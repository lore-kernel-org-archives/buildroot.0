From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Dec 2015 21:42:13 +0100
Subject: [Buildroot] [PATCH 1/3] package/nodejs: bump 0.10.x branch to
 version 0.10.41
In-Reply-To: <20151212183235.09bb8139@free-electrons.com>
References: <1449609500-10071-1-git-send-email-joerg.krause@embedded.rocks>
 <20151212183235.09bb8139@free-electrons.com>
Message-ID: <566DD825.3000105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12-12-15 18:32, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Tue,  8 Dec 2015 22:18:18 +0100, J?rg Krause wrote:
>> Also remove a patch applied upstream.
>>
>> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
>> ---
>>  ...4-fix-build-error-without-OpenSSL-support.patch | 54 ----------------------
>>  .../0001-remove-python-bz2-dependency.patch        |  0
>>  .../0002-gyp-force-link-command-to-use-CXX.patch   |  0
>>  .../0003-use-python-variable.patch                 |  0
>>  .../0004-fix-musl-USE-MISC-build-issue.patch}      |  0
>>  package/nodejs/Config.in                           |  4 +-
>>  package/nodejs/nodejs.hash                         |  4 +-
>>  7 files changed, 4 insertions(+), 58 deletions(-)
>>  delete mode 100644 package/nodejs/0.10.40/0004-fix-build-error-without-OpenSSL-support.patch
>>  rename package/nodejs/{0.10.40 => 0.10.41}/0001-remove-python-bz2-dependency.patch (100%)
>>  rename package/nodejs/{0.10.40 => 0.10.41}/0002-gyp-force-link-command-to-use-CXX.patch (100%)
>>  rename package/nodejs/{0.10.40 => 0.10.41}/0003-use-python-variable.patch (100%)
>>  rename package/nodejs/{0.10.40/0005-fix-musl-USE-MISC-build-issue.patch => 0.10.41/0004-fix-musl-USE-MISC-build-issue.patch} (100%)
> 
> I've applied all three patches. However, there is a problem: if you
> select a Cortex-A9 ARM processor, only the 0.10 version is visible, the
> 0.12 and 4.x versions are not visible. This is because for Cortex-A9,
> BR2_ARM_CPU_HAS_VFPV2 is not true. This is something that should be
> fixed at some point.

 I guess, when BR2_ARM_FPU_VFPV3 of _D16 is selected, we should also select
BR2_ARM_CPU_HAS_VFPV3. Which is of course not possible because then we get a
circular dependency. So more hidden intermediate symbols...

 I wonder BTW, does v8 still work when SOFT_FLOAT is selected?


 Regards,
 Arnout

> 
> Thanks!
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
