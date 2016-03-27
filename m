From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 Mar 2016 22:52:35 +0200
Subject: [Buildroot] [PATCH 0/5] Align library locations in target and
 staging
In-Reply-To: <56F84507.3050209@mind.be>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <56F84507.3050209@mind.be>
Message-ID: <56F84813.6080302@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout, ThomasDS, All,

Le 27/03/2016 22:39, Arnout Vandecappelle a ?crit :
> On 02/12/16 20:20, Thomas De Schampheleire wrote:
>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> As discussed on the Buildroot developer days, Buildroot installs some libraries
>> in a different location in target than in staging. This is specifically seen for
>> libstdc++ and libatomic.
>>
>> This patch series tackles that problem and performs related cleanup.
>>
>>
>>
>> Thomas De Schampheleire (5):
>>    toolchain-external: blackfin: install FDPIC libraries also to staging
>>    toolchain-external: remove unused calculation of ARCH_SUBDIR
>>    toolchain-external: extract installation of gdbserver to separate
>>      define
>>    toolchain-external: align library locations in target and staging dir
>>    toolchain-external: unify LIB_EXTERNAL_LIBS and USR_LIB_EXTERNAL_LIBS
>>
>>   package/glibc/glibc.mk                             |  2 +-
>>   toolchain/helpers.mk                               | 57 ++---------------
>>   toolchain/toolchain-external/Config.in             |  3 +-
>>   toolchain/toolchain-external/toolchain-external.mk | 71 ++++++++++------------
>>   4 files changed, 40 insertions(+), 93 deletions(-)
>>
> 
>  I've also done a review and a test of the entire series. There is a bit of
> reworking suggested by Romain in patch 3/5, the removal of -follow that I
> suggest in patch 4/5, and I would like to re-instate the --sysroot check in
> patch 2/5, but that's it.

What do you think about moving the sysroot check to a helper function like I
propose in this series ? (Which needs to be rebased after ThomasDS's series as well)

http://patchwork.ozlabs.org/patch/576578/
http://patchwork.ozlabs.org/patch/576580/

Thoughts ?

Best regards,
Romain

> 
>  ThomasDS, will you respin or do we apply and make changes afterwards?
> 
> 
>  Regards,
>  Arnout
