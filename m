From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 19 Oct 2007 23:28:20 +0300
Subject: [Buildroot] [buildroot 0001542]: arm gcc-4.1.2 + oabi + soft
 floats	fails to build
In-Reply-To: <00f901c81284$6a0e6350$01c4af0a@Glamdring>
References: <90e28420e271f11d8ba34a6bf88df8e2@bugs.uclibc.org>
	<4718F974.3010404@promwad.com>
	<00f901c81284$6a0e6350$01c4af0a@Glamdring>
Message-ID: <47191364.4070301@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf Samuelsson wrote:
> ----- Original Message ----- 
> From: "Ivan Kuten" <ivan.kuten@promwad.com>
> To: <hamish@cloud.net.au>
> Cc: <buildroot@uclibc.org>
> Sent: Friday, October 19, 2007 8:37 PM
> Subject: Re: [Buildroot] [buildroot 0001542]: arm gcc-4.1.2 + oabi + soft 
> floats fails to build
> 
> 
>>> Summary:                    arm gcc-4.1.2 + oabi + soft floats fails to 
>>> build
>>> Description:
>>> gcc 4.1.2 fails to build for OABI with soft floats enabled, with 
>>> references
>>> to missing float functions.
>>>
>>> The patch I supplied for gcc-4.2.1 works as-is for 4.1.2 also.
>>> So copying toolchain/gcc/4.2.1/910-soft-float.patch to 
>>> toolchain/gcc/4.1.2
>>> will fix this.
>>>
>> Hi Hamish,
>>
>> I tried to apply your patch 910-soft-float.patch
>>
>> BR2_ARM_TYPE="ARM920T"
>> BR2_ARM_OABI=y
>> # BR2_ARM_EABI is not set
>> BR2_ARCH="arm"
>> ..
>> BR2_GCC_VERSION_4_1_2=y
>> ..
>> BR2_GCC_VERSION="4.1.2"
>> BR2_SOFT_FLOAT=y
> 
> 
>> It compiled successfully but
>>
>> readelf -h build_arm/staging_dir/lib/libuClibc-0.9.29.so
>> ELF Header:
>>  Magic:   7f 45 4c 46 01 01 01 61 00 00 00 00 00 00 00 00
>>  Class:                             ELF32
>>  Data:                              2's complement, little endian
>>  Version:                           1 (current)
>>  OS/ABI:                            ARM
>>  ABI Version:                       0
>>  Type:                              DYN (Shared object file)
>>  Machine:                           ARM
>>  Version:                           0x1
>>  Entry point address:               0xa520
>>  Start of program headers:          52 (bytes into file)
>>  Start of section headers:          525932 (bytes into file)
>>  Flags:                             0x202, has entry point, GNU EABI, 
>> software FP
>>  Size of this header:               52 (bytes)
>>  Size of program headers:           32 (bytes)
>>  Number of program headers:         6
>>  Size of section headers:           40 (bytes)
>>  Number of section headers:         23
>>  Section header string table index: 22
>>
>>
>> Seems I get anyway EABI not OABI. Can you confirm this?
> 
> Once you have stored you ".config" the first time, the compiler
> will not change OABI/EABI.
> It will go for the string "linux-...-eabi" which is probably present in your 
> .config
> 
> $ grep eabi .config
> 
> to check.
> 
> 
> Best Regards
> Ulf Samuelsson
> 

Ulf,

I have these - which resemble your "linux-...-eabi" prefix:

BR2_GNU_BUILD_SUFFIX="pc-linux-gnu"
BR2_GNU_TARGET_SUFFIX="linux-uclibc"

and this :

# BR2_ARM_EABI is not set

which is commented out.

No lower case "eabi" at all.


Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
