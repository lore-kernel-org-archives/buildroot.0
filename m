From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Tue, 31 Jul 2007 22:19:13 +0200 (CEST)
Subject: [Buildroot] linux-2.6.21.5-003-atmel.1-avr32-updates.patch
	failes
In-Reply-To: <0707312154000.11633@somehost>
References: <0707312150570.11633@somehost> <0707312154000.11633@somehost>
Message-ID: <0707312209460.11633@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 31 Jul 2007, Cristian Ionescu-Idbohrn wrote:

> Preceeded by this:
>
> Applying linux-2.6.21.5-002-lzma-vmlinuz.01.patch using plaintext:
> patching file arch/i386/boot/compressed/Makefile
> patching file scripts/gen_lzma_initramfs_list.sh
> patching file arch/i386/boot/compressed/lzma_misc.c
> patching file scripts/Makefile.lib
>
> Applying linux-2.6.21.5-003-atmel.1-avr32-updates.patch using plaintext:
> patching file MAINTAINERS
> patching file Makefile
> Hunk #1 FAILED at 1.
> 1 out of 1 hunk FAILED -- saving rejects to file Makefile.rej
>
> On Tue, 31 Jul 2007, Cristian Ionescu-Idbohrn wrote:
>
> > Patch failed!  Please fix linux-2.6.21.5-003-atmel.1-avr32-updates.patch!
> > make: *** [buildroot/build_i486/linux-2.6.21.5/.patched] Error 1
>
> Conflicts between linux-2.6.21.5-002-lzma-vmlinuz.01.patch and
> linux-2.6.21.5-003-atmel.1-avr32-updates.patch?

Questions:

Is it really necessary to apply these patches? Even though .config shows?

# BR2_PACKAGE_LZMA_TARGET is not set
# BR2_PACKAGE_LZMA_HOST is not set
# BR2_TARGET_ROOTFS_EXT2_LZMA is not set
# BR2_avr32 is not set
# BR2_TOOLCHAIN_ATMEL_AVR32 is not set

Wouldn't it be a good idea for each successfully applied patch to have a
target and a prequisite?

<patch name>: <patch name>.done

so that, if a patch fails and is fixed on the spot, remake skipps the
already applied patches?


Cheers,

-- 
Cristian
