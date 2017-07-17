From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 17 Jul 2017 17:57:22 +0100
Subject: [Buildroot] [PATCH 1/2] arch/mips: improve help text of NaN
 option
In-Reply-To: <20170717145613.3c7feb8a@windsurf>
References: <20170717122255.61795-1-Vincent.Riera@imgtec.com>
 <20170717145613.3c7feb8a@windsurf>
Message-ID: <dfd6e917-4f2a-2d0a-b3d7-1d805f8ddd71@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 17/07/17 13:56, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 17 Jul 2017 13:22:54 +0100, Vicente Olivert Riera wrote:
> 
>> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
>> index 7dd69659d..f2b352b0b 100644
>> --- a/arch/Config.in.mips
>> +++ b/arch/Config.in.mips
>> @@ -169,7 +169,9 @@ choice
>>  	depends on BR2_mips_32r5 || BR2_mips_64r5
>>  	default BR2_MIPS_ENABLE_NAN_2008
>>  	help
>> -	  NaN encoding to be used
>> +	  MIPS supports two different NaN encodings, legacy and 2008.
>> +	  Information about MIPS NaN encodings can be found here:
>> +	  https://sourceware.org/binutils/docs/as/MIPS-NaN-Encodings.html
> 
> Is it useful (and correct?) to say that the Linux kernel, built for
> MIPS32r5, by default expect the 2008 NaN encoding?

It is correct, but since nan2008 is the default I think is not worth
mentioning it. If you change the default value is because you know what
you are doing, right?

Vincent

> 
> Thomas
> 
