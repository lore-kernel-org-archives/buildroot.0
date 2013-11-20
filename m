From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 20 Nov 2013 11:51:36 +0000
Subject: [Buildroot] [PATCH] Mark MIPS I, II, III and IV as deprecated
In-Reply-To: <20131120120900.6a66d750@skate>
References: <1384944173-15749-1-git-send-email-Vincent.Riera@imgtec.com>
 <20131120120900.6a66d750@skate>
Message-ID: <528CA248.70505@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/20/2013 11:09 AM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Wed, 20 Nov 2013 10:42:53 +0000, Vicente Olivert Riera wrote:
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>   arch/Config.in.mips |    6 ++++--
>>   1 files changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
>> index d70fd63..43af33c 100644
>> --- a/arch/Config.in.mips
>> +++ b/arch/Config.in.mips
>> @@ -12,14 +12,16 @@ choice
>>
>>   config BR2_mips_1
>>   	bool "mips I (generic)"
>> -	depends on !BR2_ARCH_IS_64
>> +	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED
>>   config BR2_mips_2
>>   	bool "mips II"
>> -	depends on !BR2_ARCH_IS_64
>> +	depends on !BR2_ARCH_IS_64 && BR2_DEPRECATED
>>   config BR2_mips_3
>>   	bool "mips III"
>> +	depends on BR2_DEPRECATED
>>   config BR2_mips_4
>>   	bool "mips IV"
>> +	depends on BR2_DEPRECATED
>>   config BR2_mips_32
>>   	bool "mips 32"
>>   	depends on !BR2_ARCH_IS_64
>
> The commit log should explain *why* we're deprecating these CPU
> variants.
>
> Moreover, if we deprecate mips_1 and mips_3, then there should be some
> change in:
>
> choice
>          prompt "Target Architecture Variant"
>          depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
>          default BR2_mips_3 if BR2_mips
>          default BR2_mips_1 if BR2_mipsel
>          default BR2_mips_64 if BR2_mips64 || BR2_mips64el
>          help
>
> at the beginning of Config.in.mips
>
> Thomas
>

Thanks for your help Thomas. I have sent a V2.

-- 
Vincent
