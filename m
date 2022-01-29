Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C782BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 13:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68249405CE;
	Sat, 29 Jan 2022 13:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xv63Ko5ec5pS; Sat, 29 Jan 2022 13:54:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB4F840611;
	Sat, 29 Jan 2022 13:54:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC43D1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 13:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E66C823CF
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 13:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xhgwy-2T8x2C for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 13:54:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6331781D70
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 13:54:30 +0000 (UTC)
Received: from smtpclient.apple ([151.68.111.39])
 by Aruba Outgoing Smtp  with ESMTPA
 id DoBPn6LXqiF0aDoBQng0Qh; Sat, 29 Jan 2022 14:54:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643464468; bh=px3nGJRC5Yie+Lhe2wYY2DQWiEK6Wa4CvXPYYvyd5Xw=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=UausZmD6ONBkq9wjtEi3fhN0Dm+7lnp2jSYTf/hq4e2qy9GRKKESmEWILdlnrkfbc
 hy0wnn/SjMX5DjeyReD+NGrnQ4QdjvA3iG0rwB+noUdBAT/J1SCoGhSL7hvjEQDGSX
 DG057Om6aLfu4ggEpmahe7eyAsJufJdlv0DT1JiTD8ZIrFPraGrfYoixZpjAX2aIXP
 Ys4g2G8mIGkB/9JtX2ltQ9q4xlB+8l1zS+JiGkjXPDSKFnQFbHO/qeFp/Q8ElCjJ/O
 eXyGA1K+IuHs0tt6bPjUx66C5en11gj75oYMHl2WHD6JT8GHxERHyQDzZg/z+opVWi
 4UAZQBU1gFw6A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 29 Jan 2022 14:54:26 +0100
Message-Id: <6D05417C-EE4C-4145-BDB2-5CD9AC5A39A5@benettiengineering.com>
References: <CAOf5uwkHPx7rh5H7=zeFpkNMSj47=0vMfPO0P8oSZKnwhh8q9A@mail.gmail.com>
In-Reply-To: <CAOf5uwkHPx7rh5H7=zeFpkNMSj47=0vMfPO0P8oSZKnwhh8q9A@mail.gmail.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfGWGZBzjPDpUN97V92OWy7qa7nyy0R2VHRKKYf4a9w5aEbobxsreez4Ve/jBcAHf2tknODHDxuPo9jBY4Fudf0fQ3JdGoRIl7iNW+q9b0zChH85UiEkD
 hxdw6JcZ58F2y0bCT0jXXI9CGWvc75igMp9bC86zPz5QI4Cui8c/jo82Ayj7SKRLhc2duGfA5EMqwxApxCy8eC/06dBbEag/z6neVssP0JEtPwpQ5QdGpd42
 Rrwyhn5rprzzPtLvuvuqBapzUuF6x/sn4RGgtCqaS1FB1thu5wDiKpRtR6CXB1pUOloTihCOr8AsWzNRgKAdTOqXro913wSNnbEVNEnbSdQ=
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
Content-Type: multipart/mixed; boundary="===============6863289885879983012=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6863289885879983012==
Content-Type: multipart/alternative; boundary=Apple-Mail-67D31621-A972-4101-8EBF-9785BD45353E
Content-Transfer-Encoding: 7bit


--Apple-Mail-67D31621-A972-4101-8EBF-9785BD45353E
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Michael,

> Il giorno 29 gen 2022, alle ore 14:38, Michael Nazzareno Trimarchi <michae=
l@amarulasolutions.com> ha scritto:
>=20
> =EF=BB=BFHi Giulio
>=20
>> On Sat, Jan 29, 2022 at 2:32 PM Giulio Benetti
>> <giulio.benetti@benettiengineering.com> wrote:
>>=20
>> Hi Michael, Ariel,
>>=20
>> happy to meet you here :-),
>>=20
>> Il giorno 29 gen 2022, alle ore 14:04, Michael Trimarchi <michael@amarula=
solutions.com> ha scritto:
>>=20
>> =EF=BB=BFAdd initial support for iMX8MN BSH SMM S2 PRO board:
>>=20
>> - Linux: v5.17-rc1
>> - Uboot 2022-01-rc1 (reference tree)
>>=20
>>=20
>> I=E2=80=99m not very sure it=E2=80=99s a good idea using an -rc1 version.=
 I see 3 chances:
>> 1) backport to previous versions(it would be a mess)
>> 2) wait until v5.17 is released in 7 weeks :-/
>> 3) keep as is while someone else gives his Tested-by:
>=20
> Well, only a few people can test it. I will wait Ariel

Ok

>=20
>> For example Ariel, that will also be one of the two maintainers of this b=
oard as I read below.
>> And later bump uboot and Linux versions as soon as they are released.
>>=20
>=20
> uboot is there for a while. I have other board that get their uboot
> source from gitlab or other download point.
> I think that we need to ensure a valid commit point. I should maybe
> force uboot to a specific one

+1

>=20
>> - Default packages from buildroot
>>=20
>>=20
>> Here please specify a https URL for the board like this:
>> https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/
>>=20
>=20
> Ok
>=20
>>=20
>> Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
>> ---
>> DEVELOPERS                         |  2 +
>> board/bsh/bsh-imx8mn/extlinux.conf |  4 ++
>> board/bsh/bsh-imx8mn/genimage.cfg  | 17 +++++++++
>> board/bsh/bsh-imx8mn/post-build.sh |  7 ++++
>> board/bsh/bsh-imx8mn/post-image.sh |  3 ++
>> board/bsh/bsh-imx8mn/readme.txt    | 60 ++++++++++++++++++++++++++++++
>> configs/bsh_smms2pro_defconfig     | 42 +++++++++++++++++++++
>> 7 files changed, 135 insertions(+)
>> create mode 100644 board/bsh/bsh-imx8mn/extlinux.conf
>> create mode 100644 board/bsh/bsh-imx8mn/genimage.cfg
>> create mode 100755 board/bsh/bsh-imx8mn/post-build.sh
>> create mode 100755 board/bsh/bsh-imx8mn/post-image.sh
>> create mode 100644 board/bsh/bsh-imx8mn/readme.txt
>> create mode 100644 configs/bsh_smms2pro_defconfig
>>=20
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index fe8de1916e..fc66fb6b83 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -220,6 +220,7 @@ F:    configs/snps_archs38_hsdk_defconfig
>> F:    configs/snps_archs38_vdk_defconfig
>>=20
>> N:    Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
>> +F:    board/bsh/
>> F:    package/axfsutils/
>> F:    package/mali-t76x/
>>=20
>> @@ -2018,6 +2019,7 @@ F:    package/python-crc16/
>> F:    package/python-pyzmq/
>>=20
>> N:    Michael Trimarchi <michael@amarulasolutions.com>
>> +F:    board/bsh/
>> F:    package/python-spidev/
>>=20
>> N:    Michael Vetter <jubalh@iodoru.org>
>> diff --git a/board/bsh/bsh-imx8mn/extlinux.conf b/board/bsh/bsh-imx8mn/ex=
tlinux.conf
>> new file mode 100644
>> index 0000000000..9111354742
>> --- /dev/null
>> +++ b/board/bsh/bsh-imx8mn/extlinux.conf
>> @@ -0,0 +1,4 @@
>> +label buildroot
>> +  kernel /boot/Image
>> +  devicetree /boot/freescale/imx8mn-bsh-smm-s2pro.dtb
>> +  append root=3DPARTUUID=3D%PARTUUID% rootwait rw
>> diff --git a/board/bsh/bsh-imx8mn/genimage.cfg b/board/bsh/bsh-imx8mn/gen=
image.cfg
>> new file mode 100644
>> index 0000000000..4a0aa117fb
>> --- /dev/null
>> +++ b/board/bsh/bsh-imx8mn/genimage.cfg
>> @@ -0,0 +1,17 @@
>> +image sdcard.img {
>> +    hdimage {
>> +        partition-table-type =3D "gpt"
>> +    }
>> +
>> +    partition imx-boot {
>> +        in-partition-table =3D "no"
>> +        image =3D "imx8-boot-sd.bin"
>> +        offset =3D 33K
>> +    }
>> +
>> +    partition rootfs {
>> +        offset =3D 8M
>> +        image =3D "rootfs.ext4"
>> +        partition-uuid =3D %PARTUUID%
>> +    }
>> +}
>> diff --git a/board/bsh/bsh-imx8mn/post-build.sh b/board/bsh/bsh-imx8mn/po=
st-build.sh
>> new file mode 100755
>> index 0000000000..bf8861f6a9
>> --- /dev/null
>> +++ b/board/bsh/bsh-imx8mn/post-build.sh
>> @@ -0,0 +1,7 @@
>> +#!/bin/sh
>> +BOARD_DIR=3D"$(dirname $0)"
>> +PARTUUID=3D"$($HOST_DIR/bin/uuidgen)"
>> +
>> +install -d "$TARGET_DIR/boot/extlinux/"
>> +sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR=
/boot/extlinux/extlinux.conf"
>> +sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DI=
R/genimage.cfg"
>> diff --git a/board/bsh/bsh-imx8mn/post-image.sh b/board/bsh/bsh-imx8mn/po=
st-image.sh
>> new file mode 100755
>> index 0000000000..3452fd4501
>> --- /dev/null
>> +++ b/board/bsh/bsh-imx8mn/post-image.sh
>> @@ -0,0 +1,3 @@
>> +#!/bin/sh
>> +
>> +support/scripts/genimage.sh -c ${BINARIES_DIR}/genimage.cfg
>> diff --git a/board/bsh/bsh-imx8mn/readme.txt b/board/bsh/bsh-imx8mn/readm=
e.txt
>> new file mode 100644
>> index 0000000000..b84f2ff4be
>> --- /dev/null
>> +++ b/board/bsh/bsh-imx8mn/readme.txt
>> @@ -0,0 +1,60 @@
>> +How to build it
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +Configure buildroot:
>> +
>> +  $ make bsh_smms2pro_defconfig
>> +
>> +Change settings to fit your needs (optional):
>> +
>> +  $ make menuconfig
>> +
>> +Compile everything and buildr the rootfs image:
>> +
>> +  $ make
>> +
>> +
>> +Result of the build
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +After building, the output/images directory contains:
>> +
>> +  output/images/
>> +    =E2=94=9C=E2=94=80=E2=94=80 bl31.bin
>> +    =E2=94=9C=E2=94=80=E2=94=80 boot.scr
>> +    =E2=94=9C=E2=94=80=E2=94=80 ddr_fw.bin
>> +    =E2=94=9C=E2=94=80=E2=94=80 Image
>> +    =E2=94=9C=E2=94=80=E2=94=80 imx8-boot-sd.bin
>> +    =E2=94=9C=E2=94=80=E2=94=80 imx8mn-bsh-smm-s2pro.dtb
>> +    =E2=94=9C=E2=94=80=E2=94=80 ddr_fw.bin
>> +    =E2=94=9C=E2=94=80=E2=94=80 rootfs.ext2
>> +    =E2=94=9C=E2=94=80=E2=94=80 rootfs.ext4 -> rootfs.ext2
>> +    =E2=94=9C=E2=94=80=E2=94=80 rootfs.tar
>> +    =E2=94=9C=E2=94=80=E2=94=80 sdcard.img
>> +    =E2=94=9C=E2=94=80=E2=94=80 u-boot.bin
>> +    =E2=94=9C=E2=94=80=E2=94=80 u-boot.itb
>> +    =E2=94=9C=E2=94=80=E2=94=80 u-boot-nodtb.bin
>> +    =E2=94=9C=E2=94=80=E2=94=80 u-boot-spl.bin
>> +    =E2=94=94=E2=94=80=E2=94=80 u-boot-spl-ddr.bin
>> +
>> +
>> +Flashing the emmc card image
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> +
>> +To install the image on on eMMC
>> +
>> +  $ sudo uuu -b emmc_all output/images/flash.bin output/images/sdcard.im=
g
>> +
>> +
>> +Preparing the board
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> + * Connect a serial line to the board
>> + * Power-up the board
>> +
>> +
>> +Booting the board
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +By default the bootloader will search for the first valid image, startin=
g
>> +with the internal eMMC.
>> diff --git a/configs/bsh_smms2pro_defconfig b/configs/bsh_smms2pro_defcon=
fig
>> new file mode 100644
>> index 0000000000..5f58d184b2
>> --- /dev/null
>> +++ b/configs/bsh_smms2pro_defconfig
>> @@ -0,0 +1,42 @@
>> +BR2_aarch64=3Dy
>> +BR2_TARGET_GENERIC_GETTY_PORT=3D"ttymxc3"
>> +BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/freescale/common/imx/imx8-bootload=
er-prepare.sh board/bsh/bsh-imx8mn/post-build.sh"
>> +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"board/bsh/bsh-imx8mn/post-image.sh"
>> +BR2_ROOTFS_POST_SCRIPT_ARGS=3D"${UBOOT_DIR}/arch/arm/dts/imx8mn-bsh-smm-=
s2pro.dtb"
>> +BR2_LINUX_KERNEL=3Dy
>> +BR2_LINUX_KERNEL_CUSTOM_GIT=3Dy
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_URL=3D"https://git.kernel.org/pub/scm/linux=
/kernel/git/torvalds/linux.git"
>>=20
>> +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=3D"v5.17-rc1"
>>=20
>> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
>> +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
>> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"freescale/imx8mn-bsh-smm-s2pro"
>> +BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=3Dy
>> +BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy
>> +BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy
>> +BR2_PACKAGE_FREESCALE_IMX=3Dy
>> +BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=3Dy
>> +BR2_PACKAGE_FIRMWARE_IMX=3Dy
>> +BR2_PACKAGE_FIRMWARE_IMX_DDR3=3Dy
>> +BR2_TARGET_ROOTFS_EXT2=3Dy
>> +BR2_TARGET_ROOTFS_EXT2_4=3Dy
>> +BR2_TARGET_ROOTFS_EXT2_SIZE=3D"120M"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=3Dy
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=3D"v2.5"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D"imx8mn"
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=3Dy
>> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES=3D"IMX_BOOT_UART_BA=
SE=3D0x30a60000"
>> +BR2_TARGET_UBOOT=3Dy
>> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
>> +BR2_TARGET_UBOOT_CUSTOM_GIT=3Dy
>> +BR2_TARGET_UBOOT_CUSTOM_REPO_URL=3D"https://gitlab.apertis.org/adalessan=
dro/u-boot.git"
>> +BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION=3D"wip/adalessandro/bsh-smm2-pro"
>>=20
>>=20
>> This ^^^ wip name doesn=E2=80=99t sound that good to me. Ariel, is it pos=
sible to give a tag with a version like v0.1? So something shorter and more c=
lear.
>>=20
>> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"imx8mn_bsh_smm_s2pro"
>> +BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
>> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=3Dy
>> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME=3D"u-boot-nodtb.bin"
>> +BR2_TARGET_UBOOT_SPL=3Dy
>>=20
>>=20
>> Have you given a go with latest Buildroot docker to check if uboot needs l=
ibfdtpy, python3 etc.?
>> It=E2=80=99s highly probable it needs them.
>=20
> Suggestion, should be given to the other newest board that was added.

Correct, I=E2=80=99m going to check my latest board reviews about this

> I think that you are talking about
> host-tools here.

Yes

> Please point me to this buildroot docker

https://hub.docker.com/r/buildroot/base/tags
# docker pull buildroot/base:20211120.1925

Best regards
=E2=80=94-
Giulio Benetti
Benetti Engineering sas

>=20
> Michael
>=20
>>=20
>> Kind regards
>> =E2=80=94-
>> Giulio Benetti
>> Benetti Engineering sas
>>=20
>> +BR2_PACKAGE_HOST_GENIMAGE=3Dy
>> +BR2_PACKAGE_HOST_IMX_MKIMAGE=3Dy
>> +BR2_PACKAGE_HOST_UBOOT_TOOLS=3Dy
>> +BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=3Dy
>> --
>> 2.25.1
>>=20
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
>=20
>=20
>=20
> --=20
> Michael Nazzareno Trimarchi
> Co-Founder & Chief Executive Officer
> M. +39 347 913 2170
> michael@amarulasolutions.com
> __________________________________
>=20
> Amarula Solutions BV
> Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> T. +31 (0)85 111 9172
> info@amarulasolutions.com
> www.amarulasolutions.com

--Apple-Mail-67D31621-A972-4101-8EBF-9785BD45353E
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Michael,<br><div dir=3D"ltr"><br><blockq=
uote type=3D"cite">Il giorno 29 gen 2022, alle ore 14:38, Michael Nazzareno T=
rimarchi &lt;michael@amarulasolutions.com&gt; ha scritto:<br><br></blockquot=
e></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Hi Giulio<=
/span><br><span></span><br><span>On Sat, Jan 29, 2022 at 2:32 PM Giulio Bene=
tti</span><br><span>&lt;giulio.benetti@benettiengineering.com&gt; wrote:</sp=
an><br><blockquote type=3D"cite"><span></span><br></blockquote><blockquote t=
ype=3D"cite"><span>Hi Michael, Ariel,</span><br></blockquote><blockquote typ=
e=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>hap=
py to meet you here :-),</span><br></blockquote><blockquote type=3D"cite"><s=
pan></span><br></blockquote><blockquote type=3D"cite"><span>Il giorno 29 gen=
 2022, alle ore 14:04, Michael Trimarchi &lt;michael@amarulasolutions.com&gt=
; ha scritto:</span><br></blockquote><blockquote type=3D"cite"><span></span>=
<br></blockquote><blockquote type=3D"cite"><span>=EF=BB=BFAdd initial suppor=
t for iMX8MN BSH SMM S2 PRO board:</span><br></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>- Linux=
: v5.17-rc1</span><br></blockquote><blockquote type=3D"cite"><span>- Uboot 2=
022-01-rc1 (reference tree)</span><br></blockquote><blockquote type=3D"cite"=
><span></span><br></blockquote><blockquote type=3D"cite"><span></span><br></=
blockquote><blockquote type=3D"cite"><span>I=E2=80=99m not very sure it=E2=80=
=99s a good idea using an -rc1 version. I see 3 chances:</span><br></blockqu=
ote><blockquote type=3D"cite"><span>1) backport to previous versions(it woul=
d be a mess)</span><br></blockquote><blockquote type=3D"cite"><span>2) wait u=
ntil v5.17 is released in 7 weeks :-/</span><br></blockquote><blockquote typ=
e=3D"cite"><span>3) keep as is while someone else gives his Tested-by:</span=
><br></blockquote><span></span><br><span>Well, only a few people can test it=
. I will wait Ariel</span><br></div></blockquote><div><br></div><div>Ok</div=
><br><blockquote type=3D"cite"><div dir=3D"ltr"><span></span><br><blockquote=
 type=3D"cite"><span>For example Ariel, that will also be one of the two mai=
ntainers of this board as I read below.</span><br></blockquote><blockquote t=
ype=3D"cite"><span>And later bump uboot and Linux versions as soon as they a=
re released.</span><br></blockquote><blockquote type=3D"cite"><span></span><=
br></blockquote><span></span><br><span>uboot is there for a while. I have ot=
her board that get their uboot</span><br><span>source from gitlab or other d=
ownload point.</span><br><span>I think that we need to ensure a valid commit=
 point. I should maybe</span><br><span>force uboot to a specific one</span><=
br></div></blockquote><div><br></div><div>+1</div><br><blockquote type=3D"ci=
te"><div dir=3D"ltr"><span></span><br><blockquote type=3D"cite"><span>- Defa=
ult packages from buildroot</span><br></blockquote><blockquote type=3D"cite"=
><span></span><br></blockquote><blockquote type=3D"cite"><span></span><br></=
blockquote><blockquote type=3D"cite"><span>Here please specify a https URL f=
or the board like this:</span><br></blockquote><blockquote type=3D"cite"><sp=
an>https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/</s=
pan><br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote=
><span></span><br><span>Ok</span><br><span></span><br><blockquote type=3D"ci=
te"><span></span><br></blockquote><blockquote type=3D"cite"><span>Cc: Ariel D=
'Alessandro &lt;ariel.dalessandro@collabora.com&gt;</span><br></blockquote><=
blockquote type=3D"cite"><span>Cc: Jagan Teki &lt;jagan@amarulasolutions.com=
&gt;</span><br></blockquote><blockquote type=3D"cite"><span>Signed-off-by: M=
ichael Trimarchi &lt;michael@amarulasolutions.com&gt;</span><br></blockquote=
><blockquote type=3D"cite"><span>---</span><br></blockquote><blockquote type=
=3D"cite"><span>DEVELOPERS &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;| &nbsp;2 +</span><br></blockquote><blockquote type=3D"ci=
te"><span>board/bsh/bsh-imx8mn/extlinux.conf | &nbsp;4 ++</span><br></blockq=
uote><blockquote type=3D"cite"><span>board/bsh/bsh-imx8mn/genimage.cfg &nbsp=
;| 17 +++++++++</span><br></blockquote><blockquote type=3D"cite"><span>board=
/bsh/bsh-imx8mn/post-build.sh | &nbsp;7 ++++</span><br></blockquote><blockqu=
ote type=3D"cite"><span>board/bsh/bsh-imx8mn/post-image.sh | &nbsp;3 ++</spa=
n><br></blockquote><blockquote type=3D"cite"><span>board/bsh/bsh-imx8mn/read=
me.txt &nbsp;&nbsp;&nbsp;| 60 ++++++++++++++++++++++++++++++</span><br></blo=
ckquote><blockquote type=3D"cite"><span>configs/bsh_smms2pro_defconfig &nbsp=
;&nbsp;&nbsp;&nbsp;| 42 +++++++++++++++++++++</span><br></blockquote><blockq=
uote type=3D"cite"><span>7 files changed, 135 insertions(+)</span><br></bloc=
kquote><blockquote type=3D"cite"><span>create mode 100644 board/bsh/bsh-imx8=
mn/extlinux.conf</span><br></blockquote><blockquote type=3D"cite"><span>crea=
te mode 100644 board/bsh/bsh-imx8mn/genimage.cfg</span><br></blockquote><blo=
ckquote type=3D"cite"><span>create mode 100755 board/bsh/bsh-imx8mn/post-bui=
ld.sh</span><br></blockquote><blockquote type=3D"cite"><span>create mode 100=
755 board/bsh/bsh-imx8mn/post-image.sh</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>create mode 100644 board/bsh/bsh-imx8mn/readme.txt</span><=
br></blockquote><blockquote type=3D"cite"><span>create mode 100644 configs/b=
sh_smms2pro_defconfig</span><br></blockquote><blockquote type=3D"cite"><span=
></span><br></blockquote><blockquote type=3D"cite"><span>diff --git a/DEVELO=
PERS b/DEVELOPERS</span><br></blockquote><blockquote type=3D"cite"><span>ind=
ex fe8de1916e..fc66fb6b83 100644</span><br></blockquote><blockquote type=3D"=
cite"><span>--- a/DEVELOPERS</span><br></blockquote><blockquote type=3D"cite=
"><span>+++ b/DEVELOPERS</span><br></blockquote><blockquote type=3D"cite"><s=
pan>@@ -220,6 +220,7 @@ F: &nbsp;&nbsp;&nbsp;configs/snps_archs38_hsdk_defco=
nfig</span><br></blockquote><blockquote type=3D"cite"><span>F: &nbsp;&nbsp;&=
nbsp;configs/snps_archs38_vdk_defconfig</span><br></blockquote><blockquote t=
ype=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>N=
: &nbsp;&nbsp;&nbsp;Ariel D'Alessandro &lt;ariel@vanguardiasur.com.ar&gt;</s=
pan><br></blockquote><blockquote type=3D"cite"><span>+F: &nbsp;&nbsp;&nbsp;b=
oard/bsh/</span><br></blockquote><blockquote type=3D"cite"><span>F: &nbsp;&n=
bsp;&nbsp;package/axfsutils/</span><br></blockquote><blockquote type=3D"cite=
"><span>F: &nbsp;&nbsp;&nbsp;package/mali-t76x/</span><br></blockquote><bloc=
kquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"=
><span>@@ -2018,6 +2019,7 @@ F: &nbsp;&nbsp;&nbsp;package/python-crc16/</spa=
n><br></blockquote><blockquote type=3D"cite"><span>F: &nbsp;&nbsp;&nbsp;pack=
age/python-pyzmq/</span><br></blockquote><blockquote type=3D"cite"><span></s=
pan><br></blockquote><blockquote type=3D"cite"><span>N: &nbsp;&nbsp;&nbsp;Mi=
chael Trimarchi &lt;michael@amarulasolutions.com&gt;</span><br></blockquote>=
<blockquote type=3D"cite"><span>+F: &nbsp;&nbsp;&nbsp;board/bsh/</span><br><=
/blockquote><blockquote type=3D"cite"><span>F: &nbsp;&nbsp;&nbsp;package/pyt=
hon-spidev/</span><br></blockquote><blockquote type=3D"cite"><span></span><b=
r></blockquote><blockquote type=3D"cite"><span>N: &nbsp;&nbsp;&nbsp;Michael V=
etter &lt;jubalh@iodoru.org&gt;</span><br></blockquote><blockquote type=3D"c=
ite"><span>diff --git a/board/bsh/bsh-imx8mn/extlinux.conf b/board/bsh/bsh-i=
mx8mn/extlinux.conf</span><br></blockquote><blockquote type=3D"cite"><span>n=
ew file mode 100644</span><br></blockquote><blockquote type=3D"cite"><span>i=
ndex 0000000000..9111354742</span><br></blockquote><blockquote type=3D"cite"=
><span>--- /dev/null</span><br></blockquote><blockquote type=3D"cite"><span>=
+++ b/board/bsh/bsh-imx8mn/extlinux.conf</span><br></blockquote><blockquote t=
ype=3D"cite"><span>@@ -0,0 +1,4 @@</span><br></blockquote><blockquote type=3D=
"cite"><span>+label buildroot</span><br></blockquote><blockquote type=3D"cit=
e"><span>+ &nbsp;kernel /boot/Image</span><br></blockquote><blockquote type=3D=
"cite"><span>+ &nbsp;devicetree /boot/freescale/imx8mn-bsh-smm-s2pro.dtb</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;append root=3DPA=
RTUUID=3D%PARTUUID% rootwait rw</span><br></blockquote><blockquote type=3D"c=
ite"><span>diff --git a/board/bsh/bsh-imx8mn/genimage.cfg b/board/bsh/bsh-im=
x8mn/genimage.cfg</span><br></blockquote><blockquote type=3D"cite"><span>new=
 file mode 100644</span><br></blockquote><blockquote type=3D"cite"><span>ind=
ex 0000000000..4a0aa117fb</span><br></blockquote><blockquote type=3D"cite"><=
span>--- /dev/null</span><br></blockquote><blockquote type=3D"cite"><span>++=
+ b/board/bsh/bsh-imx8mn/genimage.cfg</span><br></blockquote><blockquote typ=
e=3D"cite"><span>@@ -0,0 +1,17 @@</span><br></blockquote><blockquote type=3D=
"cite"><span>+image sdcard.img {</span><br></blockquote><blockquote type=3D"=
cite"><span>+ &nbsp;&nbsp;&nbsp;hdimage {</span><br></blockquote><blockquote=
 type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;partition-t=
able-type =3D "gpt"</span><br></blockquote><blockquote type=3D"cite"><span>+=
 &nbsp;&nbsp;&nbsp;}</span><br></blockquote><blockquote type=3D"cite"><span>=
+</span><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp=
;partition imx-boot {</span><br></blockquote><blockquote type=3D"cite"><span=
>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;in-partition-table =3D "no"</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;image =3D "imx8-boot-sd.bin"</span><br></blockquote><blo=
ckquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;offs=
et =3D 33K</span><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;&n=
bsp;&nbsp;}</span><br></blockquote><blockquote type=3D"cite"><span>+</span><=
br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;partitio=
n rootfs {</span><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;offset =3D 8M</span><br></blockquote><bloc=
kquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;image=
 =3D "rootfs.ext4"</span><br></blockquote><blockquote type=3D"cite"><span>+ &=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;partition-uuid =3D %PARTUUID%</span=
><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;}</spa=
n><br></blockquote><blockquote type=3D"cite"><span>+}</span><br></blockquote=
><blockquote type=3D"cite"><span>diff --git a/board/bsh/bsh-imx8mn/post-buil=
d.sh b/board/bsh/bsh-imx8mn/post-build.sh</span><br></blockquote><blockquote=
 type=3D"cite"><span>new file mode 100755</span><br></blockquote><blockquote=
 type=3D"cite"><span>index 0000000000..bf8861f6a9</span><br></blockquote><bl=
ockquote type=3D"cite"><span>--- /dev/null</span><br></blockquote><blockquot=
e type=3D"cite"><span>+++ b/board/bsh/bsh-imx8mn/post-build.sh</span><br></b=
lockquote><blockquote type=3D"cite"><span>@@ -0,0 +1,7 @@</span><br></blockq=
uote><blockquote type=3D"cite"><span>+#!/bin/sh</span><br></blockquote><bloc=
kquote type=3D"cite"><span>+BOARD_DIR=3D"$(dirname $0)"</span><br></blockquo=
te><blockquote type=3D"cite"><span>+PARTUUID=3D"$($HOST_DIR/bin/uuidgen)"</s=
pan><br></blockquote><blockquote type=3D"cite"><span>+</span><br></blockquot=
e><blockquote type=3D"cite"><span>+install -d "$TARGET_DIR/boot/extlinux/"</=
span><br></blockquote><blockquote type=3D"cite"><span>+sed "s/%PARTUUID%/$PA=
RTUUID/g" "$BOARD_DIR/extlinux.conf" &gt; "$TARGET_DIR/boot/extlinux/extlinu=
x.conf"</span><br></blockquote><blockquote type=3D"cite"><span>+sed "s/%PART=
UUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" &gt; "$BINARIES_DIR/genimage.cf=
g"</span><br></blockquote><blockquote type=3D"cite"><span>diff --git a/board=
/bsh/bsh-imx8mn/post-image.sh b/board/bsh/bsh-imx8mn/post-image.sh</span><br=
></blockquote><blockquote type=3D"cite"><span>new file mode 100755</span><br=
></blockquote><blockquote type=3D"cite"><span>index 0000000000..3452fd4501</=
span><br></blockquote><blockquote type=3D"cite"><span>--- /dev/null</span><b=
r></blockquote><blockquote type=3D"cite"><span>+++ b/board/bsh/bsh-imx8mn/po=
st-image.sh</span><br></blockquote><blockquote type=3D"cite"><span>@@ -0,0 +=
1,3 @@</span><br></blockquote><blockquote type=3D"cite"><span>+#!/bin/sh</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+</span><br></blockquote=
><blockquote type=3D"cite"><span>+support/scripts/genimage.sh -c ${BINARIES_=
DIR}/genimage.cfg</span><br></blockquote><blockquote type=3D"cite"><span>dif=
f --git a/board/bsh/bsh-imx8mn/readme.txt b/board/bsh/bsh-imx8mn/readme.txt<=
/span><br></blockquote><blockquote type=3D"cite"><span>new file mode 100644<=
/span><br></blockquote><blockquote type=3D"cite"><span>index 0000000000..b84=
f2ff4be</span><br></blockquote><blockquote type=3D"cite"><span>--- /dev/null=
</span><br></blockquote><blockquote type=3D"cite"><span>+++ b/board/bsh/bsh-=
imx8mn/readme.txt</span><br></blockquote><blockquote type=3D"cite"><span>@@ -=
0,0 +1,60 @@</span><br></blockquote><blockquote type=3D"cite"><span>+How to b=
uild it</span><br></blockquote><blockquote type=3D"cite"><span>+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><br></blockquote><blockquote type=3D=
"cite"><span>+</span><br></blockquote><blockquote type=3D"cite"><span>+Confi=
gure buildroot:</span><br></blockquote><blockquote type=3D"cite"><span>+</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;$ make bsh_smms2=
pro_defconfig</span><br></blockquote><blockquote type=3D"cite"><span>+</span=
><br></blockquote><blockquote type=3D"cite"><span>+Change settings to fit yo=
ur needs (optional):</span><br></blockquote><blockquote type=3D"cite"><span>=
+</span><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;$ make menu=
config</span><br></blockquote><blockquote type=3D"cite"><span>+</span><br></=
blockquote><blockquote type=3D"cite"><span>+Compile everything and buildr th=
e rootfs image:</span><br></blockquote><blockquote type=3D"cite"><span>+</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;$ make</span><br=
></blockquote><blockquote type=3D"cite"><span>+</span><br></blockquote><bloc=
kquote type=3D"cite"><span>+</span><br></blockquote><blockquote type=3D"cite=
"><span>+Result of the build</span><br></blockquote><blockquote type=3D"cite=
"><span>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><br=
></blockquote><blockquote type=3D"cite"><span>+</span><br></blockquote><bloc=
kquote type=3D"cite"><span>+After building, the output/images directory cont=
ains:</span><br></blockquote><blockquote type=3D"cite"><span>+</span><br></b=
lockquote><blockquote type=3D"cite"><span>+ &nbsp;output/images/</span><br><=
/blockquote><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=
=94=80=E2=94=80 bl31.bin</span><br></blockquote><blockquote type=3D"cite"><s=
pan>+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80 boot.scr</span><br></blo=
ckquote><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=
=E2=94=80 ddr_fw.bin</span><br></blockquote><blockquote type=3D"cite"><span>=
+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80 Image</span><br></blockquote=
><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=
=80 imx8-boot-sd.bin</span><br></blockquote><blockquote type=3D"cite"><span>=
+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80 imx8mn-bsh-smm-s2pro.dtb</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;=E2=94=
=9C=E2=94=80=E2=94=80 ddr_fw.bin</span><br></blockquote><blockquote type=3D"=
cite"><span>+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80 rootfs.ext2</spa=
n><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;=E2=94=
=9C=E2=94=80=E2=94=80 rootfs.ext4 -&gt; rootfs.ext2</span><br></blockquote><=
blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80=
 rootfs.tar</span><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;&=
nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80 sdcard.img</span><br></blockquote><bl=
ockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80=
 u-boot.bin</span><br></blockquote><blockquote type=3D"cite"><span>+ &nbsp;&=
nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80 u-boot.itb</span><br></blockquote><bl=
ockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80=
 u-boot-nodtb.bin</span><br></blockquote><blockquote type=3D"cite"><span>+ &=
nbsp;&nbsp;&nbsp;=E2=94=9C=E2=94=80=E2=94=80 u-boot-spl.bin</span><br></bloc=
kquote><blockquote type=3D"cite"><span>+ &nbsp;&nbsp;&nbsp;=E2=94=94=E2=94=80=
=E2=94=80 u-boot-spl-ddr.bin</span><br></blockquote><blockquote type=3D"cite=
"><span>+</span><br></blockquote><blockquote type=3D"cite"><span>+</span><br=
></blockquote><blockquote type=3D"cite"><span>+Flashing the emmc card image<=
/span><br></blockquote><blockquote type=3D"cite"><span>+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</span><br></blockq=
uote><blockquote type=3D"cite"><span>+</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>+To install the image on on eMMC</span><br></blockquote><b=
lockquote type=3D"cite"><span>+</span><br></blockquote><blockquote type=3D"c=
ite"><span>+ &nbsp;$ sudo uuu -b emmc_all output/images/flash.bin output/ima=
ges/sdcard.img</span><br></blockquote><blockquote type=3D"cite"><span>+</spa=
n><br></blockquote><blockquote type=3D"cite"><span>+</span><br></blockquote>=
<blockquote type=3D"cite"><span>+Preparing the board</span><br></blockquote>=
<blockquote type=3D"cite"><span>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D</span><br></blockquote><blockquote type=3D"cite"><span>+</span>=
<br></blockquote><blockquote type=3D"cite"><span>+ * Connect a serial line t=
o the board</span><br></blockquote><blockquote type=3D"cite"><span>+ * Power=
-up the board</span><br></blockquote><blockquote type=3D"cite"><span>+</span=
><br></blockquote><blockquote type=3D"cite"><span>+</span><br></blockquote><=
blockquote type=3D"cite"><span>+Booting the board</span><br></blockquote><bl=
ockquote type=3D"cite"><span>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</span><br></blockquote><blockquote type=3D"cite"><span>+</span><br></blo=
ckquote><blockquote type=3D"cite"><span>+By default the bootloader will sear=
ch for the first valid image, starting</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>+with the internal eMMC.</span><br></blockquote><blockquot=
e type=3D"cite"><span>diff --git a/configs/bsh_smms2pro_defconfig b/configs/=
bsh_smms2pro_defconfig</span><br></blockquote><blockquote type=3D"cite"><spa=
n>new file mode 100644</span><br></blockquote><blockquote type=3D"cite"><spa=
n>index 0000000000..5f58d184b2</span><br></blockquote><blockquote type=3D"ci=
te"><span>--- /dev/null</span><br></blockquote><blockquote type=3D"cite"><sp=
an>+++ b/configs/bsh_smms2pro_defconfig</span><br></blockquote><blockquote t=
ype=3D"cite"><span>@@ -0,0 +1,42 @@</span><br></blockquote><blockquote type=3D=
"cite"><span>+BR2_aarch64=3Dy</span><br></blockquote><blockquote type=3D"cit=
e"><span>+BR2_TARGET_GENERIC_GETTY_PORT=3D"ttymxc3"</span><br></blockquote><=
blockquote type=3D"cite"><span>+BR2_ROOTFS_POST_BUILD_SCRIPT=3D"board/freesc=
ale/common/imx/imx8-bootloader-prepare.sh board/bsh/bsh-imx8mn/post-build.sh=
"</span><br></blockquote><blockquote type=3D"cite"><span>+BR2_ROOTFS_POST_IM=
AGE_SCRIPT=3D"board/bsh/bsh-imx8mn/post-image.sh"</span><br></blockquote><bl=
ockquote type=3D"cite"><span>+BR2_ROOTFS_POST_SCRIPT_ARGS=3D"${UBOOT_DIR}/ar=
ch/arm/dts/imx8mn-bsh-smm-s2pro.dtb"</span><br></blockquote><blockquote type=
=3D"cite"><span>+BR2_LINUX_KERNEL=3Dy</span><br></blockquote><blockquote typ=
e=3D"cite"><span>+BR2_LINUX_KERNEL_CUSTOM_GIT=3Dy</span><br></blockquote><bl=
ockquote type=3D"cite"><span>+BR2_LINUX_KERNEL_CUSTOM_REPO_URL=3D"https://gi=
t.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"</span><br></blockq=
uote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote typ=
e=3D"cite"><span>+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION=3D"v5.17-rc1"</span><=
br></blockquote><blockquote type=3D"cite"><span></span><br></blockquote><blo=
ckquote type=3D"cite"><span>+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy</s=
pan><br></blockquote><blockquote type=3D"cite"><span>+BR2_LINUX_KERNEL_DTS_S=
UPPORT=3Dy</span><br></blockquote><blockquote type=3D"cite"><span>+BR2_LINUX=
_KERNEL_INTREE_DTS_NAME=3D"freescale/imx8mn-bsh-smm-s2pro"</span><br></block=
quote><blockquote type=3D"cite"><span>+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=3Dy=
</span><br></blockquote><blockquote type=3D"cite"><span>+BR2_LINUX_KERNEL_IN=
STALL_TARGET=3Dy</span><br></blockquote><blockquote type=3D"cite"><span>+BR2=
_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy</span><br></blockquote><blockquote type=
=3D"cite"><span>+BR2_PACKAGE_FREESCALE_IMX=3Dy</span><br></blockquote><block=
quote type=3D"cite"><span>+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN=3Dy</sp=
an><br></blockquote><blockquote type=3D"cite"><span>+BR2_PACKAGE_FIRMWARE_IM=
X=3Dy</span><br></blockquote><blockquote type=3D"cite"><span>+BR2_PACKAGE_FI=
RMWARE_IMX_DDR3=3Dy</span><br></blockquote><blockquote type=3D"cite"><span>+=
BR2_TARGET_ROOTFS_EXT2=3Dy</span><br></blockquote><blockquote type=3D"cite">=
<span>+BR2_TARGET_ROOTFS_EXT2_4=3Dy</span><br></blockquote><blockquote type=3D=
"cite"><span>+BR2_TARGET_ROOTFS_EXT2_SIZE=3D"120M"</span><br></blockquote><b=
lockquote type=3D"cite"><span>+BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy</span><br=
></blockquote><blockquote type=3D"cite"><span>+BR2_TARGET_ARM_TRUSTED_FIRMWA=
RE_CUSTOM_VERSION=3Dy</span><br></blockquote><blockquote type=3D"cite"><span=
>+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=3D"v2.5"</span><br></=
blockquote><blockquote type=3D"cite"><span>+BR2_TARGET_ARM_TRUSTED_FIRMWARE_=
PLATFORM=3D"imx8mn"</span><br></blockquote><blockquote type=3D"cite"><span>+=
BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=3Dy</span><br></blockquote><blockquote t=
ype=3D"cite"><span>+BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES=3D"=
IMX_BOOT_UART_BASE=3D0x30a60000"</span><br></blockquote><blockquote type=3D"=
cite"><span>+BR2_TARGET_UBOOT=3Dy</span><br></blockquote><blockquote type=3D=
"cite"><span>+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy</span><br></blockquo=
te><blockquote type=3D"cite"><span>+BR2_TARGET_UBOOT_CUSTOM_GIT=3Dy</span><b=
r></blockquote><blockquote type=3D"cite"><span>+BR2_TARGET_UBOOT_CUSTOM_REPO=
_URL=3D"https://gitlab.apertis.org/adalessandro/u-boot.git"</span><br></bloc=
kquote><blockquote type=3D"cite"><span>+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION=
=3D"wip/adalessandro/bsh-smm2-pro"</span><br></blockquote><blockquote type=3D=
"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span></span>=
<br></blockquote><blockquote type=3D"cite"><span>This ^^^ wip name doesn=E2=80=
=99t sound that good to me. Ariel, is it possible to give a tag with a versi=
on like v0.1? So something shorter and more clear.</span><br></blockquote><b=
lockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"ci=
te"><span>+BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"imx8mn_bsh_smm_s2pro"</span><=
br></blockquote><blockquote type=3D"cite"><span>+BR2_TARGET_UBOOT_NEEDS_DTC=3D=
y</span><br></blockquote><blockquote type=3D"cite"><span>+BR2_TARGET_UBOOT_FO=
RMAT_CUSTOM=3Dy</span><br></blockquote><blockquote type=3D"cite"><span>+BR2_=
TARGET_UBOOT_FORMAT_CUSTOM_NAME=3D"u-boot-nodtb.bin"</span><br></blockquote>=
<blockquote type=3D"cite"><span>+BR2_TARGET_UBOOT_SPL=3Dy</span><br></blockq=
uote><blockquote type=3D"cite"><span></span><br></blockquote><blockquote typ=
e=3D"cite"><span></span><br></blockquote><blockquote type=3D"cite"><span>Hav=
e you given a go with latest Buildroot docker to check if uboot needs libfdt=
py, python3 etc.?</span><br></blockquote><blockquote type=3D"cite"><span>It=E2=
=80=99s highly probable it needs them.</span><br></blockquote><span></span><=
br><span>Suggestion, should be given to the other newest board that was adde=
d.</span><br></div></blockquote><div><br></div><div>Correct, I=E2=80=99m goi=
ng to check my latest board reviews about this</div><br><blockquote type=3D"=
cite"><div dir=3D"ltr"><span>I think that you are talking about</span><br><s=
pan>host-tools here. </span></div></blockquote><div><br></div><div>Yes</div>=
<br><blockquote type=3D"cite"><div dir=3D"ltr"><span>Please point me to this=
 buildroot docker</span><br></div></blockquote><div><br></div><div><a href=3D=
"https://hub.docker.com/r/buildroot/base/tags">https://hub.docker.com/r/buil=
droot/base/tags</a></div><div># docker pull buildroot/base:20211120.1925</di=
v><div><br></div><div>Best regards</div><div>=E2=80=94-</div><div>Giulio Ben=
etti</div><div>Benetti Engineering sas</div><br><blockquote type=3D"cite"><d=
iv dir=3D"ltr"><span></span><br><span>Michael</span><br><span></span><br><bl=
ockquote type=3D"cite"><span></span><br></blockquote><blockquote type=3D"cit=
e"><span>Kind regards</span><br></blockquote><blockquote type=3D"cite"><span=
>=E2=80=94-</span><br></blockquote><blockquote type=3D"cite"><span>Giulio Be=
netti</span><br></blockquote><blockquote type=3D"cite"><span>Benetti Enginee=
ring sas</span><br></blockquote><blockquote type=3D"cite"><span></span><br><=
/blockquote><blockquote type=3D"cite"><span>+BR2_PACKAGE_HOST_GENIMAGE=3Dy</=
span><br></blockquote><blockquote type=3D"cite"><span>+BR2_PACKAGE_HOST_IMX_=
MKIMAGE=3Dy</span><br></blockquote><blockquote type=3D"cite"><span>+BR2_PACK=
AGE_HOST_UBOOT_TOOLS=3Dy</span><br></blockquote><blockquote type=3D"cite"><s=
pan>+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=3Dy</span><br></blockquote><bl=
ockquote type=3D"cite"><span>--</span><br></blockquote><blockquote type=3D"c=
ite"><span>2.25.1</span><br></blockquote><blockquote type=3D"cite"><span></s=
pan><br></blockquote><blockquote type=3D"cite"><span>_______________________=
________________________</span><br></blockquote><blockquote type=3D"cite"><s=
pan>buildroot mailing list</span><br></blockquote><blockquote type=3D"cite">=
<span>buildroot@buildroot.org</span><br></blockquote><blockquote type=3D"cit=
e"><span>https://lists.buildroot.org/mailman/listinfo/buildroot</span><br></=
blockquote><span></span><br><span></span><br><span></span><br><span>-- </spa=
n><br><span>Michael Nazzareno Trimarchi</span><br><span>Co-Founder &amp; Chi=
ef Executive Officer</span><br><span>M. +39 347 913 2170</span><br><span>mic=
hael@amarulasolutions.com</span><br><span>__________________________________=
</span><br><span></span><br><span>Amarula Solutions BV</span><br><span>Joop G=
eesinkweg 125, 1114 AB, Amsterdam, NL</span><br><span>T. +31 (0)85 111 9172<=
/span><br><span>info@amarulasolutions.com</span><br><span>www.amarulasolutio=
ns.com</span><br></div></blockquote></body></html>=

--Apple-Mail-67D31621-A972-4101-8EBF-9785BD45353E--


--===============6863289885879983012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6863289885879983012==--


