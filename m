From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 1 Aug 2007 08:20:01 +0200
Subject: [Buildroot] linux-2.6.21.5-003-atmel.1-avr32-updates.patchfailes
References: <0707312150570.11633@somehost> <0707312154000.11633@somehost>
	<0707312209460.11633@somehost>
Message-ID: <015801c7d404$0f9291d0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> Conflicts between linux-2.6.21.5-002-lzma-vmlinuz.01.patch and
>> linux-2.6.21.5-003-atmel.1-avr32-updates.patch?
> 
> Questions:
> 
> Is it really necessary to apply these patches? Even though .config shows?
> 
> # BR2_PACKAGE_LZMA_TARGET is not set
> # BR2_PACKAGE_LZMA_HOST is not set
> # BR2_TARGET_ROOTFS_EXT2_LZMA is not set
> # BR2_avr32 is not set
> # BR2_TOOLCHAIN_ATMEL_AVR32 is not set
> 
> Wouldn't it be a good idea for each successfully applied patch to have a
> target and a prequisite?
> 
> <patch name>: <patch name>.done
> 
> so that, if a patch fails and is fixed on the spot, remake skipps the
> already applied patches?
> 

We are currently discussing the mess with separate patch strategies
for the kernel headers and the linux build.
I proposed that both the kernel-headers and the linux should use the same patch directories.
This is only the case, if the kernel-headers and the linux version are the same today.

A long term approach could be to keep the kernel-headers for pre 2.6.19 kernels only
and build the headers in the target/linux directory, with patches
divided into groups of patches which are or are not applied depending on 
menu configurations.

Typically you would have 
"core" patches              - always applied
"architecture" patches   - always applied if an architecture is selected
"board" patches            -  conditionally applied through a choice.

Best Regards
Ulf Samuelsson
