Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CD5C4332F
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 09:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 715EB6FA08;
	Thu, 20 Oct 2022 09:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 715EB6FA08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uW9pYDpbu5eF; Thu, 20 Oct 2022 09:18:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 349BB6F9FA;
	Thu, 20 Oct 2022 09:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 349BB6F9FA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 094161BF314
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 09:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8BE84013A
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 09:18:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8BE84013A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3NXR39bmKYei for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 09:18:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C67A640116
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C67A640116
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 09:18:53 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 cy15-20020a056830698f00b0065c530585afso11046421otb.2
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 02:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=02C8li1LcTatXWpoFzfqOXz8CVOMQUvVGddlLNj48Og=;
 b=DVBorvcXc2wKsaQDeMJ1Xo8h1SaHuLobYK6EgvrMw+9EVBjJ4kjMYJIFvmSaJb5fLj
 p8kW7EROktlHj1m497JWUCJy0sLzzSDlRACccImRd770CfMmOBsqUgvNX/XfCN9Bulp9
 IpL/6pgRZGd8WhnexyiC1Xklq2jGkUKtF5qGwIjoN7ne2624b7iAxXeKrwMm0zhq2pn5
 emF8pfOAhXkEXTXBRN2Q2e9j39D7hAW4MExONy2L1G+xHM2lziRFgSTORuipob3Aar3d
 aS/La1hK/mfdoEjDKG9lNQ/NrzH5Z7bRd3yAJ+ekhRbKMk5eCi+l84Kz0jNU4h+9H8Gg
 JFIg==
X-Gm-Message-State: ACrzQf3tYiCI/w34HmVlcphdtJ3dxfwJ1jOZMgOTcvSgcQsJBnQwUbox
 wwoLeNv69SiFANk1rd7S2w9Us5hNfi2/X4ni30L3Uw==
X-Google-Smtp-Source: AMsMyM5thhbHjfQzNSHkdXp+4o662cGKz/V+bnw6S0l/z7a3Poj7s1tWYEyjwGcZFTycs6e8hu5ZgFC3YAgOLKsCgjw=
X-Received: by 2002:a05:6830:1217:b0:661:c542:503c with SMTP id
 r23-20020a056830121700b00661c542503cmr6701866otp.40.1666257532710; Thu, 20
 Oct 2022 02:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221013121041.1398841-1-jesseevg@gmail.com>
In-Reply-To: <20221013121041.1398841-1-jesseevg@gmail.com>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu, 20 Oct 2022 11:18:15 +0200
Message-ID: <CA+_SqVbuh2_ywQ8fex+4=H+JKnoqQLReTGnU9OwvzjsT2merng@mail.gmail.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=02C8li1LcTatXWpoFzfqOXz8CVOMQUvVGddlLNj48Og=;
 b=Dw+hEbh6ZHdKGGA9n3boJIm8v80uoz2WyjfTwabQmmd8nJWyCAB3D64HbUfBr0Eajh
 f2F9ne6XcxKbcR+v2e/af7xH6mMXb+osjFeDWKrNylJQYxby5JLlcKbl2NJXdj16Ds61
 D57jWPl+47rai+Kzb9ZRkq8MvLWTNlQ0ZCVIA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Dw+hEbh6
Subject: Re: [Buildroot] [PATCH v2 1/1] package/qt6: Change license hashes
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8432805776853287326=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8432805776853287326==
Content-Type: multipart/alternative; boundary="00000000000057895a05eb73d0c0"

--00000000000057895a05eb73d0c0
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 13, 2022 at 2:11 PM Jesse Van Gavere <jesseevg@gmail.com> wrote:

> There was a major rework of how licenses are used in the Qt codebase
> along with a new location for all licenses, so change the hash file to
> reflect these changes
>
> https://github.com/qt/qtserialport/commit/bb05a26d52c834cc7f3c549f3e5d66f76baf42a2
>
> Changes for v2:
>  - Also adjust the makefiles to refer to these new license file names
>  - Added myself to the developers for the qt6 package for good measure
>
> Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> ---
>

Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>


>  DEVELOPERS                                   |  1 +
>  package/qt6/qt6base/qt6base.hash             | 15 ++++++++++-----
>  package/qt6/qt6base/qt6base.mk               |  4 ++--
>  package/qt6/qt6serialport/qt6serialport.hash | 12 +++++++-----
>  package/qt6/qt6serialport/qt6serialport.mk   |  4 ++--
>  5 files changed, 22 insertions(+), 14 deletions(-)
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 59121c6a54..6cb8d0fc54 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1478,6 +1478,7 @@ F:        package/x11r7/xdriver_xf86-video-imx/
>  F:     package/x11r7/xdriver_xf86-video-imx-viv/
>
>  N:     Jesse Van Gavere <jesseevg@gmail.com>
> +F:     package/qt6/
>  F:     package/qt6/qt6serialport/
>
>  N:     Jianhui Zhao <zhaojh329@gmail.com>
> diff --git a/package/qt6/qt6base/qt6base.hash
> b/package/qt6/qt6base/qt6base.hash
> index 5dd26973fa..b004347a5a 100644
> --- a/package/qt6/qt6base/qt6base.hash
> +++ b/package/qt6/qt6base/qt6base.hash
> @@ -2,8 +2,13 @@
>  sha256  cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55db75b22b94ead9b37d
> qtbase-everywhere-src-6.4.0.tar.xz
>
>  # Hashes for license files
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSE.GPL2
> -sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSE.GPL3
> -sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652
> LICENSE.GPL3-EXCEPT
> -sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSE.LGPL3
> -sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSE.FDL
> +sha256  e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb
> LICENSES/Apache-2.0.txt
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> +sha256  3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5
> LICENSES/BSL-1.0.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSES/GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSES/LGPL-3.0-only.txt
> +sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700
> LICENSES/LicenseRef-Qt-Commercial.txt
> +sha256  d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc
> LICENSES/MIT.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
> LICENSES/Qt-GPL-exception-1.0.txt
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/
> qt6base.mk
> index b7ee6037f3..b53d53c653 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -7,8 +7,8 @@
>  QT6BASE_VERSION = $(QT6_VERSION)
>  QT6BASE_SITE = $(QT6_SITE)
>  QT6BASE_SOURCE =
> qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
> -QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools),
> GFDL-1.3 (docs)
> -QT6BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT
> LICENSE.LGPL3 LICENSE.FDL
> +QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools),
> GFDL-1.3 no invariants (docs)
> +QT6BASE_LICENSE_FILES = LICENSES/GPL-2.0-only.txt
> LICENSES/GPL-3.0-only.txt LICENSES/Qt-GPL-exception-1.0.txt
> LICENSES/LGPL-3.0-only.txt LICENSES/GFDL-1.3-no-invariants-only.txt
>  QT6BASE_DEPENDENCIES = \
>         host-ninja \
>         host-qt6base \
> diff --git a/package/qt6/qt6serialport/qt6serialport.hash
> b/package/qt6/qt6serialport/qt6serialport.hash
> index fb1b3dcf6b..887f67b2ae 100644
> --- a/package/qt6/qt6serialport/qt6serialport.hash
> +++ b/package/qt6/qt6serialport/qt6serialport.hash
> @@ -2,8 +2,10 @@
>  sha256  f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac614f4a4483
> qtserialport-everywhere-src-6.4.0.tar.xz
>
>  # Hashes for license files:
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSE.GPL2
> -sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSE.GPL3
> -sha256  0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652
> LICENSE.GPL3-EXCEPT
> -sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSE.LGPL3
> -sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d
> LICENSE.FDL
> +sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> +sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSES/GFDL-1.3-no-invariants-only.txt
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSES/GPL-2.0-only.txt
> +sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSES/GPL-3.0-only.txt
> +sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSES/LGPL-3.0-only.txt
> +sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700
> LICENSES/LicenseRef-Qt-Commercial.txt
> +sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
> LICENSES/Qt-GPL-exception-1.0.txt
> diff --git a/package/qt6/qt6serialport/qt6serialport.mk
> b/package/qt6/qt6serialport/qt6serialport.mk
> index 01763657b8..03197fd60d 100644
> --- a/package/qt6/qt6serialport/qt6serialport.mk
> +++ b/package/qt6/qt6serialport/qt6serialport.mk
> @@ -9,8 +9,8 @@ QT6SERIALPORT_SITE = $(QT6_SITE)
>  QT6SERIALPORT_SOURCE =
> qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT_VERSION).tar.xz
>  QT6SERIALPORT_INSTALL_STAGING = YES
>  QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
> -QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception
> (tools), GFDL-1.3 (docs)
> -QT6SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3
> LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
> +QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception
> (tools), GFDL-1.3 no invariants (docs)
> +QT6SERIALPORT_LICENSE_FILES = LICENSES/GPL-2.0-only.txt
> LICENSES/GPL-3.0-only.txt LICENSES/Qt-GPL-exception-1.0.txt
> LICENSES/LGPL-3.0-only.txt LICENSES/GFDL-1.3-no-invariants-only.txt
>  QT6SERIALPORT_CONF_OPTS = \
>         -GNinja \
>         -DQT_HOST_PATH=$(HOST_DIR) \
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>


-- 

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--00000000000057895a05eb73d0c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 13, 2022 at 2:11 PM Jesse=
 Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.com">jesseevg@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The=
re was a major rework of how licenses are used in the Qt codebase<br>
along with a new location for all licenses, so change the hash file to<br>
reflect these changes<br>
<a href=3D"https://github.com/qt/qtserialport/commit/bb05a26d52c834cc7f3c54=
9f3e5d66f76baf42a2" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/qt/qtserialport/commit/bb05a26d52c834cc7f3c549f3e5d66f76baf42a2</a><br>
<br>
Changes for v2:<br>
=C2=A0- Also adjust the makefiles to refer to these new license file names<=
br>
=C2=A0- Added myself to the developers for the qt6 package for good measure=
<br>
<br>
Signed-off-by: Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.com" t=
arget=3D"_blank">jesseevg@gmail.com</a>&gt;<br>
---<br></blockquote><div><br>Tested-by: Angelo Compagnucci &lt;<a href=3D"m=
ailto:angelo@amarulasolutions.com">angelo@amarulasolutions.com</a>&gt; <br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1=
 +<br>
=C2=A0package/qt6/qt6base/qt6base.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 15 ++++++++++-----<br>
=C2=A0package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0package/qt6/qt6serialport/qt6serialport.hash | 12 +++++++-----<br>
=C2=A0package/qt6/qt6serialport/<a href=3D"http://qt6serialport.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6serialport.mk</a>=C2=A0 =C2=A0|=C2=A0 4 ++=
--<br>
=C2=A05 files changed, 22 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 59121c6a54..6cb8d0fc54 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1478,6 +1478,7 @@ F:=C2=A0 =C2=A0 =C2=A0 =C2=A0 package/x11r7/xdriver_x=
f86-video-imx/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/x11r7/xdriver_xf86-video-imx-viv/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg=
@gmail.com" target=3D"_blank">jesseevg@gmail.com</a>&gt;<br>
+F:=C2=A0 =C2=A0 =C2=A0package/qt6/<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0package/qt6/qt6serialport/<br>
<br>
=C2=A0N:=C2=A0 =C2=A0 =C2=A0Jianhui Zhao &lt;<a href=3D"mailto:zhaojh329@gm=
ail.com" target=3D"_blank">zhaojh329@gmail.com</a>&gt;<br>
diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6base/qt6base=
.hash<br>
index 5dd26973fa..b004347a5a 100644<br>
--- a/package/qt6/qt6base/qt6base.hash<br>
+++ b/package/qt6/qt6base/qt6base.hash<br>
@@ -2,8 +2,13 @@<br>
=C2=A0sha256=C2=A0 cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55db75b22b94=
ead9b37d=C2=A0 qtbase-everywhere-src-6.4.0.tar.xz<br>
<br>
=C2=A0# Hashes for license files<br>
-sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880=
643=C2=A0 LICENSE.GPL2<br>
-sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b=
903=C2=A0 LICENSE.GPL3<br>
-sha256=C2=A0 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5=
652=C2=A0 LICENSE.GPL3-EXCEPT<br>
-sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464=
768=C2=A0 LICENSE.LGPL3<br>
-sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b20=
6a4=C2=A0 LICENSE.FDL<br>
+sha256=C2=A0 e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c8=
9cb=C2=A0 LICENSES/Apache-2.0.txt<br>
+sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1d=
cce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
+sha256=C2=A0 3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b04965=
3f5=C2=A0 LICENSES/BSL-1.0.txt<br>
+sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b20=
6a4=C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt<br>
+sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880=
643=C2=A0 LICENSES/GPL-2.0-only.txt<br>
+sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b=
903=C2=A0 LICENSES/GPL-3.0-only.txt<br>
+sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464=
768=C2=A0 LICENSES/LGPL-3.0-only.txt<br>
+sha256=C2=A0 9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4=
700=C2=A0 LICENSES/LicenseRef-Qt-Commercial.txt<br>
+sha256=C2=A0 d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf=
1fc=C2=A0 LICENSES/MIT.txt<br>
+sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b053084=
6b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
diff --git a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noref=
errer" target=3D"_blank">qt6base.mk</a> b/package/qt6/qt6base/<a href=3D"ht=
tp://qt6base.mk" rel=3D"noreferrer" target=3D"_blank">qt6base.mk</a><br>
index b7ee6037f3..b53d53c653 100644<br>
--- a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a><br>
+++ b/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a><br>
@@ -7,8 +7,8 @@<br>
=C2=A0QT6BASE_VERSION =3D $(QT6_VERSION)<br>
=C2=A0QT6BASE_SITE =3D $(QT6_SITE)<br>
=C2=A0QT6BASE_SOURCE =3D qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERS=
ION).tar.xz<br>
-QT6BASE_LICENSE =3D GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), =
GFDL-1.3 (docs)<br>
-QT6BASE_LICENSE_FILES =3D LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT LI=
CENSE.LGPL3 LICENSE.FDL<br>
+QT6BASE_LICENSE =3D GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (tools), =
GFDL-1.3 no invariants (docs)<br>
+QT6BASE_LICENSE_FILES =3D LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.=
txt LICENSES/Qt-GPL-exception-1.0.txt LICENSES/LGPL-3.0-only.txt LICENSES/G=
FDL-1.3-no-invariants-only.txt<br>
=C2=A0QT6BASE_DEPENDENCIES =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-ninja \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-qt6base \<br>
diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/package/qt6/qt6=
serialport/qt6serialport.hash<br>
index fb1b3dcf6b..887f67b2ae 100644<br>
--- a/package/qt6/qt6serialport/qt6serialport.hash<br>
+++ b/package/qt6/qt6serialport/qt6serialport.hash<br>
@@ -2,8 +2,10 @@<br>
=C2=A0sha256=C2=A0 f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac61=
4f4a4483=C2=A0 qtserialport-everywhere-src-6.4.0.tar.xz<br>
<br>
=C2=A0# Hashes for license files:<br>
-sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880=
643=C2=A0 LICENSE.GPL2<br>
-sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b=
903=C2=A0 LICENSE.GPL3<br>
-sha256=C2=A0 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5=
652=C2=A0 LICENSE.GPL3-EXCEPT<br>
-sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464=
768=C2=A0 LICENSE.LGPL3<br>
-sha256=C2=A0 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6=
c0d=C2=A0 LICENSE.FDL<br>
+sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1d=
cce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
+sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b20=
6a4=C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt<br>
+sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880=
643=C2=A0 LICENSES/GPL-2.0-only.txt<br>
+sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b=
903=C2=A0 LICENSES/GPL-3.0-only.txt<br>
+sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464=
768=C2=A0 LICENSES/LGPL-3.0-only.txt<br>
+sha256=C2=A0 9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4=
700=C2=A0 LICENSES/LicenseRef-Qt-Commercial.txt<br>
+sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b053084=
6b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
diff --git a/package/qt6/qt6serialport/<a href=3D"http://qt6serialport.mk" =
rel=3D"noreferrer" target=3D"_blank">qt6serialport.mk</a> b/package/qt6/qt6=
serialport/<a href=3D"http://qt6serialport.mk" rel=3D"noreferrer" target=3D=
"_blank">qt6serialport.mk</a><br>
index 01763657b8..03197fd60d 100644<br>
--- a/package/qt6/qt6serialport/<a href=3D"http://qt6serialport.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6serialport.mk</a><br>
+++ b/package/qt6/qt6serialport/<a href=3D"http://qt6serialport.mk" rel=3D"=
noreferrer" target=3D"_blank">qt6serialport.mk</a><br>
@@ -9,8 +9,8 @@ QT6SERIALPORT_SITE =3D $(QT6_SITE)<br>
=C2=A0QT6SERIALPORT_SOURCE =3D qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(=
QT6SERIALPORT_VERSION).tar.xz<br>
=C2=A0QT6SERIALPORT_INSTALL_STAGING =3D YES<br>
=C2=A0QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
-QT6SERIALPORT_LICENSE =3D GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (to=
ols), GFDL-1.3 (docs)<br>
-QT6SERIALPORT_LICENSE_FILES =3D LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXC=
EPT LICENSE.LGPL3 LICENSE.FDL<br>
+QT6SERIALPORT_LICENSE =3D GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception (to=
ols), GFDL-1.3 no invariants (docs)<br>
+QT6SERIALPORT_LICENSE_FILES =3D LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0=
-only.txt LICENSES/Qt-GPL-exception-1.0.txt LICENSES/LGPL-3.0-only.txt LICE=
NSES/GFDL-1.3-no-invariants-only.txt<br>
=C2=A0QT6SERIALPORT_CONF_OPTS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -GNinja \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DQT_HOST_PATH=3D$(HOST_DIR) \<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre-wrap"></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:50=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">Software Engineer</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:angelo@am=
arulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(241,194,50);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">__________________________________</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubun=
tu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:500=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Via le Canevare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">T. +39 (0)42 243 5310</span><span style=3D"font-size:10pt;font-famil=
y:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@=
amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.co=
m/" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">www.=
amarulasolutions.com</span></a></p><div>[`as] <a href=3D"https://www.amarul=
asolutions.com" target=3D"_blank">https://www.amarulasolutions.com</a>|</di=
v></div></div></div>

--00000000000057895a05eb73d0c0--

--===============8432805776853287326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8432805776853287326==--
