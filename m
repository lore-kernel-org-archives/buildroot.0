Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE152C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 09:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2256A40363;
	Sun, 14 Aug 2022 09:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2256A40363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gukYrPtFodVM; Sun, 14 Aug 2022 09:33:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E54AE4024B;
	Sun, 14 Aug 2022 09:33:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E54AE4024B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77DCB1BF361
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 09:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 523F860AD8
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 09:33:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 523F860AD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u_RJCxpi18bw for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 09:33:38 +0000 (UTC)
X-Greylist: delayed 00:10:57 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 147AA60674
Received: from mxd1.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 147AA60674
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 09:33:37 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc22b.ng.seznam.cz (email-smtpc22b.ng.seznam.cz [10.23.18.29])
 id 0ca4400e8c432a930ed07e60; Sun, 14 Aug 2022 11:33:35 +0200 (CEST)
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by email-relay20.ko.seznam.cz (Seznam SMTPD 1.3.137) with ESMTP;
 Sun, 14 Aug 2022 11:22:32 +0200 (CEST)  
Date: Sun, 14 Aug 2022 11:22:27 +0200
From: Jan Havran <havran.jan@email.cz>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Message-ID: <Yvi+0zOx0hn0ydhB@arch-zen.localdomain>
References: <YlBzP4J4FGA4Z7nL@arch-zen.localdomain>
 <733d97a0-7ee5-d788-6cba-ccac757befdb@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <733d97a0-7ee5-d788-6cba-ccac757befdb@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=email.cz; s=beta; 
 t=1660469615; bh=/T4KN2F5/5NLnUkyHD566O3PpyByqIBe14+DxUDdRtw=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding:In-Reply-To;
 b=l+gpXjkpude9yHej5LxEKbb1u8LzB5sREg5Rx3HSJUgX0qGNvmHg7kVCsaf7c8mfI
 bX7VSg6I9aGqlAS5EYfB3qsAjOCXS7GD1y4yVSmuyR61rM46kLFO81fBvu2ZQkfyDS
 +NmkZa/vahTXqKFTLgHfTAcilFY8k8aioefEHpzM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=email.cz header.i=@email.cz
 header.a=rsa-sha256 header.s=beta header.b=l+gpXjkp
Subject: Re: [Buildroot] [PATCH 1/1] board/pine64/pinecube: new board
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

> > new file mode 100644
> > index 0000000000..1064167d8e
> > --- /dev/null
> > +++ b/configs/pinecube_defconfig
> > @@ -0,0 +1,47 @@
> > +# Target options
> > +BR2_arm=3Dy
> > +BR2_cortex_a7=3Dy
> > +BR2_ARM_FPU_NEON_VFPV4=3Dy
> =

> This ^^^ should be removed since NEON doesn't support complete FPU
> standard API, so it's better to keep the default for BR2_cortex_a7

I will fix everything and post V2, but one thing I do not understand much is
this one.

For example both licheepi zero (v3s) and bananapi m2 plus (h3)
should support NEON and VFP4 [1][2], but one has selected option
BR2_ARM_FPU_VFPV4=3Dy, while the other has default. Also pinecube (s3)
supports both NEON/VFP4 [3].

Could you please give me a hint why some boards have this or other option
enabled, while some keep default settings?

Thank you for your time and patch review,
Jan

[1] https://linux-sunxi.org/V3s
[2] https://linux-sunxi.org/H3
[3] https://linux-sunxi.org/S3

V=A0Fri, Jul 29, 2022 at 12:28:53AM +0200,=A0Giulio Benetti napsal(a):
> Hi Jan,
> =

> On 08/04/22 19:39, Jan Havran wrote:
> > Add support for PineCube with:
> > - U-Boot 2022.01
> > - Linux 5.15
> =

> Here I would briefly describe the board(various I/Os) and add a https
> URL to the board official webpage if it exists.
> =

> > Signed-off-by: Jan Havran <havran.jan@email.cz>
> > ---
> >   DEVELOPERS                         |  4 +++
> >   board/pine64/pinecube/boot.cmd     |  6 ++++
> >   board/pine64/pinecube/genimage.cfg | 34 +++++++++++++++++++++
> >   board/pine64/pinecube/readme.txt   | 31 ++++++++++++++++++++
> >   configs/pinecube_defconfig         | 47 ++++++++++++++++++++++++++++++
> >   5 files changed, 122 insertions(+)
> >   create mode 100644 board/pine64/pinecube/boot.cmd
> >   create mode 100644 board/pine64/pinecube/genimage.cfg
> >   create mode 100644 board/pine64/pinecube/readme.txt
> >   create mode 100644 configs/pinecube_defconfig
> > =

> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index a66b9d7eee..d418a1af99 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1356,6 +1356,10 @@ F:	package/pangomm/
> >   F:	package/rpm/
> >   F:	package/yad/
> > +N:	Jan Havran <havran.jan@email.cz>
> > +F:	board/pine64/pinecube/
> > +F:	configs/pinecube_defconfig
> > +
> >   N:	Jan Heylen <jan.heylen@nokia.com>
> >   F:	package/opentracing-cpp/
> > diff --git a/board/pine64/pinecube/boot.cmd b/board/pine64/pinecube/boo=
t.cmd
> > new file mode 100644
> > index 0000000000..d8b62e0b4a
> > --- /dev/null
> > +++ b/board/pine64/pinecube/boot.cmd
> > @@ -0,0 +1,6 @@
> > +setenv bootargs console=3DttyS0,115200 earlyprintk root=3D/dev/mmcblk0=
p2 rootwait rw
> > +
> > +fatload mmc 0 $kernel_addr_r zImage
> > +fatload mmc 0 $fdt_addr_r sun8i-s3-pinecube.dtb
> > +
> > +bootz $kernel_addr_r - $fdt_addr_r
> =

> The lastest boards use extlinux.conf instead of boot.cmd since it's
> pretty easier to use it during debugging. So it's better to have
> extlinux.conf here and when one finalize the project then it can create
> the corresponding boot.cmd
> =

> > diff --git a/board/pine64/pinecube/genimage.cfg b/board/pine64/pinecube=
/genimage.cfg
> > new file mode 100644
> > index 0000000000..af175811ad
> > --- /dev/null
> > +++ b/board/pine64/pinecube/genimage.cfg
> > @@ -0,0 +1,34 @@
> > +image boot.vfat {
> > +	vfat {
> > +		files =3D {
> > +			"zImage",
> > +			"sun8i-s3-pinecube.dtb",
> > +			"boot.scr"
> > +		}
> > +	}
> > +
> > +	size =3D 8M
> > +}
> > +
> > +image sdcard.img {
> > +	hdimage {
> > +	}
> > +
> > +	partition u-boot {
> > +		in-partition-table =3D "no"
> > +		image =3D "u-boot-sunxi-with-spl.bin"
> > +		offset =3D 8K
> > +		size =3D 504K # 512KB - 8KB
> > +	}
> > +
> > +	partition boot {
> > +		partition-type =3D 0xC
> > +		bootable =3D "true"
> > +		image =3D "boot.vfat"
> > +	}
> > +
> > +	partition rootfs {
> > +		partition-type =3D 0x83
> > +		image =3D "rootfs.ext4"
> > +	}
> > +}
> > diff --git a/board/pine64/pinecube/readme.txt b/board/pine64/pinecube/r=
eadme.txt
> > new file mode 100644
> > index 0000000000..7770bbfe42
> > --- /dev/null
> > +++ b/board/pine64/pinecube/readme.txt
> > @@ -0,0 +1,31 @@
> > +Intro
> > +=3D=3D=3D=3D=3D
> > +
> > +This directory contains a Buildroot configuration for building a
> > +Pine64 PineCube.
> > +
> > +Board homepage: https://www.pine64.org/cube/
> > +Board wiki:     https://wiki.pine64.org/wiki/PineCube
> =

> These ^^^ are the URLs I ask you for in commit log
> =

> > +
> > +How to build it
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +  $ make pinecube_defconfig
> > +  $ make
> > +
> > +Note: you will need access to the internet to download the required
> > +sources.
> > +
> > +How to write the SD card
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > +
> > +Once the build process is finished you will have an image called "sdca=
rd.img"
> > +in the output/images/ directory.
> > +
> > +Copy the bootable "sdcard.img" onto an SD card with "dd":
> > +
> > +  $ sudo dd if=3Doutput/images/sdcard.img of=3D/dev/sdX
> > +  $ sudo sync
> > +
> > +Insert the micro SDcard in your PineCube and power it up. The console
> > +is on the serial port 2, 115200 8N1 (check Wiki for board pinout).
> > diff --git a/configs/pinecube_defconfig b/configs/pinecube_defconfig
> =

> Since this is a Pine64 board and you also use board/pine64/pinecube it's
> better to rename pinecube_defconfig to pine64_pinecube_defconfig like
> pine64_sopine_defconfig
> =

> > new file mode 100644
> > index 0000000000..1064167d8e
> > --- /dev/null
> > +++ b/configs/pinecube_defconfig
> > @@ -0,0 +1,47 @@
> > +# Target options
> > +BR2_arm=3Dy
> > +BR2_cortex_a7=3Dy
> > +BR2_ARM_FPU_NEON_VFPV4=3Dy
> =

> This ^^^ should be removed since NEON doesn't support complete FPU
> standard API, so it's better to keep the default for BR2_cortex_a7
> =

> > +
> > +# Toolchain options
> > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > +
> > +# System configuration
> > +BR2_TARGET_GENERIC_HOSTNAME=3D"pinecube"
> > +BR2_TARGET_GENERIC_ISSUE=3D"Welcome to PINECUBE"
> =

> "Welcome to Pine64 Pinecube" ^^^
> =

> > +BR2_SYSTEM_DHCP=3D"eth0"
> > +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
> > +BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c board/pine64/pinecube/genimage.cfg"
> > +
> > +# Kernel
> > +BR2_LINUX_KERNEL=3Dy
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15"
> =

> Here ^^^ please use latest stable 5.15.x version, now it's 5.15.57:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/
> =

> and re-test it
> =

> > +BR2_LINUX_KERNEL_DEFCONFIG=3D"sunxi"
> > +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"sun8i-s3-pinecube"
> > +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> > +
> > +# Filesystem
> > +BR2_TARGET_ROOTFS_EXT2=3Dy
> > +BR2_TARGET_ROOTFS_EXT2_4=3Dy
> > +
> > +# Bootloader
> > +BR2_TARGET_UBOOT=3Dy
> > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
> > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2022.01"
> > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"pinecube"
> > +BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> > +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy
> > +BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> > +BR2_TARGET_UBOOT_SPL=3Dy
> > +BR2_TARGET_UBOOT_SPL_NAME=3D"u-boot-sunxi-with-spl.bin"
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=3Dy
> > +BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE=3D"board/pine64/pinecu=
be/boot.cmd"
> > +
> > +# Required host utilities for building an SDCard image
> > +BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> > +BR2_PACKAGE_HOST_GENIMAGE=3Dy
> > +BR2_PACKAGE_HOST_MTOOLS=3Dy
> =

> Here ^^^ remember to check which Host tool is needed after changing to
> extlinux.conf
> =

> Anyway I've built it successfully with Buildroot's utils/docker-run.
> =

> Waiting for V2 patch then.
> =

> Thank you!
> =

> Best regards
> -- =

> Giulio Benetti
> Benetti Engineering sas
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
