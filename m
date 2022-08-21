Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD15C00140
	for <buildroot@archiver.kernel.org>; Sun, 21 Aug 2022 18:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB12D8175A;
	Sun, 21 Aug 2022 18:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB12D8175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iVL7ITK3nZwc; Sun, 21 Aug 2022 18:55:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F2D1814C9;
	Sun, 21 Aug 2022 18:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F2D1814C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8277C1BF421
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 18:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D0AB60AE5
 for <buildroot@lists.busybox.net>; Sun, 21 Aug 2022 18:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D0AB60AE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VL0gtWOjKzRj for <buildroot@lists.busybox.net>;
 Sun, 21 Aug 2022 18:55:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A4A060AE3
Received: from mxd1.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A4A060AE3
 for <buildroot@buildroot.org>; Sun, 21 Aug 2022 18:55:17 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc24a.ng.seznam.cz (email-smtpc24a.ng.seznam.cz [10.23.18.32])
 id 541625b8d4f14f2556621bd6; Sun, 21 Aug 2022 20:55:14 +0200 (CEST)
Received: from arch-zen.localdomain (havhav.seb.rev-fortech.cz [213.250.223.2])
 by email-relay13.ko.seznam.cz (Seznam SMTPD 1.3.137) with ESMTP;
 Sun, 21 Aug 2022 20:55:10 +0200 (CEST)  
Date: Sun, 21 Aug 2022 20:55:05 +0200
From: Jan Havran <havran.jan@email.cz>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Message-ID: <YwJ/ifNz9LP9JpW+@arch-zen.localdomain>
References: <YwIRMgNSkvP/T9a+@arch-zen.localdomain>
 <2515e8ef-16ef-2d1b-8395-8d63eae8724f@benettiengineering.com>
 <b32d133e-14a6-8e4f-c7e4-2e2e647f4601@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b32d133e-14a6-8e4f-c7e4-2e2e647f4601@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=email.cz; s=beta; 
 t=1661108114; bh=ju8DkHQBOE26cNHwH1SS3DwzZpjHTE4yFWPeVqw6NLU=;
 h=Received:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding:In-Reply-To;
 b=bIx1Rj5E9aSgclLxTZ3locaYIx6vxe1jPLeM/as+hpDarmxnCXCGcIETZd11Ft9lk
 D8+Jbwa8g40aZH48RjDS2lKQKuxbK4FnZd2CfUpUxu1lkxXskk2b6h9wM1nIbOlVeb
 /e80Dx55IJ971fGyahA68wo1k7vaOpPmxZemmGdI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=email.cz header.i=@email.cz
 header.a=rsa-sha256 header.s=beta header.b=bIx1Rj5E
Subject: Re: [Buildroot] [PATCH v2] board/pine64/pinecube: new board
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

Hi Giulio,

V=A0Sun, Aug 21, 2022 at 08:01:47PM +0200,=A0Giulio Benetti napsal(a):
> One last thing, please set the v1 patch to superseded in Patchwork:
> https://patchwork.ozlabs.org/project/buildroot/list/?submitter=3D74841
> =


Patch set (did not know that I have to do it manually).

> Thank you!
> =

> Best regards
> -- =

> Giulio Benetti
> Benetti Engineering sas
> =

> On 21/08/22 19:53, Giulio Benetti wrote:
> > Hi Jan,
> > =

> > On 21/08/22 13:04, Jan Havran wrote:
> > > Add support for PineCube with:
> > > - U-Boot 2022.04
> > > - Linux 5.15.61
> > > =

> > > PineCube is a low-powered, open source IP camera
> > > with the following specs:
> > > =A0 - Allwinner S3 Cortex-A7
> > > =A0 - 128 MiB DDR3
> > > =A0 - 16 MiB SPI flash
> > > =A0 - 5 MPx OV5640 camera
> > > =A0 - MicroSD slot
> > > =A0 - 10/100M Ethernet with passive PoE
> > > =A0 - 802.11 b/g/n WiFi
> > > =A0 - Bluetooth 4.1
> > > =A0 - USB 2.0
> > > =A0 - 26 pins GPIO header
> > > =A0 - Microphone
> > > =A0 - IR LEDs for night vision
> > > =

> > > Board homepage: https://www.pine64.org/cube/
> > > Board wiki:=A0=A0=A0=A0 https://wiki.pine64.org/wiki/PineCube
> > > =

> > > Signed-off-by: Jan Havran <havran.jan@email.cz>
> > > ---
> > > Changes v1 -> v2 (review by Giulio Benetti):
> > > =A0=A0 - Updated commit message
> > > =A0=A0 - Replaced boot.cmd by extlinux.conf
> > > =A0=A0 - Renamed pinecube_defconfig to pine64_pinecube_defconfig
> > > =A0=A0 - Changed welcome message (generic issue)
> > > =A0=A0 - Updated U-Boot 2022.01 to 2022.04
> > > =A0=A0 - Updated Linux kernel from 5.15 to 5.15.61
> > > =A0=A0 - Removed NEON from FPU (but kept VFPV4)
> > > ---
> > > =A0 DEVELOPERS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 4 +++
> > > =A0 board/pine64/pinecube/extlinux.conf |=A0 4 +++
> > > =A0 board/pine64/pinecube/genimage.cfg=A0 | 34 ++++++++++++++++++++++
> > > =A0 board/pine64/pinecube/post-build.sh |=A0 5 ++++
> > > =A0 board/pine64/pinecube/readme.txt=A0=A0=A0 | 31 ++++++++++++++++++=
++
> > > =A0 configs/pine64_pinecube_defconfig=A0=A0 | 45 ++++++++++++++++++++=
+++++++++
> > > =A0 6 files changed, 123 insertions(+)
> > > =A0 create mode 100644 board/pine64/pinecube/extlinux.conf
> > > =A0 create mode 100644 board/pine64/pinecube/genimage.cfg
> > > =A0 create mode 100755 board/pine64/pinecube/post-build.sh
> > > =A0 create mode 100644 board/pine64/pinecube/readme.txt
> > > =A0 create mode 100644 configs/pine64_pinecube_defconfig
> > > =

> > > diff --git a/DEVELOPERS b/DEVELOPERS
> > > index 4287fd9cf7..74f57af6fa 100644
> > > --- a/DEVELOPERS
> > > +++ b/DEVELOPERS
> > > @@ -1410,6 +1410,10 @@ F:=A0=A0=A0 package/pangomm/
> > > =A0 F:=A0=A0=A0 package/rpm/
> > > =A0 F:=A0=A0=A0 package/yad/
> > > +N:=A0=A0=A0 Jan Havran <havran.jan@email.cz>
> > > +F:=A0=A0=A0 board/pine64/pinecube/
> > > +F:=A0=A0=A0 configs/pine64_pinecube_defconfig
> > > +
> > > =A0 N:=A0=A0=A0 Jan Heylen <jan.heylen@nokia.com>
> > > =A0 F:=A0=A0=A0 package/opentracing-cpp/
> > > diff --git a/board/pine64/pinecube/extlinux.conf
> > > b/board/pine64/pinecube/extlinux.conf
> > > new file mode 100644
> > > index 0000000000..6a18d9a2cb
> > > --- /dev/null
> > > +++ b/board/pine64/pinecube/extlinux.conf
> > > @@ -0,0 +1,4 @@
> > > +label buildroot
> > > +=A0 kernel /zImage
> > > +=A0 devicetree /sun8i-s3-pinecube.dtb
> > > +=A0 append console=3DttyS0,115200 earlyprintk root=3D/dev/mmcblk0p2
> > > rootwait rw
> > > diff --git a/board/pine64/pinecube/genimage.cfg
> > > b/board/pine64/pinecube/genimage.cfg
> > > new file mode 100644
> > > index 0000000000..398d45e2f7
> > > --- /dev/null
> > > +++ b/board/pine64/pinecube/genimage.cfg
> > > @@ -0,0 +1,34 @@
> > > +image boot.vfat {
> > > +=A0=A0=A0 vfat {
> > > +=A0=A0=A0=A0=A0=A0=A0 files =3D {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "zImage",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "sun8i-s3-pinecube.dtb",
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "extlinux"
> > > +=A0=A0=A0=A0=A0=A0=A0 }
> > > +=A0=A0=A0 }
> > > +
> > > +=A0=A0=A0 size =3D 8M
> > > +}
> > > +
> > > +image sdcard.img {
> > > +=A0=A0=A0 hdimage {
> > > +=A0=A0=A0 }
> > > +
> > > +=A0=A0=A0 partition u-boot {
> > > +=A0=A0=A0=A0=A0=A0=A0 in-partition-table =3D "no"
> > > +=A0=A0=A0=A0=A0=A0=A0 image =3D "u-boot-sunxi-with-spl.bin"
> > > +=A0=A0=A0=A0=A0=A0=A0 offset =3D 8K
> > > +=A0=A0=A0=A0=A0=A0=A0 size =3D 504K # 512KB - 8KB
> > > +=A0=A0=A0 }
> > > +
> > > +=A0=A0=A0 partition boot {
> > > +=A0=A0=A0=A0=A0=A0=A0 partition-type =3D 0xC
> > > +=A0=A0=A0=A0=A0=A0=A0 bootable =3D "true"
> > > +=A0=A0=A0=A0=A0=A0=A0 image =3D "boot.vfat"
> > > +=A0=A0=A0 }
> > > +
> > > +=A0=A0=A0 partition rootfs {
> > > +=A0=A0=A0=A0=A0=A0=A0 partition-type =3D 0x83
> > > +=A0=A0=A0=A0=A0=A0=A0 image =3D "rootfs.ext4"
> > > +=A0=A0=A0 }
> > > +}
> > > diff --git a/board/pine64/pinecube/post-build.sh
> > > b/board/pine64/pinecube/post-build.sh
> > > new file mode 100755
> > > index 0000000000..ba29375c05
> > > --- /dev/null
> > > +++ b/board/pine64/pinecube/post-build.sh
> > > @@ -0,0 +1,5 @@
> > > +#!/bin/sh
> > > +
> > > +BOARD_DIR=3D"$(dirname $0)"
> > > +
> > > +install -m 0644 -D $BOARD_DIR/extlinux.conf
> > > $BINARIES_DIR/extlinux/extlinux.conf
> > > diff --git a/board/pine64/pinecube/readme.txt
> > > b/board/pine64/pinecube/readme.txt
> > > new file mode 100644
> > > index 0000000000..4cf6df2110
> > > --- /dev/null
> > > +++ b/board/pine64/pinecube/readme.txt
> > > @@ -0,0 +1,31 @@
> > > +Intro
> > > +=3D=3D=3D=3D=3D
> > > +
> > > +This directory contains a Buildroot configuration for building a
> > > +Pine64 PineCube.
> > > +
> > > +Board homepage: https://www.pine64.org/cube/
> > > +Board wiki:=A0=A0=A0=A0 https://wiki.pine64.org/wiki/PineCube
> > > +
> > > +How to build it
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +=A0 $ make pine64_pinecube_defconfig
> > > +=A0 $ make
> > > +
> > > +Note: you will need access to the internet to download the required
> > > +sources.
> > > +
> > > +How to write the SD card
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > +
> > > +Once the build process is finished you will have an image called
> > > "sdcard.img"
> > > +in the output/images/ directory.
> > > +
> > > +Copy the bootable "sdcard.img" onto an SD card with "dd":
> > > +
> > > +=A0 $ sudo dd if=3Doutput/images/sdcard.img of=3D/dev/sdX
> > > +=A0 $ sudo sync
> > > +
> > > +Insert the micro SDcard in your PineCube and power it up. The console
> > > +is on the serial port 2, 115200 8N1 (check Wiki for board pinout).
> > > diff --git a/configs/pine64_pinecube_defconfig
> > > b/configs/pine64_pinecube_defconfig
> > > new file mode 100644
> > > index 0000000000..8f60115f8f
> > > --- /dev/null
> > > +++ b/configs/pine64_pinecube_defconfig
> > > @@ -0,0 +1,45 @@
> > > +# Target options
> > > +BR2_arm=3Dy
> > > +BR2_cortex_a7=3Dy
> > > +BR2_ARM_FPU_VFPV4=3Dy
> > =

> > About this ^^^ there is an ongoing discussion if use mixed VFVP4+NEON or
> > not:
> > https://lists.buildroot.org/pipermail/buildroot/2022-August/649770.html
> > =

> > For the moment it's ok to me keeping this way and when we've all
> > clarified FPU strategy on 32-bit ARM cortex then we can modify and
> > you could test it or even provide the patch for this.
> > =

> > Have you re-tested the board with such modification?
> > =


Yes, I re-tested the board for general use. But if you ask about the FPU, I=
 am not
sure what kind of tests should I run and how to check if it gives me valid =
result.
Should I do some heavy FPU testing? This one setting is more based on chip =
description
and previous discussion rather than some my tests/experiments.

> > > +
> > > +# Toolchain options
> > > +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=3Dy
> > > +
> > > +# System configuration
> > > +BR2_TARGET_GENERIC_HOSTNAME=3D"pinecube"
> > > +BR2_TARGET_GENERIC_ISSUE=3D"Welcome to Pine64 Pinecube"
> > > +BR2_SYSTEM_DHCP=3D"eth0"
> > > +BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/pine64/pinecube/post-build.sh"
> > > +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
> > > +BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c board/pine64/pinecube/genimage.cfg"
> > > +
> > > +# Kernel
> > > +BR2_LINUX_KERNEL=3Dy
> > > +BR2_LINUX_KERNEL_CUSTOM_VERSION=3Dy
> > > +BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE=3D"5.15.61"
> > > +BR2_LINUX_KERNEL_DEFCONFIG=3D"sunxi"
> > > +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> > > +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"sun8i-s3-pinecube"
> > > +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> > > +
> > > +# Filesystem
> > > +BR2_TARGET_ROOTFS_EXT2=3Dy
> > > +BR2_TARGET_ROOTFS_EXT2_4=3Dy
> > > +
> > > +# Bootloader
> > > +BR2_TARGET_UBOOT=3Dy
> > > +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> > > +BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
> > > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2022.04"
> > > +BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"pinecube"
> > > +BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> > > +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy
> > > +BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> > > +BR2_TARGET_UBOOT_SPL=3Dy
> > > +BR2_TARGET_UBOOT_SPL_NAME=3D"u-boot-sunxi-with-spl.bin"
> > > +
> > > +# Required host utilities for building an SDCard image
> > > +BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> > > +BR2_PACKAGE_HOST_GENIMAGE=3Dy
> > > +BR2_PACKAGE_HOST_MTOOLS=3Dy
> > =

> > Overall looks good to me, it builds correctly with buildroot/docker-run
> > so:
> > Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > =

> > Expect this patch to be part of 2022.11 since 2022.08-rc1 has been
> > released on 12th August and from -rc1 to 2022.08 only bug fixes and
> > security patches are allowed.
> > =

> > Thanks for the contribution!

Thank you very much for your review and your time.

Regards,
Jan

> > =

> > Best regards
> =

> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
