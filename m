From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 May 2015 13:02:50 +0200
Subject: [Buildroot] Help for another newbie,
 AT91sam9x25 incorrect defconfig or incorrect rootfs.ubi
In-Reply-To: <1432452387471-101939.post@n4.nabble.com>
References: <1432452387471-101939.post@n4.nabble.com>
Message-ID: <20150524130250.36ebd47d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ted Salazar,

On Sun, 24 May 2015 00:26:27 -0700 (PDT), Ted Salazar wrote:

> 1. Built the At91Bootstrap Ver 3.7.2:
> location: tsalazar at Ubuntu14-64:~/at91bootstrap/binaries/
> Output file: at91sam9x5ek-nandflashboot-uboot-3.7.2.bin
> 
> 2. Built Uboot ver 2015.01:
> location: tsalazar at Ubuntu14-64:~/u-boot-at91/
> Output file: u-boot.bin
> 
> 3. Built the Kernel ver 3.6.9  (I plan to upgrade to 3.18 but I'm trying to
> duplicate a working demo first)
> location: tsalazar at Ubuntu14-64:~/linux-at91/arch/arm/boot/
> Output file: at91sam9x25ek.dtb  
> location: tsalazar at Ubuntu14-64:~/linux-at91/arch/arm/boot/
> Output file: zImage

Why do you build AT91Bootstrap, U-Boot and the kernel? Buildroot will
build them for you, no need to build these manually.

> 4. Built buildroot-at91 ver 2014.05 ( This is where I have all my problems)
> 
> https://github.com/linux4sam/buildroot-at91/tree/buildroot-2014.05-at91/configs

This is the Atmel fork of Buildroot. You're contacting the official
Buildroot mailing list, we only support the mainline Buildroot.

You should rather try the updated Atmel defconfigs recently posted by
Alexandre Belloni (they are only available in the Buildroot patchwork
for the moment, since they haven't been applied yet).

> Q1) Does someone know where I can get an at91sam9x25ek_defconfig file for
> BuildRoot-at91 Ver 2014.05?

No, because you're talking about an Atmel fork of Buildroot, and this
mailing list is only supporting the official Buildrot.

You should apply the patch http://patchwork.ozlabs.org/patch/473928/ on
the mainline Buildroot and use the at91sam9x5ek_defconfig. Also, make
sure to apply http://patchwork.ozlabs.org/patch/473935/ and read the
readme.txt file. These patches should be applied to the next Buildroot
version.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
