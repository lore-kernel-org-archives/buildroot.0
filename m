From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Wed, 21 Aug 2013 10:32:25 -0300
Subject: [Buildroot] [PATCH 2/2] toolchain-external: Add Sourcery
 CodeBench for Nios-II
In-Reply-To: <52145B05.4080405@mind.be>
References: <1376999946-3314-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1376999946-3314-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <52145B05.4080405@mind.be>
Message-ID: <CAAEAJfBVeUKtYDwHF5=QXN6NVtPQm0c_u60qRDFbs7cUKKrbeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On 21 August 2013 03:15, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 08/20/13 13:59, Ezequiel Garcia wrote:
>>
>> From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>>
>> This commit adds the pre-built Sourcery CodeBench toolchains
>> currently available for the Nios-II architecture.
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>> ---
>>   toolchain/toolchain-external/Config.in   | 26 ++++++++++++++++++++++++++
>>   toolchain/toolchain-external/ext-tool.mk |  6 ++++++
>>   2 files changed, 32 insertions(+)
>>
>> diff --git a/toolchain/toolchain-external/Config.in
>> b/toolchain/toolchain-external/Config.in
>> index ad1f203..9c0ffb1 100644
>> --- a/toolchain/toolchain-external/Config.in
>> +++ b/toolchain/toolchain-external/Config.in
>> @@ -402,6 +402,30 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
>>   comment "Sourcery CodeBench toolchains are only available for
>> MIPS/MIPS64 o32 and n64"
>>         depends on BR2_MIPS_NABI32
>>
>> +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305_12
>> +       bool "Sourcery CodeBench Nios-II 2013.05-12"
>> +       depends on BR2_nios2
>> +       depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>> +       select BR2_TOOLCHAIN_EXTERNAL_GLIBC
>> +       select BR2_TOOLCHAIN_HAS_NATIVE_RPC
>> +       select BR2_INSTALL_LIBSTDCPP
>> +       select BR2_HOSTARCH_NEEDS_IA32_LIBS
>> +       help
>> +         Sourcery CodeBench toolchain for the Nios-II architecture,
>> +         from Mentor Graphics.
>
>
>  The help text should say which gcc and glibc version are included.
>
>

Yes, I was aware of that. I tried to find such information, but couldn't :-(

Any idea how do I get that information from the toolchain itself?

>> +
>> +config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305_43
>> +       bool "Sourcery CodeBench Nios-II 2013.05-43"
>
>
>  Why do you want to support two patchlevels of the same base version?
>

Not sure, actually. Just added all the options currently available.

Do you think is silly? Should I leave the latest one alone?

Thanks,
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
