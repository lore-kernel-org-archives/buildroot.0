Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDFCC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 19:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B79B40168;
	Thu, 14 Dec 2023 19:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B79B40168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3l1kraRelH-S; Thu, 14 Dec 2023 19:53:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF5E44026A;
	Thu, 14 Dec 2023 19:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF5E44026A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8C3D41BF3EA
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A6204026A
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A6204026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rWxVbjbLf8kx for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 19:53:26 +0000 (UTC)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAF9D40168
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 19:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAF9D40168
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-28b011857f0so1123187a91.2
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 11:53:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702583606; x=1703188406;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TvHjFatt1k5aZzUjz55CT655hrpeLPbfOC7Ktv+8/ZI=;
 b=Gfbndmn3DVNqydIgc/wMGHtkgQr3mmcFj+kqcSg2O4zKbgNh+S1V2UYM5SWes2jXWR
 7BohMpSJPhSBhxB9PDxb5/8H6CvM5XSoy4T+5mvspC7ekRVou41xblGJdLrO6ienbrTp
 17mdfVqfK7jpxwJ+zs9sCbl5nRF9GPwHhLKOl2qz+fVPrOnswlHvs7f44jR73HjJSHXD
 66Ef69fAXP8p+yAJuHx/6ih1lktM8ed/chjyPWwf6+WChU1Ppgril5HFhRGYliiNrtA4
 cEze6VzpYPYQLnjkOSUYNnFXTW/483TJslfO8dKkF+jA6f04sZwJkeKN7fNQM4wlJioY
 fcww==
X-Gm-Message-State: AOJu0YxivVSPZA2y7ERBcWkoU941JhWhZ6S2ySZQEClnOcx5I4yMLhx3
 n6KKY5wZpRYrZGaNMmPTehAciGJBzPPgvnjD1S0/jg==
X-Google-Smtp-Source: AGHT+IGYkUijYpM6tzuFlPuG1P4ix5T0a99mxuCczrzfGiqQXvlC4CoEP/oT5DfizG4JwtUTZw0lQhKLVNGF3y5G7G4=
X-Received: by 2002:a17:90b:1997:b0:28b:7b0:115b with SMTP id
 mv23-20020a17090b199700b0028b07b0115bmr776460pjb.8.1702583605938; Thu, 14 Dec
 2023 11:53:25 -0800 (PST)
MIME-Version: 1.0
References: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
 <20231213164311.4180059-9-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231213164311.4180059-9-dario.binacchi@amarulasolutions.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 14 Dec 2023 20:53:14 +0100
Message-ID: <CAAE6iEUgwA3W75KRQ9oJLZx+rO-kcfSVC3kC9VWi0rG2fjHwKw@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1702583606; x=1703188406; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TvHjFatt1k5aZzUjz55CT655hrpeLPbfOC7Ktv+8/ZI=;
 b=avZxEh3R1AD3aXBWecWcU4sn2G5rJbfOG9X0tnUPtfS9YTdX5J9/ev5SFqqC582aNj
 Fj+YFFTfe/ID3tgr8Q6tPH9QCcePKFguU4egF0O+QrqepeihjiR3kp5d/XUh2oiDNxca
 aBAWagvHR7foxnJtX5ke4x8HGw0YDjrVKET0BogKfpXC0f92murANjvqXzs5tVltYI54
 lXwCZYu5OTECfCJsecy1IU/u22yKOxmHp1AE1ehyG78/QAYX+Yi1++mF0wk6dFOI+hLc
 +BqWcl7ywgcjWrIJFRT/KwoWuCHV/NybvKSOK39mQ3PXaEiA7k42+vcgb9X4YZ7AsH8I
 wTiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=avZxEh3R
Subject: Re: [Buildroot] [PATCH v2 08/11] boot/ti-k3-r5-loader: set binman
 environment
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: multipart/mixed; boundary="===============8053274048161930353=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8053274048161930353==
Content-Type: multipart/alternative; boundary="00000000000008d0d1060c7da3b0"

--00000000000008d0d1060c7da3b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 13 d=C3=A9c. 2023 =C3=A0 17:45, Dario Binacchi <
dario.binacchi@amarulasolutions.com> a =C3=A9crit :

> Recent version of U-Boot use binman to provide a mechanism for building
> images, from simple SPL + U-Boot combinations, to more complex
> arrangements with many parts.
>
> The patch set the BINMAN_INDIRS environment variable to provide the
> directory to search for binary blobs and select the packages required by
> binman.
>
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> Changes in v2:
> - Change commit message
> - Add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option
> - Select packages required by binman if
>   BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN is enabled
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  boot/ti-k3-r5-loader/Config.in          | 13 +++++++++++++
>  boot/ti-k3-r5-loader/ti-k3-r5-loader.mk |  1 +
>  2 files changed, 14 insertions(+)
>
> diff --git a/boot/ti-k3-r5-loader/Config.in
> b/boot/ti-k3-r5-loader/Config.in
> index 8c8368a1a5a8..a40eaed9467b 100644
> --- a/boot/ti-k3-r5-loader/Config.in
> +++ b/boot/ti-k3-r5-loader/Config.in
> @@ -93,4 +93,17 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE
>         help
>           Path to the TI K3 R5 Loader configuration file.
>
> +config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN
> +       bool "U-Boot uses binman"
> +       select BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
> +       select BR2_PACKAGE_HOST_PYTHON_ATTRS
> +       select BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA
> +       select BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA_SPECIFICATIONS
> +       select BR2_PACKAGE_HOST_PYTHON_PYYAML
> +       select BR2_PACKAGE_HOST_PYTHON_REFERENCING
> +       select BR2_PACKAGE_HOST_PYTHON_RPDS_PY
>

these select statements need their counterpart as dependencies in .mk

for this reason, the build fails with this message:
   error: command 'swig' failed: No such file or directory

note: the build is successful when it starts after the build of uboot which
depends on host-python-pylibfdt and host-swig

Fran=C3=A7ois

ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)    # like in uboot.mk
TI_K3_R5_LOADER_DEPENDENCIES +=3D host-python-pylibfdt
endif

ifeq ($(BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN),y)    # new packages
TI_K3_R5_LOADER_DEPENDENCIES +=3D \
    host-python-jsonschema \
    host-python-jsonschema-specifiactions \
    host-python-pyyaml \
    host-python-referencing \
    host-python-rpds-py
endif


+       help
> +         Select this option if your U-Boot version uses binman
> +         for building images.
> +
>  endif
> diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> index 0ffcb8235f2e..d5ec8fa8ba96 100644
> --- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> +++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
> @@ -58,6 +58,7 @@ TI_K3_R5_LOADER_MAKE_OPTS =3D \
>         CROSS_COMPILE=3D$(HOST_DIR)/bin/arm-none-eabi- \
>         ARCH=3Darm \
>         HOSTCC=3D"$(HOSTCC) $(subst -I/,-isystem /,$(subst -I /,-isystem
> /,$(HOST_CFLAGS)))" \
> +       BINMAN_INDIRS=3D$(BINARIES_DIR) \
>         HOSTLDFLAGS=3D"$(HOST_LDFLAGS)"
>
>  define TI_K3_R5_LOADER_BUILD_CMDS
> --
> 2.43.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000008d0d1060c7da3b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 13 d=C3=A9c. 2023 =C3=A0=
=C2=A017:45, Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulasol=
utions.com">dario.binacchi@amarulasolutions.com</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Recent version =
of U-Boot use binman to provide a mechanism for building<br>
images, from simple SPL + U-Boot combinations, to more complex<br>
arrangements with many parts.<br>
<br>
The patch set the BINMAN_INDIRS environment variable to provide the<br>
directory to search for binary blobs and select the packages required by<br=
>
binman.<br>
<br>
Co-developed-by: Michael Trimarchi &lt;<a href=3D"mailto:michael@amarulasol=
utions.com" target=3D"_blank">michael@amarulasolutions.com</a>&gt;<br>
Signed-off-by: Michael Trimarchi &lt;<a href=3D"mailto:michael@amarulasolut=
ions.com" target=3D"_blank">michael@amarulasolutions.com</a>&gt;<br>
Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulas=
olutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.com</a>&gt;=
<br>
<br>
---<br>
<br>
Changes in v2:<br>
- Change commit message<br>
- Add BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN option<br>
- Select packages required by binman if<br>
=C2=A0 BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN is enabled<br>
<br>
Signed-off-by: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulas=
olutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.com</a>&gt;=
<br>
---<br>
=C2=A0boot/ti-k3-r5-loader/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 13=
 +++++++++++++<br>
=C2=A0boot/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-loader.mk" rel=3D"nor=
eferrer" target=3D"_blank">ti-k3-r5-loader.mk</a> |=C2=A0 1 +<br>
=C2=A02 files changed, 14 insertions(+)<br>
<br>
diff --git a/boot/ti-k3-r5-loader/Config.in b/boot/ti-k3-r5-loader/Config.i=
n<br>
index 8c8368a1a5a8..a40eaed9467b 100644<br>
--- a/boot/ti-k3-r5-loader/Config.in<br>
+++ b/boot/ti-k3-r5-loader/Config.in<br>
@@ -93,4 +93,17 @@ config BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_CONFIG_FILE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Path to the TI K3 R5 Loader configuratio=
n file.<br>
<br>
+config BR2_TARGET_TI_K3_R5_LOADER_USE_BINMAN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;U-Boot uses binman&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_TARGET_UBOOT_NEEDS_PYLIBFDT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_PYTHON_ATTRS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_PYTHON_JSONSCHEMA_SPECI=
FICATIONS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_PYTHON_PYYAML<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_PYTHON_REFERENCING<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_HOST_PYTHON_RPDS_PY<br></blo=
ckquote><div><br></div><div>these select statements need their counterpart =
as dependencies in .mk</div><div><br></div><div>for this reason, the build =
fails with this message:</div><div>=C2=A0=C2=A0 error: command &#39;swig&#3=
9; failed: No such file or directory</div><div><br></div><div>note: the bui=
ld is successful when it starts after the build of uboot which depends on h=
ost-python-pylibfdt and host-swig</div><div><br></div><div>Fran=C3=A7ois</d=
iv><div><br></div><div>ifeq ($(BR2_TARGET_UBOOT_NEEDS_PYLIBFDT),y)=C2=A0=C2=
=A0=C2=A0 # like in <a href=3D"http://uboot.mk">uboot.mk</a><br>TI_K3_R5_LO=
ADER_DEPENDENCIES +=3D host-python-pylibfdt<br>endif<br><br>ifeq ($(BR2_TAR=
GET_TI_K3_R5_LOADER_USE_BINMAN),y)=C2=A0=C2=A0=C2=A0 # new packages<br>TI_K=
3_R5_LOADER_DEPENDENCIES +=3D \<br>=C2=A0=C2=A0=C2=A0 host-python-jsonschem=
a \<br>=C2=A0=C2=A0=C2=A0 host-python-jsonschema-specifiactions \<br>=C2=A0=
=C2=A0=C2=A0 host-python-pyyaml \<br>=C2=A0=C2=A0=C2=A0 host-python-referen=
cing \<br>=C2=A0=C2=A0=C2=A0 host-python-rpds-py<br>endif<br></div><div><br=
></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Select this option if your U-Boot versio=
n uses binman<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for building images.<br>
+<br>
=C2=A0endif<br>
diff --git a/boot/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-loader.mk" rel=
=3D"noreferrer" target=3D"_blank">ti-k3-r5-loader.mk</a> b/boot/ti-k3-r5-lo=
ader/<a href=3D"http://ti-k3-r5-loader.mk" rel=3D"noreferrer" target=3D"_bl=
ank">ti-k3-r5-loader.mk</a><br>
index 0ffcb8235f2e..d5ec8fa8ba96 100644<br>
--- a/boot/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-loader.mk" rel=3D"nor=
eferrer" target=3D"_blank">ti-k3-r5-loader.mk</a><br>
+++ b/boot/ti-k3-r5-loader/<a href=3D"http://ti-k3-r5-loader.mk" rel=3D"nor=
eferrer" target=3D"_blank">ti-k3-r5-loader.mk</a><br>
@@ -58,6 +58,7 @@ TI_K3_R5_LOADER_MAKE_OPTS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CROSS_COMPILE=3D$(HOST_DIR)/bin/arm-none-eabi- =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ARCH=3Darm \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 HOSTCC=3D&quot;$(HOSTCC) $(subst -I/,-isystem /=
,$(subst -I /,-isystem /,$(HOST_CFLAGS)))&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0BINMAN_INDIRS=3D$(BINARIES_DIR) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 HOSTLDFLAGS=3D&quot;$(HOST_LDFLAGS)&quot;<br>
<br>
=C2=A0define TI_K3_R5_LOADER_BUILD_CMDS<br>
-- <br>
2.43.0<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--00000000000008d0d1060c7da3b0--

--===============8053274048161930353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8053274048161930353==--
