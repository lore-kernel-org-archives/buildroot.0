Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B502DEB64D8
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 11:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 369D783C8A;
	Fri, 16 Jun 2023 11:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 369D783C8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dru7B2j04EKI; Fri, 16 Jun 2023 11:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1223E83CA9;
	Fri, 16 Jun 2023 11:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1223E83CA9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C9661BF3A9
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 11:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 662CA417EA
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 11:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 662CA417EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-zZvrynmqpc for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 11:15:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03EF440125
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03EF440125
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 11:15:15 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-25df7944f98so509490a91.0
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 04:15:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686914115; x=1689506115;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DxelMoz7X8G97sLYMRR6OnUMpf1hdvlpnBBhzKO8BNg=;
 b=Wp2z5Njd8/jl5DEzOtbCE5Sdn08RJN8tknbK9hQIDG2LrdDy5iUuLQYbkRMIYLBJO/
 kLz2MCnf+eaoCbug3QQ6JOY9c5POqwYpxQwD1Rx5rFYvE8EVuLdJAQ3S2Z5Gd2Uu4y0a
 UOaiKlHKfzvqm4tbx3YoFdAY1YglMMbofLnZZnVoc1OtRNCJWvNC44nm5ZAhl3k+fJd9
 5kOosNBC/bJdzeUoifAuYc49bsG5KHjcENyzsbnB3Ts21XEIFiobLT75DuzH6eoRX2Hs
 tuV0cQb8nSCM9TZ5WebVKisamXUmS/5RlKTsSXgilgRuX5+g98okZ+WOB59tXl6yT5ts
 9RRw==
X-Gm-Message-State: AC+VfDxp1AFhBDl2HuQBTJdzK98vuhFwJgWAcUlgMLov6Tkbh61x9BAn
 NW9P1Q7fSoNgcxOdbcuDLyHePCnXEZHk//hE3w3q6Bq8uqDelNZPhNk=
X-Google-Smtp-Source: ACHHUZ4FR8YUAsJclGH3dapU9VHoOzp2B6aOiMtLFvxNYJAi4FR6twBQUfW2cAp6O+48Pm2+ypSDSGzg70rjSkvDHQs=
X-Received: by 2002:a17:90a:d811:b0:256:87f4:432a with SMTP id
 a17-20020a17090ad81100b0025687f4432amr1475108pjv.18.1686914115275; Fri, 16
 Jun 2023 04:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230616002359.4139814-1-dannenberg@ti.com>
 <20230616002359.4139814-8-dannenberg@ti.com>
In-Reply-To: <20230616002359.4139814-8-dannenberg@ti.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 16 Jun 2023 13:15:04 +0200
Message-ID: <CAAE6iEWfhb46NsbC+4E9p24Dzcz_edGLxegJtQu4mFMp_yfBdQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1686914115; x=1689506115;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DxelMoz7X8G97sLYMRR6OnUMpf1hdvlpnBBhzKO8BNg=;
 b=EEjw6IQ/OUCLVFC+LboJX54ofYkS087rexhGQVJ/gf5xoUKPNbV7I16XjjnRgvW2mc
 11FqVp9ySHd1QrhdBQtgQo0QOg1db9+TZbUM9Fqybmwox21+qzm3B8J6AcU8xBEdu1nj
 POX0SXQJVY11ZRthxxny0uSV6Lr1hpzH3C767MZDSlRJSWSx2S0ihWdff33FKQAlX7qw
 CUg1AJ/6BuHEBj0RlewLEcHEQ3xaNbWEtaglhAKiokYR8eTFYxOBN5kkF/LakhB9Xi03
 gss8XE3tTQQ9whckC4yVsBmVyXgjVwVpcxX5xkiYPIS308HIMaSlNyFZjmR37qW7gYhJ
 5J3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=EEjw6IQ/
Subject: Re: [Buildroot] [PATCH v8 07/10] board/ti/am62x_sk|am64x_sk: switch
 to HS-FS device variants
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
Cc: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: multipart/mixed; boundary="===============4489006939836251511=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4489006939836251511==
Content-Type: multipart/alternative; boundary="0000000000009ba1e505fe3d4c32"

--0000000000009ba1e505fe3d4c32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 16 juin 2023 =C3=A0 02:38, Andreas Dannenberg via buildroot <
buildroot@buildroot.org> a =C3=A9crit :

> Current starter kits for AM62x (called SK-AM62B, see [1]) and AM64x
> (called SK-AM64B, see [2]) both contain High Security - Field Securable
> (HS-FS) device variants, and those are really the recommended production
> device variants and boards TI will provide moving forward. Hence, switch
> the defconfigs for those boards over to accommodate those now-shipping
> device variants and boards.
>
> [1] https://www.ti.com/tool/SK-AM62B
> [2] https://www.ti.com/tool/SK-AM64B
>
> Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>  board/ti/am62x_sk/readme.txt | 16 ++++++++++++++++
>  board/ti/am64x_sk/readme.txt | 16 ++++++++++++++++
>  configs/am62x_sk_defconfig   |  2 +-
>  configs/am64x_sk_defconfig   |  4 ++--
>  4 files changed, 35 insertions(+), 3 deletions(-)
>
> diff --git a/board/ti/am62x_sk/readme.txt b/board/ti/am62x_sk/readme.txt
> index ccbb24896b..9c7c8818af 100644
> --- a/board/ti/am62x_sk/readme.txt
> +++ b/board/ti/am62x_sk/readme.txt
> @@ -12,6 +12,22 @@ $ make am62x_sk_defconfig
>  Optional: modify the configuration:
>  $ make menuconfig
>
> +Required setup step for High Security HS-FS and HS-SE SoC variants:
> +
> +To allow the image signing process for various firmware artifacts to
> +work the build process for HS-FS and HS-SE device variants is using
> +an external 'core-secdev-k3' package which can be obtained from
> +https://git.ti.com/cgit/security-development-tools/core-secdev-k3.
> +To prepare building for those device variants create a local copy of
> +the 'core-secdev-k3' and export its location through the
> +TI_SECURE_DEV_PKG environmental variable. Use the package as-is for
> +HS-FS device variants such as populated on the SK-AM64B board, or
> +customize this package with your private signing keys when using a
> +HS-SE device variant.
> +
> +$ git clone
> https://git.ti.com/git/security-development-tools/core-secdev-k3.git
> +$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3
>

core-secdev-k3 could be a host package and an optional dependency of uboot
or atf

###########################################################################=
#####
#
# ti-core-secdev-k3
#
###########################################################################=
#####

TI_CORE_SECDEV_K3_VERSION =3D 08.06.00.007
TI_CORE_SECDEV_K3_SITE =3D
https://git.ti.com/cgit/security-development-tools/core-secdev-k3/snapshot
TI_CORE_SECDEV_K3_SOURCE =3D
core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).tar.gz

TI_SECURE_DEV_PKG=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CORE_SECDEV_K3_VERS=
ION)

$(eval $(host-generic-package))

Fran=C3=A7ois



> +
>  Build:
>  $ make
>
> diff --git a/board/ti/am64x_sk/readme.txt b/board/ti/am64x_sk/readme.txt
> index fe83c675f5..51d0312726 100644
> --- a/board/ti/am64x_sk/readme.txt
> +++ b/board/ti/am64x_sk/readme.txt
> @@ -12,6 +12,22 @@ $ make am64x_sk_defconfig
>  Optional: modify the configuration:
>  $ make menuconfig
>
> +Required setup step for High Security HS-FS and HS-SE SoC variants:
> +
> +To allow the image signing process for various firmware artifacts to
> +work the build process for HS-FS and HS-SE device variants is using
> +an external 'core-secdev-k3' package which can be obtained from
> +https://git.ti.com/cgit/security-development-tools/core-secdev-k3.
> +To prepare building for those device variants create a local copy of
> +the 'core-secdev-k3' and export its location through the
> +TI_SECURE_DEV_PKG environmental variable. Use the package as-is for
> +HS-FS device variants such as populated on the SK-AM64B board, or
> +customize this package with your private signing keys when using a
> +HS-SE device variant.
> +
> +$ git clone
> https://git.ti.com/git/security-development-tools/core-secdev-k3.git
> +$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3
> +
>  Build:
>  $ make
>
> diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defconfig
> index 2d05ddd96b..033101b735 100644
> --- a/configs/am62x_sk_defconfig
> +++ b/configs/am62x_sk_defconfig
> @@ -28,7 +28,7 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=3Dy
>  BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3"
>  BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
>  BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am62x"
> -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"gp"
> +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"hs-fs"
>  BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D"evm"
>  BR2_TARGET_TI_K3_R5_LOADER=3Dy
>  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy
> diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig
> index a26e38a043..096dd77f6a 100644
> --- a/configs/am64x_sk_defconfig
> +++ b/configs/am64x_sk_defconfig
> @@ -28,8 +28,8 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=3Dy
>  BR2_TARGET_OPTEE_OS_PLATFORM=3D"k3"
>  BR2_TARGET_TI_K3_IMAGE_GEN=3Dy
>  BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI=3Dy
> -BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am64x"
> -BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"gp"
> +BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D"am64x_sr2"
> +BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D"hs-fs"
>  BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D"evm"
>  BR2_TARGET_TI_K3_R5_LOADER=3Dy
>  BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000009ba1e505fe3d4c32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 16 juin 2023 =C3=A0=C2=
=A002:38, Andreas Dannenberg via buildroot &lt;<a href=3D"mailto:buildroot@=
buildroot.org">buildroot@buildroot.org</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Current starter kits for=
 AM62x (called SK-AM62B, see [1]) and AM64x<br>
(called SK-AM64B, see [2]) both contain High Security - Field Securable<br>
(HS-FS) device variants, and those are really the recommended production<br=
>
device variants and boards TI will provide moving forward. Hence, switch<br=
>
the defconfigs for those boards over to accommodate those now-shipping<br>
device variants and boards.<br>
<br>
[1] <a href=3D"https://www.ti.com/tool/SK-AM62B" rel=3D"noreferrer" target=
=3D"_blank">https://www.ti.com/tool/SK-AM62B</a><br>
[2] <a href=3D"https://www.ti.com/tool/SK-AM64B" rel=3D"noreferrer" target=
=3D"_blank">https://www.ti.com/tool/SK-AM64B</a><br>
<br>
Signed-off-by: Andreas Dannenberg &lt;<a href=3D"mailto:dannenberg@ti.com" =
target=3D"_blank">dannenberg@ti.com</a>&gt;<br>
---<br>
=C2=A0board/ti/am62x_sk/readme.txt | 16 ++++++++++++++++<br>
=C2=A0board/ti/am64x_sk/readme.txt | 16 ++++++++++++++++<br>
=C2=A0configs/am62x_sk_defconfig=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0configs/am64x_sk_defconfig=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A04 files changed, 35 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/board/ti/am62x_sk/readme.txt b/board/ti/am62x_sk/readme.txt<br=
>
index ccbb24896b..9c7c8818af 100644<br>
--- a/board/ti/am62x_sk/readme.txt<br>
+++ b/board/ti/am62x_sk/readme.txt<br>
@@ -12,6 +12,22 @@ $ make am62x_sk_defconfig<br>
=C2=A0Optional: modify the configuration:<br>
=C2=A0$ make menuconfig<br>
<br>
+Required setup step for High Security HS-FS and HS-SE SoC variants:<br>
+<br>
+To allow the image signing process for various firmware artifacts to<br>
+work the build process for HS-FS and HS-SE device variants is using<br>
+an external &#39;core-secdev-k3&#39; package which can be obtained from<br=
>
+<a href=3D"https://git.ti.com/cgit/security-development-tools/core-secdev-=
k3" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/cgit/security-d=
evelopment-tools/core-secdev-k3</a>.<br>
+To prepare building for those device variants create a local copy of<br>
+the &#39;core-secdev-k3&#39; and export its location through the<br>
+TI_SECURE_DEV_PKG environmental variable. Use the package as-is for<br>
+HS-FS device variants such as populated on the SK-AM64B board, or<br>
+customize this package with your private signing keys when using a<br>
+HS-SE device variant.<br>
+<br>
+$ git clone <a href=3D"https://git.ti.com/git/security-development-tools/c=
ore-secdev-k3.git" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/=
git/security-development-tools/core-secdev-k3.git</a><br>
+$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3<br></blockquote><div><br>=
</div><div>core-secdev-k3 could be a host package and an optional dependenc=
y of uboot or atf<br></div><div><br></div><div>############################=
####################################################<br>#<br># ti-core-secd=
ev-k3<br>#<br>#############################################################=
###################<br><br>TI_CORE_SECDEV_K3_VERSION =3D 08.06.00.007<br>TI=
_CORE_SECDEV_K3_SITE =3D <a href=3D"https://git.ti.com/cgit/security-develo=
pment-tools/core-secdev-k3/snapshot">https://git.ti.com/cgit/security-devel=
opment-tools/core-secdev-k3/snapshot</a><br>TI_CORE_SECDEV_K3_SOURCE =3D co=
re-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION).tar.gz<br><br>TI_SECURE_DEV_PKG=
=3D$(BUILD_DIR)/ti-core-secdev-k3-$(TI_CORE_SECDEV_K3_VERSION)<br><br>$(eva=
l $(host-generic-package))<br></div><div><br></div><div>Fran=C3=A7ois<br></=
div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
+<br>
=C2=A0Build:<br>
=C2=A0$ make<br>
<br>
diff --git a/board/ti/am64x_sk/readme.txt b/board/ti/am64x_sk/readme.txt<br=
>
index fe83c675f5..51d0312726 100644<br>
--- a/board/ti/am64x_sk/readme.txt<br>
+++ b/board/ti/am64x_sk/readme.txt<br>
@@ -12,6 +12,22 @@ $ make am64x_sk_defconfig<br>
=C2=A0Optional: modify the configuration:<br>
=C2=A0$ make menuconfig<br>
<br>
+Required setup step for High Security HS-FS and HS-SE SoC variants:<br>
+<br>
+To allow the image signing process for various firmware artifacts to<br>
+work the build process for HS-FS and HS-SE device variants is using<br>
+an external &#39;core-secdev-k3&#39; package which can be obtained from<br=
>
+<a href=3D"https://git.ti.com/cgit/security-development-tools/core-secdev-=
k3" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/cgit/security-d=
evelopment-tools/core-secdev-k3</a>.<br>
+To prepare building for those device variants create a local copy of<br>
+the &#39;core-secdev-k3&#39; and export its location through the<br>
+TI_SECURE_DEV_PKG environmental variable. Use the package as-is for<br>
+HS-FS device variants such as populated on the SK-AM64B board, or<br>
+customize this package with your private signing keys when using a<br>
+HS-SE device variant.<br>
+<br>
+$ git clone <a href=3D"https://git.ti.com/git/security-development-tools/c=
ore-secdev-k3.git" rel=3D"noreferrer" target=3D"_blank">https://git.ti.com/=
git/security-development-tools/core-secdev-k3.git</a><br>
+$ export TI_SECURE_DEV_PKG=3D$PWD/core-secdev-k3<br>
+<br>
=C2=A0Build:<br>
=C2=A0$ make<br>
<br>
diff --git a/configs/am62x_sk_defconfig b/configs/am62x_sk_defconfig<br>
index 2d05ddd96b..033101b735 100644<br>
--- a/configs/am62x_sk_defconfig<br>
+++ b/configs/am62x_sk_defconfig<br>
@@ -28,7 +28,7 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=3Dy<br>
=C2=A0BR2_TARGET_OPTEE_OS_PLATFORM=3D&quot;k3&quot;<br>
=C2=A0BR2_TARGET_TI_K3_IMAGE_GEN=3Dy<br>
=C2=A0BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D&quot;am62x&quot;<br>
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D&quot;gp&quot;<br>
+BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D&quot;hs-fs&quot;<br>
=C2=A0BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D&quot;evm&quot;<br>
=C2=A0BR2_TARGET_TI_K3_R5_LOADER=3Dy<br>
=C2=A0BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy<br>
diff --git a/configs/am64x_sk_defconfig b/configs/am64x_sk_defconfig<br>
index a26e38a043..096dd77f6a 100644<br>
--- a/configs/am64x_sk_defconfig<br>
+++ b/configs/am64x_sk_defconfig<br>
@@ -28,8 +28,8 @@ BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=3Dy<br>
=C2=A0BR2_TARGET_OPTEE_OS_PLATFORM=3D&quot;k3&quot;<br>
=C2=A0BR2_TARGET_TI_K3_IMAGE_GEN=3Dy<br>
=C2=A0BR2_TARGET_TI_K3_IMAGE_GEN_FW_TYPE_TISCI=3Dy<br>
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D&quot;am64x&quot;<br>
-BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D&quot;gp&quot;<br>
+BR2_TARGET_TI_K3_IMAGE_GEN_SOC=3D&quot;am64x_sr2&quot;<br>
+BR2_TARGET_TI_K3_IMAGE_GEN_SOC_TYPE=3D&quot;hs-fs&quot;<br>
=C2=A0BR2_TARGET_TI_K3_IMAGE_GEN_CONFIG=3D&quot;evm&quot;<br>
=C2=A0BR2_TARGET_TI_K3_R5_LOADER=3Dy<br>
=C2=A0BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_TARBALL=3Dy<br>
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

--0000000000009ba1e505fe3d4c32--

--===============4489006939836251511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4489006939836251511==--
