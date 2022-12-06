Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43958C352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 20:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99B3E81E8B;
	Tue,  6 Dec 2022 20:19:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99B3E81E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9WkrkMNgG7ts; Tue,  6 Dec 2022 20:19:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7280381E8F;
	Tue,  6 Dec 2022 20:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7280381E8F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 370201BF3DB
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 20:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E69A41624
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 20:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E69A41624
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NgxL_NtJ_VZs for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 20:19:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1F3A41612
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1F3A41612
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 20:19:06 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id 128so15273326vsz.12
 for <buildroot@buildroot.org>; Tue, 06 Dec 2022 12:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=22wPI23D5L08IqdCBF4bKNWdilBFmHBcfwawrZ00n6o=;
 b=lxk1wWZPOsSq6m4JeT0EhkDtFdLgLY3jNWjSRWQmF4b/3fuDxHUWRo4LEDzz26OhPc
 DDb6gYkOwjE90zeyG2c7LbO3gE5oiVtlOWzliBjLEIK6V2d06/SraFIpBwx3qZKSeWFs
 JP6QICkLIJYm4gYUvrWFiBW484tujfBDlhqPuoQmjNCSb5pHseYqzgwgWIvKC1ZRlt0h
 DVTB52EG1mUuxwSVzLq0SA2nRSocijmE7nKMKBRN1CijuPh88REZtbOEcsE7w+ZpmBmU
 djR0P6fHn9LkbXtOLmOSquaXVkpInd2RVxC6yAxUtQwTOGJcOdPM2iPe+cWwA/QPEwxu
 qKUQ==
X-Gm-Message-State: ANoB5pmbYOtjFHtPxiQ0tVWtsrkTucIW3LFeZ9NwlExeQDLkRS8voQ6B
 8vsd2t/fmmzDIrLApXVuvw3+Zny38DGaYpba+LpFhA==
X-Google-Smtp-Source: AA0mqf4oF2jcEfCKfgPZtyZG00JRABndeolhh3s5WxHMOkuivf3zNzP5+Hk6BnuDU1cbOhsCo3I/8pjcnjWQY8/YgLM=
X-Received: by 2002:a67:fc51:0:b0:3b1:48c:8218 with SMTP id
 p17-20020a67fc51000000b003b1048c8218mr12098791vsq.71.1670357945720; Tue, 06
 Dec 2022 12:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20221206171719.747581-1-gadiyar@ti.com>
 <20221206171719.747581-2-gadiyar@ti.com>
In-Reply-To: <20221206171719.747581-2-gadiyar@ti.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 6 Dec 2022 21:18:54 +0100
Message-ID: <CAB0FRsu+D57P5n7rvG_5RdVHYcn4LJVx-C4NQRLawQukP7-gCQ@mail.gmail.com>
To: Anand Gadiyar <gadiyar@ti.com>
Subject: Re: [Buildroot] [PATCH v7 1/3] boot/ti-k3-r5-loader: add new package
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
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Xuanhao Shi <X15000177@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: multipart/mixed; boundary="===============8901390836988709608=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8901390836988709608==
Content-Type: multipart/alternative; boundary="00000000000000b59105ef2e846f"

--00000000000000b59105ef2e846f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 6 d=C3=A9c. 2022 =C3=A0 18:41, Anand Gadiyar <gadiyar@ti.com> a =C3=
=A9crit :

> From: Xuanhao Shi <x-shi@ti.com>
>
> This is a separate U-Boot package that would build
> the intermediate spl binary for the R5 core on TI's k3 boards.
> Usually, the resulting spl will be used for k3-image-gen
> to build the full R5 boot binary tiboot3.bin.
>
> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>

Reviewed-by: Francois Perrad <francois.perrad@gadz.org>


> Acked-by: Andrew Davis <afd@ti.com>
> Tested-by: Bryan Brattlof <bb@ti.com>
> Cc: Romain Naour <romain.naour@gmail.com>
> Cc: Francois Perrad <francois.perrad@gadz.org>
> ---
>  DEVELOPERS                                |  6 +++
>  boot/Config.in                            |  1 +
>  boot/ti-k3-r5-loader/Config.in            | 32 +++++++++++++++
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.hash |  2 +
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk   | 49 +++++++++++++++++++++++
>  5 files changed, 90 insertions(+)
>  create mode 100644 boot/ti-k3-r5-loader/Config.in
>  create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
>  create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 233fda4c71..62d77b6c4b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -128,6 +128,9 @@ F:  package/dcron/
>  F:     package/libxmlrpc/
>  F:     package/python-docopt/
>
> +N:     Anand Gadiyar <gadiyar@ti.com>
> +F:     boot/ti-k3-r5-loader/
> +
>  N:     Andr=C3=A9 Zwing <nerv@dawncrow.de>
>  F:     package/libkrb5/
>  F:     package/openal/
> @@ -3055,6 +3058,9 @@ F:        package/python-pyusb/
>  N:     Wojciech Nizi=C5=84ski <niziak@spox.org>
>  F:     package/fwup/
>
> +N:     Xuanhao Shi <X15000177@gmail.com>
> +F:     boot/ti-k3-r5-loader/
> +
>  N:     Yair Ben Avraham <yairba@protonmail.com>
>  F:     package/casync/
>  F:     package/gloox/
> diff --git a/boot/Config.in b/boot/Config.in
> index 40472ae07d..ce17b2df6b 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -22,6 +22,7 @@ source "boot/s500-bootloader/Config.in"
>  source "boot/shim/Config.in"
>  source "boot/sun20i-d1-spl/Config.in"
>  source "boot/syslinux/Config.in"
> +source "boot/ti-k3-r5-loader/Config.in"
>  source "boot/uboot/Config.in"
>  source "boot/vexpress-firmware/Config.in"
>
> diff --git a/boot/ti-k3-r5-loader/Config.in
> b/boot/ti-k3-r5-loader/Config.in
> new file mode 100644
> index 0000000000..bb6140f8a6
> --- /dev/null
> +++ b/boot/ti-k3-r5-loader/Config.in
> @@ -0,0 +1,32 @@
> +config BR2_TARGET_TI_K3_R5_LOADER
> +       bool "ti-k3-r5-loader"
> +       help
> +         Separate U-Boot build for R5 cores on TI's k3 boards.
> +         Usually used to build tiboot3.bin with k3-image-gen.
> +
> +if BR2_TARGET_TI_K3_R5_LOADER
> +choice
> +       prompt "K3 R5 Loader configuration"
> +       default BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
> +       bool "Using an in-tree board defconfig file"
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTOM_CONFIG
> +       bool "Using a custom board (def)config file"
> +
> +endchoice
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG
> +       string "Board defconfig"
> +       depends on BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
> +       help
> +         Name of the board for which TI K3 R5 Loader should be
> +         built, without the _defconfig suffix.
> +
> +config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
> +       string "Configuration file path"
> +       depends on BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTOM_CONFIG
> +       help
> +         Path to the TI K3 R5 Loader configuration file.
> +endif
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> new file mode 100644
> index 0000000000..fb6ce7c2a6
> --- /dev/null
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  6d69d5e4635cb3fa7852bf15f88ca342ef7740196e71961d3572deb58ba44bea
> u-boot-2022.10-rc1.tar.bz2
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> new file mode 100644
> index 0000000000..8a2a3fdad4
> --- /dev/null
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -0,0 +1,49 @@
>
> +########################################################################=
########
> +#
> +# ti-k3-r5-loader.mk
> +#
>
> +########################################################################=
########
> +
> +TI_K3_R5_LOADER_VERSION =3D 2022.10
> +TI_K3_R5_LOADER_SITE =3D https://ftp.denx.de/pub/u-boot
> +TI_K3_R5_LOADER_SOURCE =3D u-boot-$(TI_K3_R5_LOADER_VERSION).tar.bz2
> +TI_K3_R5_LOADER_LICENSE =3D GPL-2.0+
> +TI_K3_R5_LOADER_LICENSE_FILES =3D Licenses/gpl-2.0.txt
> +TI_K3_R5_LOADER_CPE_ID_VENDOR =3D denx
> +TI_K3_R5_LOADER_CPE_ID_PRODUCT =3D u-boot
> +TI_K3_R5_LOADER_INSTALL_IMAGES =3D YES
> +TI_K3_R5_LOADER_DEPENDENCIES =3D \
> +       host-pkgconf \
> +       $(BR2_MAKE_HOST_DEPENDENCY) \
> +       host-arm-gnu-toolchain \
> +       host-openssl
> +
> +TI_K3_R5_LOADER_MAKE =3D $(BR2_MAKE)
> +TI_K3_R5_LOADER_MAKE_ENV =3D $(TARGET_MAKE_ENV)
> +TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES =3D \
> +       host-arm-gnu-toolchain \
> +       $(BR2_MAKE_HOST_DEPENDENCY) \
> +       $(BR2_BISON_HOST_DEPENDENCY) \
> +       $(BR2_FLEX_HOST_DEPENDENCY)
> +
> +TI_K3_R5_LOADER_BOARD =3D $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOA=
RD))
> +ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG),y)
> +TI_K3_R5_LOADER_KCONFIG_DEFCONFIG =3D $(call
> qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG))_defconfig
> +else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTOM_CONFIG),y)
> +TI_K3_R5_LOADER_KCONFIG_FILE =3D $(call
> qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE))
> +endif # BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG
> +TI_K3_R5_LOADER_MAKE_OPTS =3D \
> +       CROSS_COMPILE=3D$(HOST_DIR)/bin/arm-none-eabi- \
> +       ARCH=3Darm \
> +       HOSTCC=3D"$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem
> /,$(HOST_CFLAGS)))" \
> +       HOSTLDFLAGS=3D"$(HOST_LDFLAGS)"
> +
> +define TI_K3_R5_LOADER_BUILD_CMDS
> +       $(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D)
> $(TI_K3_R5_LOADER_MAKE_OPTS)
> +endef
> +
> +define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
> +       cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
> +endef
> +
> +$(eval $(kconfig-package))
> --
> 2.34.1
>
>

--00000000000000b59105ef2e846f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 6 d=C3=A9c. 2022 =C3=A0=
=C2=A018:41, Anand Gadiyar &lt;<a href=3D"mailto:gadiyar@ti.com">gadiyar@ti=
.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">From: Xuanhao Shi &lt;<a href=3D"mailto:x-shi@ti.com" targ=
et=3D"_blank">x-shi@ti.com</a>&gt;<br>
<br>
This is a separate U-Boot package that would build<br>
the intermediate spl binary for the R5 core on TI&#39;s k3 boards.<br>
Usually, the resulting spl will be used for k3-image-gen<br>
to build the full R5 boot binary tiboot3.bin.<br>
<br>
Signed-off-by: Xuanhao Shi &lt;<a href=3D"mailto:x-shi@ti.com" target=3D"_b=
lank">x-shi@ti.com</a>&gt;<br>
Signed-off-by: Anand Gadiyar &lt;<a href=3D"mailto:gadiyar@ti.com" target=
=3D"_blank">gadiyar@ti.com</a>&gt;<br>
Reviewed-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettieng=
ineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&g=
t;<br></blockquote><div><br></div><div>Reviewed-by: Francois Perrad &lt;<a =
href=3D"mailto:francois.perrad@gadz.org">francois.perrad@gadz.org</a>&gt;<b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Acked-by: Andrew Davis &lt;<a href=3D"mailto:afd@ti.com" target=3D"_blank">=
afd@ti.com</a>&gt;<br>
Tested-by: Bryan Brattlof &lt;<a href=3D"mailto:bb@ti.com" target=3D"_blank=
">bb@ti.com</a>&gt;<br>
Cc: Romain Naour &lt;<a href=3D"mailto:romain.naour@gmail.com" target=3D"_b=
lank">romain.naour@gmail.com</a>&gt;<br>
Cc: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.org" target=
=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
---<br>
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++<br>
=C2=A0boot/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0boot/ti-k3-r5-loader/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 32 +++++++++++++++<br>
=C2=A0boot/ti-k3-r5-loader/ti-k3-r5-loader.hash |=C2=A0 2 +<br>
=C2=A0boot/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-loader.mk" rel=3D"nor=
eferrer" target=3D"_blank">ti-k3-r5-loader.mk</a>=C2=A0 =C2=A0| 49 ++++++++=
+++++++++++++++<br>
=C2=A05 files changed, 90 insertions(+)<br>
=C2=A0create mode 100644 boot/ti-k3-r5-loader/Config.in<br>
=C2=A0create mode 100644 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash<br>
=C2=A0create mode 100644 boot/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-lo=
ader.mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-r5-loader.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 233fda4c71..62d77b6c4b 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -128,6 +128,9 @@ F:=C2=A0 package/dcron/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libxmlrpc/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/python-docopt/<br>
<br>
+N:=C2=A0 =C2=A0 =C2=A0Anand Gadiyar &lt;<a href=3D"mailto:gadiyar@ti.com" =
target=3D"_blank">gadiyar@ti.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-r5-loader/<br>
+<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Andr=C3=A9 Zwing &lt;<a href=3D"mailto:nerv@daw=
ncrow.de" target=3D"_blank">nerv@dawncrow.de</a>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/libkrb5/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/openal/<br>
@@ -3055,6 +3058,9 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/python-pyusb/<b=
r>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Wojciech Nizi=C5=84ski &lt;<a href=3D"mailto:ni=
ziak@spox.org" target=3D"_blank">niziak@spox.org</a>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/fwup/<br>
<br>
+N:=C2=A0 =C2=A0 =C2=A0Xuanhao Shi &lt;<a href=3D"mailto:X15000177@gmail.co=
m" target=3D"_blank">X15000177@gmail.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-r5-loader/<br>
+<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Yair Ben Avraham &lt;<a href=3D"mailto:yairba@p=
rotonmail.com" target=3D"_blank">yairba@protonmail.com</a>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/casync/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/gloox/<br>
diff --git a/boot/Config.in b/boot/Config.in<br>
index 40472ae07d..ce17b2df6b 100644<br>
--- a/boot/Config.in<br>
+++ b/boot/Config.in<br>
@@ -22,6 +22,7 @@ source &quot;boot/s500-bootloader/Config.in&quot;<br>
=C2=A0source &quot;boot/shim/Config.in&quot;<br>
=C2=A0source &quot;boot/sun20i-d1-spl/Config.in&quot;<br>
=C2=A0source &quot;boot/syslinux/Config.in&quot;<br>
+source &quot;boot/ti-k3-r5-loader/Config.in&quot;<br>
=C2=A0source &quot;boot/uboot/Config.in&quot;<br>
=C2=A0source &quot;boot/vexpress-firmware/Config.in&quot;<br>
<br>
diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.i=
n<br>
new file mode 100644<br>
index 0000000000..bb6140f8a6<br>
--- /dev/null<br>
+++ b/boot/ti-k3-r5-loader/Config.in<br>
@@ -0,0 +1,32 @@<br>
+config BR2_TARGET_TI_K3_R5_LOADER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;ti-k3-r5-loader&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Separate U-Boot build for R5 cores on TI=
&#39;s k3 boards.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Usually used to build tiboot3.bin with k=
3-image-gen.<br>
+<br>
+if BR2_TARGET_TI_K3_R5_LOADER<br>
+choice<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0prompt &quot;K3 R5 Loader configuration&quot;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFI=
G<br>
+<br>
+config BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Using an in-tree board defconfig fil=
e&quot;<br>
+<br>
+config BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTOM_CONFIG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Using a custom board (def)config fil=
e&quot;<br>
+<br>
+endchoice<br>
+<br>
+config BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;Board defconfig&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCO=
NFIG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Name of the board for which TI K3 R5 Loa=
der should be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0built, without the _defconfig suffix.<br=
>
+<br>
+config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;Configuration file path&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTO=
M_CONFIG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Path to the TI K3 R5 Loader configuratio=
n file.<br>
+endif<br>
diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash b/boot/ti-k3-r5-load=
er/ti-k3-r5-loader.hash<br>
new file mode 100644<br>
index 0000000000..fb6ce7c2a6<br>
--- /dev/null<br>
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.hash<br>
@@ -0,0 +1,2 @@<br>
+# Locally computed:<br>
+sha256=C2=A0 6d69d5e4635cb3fa7852bf15f88ca342ef7740196e71961d3572deb58ba44=
bea=C2=A0 u-boot-2022.10-rc1.tar.bz2<br>
diff --git a/boot/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-loader.mk" rel=
=3D"noreferrer" target=3D"_blank">ti-k3-r5-loader.mk</a> b/boot/ti-k3-r5-lo=
ader/<a href=3D"http://ti-k3-r5-loader.mk" rel=3D"noreferrer" target=3D"_bl=
ank">ti-k3-r5-loader.mk</a><br>
new file mode 100644<br>
index 0000000000..8a2a3fdad4<br>
--- /dev/null<br>
+++ b/boot/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-loader.mk" rel=3D"nor=
eferrer" target=3D"_blank">ti-k3-r5-loader.mk</a><br>
@@ -0,0 +1,49 @@<br>
+##########################################################################=
######<br>
+#<br>
+# <a href=3D"http://ti-k3-r5-loader.mk" rel=3D"noreferrer" target=3D"_blan=
k">ti-k3-r5-loader.mk</a><br>
+#<br>
+##########################################################################=
######<br>
+<br>
+TI_K3_R5_LOADER_VERSION =3D 2022.10<br>
+TI_K3_R5_LOADER_SITE =3D <a href=3D"https://ftp.denx.de/pub/u-boot" rel=3D=
"noreferrer" target=3D"_blank">https://ftp.denx.de/pub/u-boot</a><br>
+TI_K3_R5_LOADER_SOURCE =3D u-boot-$(TI_K3_R5_LOADER_VERSION).tar.bz2<br>
+TI_K3_R5_LOADER_LICENSE =3D GPL-2.0+<br>
+TI_K3_R5_LOADER_LICENSE_FILES =3D Licenses/gpl-2.0.txt<br>
+TI_K3_R5_LOADER_CPE_ID_VENDOR =3D denx<br>
+TI_K3_R5_LOADER_CPE_ID_PRODUCT =3D u-boot<br>
+TI_K3_R5_LOADER_INSTALL_IMAGES =3D YES<br>
+TI_K3_R5_LOADER_DEPENDENCIES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-pkgconf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BR2_MAKE_HOST_DEPENDENCY) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-arm-gnu-toolchain \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-openssl<br>
+<br>
+TI_K3_R5_LOADER_MAKE =3D $(BR2_MAKE)<br>
+TI_K3_R5_LOADER_MAKE_ENV =3D $(TARGET_MAKE_ENV)<br>
+TI_K3_R5_LOADER_KCONFIG_DEPENDENCIES =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0host-arm-gnu-toolchain \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BR2_MAKE_HOST_DEPENDENCY) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BR2_BISON_HOST_DEPENDENCY) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(BR2_FLEX_HOST_DEPENDENCY)<br>
+<br>
+TI_K3_R5_LOADER_BOARD =3D $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADER_BOARD=
))<br>
+ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG),y)<br>
+TI_K3_R5_LOADER_KCONFIG_DEFCONFIG =3D $(call qstrip,$(BR2_TARGET_TI_K3_R5_=
LOADER_BOARD_DEFCONFIG))_defconfig<br>
+else ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_CUSTOM_CONFIG),y)<br>
+TI_K3_R5_LOADER_KCONFIG_FILE =3D $(call qstrip,$(BR2_TARGET_TI_K3_R5_LOADE=
R_CUSTOM_CONFIG_FILE))<br>
+endif # BR2_TARGET_TI_K3_R5_LOADER_USE_DEFCONFIG<br>
+TI_K3_R5_LOADER_MAKE_OPTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CROSS_COMPILE=3D$(HOST_DIR)/bin/arm-none-eabi- =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ARCH=3Darm \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HOSTCC=3D&quot;$(HOSTCC) $(subst -I/,-isystem /=
,$(subst -I /,-isystem /,$(HOST_CFLAGS)))&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HOSTLDFLAGS=3D&quot;$(HOST_LDFLAGS)&quot;<br>
+<br>
+define TI_K3_R5_LOADER_BUILD_CMDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE=
) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)<br>
+endef<br>
+<br>
+define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-=
u-boot-spl.bin<br>
+endef<br>
+<br>
+$(eval $(kconfig-package))<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--00000000000000b59105ef2e846f--

--===============8901390836988709608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8901390836988709608==--
