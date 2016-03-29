From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Mar 2016 16:21:33 +0200
Subject: [Buildroot] [PATCH 0/5] Align library locations in target and
	staging
In-Reply-To: <56F84507.3050209@mind.be>
References: <1455304826-10557-1-git-send-email-patrickdepinguin@gmail.com>
 <56F84507.3050209@mind.be>
Message-ID: <CAAXf6LUA=n=5u6TkEsEWbMu2NdbVQzBHOPzSXyTgbQGHE_ZWSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sun, Mar 27, 2016 at 10:39 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 02/12/16 20:20, Thomas De Schampheleire wrote:
>>
>> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> As discussed on the Buildroot developer days, Buildroot installs some
>> libraries
>> in a different location in target than in staging. This is specifically
>> seen for
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
>>   toolchain/helpers.mk                               | 57
>> ++---------------
>>   toolchain/toolchain-external/Config.in             |  3 +-
>>   toolchain/toolchain-external/toolchain-external.mk | 71
>> ++++++++++------------
>>   4 files changed, 40 insertions(+), 93 deletions(-)
>>
>
>  I've also done a review and a test of the entire series. There is a bit of
> reworking suggested by Romain in patch 3/5, the removal of -follow that I
> suggest in patch 4/5, and I would like to re-instate the --sysroot check in
> patch 2/5, but that's it.
>
>  ThomasDS, will you respin or do we apply and make changes afterwards?

I think it makes sense to respin to keep history clean, unless you
prefer to apply first and deblock Romain. That is also fine by me. I
just need some time to do the respin and retest.

Thanks for the review both you and Romain, I really appreciate it.

/Thomas
