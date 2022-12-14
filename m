Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFDBDC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 20:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 199FA40012;
	Wed, 14 Dec 2022 20:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 199FA40012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CAVhPo9d2auS; Wed, 14 Dec 2022 20:14:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C591440BD5;
	Wed, 14 Dec 2022 20:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C591440BD5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC7211BF3C5
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 20:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7CA581F96
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 20:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7CA581F96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HFIBcUayt0At for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 20:14:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00E0A81F90
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00E0A81F90
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 20:14:03 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c66so24200055edf.5
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 12:14:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g4pZKbQ/qYAoZ0ZJsrAtFMVj30J1PqhTfkWxB9AOtNA=;
 b=YOsZtXWLcv4HzGmtGDwJ5RxkPEWcY79zHQpJd4NtUPbAAWdCS9ARJ/98UvM23QaH8P
 SV1xmyQTTIClQooMQciL88yF7GPDfoGrO+Uo4cJ3ZKzoEsnS2NQHmCsbVRA5KYTePK9N
 HLD1+vmTtZTfWBkrIka/2GhSluJIGhM2ZUp2kMVnOxEYuGP+CpwcOQZzLg5Ro6IOpu6w
 9zyyS1qUWT2xJzZS1mAbd9XyJoqYmBzgQX0s3XKetdMYsT0e1sTJuiTTPoyU3mtzpQ9O
 V/UcnchReDmTc90LzHowPMCft4PFWR+UQ7dvZkDWunOKHSTSql+NOJs2usrjYUrQExMO
 ROxw==
X-Gm-Message-State: ANoB5pkVFOhxRAZNBVElKyR5TN0WsNtnhSacYi157hMag3lX/ZSyLfzI
 GDo4HLsXDJcU2uGawgIwMoOsItC/x7JeHJEyV+o=
X-Google-Smtp-Source: AA0mqf75XvqKFhaAc0TfFrwVdpZmY82/SyAiVS+8B8FXc/IzxxcdpXAbvom89+YVloP/5tZPOJY+4Rwfrg2NVmIbCns=
X-Received: by 2002:aa7:dbca:0:b0:458:3f65:4e42 with SMTP id
 v10-20020aa7dbca000000b004583f654e42mr87068854edt.39.1671048842044; Wed, 14
 Dec 2022 12:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20221213232159.855265-1-angelo@amarulasolutions.com>
 <20221213232159.855265-2-angelo@amarulasolutions.com>
In-Reply-To: <20221213232159.855265-2-angelo@amarulasolutions.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Wed, 14 Dec 2022 22:13:50 +0200
Message-ID: <CA+fTLhiBZN_VCvdq65VwP1o4nfoaf5L7rg_L-wu6ToV4vA3nTg@mail.gmail.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=g4pZKbQ/qYAoZ0ZJsrAtFMVj30J1PqhTfkWxB9AOtNA=;
 b=V2v9BdCrfMwk+Uw4ibHSVn7NIDDYVJy2yf3zukoaYjGLdVA+72Yxua3DxpWajZKHzd
 uisff2a25sdU3arN8Dx4+Yu+CZJZeqox6G3PYyg8QxGZKlZY7w/Dz8XBBWXDO2RVYrfA
 0zGimDMfZdpU1mtpa8UmeFzjdtjj3nBmt4fpgkCpD9RpXCWVF+rNEFGGRa0hiRlxw0fj
 AF2bCLtY7xK/V2CZJDRVUO0+RGSlrC2Dj2ZYJg07Ps2Yxj3Z+LiU02kTBtwrXeJq+SmQ
 8cFBq7LwV9Nhze3bUV4HiNPgOCGvKrIhzZktt2azSGynIVXFtc17niVBwDyhGNIFgBS7
 v7hA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V2v9BdCr
Subject: Re: [Buildroot] [PATCH v4 2/3] configs/lichee_rv: new defconfig
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6294544874357502947=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6294544874357502947==
Content-Type: multipart/alternative; boundary="000000000000a1e6e105efcf6004"

--000000000000a1e6e105efcf6004
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Angelo Compagnucci (<angelo@amarulasolutions.com>) kirjutas
kuup=C3=A4eval K, 14. detsember 2022 kell 01:22:

> Lichee RV - Nezha CM is a compute module with modular design, equipped
> with Allwinner D1 chip (based on T-Head XuanTie C906 core), 512MB DDR3
> RAM.
> Board support is based on the nezha defconfig already available in
> buildroot.
>
> https://wiki.sipeed.com/hardware/en/lichee/RV/RV.html
> https://linux-sunxi.org/Sipeed_Lichee_RV
>
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> v4:
> * bump to latest kernel/uboot/opensbi as for the nezha defconfig
>
>  board/sipeed/lichee_rv/genimage.cfg           | 19 +++++++++++
>  .../overlay/boot/extlinux/extlinux.conf       |  4 +++
>  board/sipeed/lichee_rv/readme.txt             | 26 +++++++++++++++
>  configs/sipeed_lichee_rv_defconfig            | 33 +++++++++++++++++++
>  4 files changed, 82 insertions(+)
>  create mode 100644 board/sipeed/lichee_rv/genimage.cfg
>  create mode 100644
> board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf
>  create mode 100644 board/sipeed/lichee_rv/readme.txt
>  create mode 100644 configs/sipeed_lichee_rv_defconfig
>
> diff --git a/board/sipeed/lichee_rv/genimage.cfg
> b/board/sipeed/lichee_rv/genimage.cfg
> new file mode 100644
> index 0000000000..d5df41203d
> --- /dev/null
> +++ b/board/sipeed/lichee_rv/genimage.cfg
> @@ -0,0 +1,19 @@
> +# Minimal SD card image for the sipeed Lichee RV
> +
> +image sdcard.img {
> +       hdimage {
> +       }
> +
> +       partition u-boot {
> +               in-partition-table =3D false
> +               image =3D "u-boot-sunxi-with-spl.bin"
> +               offset =3D 8K
> +       }
> +
> +       partition rootfs {
> +               partition-type =3D 0x83
> +               image =3D "rootfs.ext4"
> +               bootable =3D "true"
> +               offset =3D 1M
> +       }
> +}
> diff --git a/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf
> b/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf
> new file mode 100644
> index 0000000000..91b2298628
> --- /dev/null
> +++ b/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf
> @@ -0,0 +1,4 @@
> +label linux
> +  kernel /boot/Image
> +  # use devicetree from u-boot
> +  append console=3DttyS0,115200 root=3D/dev/mmcblk0p1 ro rootwait
> diff --git a/board/sipeed/lichee_rv/readme.txt
> b/board/sipeed/lichee_rv/readme.txt
> new file mode 100644
> index 0000000000..008be3a3bc
> --- /dev/null
> +++ b/board/sipeed/lichee_rv/readme.txt
> @@ -0,0 +1,26 @@
> +Lichee RV
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Lichee RV - Nezha CM is a compute module with modular design, equipped
> +with Allwinner D1 chip (based on T-Head XuanTie C906 core), 512MB DDR3
> RAM.
> +It can boot from TF card or SD-NAND, uses two sets of M.2 b key 67 pin
> +connectors to route all IO, making it convient for wide use and easy to
> replace.
> +
> +How to build
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +$ make lichee_rv_defconfig
>

This should be 'make sipeed_lichee_rv_defconfig'


> +$ make
> +
> +How to write the SD card
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Once the build process is finished you will have an image called
> "sdcard.img"
> +in the output/images/ directory.
> +
> +Copy the bootable "sdcard.img" onto an SD card with "dd":
> +
> +  $ sudo dd if=3Doutput/images/sdcard.img of=3D/dev/sdX
> +
> +Connect a TTL UART to the debug connector, insert the microSD card and
> +plug in a USB-C cable to the PWR connector to boot the system.
> diff --git a/configs/sipeed_lichee_rv_defconfig
> b/configs/sipeed_lichee_rv_defconfig
> new file mode 100644
> index 0000000000..f9782f870b
> --- /dev/null
> +++ b/configs/sipeed_lichee_rv_defconfig
> @@ -0,0 +1,33 @@
> +BR2_riscv=3Dy
> +BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=3Dy
> +BR2_ROOTFS_OVERLAY=3D"board/sipeed/lichee_rv/overlay"
> +BR2_ROOTFS_POST_IMAGE_SCRIPT=3D"support/scripts/genimage.sh"
> +BR2_ROOTFS_POST_SCRIPT_ARGS=3D"-c board/sipeed/lichee_rv/genimage.cfg"
> +BR2_LINUX_KERNEL=3Dy
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D"$(call
> github,smaeul,linux,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca678=
38d84af4c9f85d06311c9e98e1adf46308f.tar.gz"
> +BR2_LINUX_KERNEL_DEFCONFIG=3D"nezha"
> +BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy
> +BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D"allwinner/sun20i-d1-lichee-rv"
> +BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy
> +BR2_TARGET_ROOTFS_EXT2=3Dy
> +BR2_TARGET_ROOTFS_EXT2_4=3Dy
> +# BR2_TARGET_ROOTFS_TAR is not set
> +BR2_TARGET_OPENSBI=3Dy
> +BR2_TARGET_OPENSBI_CUSTOM_VERSION=3Dy
> +BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE=3D"1.1"
> +BR2_TARGET_OPENSBI_PLAT=3D"generic"
> +# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
> +BR2_TARGET_UBOOT=3Dy
> +BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL=3Dy
> +BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D"$(call
> github,smaeul,u-boot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528a=
e9bc6c55edd3ffe642734b4132a8246ea777.tar.gz"
> +BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D"lichee_rv_dock"
>

In the future - when proper defconfig (supposedly 'lichee_rv') will be
added to u-boot this should be changed accordingly. Currently the device
tree is dock specific.


> +BR2_TARGET_UBOOT_NEEDS_DTC=3Dy
> +BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy
> +BR2_TARGET_UBOOT_NEEDS_OPENSBI=3Dy
> +# BR2_TARGET_UBOOT_FORMAT_BIN is not set
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM=3Dy
> +BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME=3D"u-boot-sunxi-with-spl.bin"
> +BR2_PACKAGE_HOST_GENIMAGE=3Dy
> --
> 2.34.1
>
>

--000000000000a1e6e105efcf6004
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Kontakt Angelo Compagnucci (&lt;<a href=
=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">angelo@amarulasol=
utions.com</a>&gt;) kirjutas kuup=C3=A4eval K, 14. detsember 2022 kell 01:2=
2:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Lichee RV - Nezha CM is a compute module with modular design,=
 equipped<br>
with Allwinner D1 chip (based on T-Head XuanTie C906 core), 512MB DDR3<br>
RAM.<br>
Board support is based on the nezha defconfig already available in<br>
buildroot.<br>
<br>
<a href=3D"https://wiki.sipeed.com/hardware/en/lichee/RV/RV.html" rel=3D"no=
referrer" target=3D"_blank">https://wiki.sipeed.com/hardware/en/lichee/RV/R=
V.html</a><br>
<a href=3D"https://linux-sunxi.org/Sipeed_Lichee_RV" rel=3D"noreferrer" tar=
get=3D"_blank">https://linux-sunxi.org/Sipeed_Lichee_RV</a><br>
<br>
Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolut=
ions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br>
---<br>
v4:<br>
* bump to latest kernel/uboot/opensbi as for the nezha defconfig<br>
<br>
=C2=A0board/sipeed/lichee_rv/genimage.cfg=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 19 +++++++++++<br>
=C2=A0.../overlay/boot/extlinux/extlinux.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 4 +++<br>
=C2=A0board/sipeed/lichee_rv/readme.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 26 +++++++++++++++<br>
=C2=A0configs/sipeed_lichee_rv_defconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 33 +++++++++++++++++++<br>
=C2=A04 files changed, 82 insertions(+)<br>
=C2=A0create mode 100644 board/sipeed/lichee_rv/genimage.cfg<br>
=C2=A0create mode 100644 board/sipeed/lichee_rv/overlay/boot/extlinux/extli=
nux.conf<br>
=C2=A0create mode 100644 board/sipeed/lichee_rv/readme.txt<br>
=C2=A0create mode 100644 configs/sipeed_lichee_rv_defconfig<br>
<br>
diff --git a/board/sipeed/lichee_rv/genimage.cfg b/board/sipeed/lichee_rv/g=
enimage.cfg<br>
new file mode 100644<br>
index 0000000000..d5df41203d<br>
--- /dev/null<br>
+++ b/board/sipeed/lichee_rv/genimage.cfg<br>
@@ -0,0 +1,19 @@<br>
+# Minimal SD card image for the sipeed Lichee RV<br>
+<br>
+image sdcard.img {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0hdimage {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0partition u-boot {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in-partition-table =
=3D false<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;u-b=
oot-sunxi-with-spl.bin&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 8K<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0partition rootfs {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0partition-type =3D =
0x83<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;roo=
tfs.ext4&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bootable =3D &quot;=
true&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D 1M<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+}<br>
diff --git a/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf b/b=
oard/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf<br>
new file mode 100644<br>
index 0000000000..91b2298628<br>
--- /dev/null<br>
+++ b/board/sipeed/lichee_rv/overlay/boot/extlinux/extlinux.conf<br>
@@ -0,0 +1,4 @@<br>
+label linux<br>
+=C2=A0 kernel /boot/Image<br>
+=C2=A0 # use devicetree from u-boot<br>
+=C2=A0 append console=3DttyS0,115200 root=3D/dev/mmcblk0p1 ro rootwait<br>
diff --git a/board/sipeed/lichee_rv/readme.txt b/board/sipeed/lichee_rv/rea=
dme.txt<br>
new file mode 100644<br>
index 0000000000..008be3a3bc<br>
--- /dev/null<br>
+++ b/board/sipeed/lichee_rv/readme.txt<br>
@@ -0,0 +1,26 @@<br>
+Lichee RV<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+Lichee RV - Nezha CM is a compute module with modular design, equipped<br>
+with Allwinner D1 chip (based on T-Head XuanTie C906 core), 512MB DDR3 RAM=
.<br>
+It can boot from TF card or SD-NAND, uses two sets of M.2 b key 67 pin<br>
+connectors to route all IO, making it convient for wide use and easy to re=
place.<br>
+<br>
+How to build<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+<br>
+$ make lichee_rv_defconfig<br></blockquote><div><br></div><div>This should=
 be &#39;make sipeed_lichee_rv_defconfig&#39;</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+$ make<br>
+<br>
+How to write the SD card<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<b=
r>
+<br>
+Once the build process is finished you will have an image called &quot;sdc=
ard.img&quot;<br>
+in the output/images/ directory.<br>
+<br>
+Copy the bootable &quot;sdcard.img&quot; onto an SD card with &quot;dd&quo=
t;:<br>
+<br>
+=C2=A0 $ sudo dd if=3Doutput/images/sdcard.img of=3D/dev/sdX<br>
+<br>
+Connect a TTL UART to the debug connector, insert the microSD card and<br>
+plug in a USB-C cable to the PWR connector to boot the system.<br>
diff --git a/configs/sipeed_lichee_rv_defconfig b/configs/sipeed_lichee_rv_=
defconfig<br>
new file mode 100644<br>
index 0000000000..f9782f870b<br>
--- /dev/null<br>
+++ b/configs/sipeed_lichee_rv_defconfig<br>
@@ -0,0 +1,33 @@<br>
+BR2_riscv=3Dy<br>
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_0=3Dy<br>
+BR2_ROOTFS_OVERLAY=3D&quot;board/sipeed/lichee_rv/overlay&quot;<br>
+BR2_ROOTFS_POST_IMAGE_SCRIPT=3D&quot;support/scripts/genimage.sh&quot;<br>
+BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c board/sipeed/lichee_rv/genimage.cfg=
&quot;<br>
+BR2_LINUX_KERNEL=3Dy<br>
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy<br>
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github,smaeul,linu=
x,ca67838d84af4c9f85d06311c9e98e1adf46308f)/linux-ca67838d84af4c9f85d06311c=
9e98e1adf46308f.tar.gz&quot;<br>
+BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;nezha&quot;<br>
+BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
+BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;allwinner/sun20i-d1-lichee-rv&quo=
t;<br>
+BR2_LINUX_KERNEL_INSTALL_TARGET=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2=3Dy<br>
+BR2_TARGET_ROOTFS_EXT2_4=3Dy<br>
+# BR2_TARGET_ROOTFS_TAR is not set<br>
+BR2_TARGET_OPENSBI=3Dy<br>
+BR2_TARGET_OPENSBI_CUSTOM_VERSION=3Dy<br>
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE=3D&quot;1.1&quot;<br>
+BR2_TARGET_OPENSBI_PLAT=3D&quot;generic&quot;<br>
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set<br>
+BR2_TARGET_UBOOT=3Dy<br>
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=3Dy<br>
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=3Dy<br>
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github,smaeul,u-bo=
ot,528ae9bc6c55edd3ffe642734b4132a8246ea777)/uboot-528ae9bc6c55edd3ffe64273=
4b4132a8246ea777.tar.gz&quot;<br>
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;lichee_rv_dock&quot;<br></blockqu=
ote><div><br></div><div>In the future - when proper defconfig (supposedly &=
#39;lichee_rv&#39;) will be added to u-boot this should be changed accordin=
gly. Currently the device tree is dock specific.</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
+BR2_TARGET_UBOOT_NEEDS_DTC=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=3Dy<br>
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=3Dy<br>
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set<br>
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=3Dy<br>
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME=3D&quot;u-boot-sunxi-with-spl.bin&quot=
;<br>
+BR2_PACKAGE_HOST_GENIMAGE=3Dy<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000a1e6e105efcf6004--

--===============6294544874357502947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6294544874357502947==--
