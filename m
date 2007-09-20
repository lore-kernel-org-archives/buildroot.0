From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 20 Sep 2007 20:04:12 +0200
Subject: [Buildroot] EABI option required ?
In-Reply-To: <7EDF9790847B6B459CE09E1355BE138D2344A5@CORPUSMX10C.corp.emc.com>
References: <7EDF9790847B6B459CE09E1355BE138D2344A5@CORPUSMX10C.corp.emc.com>
Message-ID: <20070920180412.GE8635@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2007 at 01:20:40PM -0400, Rae_Samant at emc.com wrote:
>Hello,
> I am trying to build a toolchain using buildroot and use that toolchain
>to build
> Kernel and ramdisk for ARM 926EJ-Sid.
>
>Is EABI option for toolchain required ?
> 
> I used option OABI -- resulting in my shell not working.( Kernel comes
>up but linuxrc does not execute. Seems that shell does not execute.).
>> BR2_ARM_OABI=y
>> # BR2_ARM_EABI is not set
>
> If I use option EABI, then the kernel does not compile:
>< # BR2_ARM_OABI is not set
>< BR2_ARM_EABI=y
>
>Kernel compile Gives following error:
>
>[root at raes linux-feroceon_2_2_2_NAS_GDP]# make uImage
>  CHK     include/linux/version.h
>  UPD     include/linux/version.h
>  SYMLINK include/asm -> include/asm-arm
>  SPLIT   include/linux/autoconf.h -> include/config/*
>  CC      scripts/mod/empty.o
>cc1: error: invalid option `abi=aapcs-linux'

If your compiler is too old to support abi=aapcs-linux then i suggest
you remove it.

>make[2]: *** [scripts/mod/empty.o] Error 1
>make[1]: *** [scripts/mod] Error 2
>make: *** [scripts] Error 2
>
>My tools are old:
>Buildroot: Daily snapshot of 20060906:
>My gcc: 3.4.6
>Busybox: 1.2.0

yea, they are old. I usually ask anybody trying to use stuff that old to
update and retry. Today is something like 20070920, current gcc is 4.2.1
(last time i looked), binutils are at 2.18(.50.0.1), busybox-1.7.1,
kernel-2.6.22.6 (last time i looked).
>
>I am using kernel 2.6.12.6 patched with linux-feroceon_2_2_2_NAS_GDP
>patch from marvell.

I'd kindly ask those guy to provide something vaguely recent, given that
2.6.12.6 was released almost exactly two years ago..
good luck
