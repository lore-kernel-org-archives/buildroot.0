From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 1 Aug 2007 12:36:19 +0200
Subject: [Buildroot]
	linux-2.6.21.5-003-atmel.1-avr32-updates.patch	failes
In-Reply-To: <0707312209460.11633@somehost>
References: <0707312150570.11633@somehost> <0707312154000.11633@somehost>
	<0707312209460.11633@somehost>
Message-ID: <20070801103619.GF11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 31, 2007 at 10:19:13PM +0200, Cristian Ionescu-Idbohrn wrote:
>On Tue, 31 Jul 2007, Cristian Ionescu-Idbohrn wrote:
>
>> Preceeded by this:
>>
>> Applying linux-2.6.21.5-002-lzma-vmlinuz.01.patch using plaintext:
>> patching file arch/i386/boot/compressed/Makefile
>> patching file scripts/gen_lzma_initramfs_list.sh
>> patching file arch/i386/boot/compressed/lzma_misc.c
>> patching file scripts/Makefile.lib
>>
>> Applying linux-2.6.21.5-003-atmel.1-avr32-updates.patch using plaintext:
>> patching file MAINTAINERS
>> patching file Makefile
>> Hunk #1 FAILED at 1.
>> 1 out of 1 hunk FAILED -- saving rejects to file Makefile.rej
>>
>> On Tue, 31 Jul 2007, Cristian Ionescu-Idbohrn wrote:
>>
>> > Patch failed!  Please fix linux-2.6.21.5-003-atmel.1-avr32-updates.patch!
>> > make: *** [buildroot/build_i486/linux-2.6.21.5/.patched] Error 1
>>
>> Conflicts between linux-2.6.21.5-002-lzma-vmlinuz.01.patch and
>> linux-2.6.21.5-003-atmel.1-avr32-updates.patch?
>
>Questions:
>
>Is it really necessary to apply these patches? Even though .config shows?
>
># BR2_PACKAGE_LZMA_TARGET is not set
># BR2_PACKAGE_LZMA_HOST is not set
># BR2_TARGET_ROOTFS_EXT2_LZMA is not set

I do have lzma installed on my host so i do not need to build a separate
lzma for the host. Still i want to use a vmlinux that is lzma
compressed, so the linux-2.6.21.5-002-lzma-vmlinuz.01.patch is needed
(vmlinux-lzma is a kernel-config anyway, so even if it is applied you
don't have to use it).
I don't know what that atmel patch is supposed to do. For anything but
atmel "boards" it should not be downloaded nor applied anyway.

># BR2_avr32 is not set
># BR2_TOOLCHAIN_ATMEL_AVR32 is not set
