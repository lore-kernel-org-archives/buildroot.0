Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73321EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 05:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A58060634;
	Sun, 25 Jun 2023 05:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A58060634
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFeuTFW9PAXu; Sun, 25 Jun 2023 05:43:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF26660B16;
	Sun, 25 Jun 2023 05:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF26660B16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 666481BF409
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 05:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CFC5400D2
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 05:43:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CFC5400D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yrQC9eeV8Y4d for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 05:43:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2C0B400BA
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2C0B400BA
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 05:43:20 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6b5915d0816so1812285a34.1
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 22:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687671799; x=1690263799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JohlRKbVK5qnIg4FdbVLZeJ+Yf9e7X2UMs5FUw8+q78=;
 b=U9WeZCdh8JLONTl1WbUgVqosOEvlM7lpOYleWhgGz4uJfDNfMARoHpR61mpmoQf+5w
 viBKlRXKWV6sn/HFKW6N0OpuHwtt4bgrrSO5IoHnp1FGqCfW0ImLT3O1U+8vcuFGttez
 eGEeQmGFhGHm/NUvCQ9FrfhRW9zvz56sdEvhzlSMlEjYgorjRiemZ9GBaazcBj9Jp5n0
 O2thrk9lRpXfbShLRHpgds+AM3f7zwmN6fftt7fvl+fz2/7vHlIC+yFY5zmMcEgMKomN
 cNVXOQP3q4eU3F1Z3WVRbPLJwUb1vDes/pmtQ84hs8xCHS49ElM+NjDrlSpilmLD65uD
 ZS4A==
X-Gm-Message-State: AC+VfDwfF9CuqG8reLIxICAcUhEbqMVeCVFOxwul9nrznn4ifhThm0So
 qxh2aVr8MfPLL639oBB5EAVn2AUodmvVEpFCzq35eA/x6txra/rO3ZhR5Q==
X-Google-Smtp-Source: ACHHUZ4pRtwgPIhvPHfsdBbGtbUCbVR8d9KKnL4ah0w07l5N7yrL8/z2Og2JbWNgDKUv47f1/S5txRzQ0LFoZ0X7LNY=
X-Received: by 2002:a05:6830:3a0a:b0:6b4:5091:d408 with SMTP id
 di10-20020a0568303a0a00b006b45091d408mr22790885otb.16.1687671799682; Sat, 24
 Jun 2023 22:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-6-dannenberg@ti.com>
In-Reply-To: <20230622160212.2063472-6-dannenberg@ti.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 25 Jun 2023 07:42:47 +0200
Message-ID: <CAAE6iEVZSojnPcJxyM_o=jqi7huc_ymN00hyzLp0gkxNcUfEWA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1687671799; x=1690263799;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JohlRKbVK5qnIg4FdbVLZeJ+Yf9e7X2UMs5FUw8+q78=;
 b=E6ordb9BwGNVV7V1BoItr7O0jYy3YIzEqoxwlP0ChO0QRekBWV5F3z1mek1OKNF+71
 VpsTPkr9Y+vAQXlWqscjc0hlYQKh/xm/D30W7SlPwkrXZU3ck+c4/pM1lyyVgUqEkuSL
 YWfU6lMjFwBkBrC1uZsOYQ6TmV9yu8kftz6V2aB+JWAbVrmdEYcb6z9R+k/svcq1R3lG
 JzBc7sicDGZmnwZscowyFxM0rCr0rEr1UKV7Y5bdz8aHdgNvHB1SEP4lgOo/wszV0lCY
 cbi/WERg5MFlreCdmQ4Nqcq6vVzBUFwBM2AtZWuzZmpNQYRxLJQ8B8qNaGnbH4b2Lfjx
 XqRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=E6ordb9B
Subject: Re: [Buildroot] [PATCH v9 05/11] board/ti/am62x_sk: add new board
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
Cc: Xuanhao Shi <x-shi@ti.com>, Andreas Dannenberg <dannenberg@ti.com>
Content-Type: multipart/mixed; boundary="===============5645751534089466021=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5645751534089466021==
Content-Type: multipart/alternative; boundary="0000000000001e2ce405feedb6fc"

--0000000000001e2ce405feedb6fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 22 juin 2023 =C3=A0 18:07, Andreas Dannenberg via buildroot <
buildroot@buildroot.org> a =C3=A9crit :

> From: Xuanhao Shi <x-shi@ti.com>
>
> Adds support for TI's SK-AM62 board by introducing the
> am62x_sk_defconfig file and related support files.
>
> More information about the board can be found at:
> https://www.ti.com/tool/SK-AM62
>
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>  DEVELOPERS                     |  4 +++
>  board/ti/am62x_sk/genimage.cfg | 27 ++++++++++++++++++++
>  board/ti/am62x_sk/readme.txt   | 26 ++++++++++++++++++++
>  configs/am62x_sk_defconfig     | 45 ++++++++++++++++++++++++++++++++++
>  4 files changed, 102 insertions(+)
>  create mode 100644 board/ti/am62x_sk/genimage.cfg
>  create mode 100644 board/ti/am62x_sk/readme.txt
>  create mode 100644 configs/am62x_sk_defconfig
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a4d729983b..8ce903b294 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -129,9 +129,11 @@ F: package/libxmlrpc/
>  F:     package/python-docopt/
>
>  N:     Anand Gadiyar <gadiyar@ti.com>
> +F:     board/ti/am62x_sk/
>  F:     board/ti/am64x_sk/
>  F:     boot/ti-k3-image-gen/
>  F:     boot/ti-k3-r5-loader/
> +F:     configs/am62x_sk_defconfig
>  F:     configs/am64x_sk_defconfig
>
>  N:     Andr=C3=A9 Zwing <nerv@dawncrow.de>
> @@ -3023,9 +3025,11 @@ N:       Wojciech Nizi=C5=84ski <niziak@spox.org>
>  F:     package/fwup/
>
>  N:     Xuanhao Shi <X15000177@gmail.com>
> +F:     board/ti/am62x_sk/
>  F:     board/ti/am64x_sk/
>  F:     boot/ti-k3-image-gen/
>  F:     boot/ti-k3-r5-loader/
> +F:     configs/am62x_sk_defconfig
>  F:     configs/am64x_sk_defconfig
>
>  N:     Yair Ben Avraham <yairba@protonmail.com>
> diff --git a/board/ti/am62x_sk/genimage.cfg
> b/board/ti/am62x_sk/genimage.cfg
> new file mode 100644
> index 0000000000..26304fe98f
> --- /dev/null
> +++ b/board/ti/am62x_sk/genimage.cfg
> @@ -0,0 +1,27 @@
> +image boot.vfat {
> +       vfat {
> +               files =3D {
> +                       "tiboot3.bin",
> +                       "tispl.bin",
> +                       "u-boot.img",
> +               }
> +       }
> +
> +       size =3D 16M
> +}
> +
> +image sdcard.img {
> +       hdimage {
> +       }
> +
> +       partition u-boot {
> +               partition-type =3D 0xC
> +               bootable =3D "true"
> +               image =3D "boot.vfat"
> +       }
> +
> +       partition rootfs {
> +               partition-type =3D 0x83
> +               image =3D "rootfs.ext4"
> +       }
> +}
> diff --git a/board/ti/am62x_sk/readme.txt b/board/ti/am62x_sk/readme.txt
> new file mode 100644
> index 0000000000..ccbb24896b
> --- /dev/null
> +++ b/board/ti/am62x_sk/readme.txt
> @@ -0,0 +1,26 @@
> +Texas Instuments SK-AM62 Test and Development Board
> +
> +Description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +This configuration will build a complete image for the TI SK-AM62 board.
> +
> +How to Build
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Select the default configuration for the target:
> +$ make am62x_sk_defconfig
> +
> +Optional: modify the configuration:
> +$ make menuconfig
> +
> +Build:
> +$ make
> +
> +To copy the resultimg output image file to an SD card use dd:
> +$ dd if=3Doutput/images/sdcard.img of=3D/dev/sdX bs=3D1M
> +
> +How to Run
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Insert the SD card into the SK-AM62 board, and power it up through
> +the USB Type-C connector. The system should come up. You can use
> +a micro-USB cable to connect to the connector labeled UART to
> +communicate with the board.
> diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defconfig
> new file mode 100644
> index 0000000000..083720f512
> --- /dev/null
> +++ b/configs/am62x_sk_defconfig
> @@ -0,0 +1,45 @@
> +BR2_aarch64=3Dy
> +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c board/ti/am62x_sk/genimage.cfg"
> +BR2_LINUX_KERNEL=3Dy
> +BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy
> +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"ti/k3-am625-sk"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy
>

BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy  is missing at least at the end of
the serie.

Fran=C3=A7ois


> +BR2_PACKAGE_LINUX_FIRMWARE=3Dy
> +BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=3Dy
> +BR2_TARGET_ROOTFS_EXT2=3Dy
> +BR2_TARGET_ROOTFS_EXT2_4=3Dy
> +BR2_TARGET_ROOTFS_EXT2_SIZE=3D"256M"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=3Dy
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=3D"v2.7.0"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D"k3"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD=3D"lite"
> +BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=3Dy
> +BR2_TARGET_OPTEE_OS=3Dy
> +BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3"
> +BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
> +BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am62x"
> +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_GP=3Dy
> +BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D"evm"
> +BR2_TARGET_TI_K3_R5_LOADER=3Dy
> +BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG=3D"am62x_evm_r5"
> +BR2_TARGET_UBOOT=3Dy
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> +BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy
> +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D"2022.10"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"am62x_evm_a53"
> +BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> +BR2_TARGET_UBOOT_NEEDS_ATF_BL31=3Dy
> +BR2_TARGET_UBOOT_NEEDS_TI_K3_DM=3Dy
> +BR2_TARGET_UBOOT_TI_K3_DM_SOC=3D"am62xx"
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_IMG=3Dy
> +BR2_TARGET_UBOOT_SPL=3Dy
> +BR2_TARGET_UBOOT_SPL_NAME=3D"tispl.bin"
> +BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS=3D"TEE=3D$(BINARIES_DIR)/tee-pager_v2.b=
in"
> +BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy
> +BR2_PACKAGE_HOST_GENIMAGE=3Dy
> +BR2_PACKAGE_HOST_MTOOLS=3Dy
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000001e2ce405feedb6fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 22 juin 2023 =C3=A0=C2=
=A018:07, Andreas Dannenberg via buildroot &lt;<a href=3D"mailto:buildroot@=
buildroot.org">buildroot@buildroot.org</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Xuanhao Shi &lt;<a=
 href=3D"mailto:x-shi@ti.com" target=3D"_blank">x-shi@ti.com</a>&gt;<br>
<br>
Adds support for TI&#39;s SK-AM62 board by introducing the<br>
am62x_sk_defconfig file and related support files.<br>
<br>
More information about the board can be found at:<br>
<a href=3D"https://www.ti.com/tool/SK-AM62" rel=3D"noreferrer" target=3D"_b=
lank">https://www.ti.com/tool/SK-AM62</a><br>
<br>
Signed-off-by: Xuanhao Shi &lt;<a href=3D"mailto:x-shi@ti.com" target=3D"_b=
lank">x-shi@ti.com</a>&gt;<br>
Signed-off-by: Andreas Dannenberg &lt;<a href=3D"mailto:dannenberg@ti.com" =
target=3D"_blank">dannenberg@ti.com</a>&gt;<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 4 +++<br>
=C2=A0board/ti/am62x_sk/genimage.cfg | 27 ++++++++++++++++++++<br>
=C2=A0board/ti/am62x_sk/readme.txt=C2=A0 =C2=A0| 26 ++++++++++++++++++++<br=
>
=C2=A0configs/am62x_sk_defconfig=C2=A0 =C2=A0 =C2=A0| 45 ++++++++++++++++++=
++++++++++++++++<br>
=C2=A04 files changed, 102 insertions(+)<br>
=C2=A0create mode 100644 board/ti/am62x_sk/genimage.cfg<br>
=C2=A0create mode 100644 board/ti/am62x_sk/readme.txt<br>
=C2=A0create mode 100644 configs/am62x_sk_defconfig<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index a4d729983b..8ce903b294 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -129,9 +129,11 @@ F: package/libxmlrpc/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/python-docopt/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Anand Gadiyar &lt;<a href=3D"mailto:gadiyar@ti.=
com" target=3D"_blank">gadiyar@ti.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0board/ti/am62x_sk/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0board/ti/am64x_sk/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-image-gen/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-r5-loader/<br>
+F:=C2=A0 =C2=A0 =C2=A0configs/am62x_sk_defconfig<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0configs/am64x_sk_defconfig<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Andr=C3=A9 Zwing &lt;<a href=3D"mailto:nerv@daw=
ncrow.de" target=3D"_blank">nerv@dawncrow.de</a>&gt;<br>
@@ -3023,9 +3025,11 @@ N:=C2=A0 =C2=A0 =C2=A0 =C2=A0Wojciech Nizi=C5=84ski =
&lt;<a href=3D"mailto:niziak@spox.org" target=3D"_blank">niziak@spox.org</a=
>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/fwup/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Xuanhao Shi &lt;<a href=3D"mailto:X15000177@gma=
il.com" target=3D"_blank">X15000177@gmail.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0board/ti/am62x_sk/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0board/ti/am64x_sk/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-image-gen/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-r5-loader/<br>
+F:=C2=A0 =C2=A0 =C2=A0configs/am62x_sk_defconfig<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0configs/am64x_sk_defconfig<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Yair Ben Avraham &lt;<a href=3D"mailto:yairba@p=
rotonmail.com" target=3D"_blank">yairba@protonmail.com</a>&gt;<br>
diff --git a/board/ti/am62x_sk/genimage.cfg b/board/ti/am62x_sk/genimage.cf=
g<br>
new file mode 100644<br>
index 0000000000..26304fe98f<br>
--- /dev/null<br>
+++ b/board/ti/am62x_sk/genimage.cfg<br>
@@ -0,0 +1,27 @@<br>
+image boot.vfat {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0vfat {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0files =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;tiboot3.bin&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;tispl.bin&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;u-boot.img&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D 16M<br>
+}<br>
+<br>
+image sdcard.img {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hdimage {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0partition u-boot {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0xC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootable =3D &quot;=
true&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;boo=
t.vfat&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0partition rootfs {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0x83<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;roo=
tfs.ext4&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
diff --git a/board/ti/am62x_sk/readme.txt b/board/ti/am62x_sk/readme.txt<br=
>
new file mode 100644<br>
index 0000000000..ccbb24896b<br>
--- /dev/null<br>
+++ b/board/ti/am62x_sk/readme.txt<br>
@@ -0,0 +1,26 @@<br>
+Texas Instuments SK-AM62 Test and Development Board<br>
+<br>
+Description<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+This configuration will build a complete image for the TI SK-AM62 board.<b=
r>
+<br>
+How to Build<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+Select the default configuration for the target:<br>
+$ make am62x_sk_defconfig<br>
+<br>
+Optional: modify the configuration:<br>
+$ make menuconfig<br>
+<br>
+Build:<br>
+$ make<br>
+<br>
+To copy the resultimg output image file to an SD card use dd:<br>
+$ dd if=3Doutput/images/sdcard.img of=3D/dev/sdX bs=3D1M<br>
+<br>
+How to Run<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+Insert the SD card into the SK-AM62 board, and power it up through<br>
+the USB Type-C connector. The system should come up. You can use<br>
+a micro-USB cable to connect to the connector labeled UART to<br>
+communicate with the board.<br>
diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defconfig<br>
new file mode 100644<br>
index 0000000000..083720f512<br>
--- /dev/null<br>
+++ b/configs/am62x_sk_defconfig<br>
@@ -0,0 +1,45 @@<br>
+BR2_aarch64=3Dy<br>
+BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;support/scripts/genimage.sh&quot;<br>
+BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c board/ti/am62x_sk/genimage.cfg&quot=
;<br>
+BR2_LINUX_KERNEL=3Dy<br>
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=3Dy<br>
+BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
+BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;ti/k3-am625-sk&quot;<br>
+BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy<br></blockquote><div><br></div><div>BR=
2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=3Dy =C2=A0is missing at least at the end =
of the serie.<br><br></div><div>Fran=C3=A7ois<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
+BR2_PACKAGE_LINUX_FIRMWARE=3Dy<br>
+BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2_SIZE=3D&quot;256M&quot;<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=3Dy<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=3Dy<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE=3D&quot;v2.7.0&quot;<=
br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM=3D&quot;k3&quot;<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD=3D&quot;lite&quot;<br>
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=3Dy<br>
+BR2_TARGET_OPTEE_OS=3Dy<br>
+BR2_TARGET_OPTEE_OS_PLATFORM=3D&quot;k3&quot;<br>
+BR2_TARGET_TI_K3_IMAGE_GEN=3Dy<br>
+BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D&quot;am62x&quot;<br>
+BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE_GP=3Dy<br>
+BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D&quot;evm&quot;<br>
+BR2_TARGET_TI_K3_R5_LOADER=3Dy<br>
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG=3D&quot;am62x_evm_r5&quot;<br>
+BR2_TARGET_UBOOT=3Dy<br>
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
+BR2_TARGET_UBOOT_CUSTOM_VERSION=3Dy<br>
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE=3D&quot;2022.10&quot;<br>
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;am62x_evm_a53&quot;<br>
+BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_TI_K3_DM=3Dy<br>
+BR2_TARGET_UBOOT_TI_K3_DM_SOC=3D&quot;am62xx&quot;<br>
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set<br>
+BR2_TARGET_UBOOT_FORMAT_IMG=3Dy<br>
+BR2_TARGET_UBOOT_SPL=3Dy<br>
+BR2_TARGET_UBOOT_SPL_NAME=3D&quot;tispl.bin&quot;<br>
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS=3D&quot;TEE=3D$(BINARIES_DIR)/tee-pager_v=
2.bin&quot;<br>
+BR2_PACKAGE_HOST_DOSFSTOOLS=3Dy<br>
+BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
+BR2_PACKAGE_HOST_MTOOLS=3Dy<br>
-- <br>
2.34.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--0000000000001e2ce405feedb6fc--

--===============5645751534089466021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5645751534089466021==--
