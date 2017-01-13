From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Jan 2017 09:40:45 -0800
Subject: [Buildroot] [PATCH 1/2] toolchain: bump Codescape IMG MIPS
 version to 2016.05-06
In-Reply-To: <76c2b972-93fc-5413-9bb3-f17ca76bccc1@imgtec.com>
References: <20170113135540.64589-1-Vincent.Riera@imgtec.com>
 <c5dad2b8-f1bf-1907-71c8-836591c14c8f@gmail.com>
 <76c2b972-93fc-5413-9bb3-f17ca76bccc1@imgtec.com>
Message-ID: <bd50695c-eae6-765e-974e-10ea57ad776c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 1/13/17 9:35 AM, Vicente Olivert Riera wrote:
> Hi Romain,
> 
> On 13/01/17 17:10, Romain Naour wrote:
>> Hi Vicente,
>>
>> Le 13/01/2017 ? 14:55, Vicente Olivert Riera a ?crit :
>>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>> ---
>>>  .../toolchain-external-codescape-img-mips/Config.in                   | 2 +-
>>>  .../toolchain-external-codescape-img-mips.hash                        | 4 ++--
>>>  .../toolchain-external-codescape-img-mips.mk                          | 2 +-
>>>  3 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
>>> index 1f0d4d1..2250e17 100644
>>> --- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
>>> +++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
>>> @@ -6,7 +6,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
>>>  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>>>  	select BR2_INSTALL_LIBSTDCPP
>>>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>>> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
>>> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
>>>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>>>  	select BR2_TOOLCHAIN_HAS_FORTRAN
>>>  	help
>>> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
>>> index e4ae9e1..3d5703b 100644
>>> --- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
>>> +++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.hash
>>> @@ -1,3 +1,3 @@
>>>  # Codescape toolchains from Imagination Technologies
>>> -# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-03/downloads.html
>>> -sha256 e3c1f292ac6a9f12480af431c85a7ed9dfa011a52fd62a50be3363ec6b9bc872  Codescape.GNU.Tools.Package.2016.05-03.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
>>> +# From: http://codescape-mips-sdk.imgtec.com/components/toolchain/2016.05-06/downloads.html
>>> +sha256 8d9cdf711dd402d7bf82883d425c221038fe8ce9d0c91a3f6b30939d9d55476c  Codescape.GNU.Tools.Package.2016.05-06.for.MIPS.IMG.Linux.CentOS-5.x86.tar.gz
>>> diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
>>> index b4decfb..805e956 100644
>>> --- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
>>> +++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/toolchain-external-codescape-img-mips.mk
>>> @@ -4,7 +4,7 @@
>>>  #
>>>  ################################################################################
>>>  
>>> -TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION = 2016.05-03
>>> +TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION = 2016.05-06
>>>  TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_SITE = http://codescape-mips-sdk.imgtec.com/components/toolchain/$(TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_VERSION)
>>>  TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS_STRIP_COMPONENTS = 2
>>
>> Reviewed-by: Romain Naour <romain.naour@gmail.com>
>>
>> Not related to this patch but Codescape toolchains are also available for x86_64
>> hosts. Why not using x86_64 toolchain ?
> 
> if we use the x86_64 versions we can only use them on 64bit machines. If
> you use the x86 ones, we can use them on both 32 and 64bit machines.
> 

You can detect the host architecture to help decide which one to use.
for x86 to work on x86_64 you would require multilib support,which might
also be an assumption that all x86_64 host linux distros may not meet.

> Regards,
> 
> Vincent
> 
>>
>> Look at the Linaro toolchains for example.
>>
>> Best regards,
>> Romain
>>
>>>  
>>>
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
