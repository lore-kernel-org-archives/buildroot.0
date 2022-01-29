Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118CBC433EF
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 13:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C1DC60625;
	Sat, 29 Jan 2022 13:32:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AWoTSujLo5SQ; Sat, 29 Jan 2022 13:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D835607C9;
	Sat, 29 Jan 2022 13:32:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 19B101BF2C7
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 13:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0729E408EA
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 13:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ny1ff3Td1zko for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 13:32:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9959C40867
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 13:32:24 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPA
 id Dnq2np7oiQUuPDnq2nzaI0; Sat, 29 Jan 2022 14:32:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643463142; bh=A0yTNTtpK03/0c49IhjB0KGAL/rykrtHdg2foCecy2Y=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=Jm8+WdoGg/9DteW8hvd9FL4lUEsGsgQ9kfQqQeIjYgtbjscy5Ia4iMifw/sc+tghH
 F86eoOslSbgN99f7b1RBvF2xJHxCOA/mh03qSXBn5Filz0SNLU6wgXReWpZ6QZRDXQ
 FlttbdKZ0W6KiKBcAHPZcORk93Sy5veeCzH1eaG+o72bSQ7FXo+OznRNOUVQ38i2AM
 8MFs+uPBbIXLuxbnCQJvm6LFTgepRbtfZnjoGc37rRTwu3Td3clU7/Uti5bzuCIi2U
 FYhw2KQrCGtRM9n33CUdKWXc/tVoHh7Sl95lQ0NTeut7VT6b4pp2sBZUsdB/nHl5nP
 daNYP1cwP8Qpg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 29 Jan 2022 14:32:21 +0100
Message-Id: <00DCA0AA-C62D-4A45-8DDF-7E275F75047C@benettiengineering.com>
References: <20220129130354.1094543-1-michael@amarulasolutions.com>
In-Reply-To: <20220129130354.1094543-1-michael@amarulasolutions.com>
To: Michael Trimarchi <michael@amarulasolutions.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfE2w6CV7dCCEEHLZKqWOYFmhQHxVZ2fnagW5IEp35HAkcJkn5tL2mHmyr/bscVp+rxQ+RKrPy8Tvnih0KenNIRSvaMXCTBEI9WyDhMLrPMraDNyVb1mD
 TU46pEWDGH3Nb4m8WQYW8TPe648TP+9Ct5HrmJB2pJqFdG4+1URhsB0QA9t5bEysBX0pEF9E3VF9dTKPKUhRgX7uvLZt4C5a3yE60b6Jmwnqj38IsSseCZDQ
 AmzVvtgvYOZj5UAnp8aEPwSOx95n52M/6wGrB65zJ114K9Zls7CQNdvCh0bmo1Tuln2fU5a//9dUZxT1sZAq7aYk/Vl6u0WkrPlSO/eujG4=
Subject: Re: [Buildroot] [PATCH] board: Add support for iMX8MN BSH SMM S2 PRO
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
Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1495186020496932370=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1495186020496932370==
Content-Type: multipart/alternative; boundary=Apple-Mail-F10A349A-2A61-476A-A263-A2DCA5443CD1
Content-Transfer-Encoding: 7bit


--Apple-Mail-F10A349A-2A61-476A-A263-A2DCA5443CD1
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Michael, Ariel,

happy to meet you here :-),

> Il giorno 29 gen 2022, alle ore 14:04, Michael Trimarchi <michael@amarulas=
olutions.com> ha scritto:
>=20
> =EF=BB=BFAdd initial support for iMX8MN BSH SMM S2 PRO board:
>=20
> - Linux: v5.17-rc1
> - Uboot 2022-01-rc1 (reference tree)

I=E2=80=99m not very sure it=E2=80=99s a good idea using an -rc1 version. I s=
ee 3 chances:
1) backport to previous versions(it would be a mess)
2) wait until v5.17 is released in 7 weeks :-/
3) keep as is while someone else gives his Tested-by:
For example Ariel, that will also be one of the two maintainers of this boar=
d as I read below.
And later bump uboot and Linux versions as soon as they are released.

> - Default packages from buildroot

Here please specify a https URL for the board like this:
https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/

>=20
> Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
> DEVELOPERS                         |  2 +
> board/bsh/bsh-imx8mn/extlinux.conf |  4 ++
> board/bsh/bsh-imx8mn/genimage.cfg  | 17 +++++++++
> board/bsh/bsh-imx8mn/post-build.sh |  7 ++++
> board/bsh/bsh-imx8mn/post-image.sh |  3 ++
> board/bsh/bsh-imx8mn/readme.txt    | 60 ++++++++++++++++++++++++++++++
> configs/bsh_smms2pro_defconfig     | 42 +++++++++++++++++++++
> 7 files changed, 135 insertions(+)
> create mode 100644 board/bsh/bsh-imx8mn/extlinux.conf
> create mode 100644 board/bsh/bsh-imx8mn/genimage.cfg
> create mode 100755 board/bsh/bsh-imx8mn/post-build.sh
> create mode 100755 board/bsh/bsh-imx8mn/post-image.sh
> create mode 100644 board/bsh/bsh-imx8mn/readme.txt
> create mode 100644 configs/bsh_smms2pro_defconfig
>=20
> diff --git a/DEVELOPERS b/DEVELOPERS
> index fe8de1916e..fc66fb6b83 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -220,6 +220,7 @@ F:    configs/snps_archs38_hsdk_defconfig
> F:    configs/snps_archs38_vdk_defconfig
>=20
> N:    Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> +F:    board/bsh/
> F:    package/axfsutils/
> F:    package/mali-t76x/
>=20
> @@ -2018,6 +2019,7 @@ F:    package/python-crc16/
> F:    package/python-pyzmq/
>=20
> N:    Michael Trimarchi <michael@amarulasolutions.com>
> +F:    board/bsh/
> F:    package/python-spidev/
>=20
> N:    Michael Vetter <jubalh@iodoru.org>
> diff --git a/board/bsh/bsh-imx8mn/extlinux.conf b/board/bsh/bsh-imx8mn/ext=
linux.conf
> new file mode 100644
> index 0000000000..9111354742
> --- /dev/null
> +++ b/board/bsh/bsh-imx8mn/extlinux.conf
> @@ -0,0 +1,4 @@
> +label buildroot
> +  kernel /boot/Image
> +  devicetree /boot/freescale/imx8mn-bsh-smm-s2pro.dtb
> +  append root=3DPARTUUID=3D%PARTUUID% rootwait rw
> diff --git a/board/bsh/bsh-imx8mn/genimage.cfg b/board/bsh/bsh-imx8mn/geni=
mage.cfg
> new file mode 100644
> index 0000000000..4a0aa117fb
> --- /dev/null
> +++ b/board/bsh/bsh-imx8mn/genimage.cfg
> @@ -0,0 +1,17 @@
> +image sdcard.img {
> +    hdimage {
> +        partition-table-type =3D "gpt"
> +    }
> +
> +    partition imx-boot {
> +        in-partition-table =3D "no"
> +        image =3D "imx8-boot-sd.bin"
> +        offset =3D 33K
> +    }
> +
> +    partition rootfs {
> +        offset =3D 8M
> +        image =3D "rootfs.ext4"
> +        partition-uuid =3D %PARTUUID%
> +    }
> +}
> diff --git a/board/bsh/bsh-imx8mn/post-build.sh b/board/bsh/bsh-imx8mn/pos=
t-build.sh
> new file mode 100755
> index 0000000000..bf8861f6a9
> --- /dev/null
> +++ b/board/bsh/bsh-imx8mn/post-build.sh
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +BOARD_DIR=3D"$(dirname $0)"
> +PARTUUID=3D"$($HOST_DIR/bin/uuidgen)"
> +
> +install -d "$TARGET_DIR/boot/extlinux/"
> +sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/=
boot/extlinux/extlinux.conf"
> +sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR=
/genimage.cfg"
> diff --git a/board/bsh/bsh-imx8mn/post-image.sh b/board/bsh/bsh-imx8mn/pos=
t-image.sh
> new file mode 100755
> index 0000000000..3452fd4501
> --- /dev/null
> +++ b/board/bsh/bsh-imx8mn/post-image.sh
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +support/scripts/genimage.sh -c ${BINARIES_DIR}/genimage.cfg
> diff --git a/board/bsh/bsh-imx8mn/readme.txt b/board/bsh/bsh-imx8mn/readme=
.txt
> new file mode 100644
> index 0000000000..b84f2ff4be
> --- /dev/null
> +++ b/board/bsh/bsh-imx8mn/readme.txt
> @@ -0,0 +1,60 @@
> +How to build it
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Configure buildroot:
> +
> +  $ make bsh_smms2pro_defconfig
> +
> +Change settings to fit your needs (optional):
> +
> +  $ make menuconfig
> +
> +Compile everything and buildr the rootfs image:
> +
> +  $ make
> +
> +
> +Result of the build
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +After building, the output/images directory contains:
> +
> +  output/images/
> +    =E2=94=9C=E2=94=80=E2=94=80 bl31.bin
> +    =E2=94=9C=E2=94=80=E2=94=80 boot.scr
> +    =E2=94=9C=E2=94=80=E2=94=80 ddr_fw.bin
> +    =E2=94=9C=E2=94=80=E2=94=80 Image
> +    =E2=94=9C=E2=94=80=E2=94=80 imx8-boot-sd.bin
> +    =E2=94=9C=E2=94=80=E2=94=80 imx8mn-bsh-smm-s2pro.dtb
> +    =E2=94=9C=E2=94=80=E2=94=80 ddr_fw.bin
> +    =E2=94=9C=E2=94=80=E2=94=80 rootfs.ext2
> +    =E2=94=9C=E2=94=80=E2=94=80 rootfs.ext4 -> rootfs.ext2
> +    =E2=94=9C=E2=94=80=E2=94=80 rootfs.tar
> +    =E2=94=9C=E2=94=80=E2=94=80 sdcard.img
> +    =E2=94=9C=E2=94=80=E2=94=80 u-boot.bin
> +    =E2=94=9C=E2=94=80=E2=94=80 u-boot.itb
> +    =E2=94=9C=E2=94=80=E2=94=80 u-boot-nodtb.bin
> +    =E2=94=9C=E2=94=80=E2=94=80 u-boot-spl.bin
> +    =E2=94=94=E2=94=80=E2=94=80 u-boot-spl-ddr.bin
> +
> +
> +Flashing the emmc card image
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +To install the image on on eMMC
> +
> +  $ sudo uuu -b emmc_all output/images/flash.bin output/images/sdcard.img=

> +
> +
> +Preparing the board
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> + * Connect a serial line to the board
> + * Power-up the board
> +
> +
> +Booting the board
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +By default the bootloader will search for the first valid image, starting=

> +with the internal eMMC.
> diff --git a/configs/bsh_smms2pro_defconfig b/configs/bsh_smms2pro_defconf=
ig
> new file mode 100644
> index 0000000000..5f58d184b2
> --- /dev/null
> +++ b/configs/bsh_smms2pro_defconfig
> @@ -0,0 +1,42 @@
> +BR2_aarch64=3Dy
> +BR2_TARGET_GENERIC_GETTY_PORT=3D"ttymxc3"
> +BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/freescale/common/imx/imx8-bootloade=
r-prepare.sh board/bsh/bsh-imx8mn/post-build.sh"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/bsh/bsh-imx8mn/post-image.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS=3D"${UBOOT_DIR}/arch/arm/dts/imx8mn-bsh-smm-s=
2pro.dtb"
> +BR2_LINUX_KERNEL=3Dy
> +BR2_LINUX_KERNEL_CUSTOM_GIT=3Dy
> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL=3D"https://git.kernel.org/pub/scm/linux/=
kernel/git/torvalds/linux.git"
> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=3D"v5.17-rc1"
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
> +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"freescale/imx8mn-bsh-smm-s2pro"
> +BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=3Dy
> +BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy
> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
> +BR2_PACKAGE_FREESCALE_IMX=3Dy
> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=3Dy
> +BR2_PACKAGE_FIRMWARE_IMX=3Dy
> +BR2_PACKAGE_FIRMWARE_IMX_DDR3=3Dy
> +BR2_TARGET_ROOTFS_EXT2=3Dy
> +BR2_TARGET_ROOTFS_EXT2_4=3Dy
> +BR2_TARGET_ROOTFS_EXT2_SIZE=3D"120M"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=3Dy
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=3D"v2.5"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D"imx8mn"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=3Dy
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES=3D"IMX_BOOT_UART_BAS=
E=3D0x30a60000"
> +BR2_TARGET_UBOOT=3Dy
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> +BR2_TARGET_UBOOT_CUSTOM_GIT=3Dy
> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL=3D"https://gitlab.apertis.org/adalessand=
ro/u-boot.git"
> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION=3D"wip/adalessandro/bsh-smm2-pro"

This ^^^ wip name doesn=E2=80=99t sound that good to me. Ariel, is it possib=
le to give a tag with a version like v0.1? So something shorter and more cle=
ar.

> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"imx8mn_bsh_smm_s2pro"
> +BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=3Dy
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME=3D"u-boot-nodtb.bin"
> +BR2_TARGET_UBOOT_SPL=3Dy

Have you given a go with latest Buildroot docker to check if uboot needs lib=
fdtpy, python3 etc.?
It=E2=80=99s highly probable it needs them.

Kind regards
=E2=80=94-
Giulio Benetti
Benetti Engineering sas

> +BR2_PACKAGE_HOST_GENIMAGE=3Dy
> +BR2_PACKAGE_HOST_IMX_MKIMAGE=3Dy
> +BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy
> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=3Dy
> --=20
> 2.25.1
>=20
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-F10A349A-2A61-476A-A263-A2DCA5443CD1
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Michael, Ariel,<div><br></div><div>happy=
 to meet you here :-),<br><div dir=3D"ltr"><br><blockquote type=3D"cite">Il g=
iorno 29 gen 2022, alle ore 14:04, Michael Trimarchi &lt;michael@amarulasolu=
tions.com&gt; ha scritto:<br><br></blockquote></div><blockquote type=3D"cite=
"><div dir=3D"ltr">=EF=BB=BF<span>Add initial support for iMX8MN BSH SMM S2 P=
RO board:</span><br><span></span><br><span>- Linux: v5.17-rc1</span><br><spa=
n>- Uboot 2022-01-rc1 (reference tree)</span><br></div></blockquote><div><br=
></div><div>I=E2=80=99m not very sure it=E2=80=99s a good idea using an -rc1=
 version. I see 3 chances:</div><div>1) backport to previous versions(it wou=
ld be a mess)</div><div>2) wait until v5.17 is released in 7 weeks :-/</div>=
<div>3) keep as is while someone else gives his Tested-by:</div><div>For exa=
mple Ariel, that will also be one of the two maintainers of this board as I r=
ead below.</div><div>And later bump uboot and Linux versions as soon as they=
 are released.</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span>- D=
efault packages from buildroot</span><br></div></blockquote><div><br></div><=
div>Here please specify a https URL for the board like this:</div><div><a hr=
ef=3D"https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/=
">https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/</a>=
</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span></span><br><span>=
Cc: Ariel D'Alessandro &lt;ariel.dalessandro@collabora.com&gt;</span><br><sp=
an>Cc: Jagan Teki &lt;jagan@amarulasolutions.com&gt;</span><br><span>Signed-=
off-by: Michael Trimarchi &lt;michael@amarulasolutions.com&gt;</span><br><sp=
an>---</span><br><span> DEVELOPERS &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;2 +</span><br><span> board/bsh/bsh-imx8mn=
/extlinux.conf | &nbsp;4 ++</span><br><span> board/bsh/bsh-imx8mn/genimage.c=
fg &nbsp;| 17 +++++++++</span><br><span> board/bsh/bsh-imx8mn/post-build.sh |=
 &nbsp;7 ++++</span><br><span> board/bsh/bsh-imx8mn/post-image.sh | &nbsp;3 +=
+</span><br><span> board/bsh/bsh-imx8mn/readme.txt &nbsp;&nbsp;&nbsp;| 60 ++=
++++++++++++++++++++++++++++</span><br><span> configs/bsh_smms2pro_defconfig=
 &nbsp;&nbsp;&nbsp;&nbsp;| 42 +++++++++++++++++++++</span><br><span> 7 files=
 changed, 135 insertions(+)</span><br><span> create mode 100644 board/bsh/bs=
h-imx8mn/extlinux.conf</span><br><span> create mode 100644 board/bsh/bsh-imx=
8mn/genimage.cfg</span><br><span> create mode 100755 board/bsh/bsh-imx8mn/po=
st-build.sh</span><br><span> create mode 100755 board/bsh/bsh-imx8mn/post-im=
age.sh</span><br><span> create mode 100644 board/bsh/bsh-imx8mn/readme.txt</=
span><br><span> create mode 100644 configs/bsh_smms2pro_defconfig</span><br>=
<span></span><br><span>diff --git a/DEVELOPERS b/DEVELOPERS</span><br><span>=
index fe8de1916e..fc66fb6b83 100644</span><br><span>--- a/DEVELOPERS</span><=
br><span>+++ b/DEVELOPERS</span><br><span>@@ -220,6 +220,7 @@ F: &nbsp; &nbs=
p;configs/snps_archs38_hsdk_defconfig</span><br><span> F: &nbsp; &nbsp;confi=
gs/snps_archs38_vdk_defconfig</span><br><span></span><br><span> N: &nbsp; &n=
bsp;Ariel D'Alessandro &lt;ariel@vanguardiasur.com.ar&gt;</span><br><span>+F:=
 &nbsp; &nbsp;board/bsh/</span><br><span> F: &nbsp; &nbsp;package/axfsutils/=
</span><br><span> F: &nbsp; &nbsp;package/mali-t76x/</span><br><span></span>=
<br><span>@@ -2018,6 +2019,7 @@ F: &nbsp; &nbsp;package/python-crc16/</span>=
<br><span> F: &nbsp; &nbsp;package/python-pyzmq/</span><br><span></span><br>=
<span> N: &nbsp; &nbsp;Michael Trimarchi &lt;michael@amarulasolutions.com&gt=
;</span><br><span>+F: &nbsp; &nbsp;board/bsh/</span><br><span> F: &nbsp; &nb=
sp;package/python-spidev/</span><br><span></span><br><span> N: &nbsp; &nbsp;=
Michael Vetter &lt;jubalh@iodoru.org&gt;</span><br><span>diff --git a/board/=
bsh/bsh-imx8mn/extlinux.conf b/board/bsh/bsh-imx8mn/extlinux.conf</span><br>=
<span>new file mode 100644</span><br><span>index 0000000000..9111354742</spa=
n><br><span>--- /dev/null</span><br><span>+++ b/board/bsh/bsh-imx8mn/extlinu=
x.conf</span><br><span>@@ -0,0 +1,4 @@</span><br><span>+label buildroot</spa=
n><br><span>+ &nbsp;kernel /boot/Image</span><br><span>+ &nbsp;devicetree /b=
oot/freescale/imx8mn-bsh-smm-s2pro.dtb</span><br><span>+ &nbsp;append root=3D=
PARTUUID=3D%PARTUUID% rootwait rw</span><br><span>diff --git a/board/bsh/bsh=
-imx8mn/genimage.cfg b/board/bsh/bsh-imx8mn/genimage.cfg</span><br><span>new=
 file mode 100644</span><br><span>index 0000000000..4a0aa117fb</span><br><sp=
an>--- /dev/null</span><br><span>+++ b/board/bsh/bsh-imx8mn/genimage.cfg</sp=
an><br><span>@@ -0,0 +1,17 @@</span><br><span>+image sdcard.img {</span><br>=
<span>+ &nbsp; &nbsp;hdimage {</span><br><span>+ &nbsp; &nbsp; &nbsp; &nbsp;=
partition-table-type =3D "gpt"</span><br><span>+ &nbsp; &nbsp;}</span><br><s=
pan>+</span><br><span>+ &nbsp; &nbsp;partition imx-boot {</span><br><span>+ &=
nbsp; &nbsp; &nbsp; &nbsp;in-partition-table =3D "no"</span><br><span>+ &nbs=
p; &nbsp; &nbsp; &nbsp;image =3D "imx8-boot-sd.bin"</span><br><span>+ &nbsp;=
 &nbsp; &nbsp; &nbsp;offset =3D 33K</span><br><span>+ &nbsp; &nbsp;}</span><=
br><span>+</span><br><span>+ &nbsp; &nbsp;partition rootfs {</span><br><span=
>+ &nbsp; &nbsp; &nbsp; &nbsp;offset =3D 8M</span><br><span>+ &nbsp; &nbsp; &=
nbsp; &nbsp;image =3D "rootfs.ext4"</span><br><span>+ &nbsp; &nbsp; &nbsp; &=
nbsp;partition-uuid =3D %PARTUUID%</span><br><span>+ &nbsp; &nbsp;}</span><b=
r><span>+}</span><br><span>diff --git a/board/bsh/bsh-imx8mn/post-build.sh b=
/board/bsh/bsh-imx8mn/post-build.sh</span><br><span>new file mode 100755</sp=
an><br><span>index 0000000000..bf8861f6a9</span><br><span>--- /dev/null</spa=
n><br><span>+++ b/board/bsh/bsh-imx8mn/post-build.sh</span><br><span>@@ -0,0=
 +1,7 @@</span><br><span>+#!/bin/sh</span><br><span>+BOARD_DIR=3D"$(dirname $=
0)"</span><br><span>+PARTUUID=3D"$($HOST_DIR/bin/uuidgen)"</span><br><span>+=
</span><br><span>+install -d "$TARGET_DIR/boot/extlinux/"</span><br><span>+s=
ed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" &gt; "$TARGET_DIR/b=
oot/extlinux/extlinux.conf"</span><br><span>+sed "s/%PARTUUID%/$PARTUUID/g" "=
$BOARD_DIR/genimage.cfg" &gt; "$BINARIES_DIR/genimage.cfg"</span><br><span>d=
iff --git a/board/bsh/bsh-imx8mn/post-image.sh b/board/bsh/bsh-imx8mn/post-i=
mage.sh</span><br><span>new file mode 100755</span><br><span>index 000000000=
0..3452fd4501</span><br><span>--- /dev/null</span><br><span>+++ b/board/bsh/=
bsh-imx8mn/post-image.sh</span><br><span>@@ -0,0 +1,3 @@</span><br><span>+#!=
/bin/sh</span><br><span>+</span><br><span>+support/scripts/genimage.sh -c ${=
BINARIES_DIR}/genimage.cfg</span><br><span>diff --git a/board/bsh/bsh-imx8mn=
/readme.txt b/board/bsh/bsh-imx8mn/readme.txt</span><br><span>new file mode 1=
00644</span><br><span>index 0000000000..b84f2ff4be</span><br><span>--- /dev/=
null</span><br><span>+++ b/board/bsh/bsh-imx8mn/readme.txt</span><br><span>@=
@ -0,0 +1,60 @@</span><br><span>+How to build it</span><br><span>+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><br><span>+</span><br><span>+Configu=
re buildroot:</span><br><span>+</span><br><span>+ &nbsp;$ make bsh_smms2pro_=
defconfig</span><br><span>+</span><br><span>+Change settings to fit your nee=
ds (optional):</span><br><span>+</span><br><span>+ &nbsp;$ make menuconfig</=
span><br><span>+</span><br><span>+Compile everything and buildr the rootfs i=
mage:</span><br><span>+</span><br><span>+ &nbsp;$ make</span><br><span>+</sp=
an><br><span>+</span><br><span>+Result of the build</span><br><span>+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><br><span>+</span><br=
><span>+After building, the output/images directory contains:</span><br><spa=
n>+</span><br><span>+ &nbsp;output/images/</span><br><span>+ &nbsp;&nbsp;&nb=
sp;=E2=94=9C=E2=94=80=E2=94=80 bl31.bin</span><br><span>+ &nbsp;&nbsp;&nbsp;=
=E2=94=9C=E2=94=80=E2=94=80 boot.scr</span><br><span>+ &nbsp;&nbsp;&nbsp;=E2=
=94=9C=E2=94=80=E2=94=80 ddr_fw.bin</span><br><span>+ &nbsp;&nbsp;&nbsp;=E2=94=
=9C=E2=94=80=E2=94=80 Image</span><br><span>+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=
=94=80=E2=94=80 imx8-boot-sd.bin</span><br><span>+ &nbsp;&nbsp;&nbsp;=E2=94=9C=
=E2=94=80=E2=94=80 imx8mn-bsh-smm-s2pro.dtb</span><br><span>+ &nbsp;&nbsp;&n=
bsp;=E2=94=9C=E2=94=80=E2=94=80 ddr_fw.bin</span><br><span>+ &nbsp;&nbsp;&nb=
sp;=E2=94=9C=E2=94=80=E2=94=80 rootfs.ext2</span><br><span>+ &nbsp;&nbsp;&nb=
sp;=E2=94=9C=E2=94=80=E2=94=80 rootfs.ext4 -&gt; rootfs.ext2</span><br><span=
>+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80 rootfs.tar</span><br><span>=
+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80 sdcard.img</span><br><span>+=
 &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80 u-boot.bin</span><br><span>+ &=
nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80 u-boot.itb</span><br><span>+ &n=
bsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80 u-boot-nodtb.bin</span><br><span=
>+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80 u-boot-spl.bin</span><br><s=
pan>+ &nbsp;&nbsp;&nbsp;=E2=94=94=E2=94=80=E2=94=80 u-boot-spl-ddr.bin</span=
><br><span>+</span><br><span>+</span><br><span>+Flashing the emmc card image=
</span><br><span>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D</span><br><span>+</span><br><span>+To install the image o=
n on eMMC</span><br><span>+</span><br><span>+ &nbsp;$ sudo uuu -b emmc_all o=
utput/images/flash.bin output/images/sdcard.img</span><br><span>+</span><br>=
<span>+</span><br><span>+Preparing the board</span><br><span>+=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><br><span>+</span><br><span=
>+ * Connect a serial line to the board</span><br><span>+ * Power-up the boa=
rd</span><br><span>+</span><br><span>+</span><br><span>+Booting the board</s=
pan><br><span>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><br=
><span>+</span><br><span>+By default the bootloader will search for the firs=
t valid image, starting</span><br><span>+with the internal eMMC.</span><br><=
span>diff --git a/configs/bsh_smms2pro_defconfig b/configs/bsh_smms2pro_defc=
onfig</span><br><span>new file mode 100644</span><br><span>index 0000000000.=
.5f58d184b2</span><br><span>--- /dev/null</span><br><span>+++ b/configs/bsh_=
smms2pro_defconfig</span><br><span>@@ -0,0 +1,42 @@</span><br><span>+BR2_aar=
ch64=3Dy</span><br><span>+BR2_TARGET_GENERIC_GETTY_PORT=3D"ttymxc3"</span><b=
r><span>+BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/freescale/common/imx/imx8-boo=
tloader-prepare.sh board/bsh/bsh-imx8mn/post-build.sh"</span><br><span>+BR2_=
ROOTFS_POST_IMAGE_SCRIPT=3D"board/bsh/bsh-imx8mn/post-image.sh"</span><br><s=
pan>+BR2_ROOTFS_POST_SCRIPT_ARGS=3D"${UBOOT_DIR}/arch/arm/dts/imx8mn-bsh-smm=
-s2pro.dtb"</span><br><span>+BR2_LINUX_KERNEL=3Dy</span><br><span>+BR2_LINUX=
_KERNEL_CUSTOM_GIT=3Dy</span><br><span>+BR2_LINUX_KERNEL_CUSTOM_REPO_URL=3D"=
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"</span></=
div></blockquote><blockquote type=3D"cite"><div dir=3D"ltr"><span>+BR2_LINUX=
_KERNEL_CUSTOM_REPO_VERSION=3D"v5.17-rc1"</span></div></blockquote><blockquo=
te type=3D"cite"><div dir=3D"ltr"><span>+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_C=
ONFIG=3Dy</span><br><span>+BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy</span><br><span>=
+BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"freescale/imx8mn-bsh-smm-s2pro"</span><=
br><span>+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=3Dy</span><br><span>+BR2_LINUX_K=
ERNEL_INSTALL_TARGET=3Dy</span><br><span>+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSS=
L=3Dy</span><br><span>+BR2_PACKAGE_FREESCALE_IMX=3Dy</span><br><span>+BR2_PA=
CKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=3Dy</span><br><span>+BR2_PACKAGE_FIRMWAR=
E_IMX=3Dy</span><br><span>+BR2_PACKAGE_FIRMWARE_IMX_DDR3=3Dy</span><br><span=
>+BR2_TARGET_ROOTFS_EXT2=3Dy</span><br><span>+BR2_TARGET_ROOTFS_EXT2_4=3Dy</=
span><br><span>+BR2_TARGET_ROOTFS_EXT2_SIZE=3D"120M"</span><br><span>+BR2_TA=
RGET_ARM_TRUSTED_FIRMWARE=3Dy</span><br><span>+BR2_TARGET_ARM_TRUSTED_FIRMWA=
RE_CUSTOM_VERSION=3Dy</span><br><span>+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTO=
M_VERSION_VALUE=3D"v2.5"</span><br><span>+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PL=
ATFORM=3D"imx8mn"</span><br><span>+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=3Dy<=
/span><br><span>+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES=3D"IMX=
_BOOT_UART_BASE=3D0x30a60000"</span><br><span>+BR2_TARGET_UBOOT=3Dy</span><b=
r><span>+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy</span><br><span>+BR2_TARG=
ET_UBOOT_CUSTOM_GIT=3Dy</span><br><span>+BR2_TARGET_UBOOT_CUSTOM_REPO_URL=3D=
"https://gitlab.apertis.org/adalessandro/u-boot.git"</span><br><span>+BR2_TA=
RGET_UBOOT_CUSTOM_REPO_VERSION=3D"wip/adalessandro/bsh-smm2-pro"</span><br><=
/div></blockquote><div><br></div><div>This ^^^ wip name doesn=E2=80=99t soun=
d that good to me. Ariel, is it possible to give a tag with a version like v=
0.1? So something shorter and more clear.</div><br><blockquote type=3D"cite"=
><div dir=3D"ltr"><span>+BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"imx8mn_bsh_smm_=
s2pro"</span><br><span>+BR2_TARGET_UBOOT_NEEDS_DTC=3Dy</span><br><span>+BR2_=
TARGET_UBOOT_FORMAT_CUSTOM=3Dy</span><br><span>+BR2_TARGET_UBOOT_FORMAT_CUST=
OM_NAME=3D"u-boot-nodtb.bin"</span><br><span>+BR2_TARGET_UBOOT_SPL=3Dy</span=
><br></div></blockquote><div><br></div><div>Have you given a go with latest B=
uildroot docker to check if uboot needs libfdtpy, python3 etc.?</div><div>It=
=E2=80=99s highly probable it needs them.</div><div><br></div><div>Kind rega=
rds</div><div>=E2=80=94-</div><div>Giulio Benetti</div><div>Benetti Engineer=
ing sas</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span>+BR2_PACKA=
GE_HOST_GENIMAGE=3Dy</span><br><span>+BR2_PACKAGE_HOST_IMX_MKIMAGE=3Dy</span=
><br><span>+BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy</span><br><span>+BR2_PACKAGE_HO=
ST_UBOOT_TOOLS_FIT_SUPPORT=3Dy</span><br><span>-- </span><br><span>2.25.1</s=
pan><br><span></span><br><span>_____________________________________________=
__</span><br><span>buildroot mailing list</span><br><span>buildroot@buildroo=
t.org</span><br><span>https://lists.buildroot.org/mailman/listinfo/buildroot=
</span><br></div></blockquote></div></body></html>=

--Apple-Mail-F10A349A-2A61-476A-A263-A2DCA5443CD1--

--===============1495186020496932370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1495186020496932370==--
