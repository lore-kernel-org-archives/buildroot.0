Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511BDC352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 20:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1B2580B99;
	Tue,  6 Dec 2022 20:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1B2580B99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4M8odKWtPQP7; Tue,  6 Dec 2022 20:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FCF680BED;
	Tue,  6 Dec 2022 20:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FCF680BED
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A856F1BF3DB
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 20:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90BEF60C02
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 20:19:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90BEF60C02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VzCvAGS1oV6V for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 20:19:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A63760AF4
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A63760AF4
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 20:19:29 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id 125so15285247vsi.9
 for <buildroot@buildroot.org>; Tue, 06 Dec 2022 12:19:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbrWlSxdHimV3+TW/ShIhskfzyR/hi5w9Wjd8CfRkOo=;
 b=EheDToWyzp4k2iLmhYd4CaVkKI8NQKauF5KgshFbHLISFR86TyYfKPW+ATZslkhLdO
 3yHrD0yXfa627jlO9l5GJGC+ipjKdziH6c25SbS9aLkSHegfPP2yYnlmDLK57gEEDhGk
 PfOzGJv0j20lwtIIiwo+zHFGsXHLcO4Ysl4GUl3fKFK5KYi3ahD3aUS78+PMKHPKHc0i
 SYTycb6Y3WAsc7SBdRFtxxbkbj+TcPughFKowFAja+fuCf6V2g0NAqqWsx/sUYjUtP7y
 VLkm2A/PU1zxKHtd6uBl8hsw20OjCvbxF7PuwRxmkkPrydrWdGXXTQmreU2Ls2GfW9MS
 oGTw==
X-Gm-Message-State: ANoB5pk0c3+Iy99VukgFDgDe678k8ElVTCR4h9N7Z00NpLVogcBeUDH3
 gpBw6S8UeNHeTMuCDCGSYBHV4forjWz9INKPikVT1A==
X-Google-Smtp-Source: AA0mqf7PKIXU7gkcDY+oVxlq/lJzEOk6vztIfYTshOYSEUOEjqikPm3YYFmfmf/vq4+PJ6MlFK/j9s/B9/rADS9sJZI=
X-Received: by 2002:a05:6102:c4e:b0:3aa:3bdf:75fd with SMTP id
 y14-20020a0561020c4e00b003aa3bdf75fdmr38102684vss.15.1670357967864; Tue, 06
 Dec 2022 12:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20221206171719.747581-1-gadiyar@ti.com>
 <20221206171719.747581-3-gadiyar@ti.com>
In-Reply-To: <20221206171719.747581-3-gadiyar@ti.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 6 Dec 2022 21:19:15 +0100
Message-ID: <CAB0FRssDs26J8ij4SN=yv3M32a__3aaK4aEzcsjn19Lp5KJoWQ@mail.gmail.com>
To: Anand Gadiyar <gadiyar@ti.com>
Subject: Re: [Buildroot] [PATCH v7 2/3] boot/ti-k3-image-gen: add new package
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
Content-Type: multipart/mixed; boundary="===============2561325888891878287=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2561325888891878287==
Content-Type: multipart/alternative; boundary="000000000000529ab705ef2e85b9"

--000000000000529ab705ef2e85b9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 6 d=C3=A9c. 2022 =C3=A0 18:41, Anand Gadiyar <gadiyar@ti.com> a =C3=
=A9crit :

> From: Xuanhao Shi <x-shi@ti.com>
>
> This is the image generator that builds the full boot binary,
> tiboot3.bin, for the R5 core on TI's k3 devices.
> This requires the R5 spl output from the ti-k3-r5-loader package.
>
> https://git.ti.com/cgit/k3-image-gen/k3-image-gen
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
>  DEVELOPERS                                |  2 ++
>  boot/Config.in                            |  1 +
>  boot/ti-k3-image-gen/Config.in            | 30 ++++++++++++++++
>  boot/ti-k3-image-gen/ti-k3-image-gen.hash |  2 ++
>  boot/ti-k3-image-gen/ti-k3-image-gen.mk   | 42 +++++++++++++++++++++++
>  5 files changed, 77 insertions(+)
>  create mode 100644 boot/ti-k3-image-gen/Config.in
>  create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
>  create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 62d77b6c4b..b5b6cd0a99 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -129,6 +129,7 @@ F:  package/libxmlrpc/
>  F:     package/python-docopt/
>
>  N:     Anand Gadiyar <gadiyar@ti.com>
> +F:     boot/ti-k3-image-gen/
>  F:     boot/ti-k3-r5-loader/
>
>  N:     Andr=C3=A9 Zwing <nerv@dawncrow.de>
> @@ -3059,6 +3060,7 @@ N:        Wojciech Nizi=C5=84ski <niziak@spox.org>
>  F:     package/fwup/
>
>  N:     Xuanhao Shi <X15000177@gmail.com>
> +F:     boot/ti-k3-image-gen/
>  F:     boot/ti-k3-r5-loader/
>
>  N:     Yair Ben Avraham <yairba@protonmail.com>
> diff --git a/boot/Config.in b/boot/Config.in
> index ce17b2df6b..1b25bacfee 100644
> --- a/boot/Config.in
> +++ b/boot/Config.in
> @@ -22,6 +22,7 @@ source "boot/s500-bootloader/Config.in"
>  source "boot/shim/Config.in"
>  source "boot/sun20i-d1-spl/Config.in"
>  source "boot/syslinux/Config.in"
> +source "boot/ti-k3-image-gen/Config.in"
>  source "boot/ti-k3-r5-loader/Config.in"
>  source "boot/uboot/Config.in"
>  source "boot/vexpress-firmware/Config.in"
> diff --git a/boot/ti-k3-image-gen/Config.in
> b/boot/ti-k3-image-gen/Config.in
> new file mode 100644
> index 0000000000..02018f2f78
> --- /dev/null
> +++ b/boot/ti-k3-image-gen/Config.in
> @@ -0,0 +1,30 @@
> +config BR2_TARGET_TI_K3_IMAGE_GEN
> +       bool "ti-k3-image-gen"
> +       select BR2_TARGET_TI_K3_R5_LOADER
> +       help
> +         Use TI's k3-image-gen to build a separate bare metal
> +         boot binary from a separate spl. Currently supports
> +         version 08.05.00.004 as default.
> +
> +         https://git.ti.com/cgit/k3-image-gen/k3-image-gen/
> +
> +if BR2_TARGET_TI_K3_IMAGE_GEN
> +config BR2_TARGET_TI_K3_IMAGE_GEN_SOC
> +       string "SOC type for image gen"
> +       help
> +         The target SoC option for image gen.
> +         For example, "am64x" for AM64X boards.
> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE
> +       string "SOC security type for image gen"
> +       help
> +         The security type option for image gen.
> +         Options are "gp", "hs-fs", or "hs-se".
> +
> +config BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG
> +       string "CONFIG type for image gen"
> +       help
> +         The board config option for image gen.
> +         Usually "sk" or "evm".
> +endif
> +
> diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash
> b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
> new file mode 100644
> index 0000000000..82c5b17060
> --- /dev/null
> +++ b/boot/ti-k3-image-gen/ti-k3-image-gen.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  d13e9556bfba32d14071e172589683e48f6fea705a0b05ddd7fe984002089888
> k3-image-gen-08.05.00.004.tar.gz
> diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> new file mode 100644
> index 0000000000..f8e6105bfb
> --- /dev/null
> +++ b/boot/ti-k3-image-gen/ti-k3-image-gen.mk
> @@ -0,0 +1,42 @@
>
> +########################################################################=
########
> +#
> +# ti-k3-image-gen
> +#
>
> +########################################################################=
########
> +
> +TI_K3_IMAGE_GEN_VERSION =3D 08.05.00.004
> +TI_K3_IMAGE_GEN_SITE =3D
> https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot
> +TI_K3_IMAGE_GEN_SOURCE
> <https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot+TI_K3_IMAGE_G=
EN_SOURCE>
> =3D k3-image-gen-$(TI_K3_IMAGE_GEN_VERSION).tar.gz
> +TI_K3_IMAGE_GEN_LICENSE =3D BSD-3-Clause
> +TI_K3_IMAGE_GEN_LICENSE_FILES =3D LICENSE
> +TI_K3_IMAGE_GEN_INSTALL_IMAGES =3D YES
> +
> +# ti-k3-image-gen is used to build tiboot3.bin, using the
> r5-u-boot-spl.bin file
> +# from the ti-k3-r5-loader package. Hence the dependency on
> ti-k3-r5-loader.
> +TI_K3_IMAGE_GEN_DEPENDENCIES =3D host-arm-gnu-toolchain ti-k3-r5-loader
> +
> +# The ti-k3-image-gen makefiles seem to need some feature from Make v4.0=
,
> +# similar to u-boot. Explicitly use $(BR2_MAKE) here, as the build
> +# otherwise fails with some misleading error message.
> +TI_K3_IMAGE_GEN_MAKE =3D $(BR2_MAKE)
> +TI_K3_IMAGE_GEN_SOC =3D $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))
> +TI_K3_IMAGE_GEN_SOC_TYPE =3D $(call
> qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE))
> +TI_K3_IMAGE_GEN_CONFIG =3D $(call
> qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG))
> +TI_K3_IMAGE_GEN_MAKE_OPTS =3D \
> +       SOC=3D$(TI_K3_IMAGE_GEN_SOC) \
> +       SOC_TYPE=3D$(TI_K3_IMAGE_GEN_SOC_TYPE) \
> +       CONFIG=3D$(TI_K3_IMAGE_GEN_CONFIG) \
> +       CROSS_COMPILE=3D$(HOST_DIR)/bin/arm-none-eabi- \
> +       SBL=3D$(BINARIES_DIR)/r5-u-boot-spl.bin \
> +       O=3D$(@D)/tmp \
> +       BIN_DIR=3D$(@D)
> +
> +define TI_K3_IMAGE_GEN_BUILD_CMDS
> +       $(TI_K3_IMAGE_GEN_MAKE) -C $(@D) $(TI_K3_IMAGE_GEN_MAKE_OPTS)
> +endef
> +
> +define TI_K3_IMAGE_GEN_INSTALL_IMAGES_CMDS
> +       cp $(@D)/tiboot3.bin $(BINARIES_DIR)
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.34.1
>
>

--000000000000529ab705ef2e85b9
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
This is the image generator that builds the full boot binary,<br>
tiboot3.bin, for the R5 core on TI&#39;s k3 devices.<br>
This requires the R5 spl output from the ti-k3-r5-loader package.<br>
<br>
<a href=3D"https://git.ti.com/cgit/k3-image-gen/k3-image-gen" rel=3D"norefe=
rrer" target=3D"_blank">https://git.ti.com/cgit/k3-image-gen/k3-image-gen</=
a><br>
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
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
=C2=A0boot/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A0boot/ti-k3-image-gen/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 30 ++++++++++++++++<br>
=C2=A0boot/ti-k3-image-gen/ti-k3-image-gen.hash |=C2=A0 2 ++<br>
=C2=A0boot/ti-k3-image-gen/<a href=3D"http://ti-k3-image-gen.mk" rel=3D"nor=
eferrer" target=3D"_blank">ti-k3-image-gen.mk</a>=C2=A0 =C2=A0| 42 ++++++++=
+++++++++++++++<br>
=C2=A05 files changed, 77 insertions(+)<br>
=C2=A0create mode 100644 boot/ti-k3-image-gen/Config.in<br>
=C2=A0create mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash<br>
=C2=A0create mode 100644 boot/ti-k3-image-gen/<a href=3D"http://ti-k3-image=
-gen.mk" rel=3D"noreferrer" target=3D"_blank">ti-k3-image-gen.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 62d77b6c4b..b5b6cd0a99 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -129,6 +129,7 @@ F:=C2=A0 package/libxmlrpc/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/python-docopt/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Anand Gadiyar &lt;<a href=3D"mailto:gadiyar@ti.=
com" target=3D"_blank">gadiyar@ti.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-image-gen/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-r5-loader/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Andr=C3=A9 Zwing &lt;<a href=3D"mailto:nerv@daw=
ncrow.de" target=3D"_blank">nerv@dawncrow.de</a>&gt;<br>
@@ -3059,6 +3060,7 @@ N:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Wojciech Nizi=C5=84ski =
&lt;<a href=3D"mailto:niziak@spox.org" target=3D"_blank">niziak@spox.org</a=
>&gt;<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/fwup/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Xuanhao Shi &lt;<a href=3D"mailto:X15000177@gma=
il.com" target=3D"_blank">X15000177@gmail.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-image-gen/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0boot/ti-k3-r5-loader/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Yair Ben Avraham &lt;<a href=3D"mailto:yairba@p=
rotonmail.com" target=3D"_blank">yairba@protonmail.com</a>&gt;<br>
diff --git a/boot/Config.in b/boot/Config.in<br>
index ce17b2df6b..1b25bacfee 100644<br>
--- a/boot/Config.in<br>
+++ b/boot/Config.in<br>
@@ -22,6 +22,7 @@ source &quot;boot/s500-bootloader/Config.in&quot;<br>
=C2=A0source &quot;boot/shim/Config.in&quot;<br>
=C2=A0source &quot;boot/sun20i-d1-spl/Config.in&quot;<br>
=C2=A0source &quot;boot/syslinux/Config.in&quot;<br>
+source &quot;boot/ti-k3-image-gen/Config.in&quot;<br>
=C2=A0source &quot;boot/ti-k3-r5-loader/Config.in&quot;<br>
=C2=A0source &quot;boot/uboot/Config.in&quot;<br>
=C2=A0source &quot;boot/vexpress-firmware/Config.in&quot;<br>
diff --git a/boot/ti-k3-image-gen/Config.in b/boot/ti-k3-image-gen/Config.i=
n<br>
new file mode 100644<br>
index 0000000000..02018f2f78<br>
--- /dev/null<br>
+++ b/boot/ti-k3-image-gen/Config.in<br>
@@ -0,0 +1,30 @@<br>
+config BR2_TARGET_TI_K3_IMAGE_GEN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;ti-k3-image-gen&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_TARGET_TI_K3_R5_LOADER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Use TI&#39;s k3-image-gen to build a sep=
arate bare metal<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0boot binary from a separate spl. Current=
ly supports<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0version 08.05.00.004 as default.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://git.ti.com/cgit/k3-im=
age-gen/k3-image-gen/" rel=3D"noreferrer" target=3D"_blank">https://git.ti.=
com/cgit/k3-image-gen/k3-image-gen/</a><br>
+<br>
+if BR2_TARGET_TI_K3_IMAGE_GEN<br>
+config BR2_TARGET_TI_K3_IMAGE_GEN_SOC<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;SOC type for image gen&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The target SoC option for image gen.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0For example, &quot;am64x&quot; for AM64X=
 boards.<br>
+<br>
+config BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;SOC security type for image gen&qu=
ot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The security type option for image gen.<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Options are &quot;gp&quot;, &quot;hs-fs&=
quot;, or &quot;hs-se&quot;.<br>
+<br>
+config BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0string &quot;CONFIG type for image gen&quot;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The board config option for image gen.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Usually &quot;sk&quot; or &quot;evm&quot=
;.<br>
+endif<br>
+<br>
diff --git a/boot/ti-k3-image-gen/ti-k3-image-gen.hash b/boot/ti-k3-image-g=
en/ti-k3-image-gen.hash<br>
new file mode 100644<br>
index 0000000000..82c5b17060<br>
--- /dev/null<br>
+++ b/boot/ti-k3-image-gen/ti-k3-image-gen.hash<br>
@@ -0,0 +1,2 @@<br>
+# Locally calculated<br>
+sha256=C2=A0 d13e9556bfba32d14071e172589683e48f6fea705a0b05ddd7fe984002089=
888=C2=A0 k3-image-gen-08.05.00.004.tar.gz<br>
diff --git a/boot/ti-k3-image-gen/<a href=3D"http://ti-k3-image-gen.mk" rel=
=3D"noreferrer" target=3D"_blank">ti-k3-image-gen.mk</a> b/boot/ti-k3-image=
-gen/<a href=3D"http://ti-k3-image-gen.mk" rel=3D"noreferrer" target=3D"_bl=
ank">ti-k3-image-gen.mk</a><br>
new file mode 100644<br>
index 0000000000..f8e6105bfb<br>
--- /dev/null<br>
+++ b/boot/ti-k3-image-gen/<a href=3D"http://ti-k3-image-gen.mk" rel=3D"nor=
eferrer" target=3D"_blank">ti-k3-image-gen.mk</a><br>
@@ -0,0 +1,42 @@<br>
+##########################################################################=
######<br>
+#<br>
+# ti-k3-image-gen<br>
+#<br>
+##########################################################################=
######<br>
+<br>
+TI_K3_IMAGE_GEN_VERSION =3D 08.05.00.004<br>
+TI_K3_IMAGE_GEN_SITE =3D <a href=3D"https://git.ti.com/cgit/k3-image-gen/k=
3-image-gen/snapshot+TI_K3_IMAGE_GEN_SOURCE" rel=3D"noreferrer" target=3D"_=
blank">https://git.ti.com/cgit/k3-image-gen/k3-image-gen/snapshot<br>
+TI_K3_IMAGE_GEN_SOURCE</a> =3D k3-image-gen-$(TI_K3_IMAGE_GEN_VERSION).tar=
.gz<br>
+TI_K3_IMAGE_GEN_LICENSE =3D BSD-3-Clause<br>
+TI_K3_IMAGE_GEN_LICENSE_FILES =3D LICENSE<br>
+TI_K3_IMAGE_GEN_INSTALL_IMAGES =3D YES<br>
+<br>
+# ti-k3-image-gen is used to build tiboot3.bin, using the r5-u-boot-spl.bi=
n file<br>
+# from the ti-k3-r5-loader package. Hence the dependency on ti-k3-r5-loade=
r.<br>
+TI_K3_IMAGE_GEN_DEPENDENCIES =3D host-arm-gnu-toolchain ti-k3-r5-loader<br=
>
+<br>
+# The ti-k3-image-gen makefiles seem to need some feature from Make v4.0,<=
br>
+# similar to u-boot. Explicitly use $(BR2_MAKE) here, as the build<br>
+# otherwise fails with some misleading error message.<br>
+TI_K3_IMAGE_GEN_MAKE =3D $(BR2_MAKE)<br>
+TI_K3_IMAGE_GEN_SOC =3D $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SOC))<b=
r>
+TI_K3_IMAGE_GEN_SOC_TYPE =3D $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_SO=
C_TYPE))<br>
+TI_K3_IMAGE_GEN_CONFIG =3D $(call qstrip,$(BR2_TARGET_TI_K3_IMAGE_GEN_CONF=
IG))<br>
+TI_K3_IMAGE_GEN_MAKE_OPTS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SOC=3D$(TI_K3_IMAGE_GEN_SOC) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SOC_TYPE=3D$(TI_K3_IMAGE_GEN_SOC_TYPE) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG=3D$(TI_K3_IMAGE_GEN_CONFIG) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0CROSS_COMPILE=3D$(HOST_DIR)/bin/arm-none-eabi- =
\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SBL=3D$(BINARIES_DIR)/r5-u-boot-spl.bin \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0O=3D$(@D)/tmp \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BIN_DIR=3D$(@D)<br>
+<br>
+define TI_K3_IMAGE_GEN_BUILD_CMDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TI_K3_IMAGE_GEN_MAKE) -C $(@D) $(TI_K3_IMAGE_=
GEN_MAKE_OPTS)<br>
+endef<br>
+<br>
+define TI_K3_IMAGE_GEN_INSTALL_IMAGES_CMDS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp $(@D)/tiboot3.bin $(BINARIES_DIR)<br>
+endef<br>
+<br>
+$(eval $(generic-package))<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--000000000000529ab705ef2e85b9--

--===============2561325888891878287==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2561325888891878287==--
