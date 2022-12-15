Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E8FC4332F
	for <buildroot@archiver.kernel.org>; Thu, 15 Dec 2022 22:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 579024185B;
	Thu, 15 Dec 2022 22:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 579024185B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3luz2MAdVB2g; Thu, 15 Dec 2022 22:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F8641B85;
	Thu, 15 Dec 2022 22:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58F8641B85
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30ECC1BF2C8
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 22:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B2B941B85
 for <buildroot@lists.busybox.net>; Thu, 15 Dec 2022 22:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B2B941B85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0eo3JFbwSbO for <buildroot@lists.busybox.net>;
 Thu, 15 Dec 2022 22:01:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2FA74185B
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2FA74185B
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 22:01:07 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id fc4so1790714ejc.12
 for <buildroot@buildroot.org>; Thu, 15 Dec 2022 14:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pcYEJT83uDWN+3pI89Xclj2frKVvaN5qxd59Ejp2PC0=;
 b=BbYWrhmmHFLtzdEEzTg3vdR8ypbs+pp7yKe46Hty2FyfGdmeUCUglO2NgO3/sFJV1o
 ws55qarMIv0gq0zIBjrQJjk/HwDa/mOTai5LaK7QgjXhD2sQmdwg0+VmoSiMVVrrK7p7
 GQMZK9nWncBX2gMe22nuz5id4vh9YSm+rab8MQHSIEHHxKybbqf33HOpbqJ3In7ypXvz
 JK4kNtNB3ZpLmLOPjiRXYrkCVw1hyqYpUizbyet3CdAfN5AzbnZvggiBUWzfOxGfTC5e
 HIsoTUEFhU3wq676tEyzTMHb79gfTGngx4u0WzkLQspmR14ETE7/H4UJoHkPpuSlrAlU
 IXkA==
X-Gm-Message-State: ANoB5pn0amDTstwwzDc2xefTHWS7/Net9fK1p9cDO6k7ir+0BZOmT2qO
 pTjyFmaWbBDG4al6+1U+LHytU+tNj5F7I5kNImM=
X-Google-Smtp-Source: AA0mqf6ZT5P6qYKS/2Thi7Hli1qYaTpyEvJDxwuCE1FG6epmyB7e1CiTK372Iku56kJUhRwnzEWVDvuprG4JFZgtllE=
X-Received: by 2002:a17:906:bce9:b0:7ad:960d:3a4d with SMTP id
 op9-20020a170906bce900b007ad960d3a4dmr62797756ejb.522.1671141665901; Thu, 15
 Dec 2022 14:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20221214221506.43849-1-angelo@amarulasolutions.com>
 <20221214221506.43849-2-angelo@amarulasolutions.com>
In-Reply-To: <20221214221506.43849-2-angelo@amarulasolutions.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Fri, 16 Dec 2022 00:00:55 +0200
Message-ID: <CA+fTLhhOE7Ccbegd6ckYcdDwWbC4w15A=g_vJp+_CVTEHikJ0A@mail.gmail.com>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pcYEJT83uDWN+3pI89Xclj2frKVvaN5qxd59Ejp2PC0=;
 b=Eoq928AskZuoFVMWwPMVnJC0Yqj/OWwMIGTTT4UUbIsff1+YUoIfL/R7xZGyR2PY9A
 L9xTW2IOD7VNg6MvzUv8fTXSObbhcq0whdg7dZUxKySzhg/jVEvDJCskIkzpuaMaXtbA
 yFMwxUY3jaJcCWWDqvOQ/0Yr2nT/rwHf4z7S6tkWKf0oBI0I7S5xuDfrQjpAyNVm3uWY
 SkHXI8SP59xjZquKWqF+DgUU/XWgCYtb822NQeQVZ/6Zz0pDLTdQSnv5T28SlawWzK3N
 z1dw56Uf1eQvB73fbRX61UyGPiQa8nc/No1MvTS8LhSgNVeGfERLSyGPZyPDSxd1ng1o
 97nQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Eoq928As
Subject: Re: [Buildroot] [PATCH v5 2/3] configs/lichee_rv: new defconfig
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
Content-Type: multipart/mixed; boundary="===============4431225300258031651=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4431225300258031651==
Content-Type: multipart/alternative; boundary="0000000000005d935e05efe4fd2f"

--0000000000005d935e05efe4fd2f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Angelo Compagnucci (<angelo@amarulasolutions.com>) kirjutas
kuup=C3=A4eval N, 15. detsember 2022 kell 00:15:

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
>

Reviewed-by: Indrek Kruusa <indrek.kruusa@gmail.com>

I also did a clean build for 'sipeed_lichee_rv_defconfig' and booted the
image on the Lichee RV dock without issues. Therefore:

Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>


> ---
> v5:
> * Fixing typos in readme (Indrek Kruusa)
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
> index 0000000000..24e8141851
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
> +$ make sipeed_lichee_rv_defconfig
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

--0000000000005d935e05efe4fd2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Kontakt Angelo Compagnucci (&lt;<a href=
=3D"mailto:angelo@amarulasolutions.com">angelo@amarulasolutions.com</a>&gt;=
) kirjutas kuup=C3=A4eval N, 15. detsember 2022 kell 00:15:<br></div><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Lich=
ee RV - Nezha CM is a compute module with modular design, equipped<br>
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
ions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br></blockq=
uote><div><br></div><div>Reviewed-by: Indrek Kruusa &lt;<a href=3D"mailto:i=
ndrek.kruusa@gmail.com">indrek.kruusa@gmail.com</a>&gt;</div><div><br></div=
><div>I also did a clean build for &#39;sipeed_lichee_rv_defconfig&#39; and=
 booted the image=C2=A0on the Lichee RV dock without issues. Therefore:</di=
v><div><br>Tested-by: Indrek Kruusa &lt;<a href=3D"mailto:indrek.kruusa@gma=
il.com">indrek.kruusa@gmail.com</a>&gt;<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
---<br>
v5:<br>
* Fixing typos in readme (Indrek Kruusa)<br>
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
index 0000000000..24e8141851<br>
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
+$ make sipeed_lichee_rv_defconfig<br>
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
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG=3D&quot;lichee_rv_dock&quot;<br>
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

--0000000000005d935e05efe4fd2f--

--===============4431225300258031651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4431225300258031651==--
