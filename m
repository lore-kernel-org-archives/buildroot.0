From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Apr 2016 01:08:37 +0200
Subject: [Buildroot] [PATCH] mosh: fix build with the Codescape IMG
 toolchain
In-Reply-To: <57043281.5050104@mind.be>
References: <95907701a43145654f7962319823a0f7fe73551b.1459879412.git.baruch@tkos.co.il>
 <57043281.5050104@mind.be>
Message-ID: <57044575.7030307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/05/16 23:47, Arnout Vandecappelle wrote:
> On 04/05/16 20:03, Baruch Siach wrote:
>> The Codescape IMG toolchain does not provide the ssp library even though it's
>> a glibc toolchain, and thus selects BR2_TOOLCHAIN_HAS_SSP. Add a patch that
>> changes the compile test for -fstack-protector-all to a build test that
>> correctly fails when ssp is missing.
>>
>> This makes the seeding of ssp related configure variables unnecessary.
>
>   So, this fixes the issue for mosh, but not for libpam-tacplus, powerpc-utils,
> psmisc, ruby, sox, and stunnel...
>
>   Wouldn't it be better to fix BR2_TOOLCHAIN_HAS_SSP itself instead? Otherwise
> there isn't much point in having this symbol... So it shouldn't be selected by
> glibc/musl itself, but by the individual external toolchains. Cfr. the previous
> discussion for sox [1].

  And actually, Vicente already provided a patch for that:
http://patchwork.ozlabs.org/patch/597701/

  It is at place fifty-something of my patches-to-review list :-)

  Regards,
  Arnout

>
>   That said, it would of course be a great idea to upstream the patch to mosh so
> we can remove our workaround at some point.
>
>   Regards,
>   Arnout
>
> [1] http://patchwork.ozlabs.org/patch/590047/
>
>>
>> Signed-off-by: Baruch Siach<baruch@tkos.co.il>
>> ---
>>   ...ure.ac-link-test-for-fstack-protector-all.patch | 33 ++++++++++++++++++++++
>>   package/mosh/mosh.mk                               | 11 ++------
>>   2 files changed, 35 insertions(+), 9 deletions(-)
>>   create mode 100644
>> package/mosh/0001-configure.ac-link-test-for-fstack-protector-all.patch
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
