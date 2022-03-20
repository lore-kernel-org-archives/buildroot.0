Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9D2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 13:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7795481987;
	Sun, 20 Mar 2022 13:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pm7rDRhJpy_z; Sun, 20 Mar 2022 13:15:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CEB3818AC;
	Sun, 20 Mar 2022 13:15:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00A541BF3C3
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 13:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF39060BDC
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 13:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vLNRndf1J4Oe for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 13:15:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9001D60B64
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 13:15:28 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id b37so4855598uad.12
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sJitiXKcGmniovYnzkGgBIXkxaGHyV+u3XP0ESvUFhQ=;
 b=FmX2eudZ7rbkHjvHM/BdmaVSpFyn0Ho22eJ5YGLGkdDvSMlqepEUHPo6E561xK7GCT
 fl37cLf5aQ0APFN55k9PYay0P72SjTDN0nnrY4Z6Rrufgs6a2VzvMx5FGPeCCOdkhnK+
 w+MczBHZZWk6CuihQGV8gVjzrvAJhcrVcF/10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sJitiXKcGmniovYnzkGgBIXkxaGHyV+u3XP0ESvUFhQ=;
 b=rdzDi7y/hP9NHLlK44+hf6ciLxfQYFeD6P8o97i4wpXY1FC2fu/+qZin0WkjZUJP3E
 ZL47pU5HAIV9a517r2j80oHDoeWxnrVoVsKnmqpjV5FqatgUYehBTJpfYiJogZUgIQhZ
 p4G9QfWXUCxjXkRfW6TRKlLV0PSqT99Vapaqt3ulxR32onhk1fxMffD+7JymYMS+l9O1
 lBowvPKtILuHhfjY0QwgBrpyo26rV4mitMxKCNiatmmmxTK48HsUT+BcEQufRNP7K3og
 SnfrKiv5DC1xP5xsYlOgM6CU4tLNv4CV4QiQXYc73oJ6tHewaEOzap8Y+EmDT/97/YP5
 szBw==
X-Gm-Message-State: AOAM530gaOBMs50YsX8vAIcm+rBx+ez0HFLoBIZH4EJ0IUXBJhWylxPx
 TZeD0Lk6VFg9zv18FR4TVAP6caGjj5YACmoQSXH4og==
X-Google-Smtp-Source: ABdhPJwKoJE5Jys6o7cvyWS+IGklXwb5JoPQBGkBg9WDY4UqKUPksc+V5PZWz9F14pHV6V/pPEVXxAeWKcibMVBpnlo=
X-Received: by 2002:ab0:2999:0:b0:353:a9f5:1336 with SMTP id
 u25-20020ab02999000000b00353a9f51336mr4642532uap.6.1647782127356; Sun, 20 Mar
 2022 06:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220316060219.3448648-1-james.hilliard1@gmail.com>
In-Reply-To: <20220316060219.3448648-1-james.hilliard1@gmail.com>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun, 20 Mar 2022 14:14:51 +0100
Message-ID: <CA+_SqVY_6eJbnUPEmfTYNgrq9p6rdkGyaU4c6ZY0w41YWn+4Xw@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pillow: fix pkg-config
 search paths
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
Content-Type: multipart/mixed; boundary="===============7395628236159264772=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7395628236159264772==
Content-Type: multipart/alternative; boundary="0000000000005e671c05daa62c07"

--0000000000005e671c05daa62c07
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 16, 2022 at 7:02 AM James Hilliard <james.hilliard1@gmail.com>
wrote:

> Currently pillow doesn't correctly search pkg-config system paths
> for some libraries which can prevent some libraries from being
> properly detected/enabled in pillow.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>

> ---
>  ...Search-pkg-config-system-libs-cflags.patch | 33 +++++++++++++++++++
>  package/python-pillow/python-pillow.mk        | 23 +++----------
>  2 files changed, 37 insertions(+), 19 deletions(-)
>  create mode 100644
> package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
>
> diff --git
> a/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> new file mode 100644
> index 0000000000..9f979b048f
> --- /dev/null
> +++ b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch
> @@ -0,0 +1,33 @@
> +From 89c9c347bb7437d5ea559930e315f42a0236761f Mon Sep 17 00:00:00 2001
> +From: James Hilliard <james.hilliard1@gmail.com>
> +Date: Tue, 15 Mar 2022 23:31:59 -0600
> +Subject: [PATCH] Search pkg-config system libs/cflags.
> +
> +We need to search the system paths as well from pkg-config for
> +some packages to be found properly.
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +[Upstream status:
> +https://github.com/python-pillow/Pillow/pull/6138]
> +---
> + setup.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 3468b260..59d65ce2 100755
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -252,8 +252,8 @@ def _cmd_exists(cmd):
> + def _pkg_config(name):
> +     try:
> +         command = os.environ.get("PKG_CONFIG", "pkg-config")
> +-        command_libs = [command, "--libs-only-L", name]
> +-        command_cflags = [command, "--cflags-only-I", name]
> ++        command_libs = [command, "--libs-only-L", "--keep-system-libs",
> name]
> ++        command_cflags = [command, "--cflags-only-I",
> "--keep-system-cflags", name]
> +         if not DEBUG:
> +             command_libs.append("--silence-errors")
> +             command_cflags.append("--silence-errors")
> +--
> +2.35.1
> +
> diff --git a/package/python-pillow/python-pillow.mk
> b/package/python-pillow/python-pillow.mk
> index 901876e0ee..ef677855b2 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -12,7 +12,10 @@ PYTHON_PILLOW_LICENSE_FILES = LICENSE
>  PYTHON_PILLOW_CPE_ID_VENDOR = python
>  PYTHON_PILLOW_CPE_ID_PRODUCT = pillow
>  PYTHON_PILLOW_SETUP_TYPE = setuptools
> -PYTHON_PILLOW_BUILD_OPTS = --disable-platform-guessing
> +PYTHON_PILLOW_ENV = MAX_CONCURRENCY="$(PARALLEL_JOBS)"
> +
> +PYTHON_PILLOW_DEPENDENCIES = host-pkgconf
> +PYTHON_PILLOW_BUILD_OPTS = build_ext --disable-platform-guessing
>
>  ifeq ($(BR2_PACKAGE_FREETYPE),y)
>  PYTHON_PILLOW_DEPENDENCIES += freetype
> @@ -68,22 +71,4 @@ else
>  PYTHON_PILLOW_BUILD_OPTS += --disable-webp --disable-webpmux
>  endif
>
> -define PYTHON_PILLOW_BUILD_CMDS
> -       cd $(PYTHON_PILLOW_BUILDDIR); \
> -               PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> -               $(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
> -               $(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
> -               $(PYTHON_PILLOW_BASE_BUILD_OPTS)
> $(PYTHON_PILLOW_BUILD_OPTS)
> -endef
> -
> -define PYTHON_PILLOW_INSTALL_TARGET_CMDS
> -       cd $(PYTHON_PILLOW_BUILDDIR); \
> -               PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 \
> -               $(PYTHON_PILLOW_BASE_ENV) $(PYTHON_PILLOW_ENV) \
> -               $(PYTHON_PILLOW_PYTHON_INTERPRETER) setup.py build_ext \
> -               $(PYTHON_PILLOW_BUILD_OPTS) install \
> -               $(PYTHON_PILLOW_BASE_INSTALL_TARGET_OPTS) \
> -               $(PYTHON_PILLOW_INSTALL_TARGET_OPTS)
> -endef
> -
>  $(eval $(python-package))
> --
> 2.25.1
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

--0000000000005e671c05daa62c07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 16, 2022 at 7:02 AM James=
 Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com">james.hilliard1@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Currently pillow doesn&#39;t correctly search pkg-config system =
paths<br>
for some libraries which can prevent some libraries from being<br>
properly detected/enabled in pillow.<br>
<br>
Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.c=
om" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br></blockquote><di=
v>Tested-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutio=
ns.com">angelo@amarulasolutions.com</a>&gt; <br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
---<br>
=C2=A0...Search-pkg-config-system-libs-cflags.patch | 33 ++++++++++++++++++=
+<br>
=C2=A0package/python-pillow/<a href=3D"http://python-pillow.mk" rel=3D"nore=
ferrer" target=3D"_blank">python-pillow.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 23 +++----------<br>
=C2=A02 files changed, 37 insertions(+), 19 deletions(-)<br>
=C2=A0create mode 100644 package/python-pillow/0001-Search-pkg-config-syste=
m-libs-cflags.patch<br>
<br>
diff --git a/package/python-pillow/0001-Search-pkg-config-system-libs-cflag=
s.patch b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.p=
atch<br>
new file mode 100644<br>
index 0000000000..9f979b048f<br>
--- /dev/null<br>
+++ b/package/python-pillow/0001-Search-pkg-config-system-libs-cflags.patch=
<br>
@@ -0,0 +1,33 @@<br>
+From 89c9c347bb7437d5ea559930e315f42a0236761f Mon Sep 17 00:00:00 2001<br>
+From: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com" targ=
et=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
+Date: Tue, 15 Mar 2022 23:31:59 -0600<br>
+Subject: [PATCH] Search pkg-config system libs/cflags.<br>
+<br>
+We need to search the system paths as well from pkg-config for<br>
+some packages to be found properly.<br>
+<br>
+Signed-off-by: James Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.=
com" target=3D"_blank">james.hilliard1@gmail.com</a>&gt;<br>
+[Upstream status:<br>
+<a href=3D"https://github.com/python-pillow/Pillow/pull/6138" rel=3D"noref=
errer" target=3D"_blank">https://github.com/python-pillow/Pillow/pull/6138<=
/a>]<br>
+---<br>
+ setup.py | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/setup.py b/setup.py<br>
+index 3468b260..59d65ce2 100755<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -252,8 +252,8 @@ def _cmd_exists(cmd):<br>
+ def _pkg_config(name):<br>
+=C2=A0 =C2=A0 =C2=A0try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command =3D os.environ.get(&quot;PKG_CON=
FIG&quot;, &quot;pkg-config&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 command_libs =3D [command, &quot;--libs-only-=
L&quot;, name]<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 command_cflags =3D [command, &quot;--cflags-o=
nly-I&quot;, name]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 command_libs =3D [command, &quot;--libs-only-=
L&quot;, &quot;--keep-system-libs&quot;, name]<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 command_cflags =3D [command, &quot;--cflags-o=
nly-I&quot;, &quot;--keep-system-cflags&quot;, name]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not DEBUG:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command_libs.append(&quot;=
--silence-errors&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command_cflags.append(&quo=
t;--silence-errors&quot;)<br>
+-- <br>
+2.35.1<br>
+<br>
diff --git a/package/python-pillow/<a href=3D"http://python-pillow.mk" rel=
=3D"noreferrer" target=3D"_blank">python-pillow.mk</a> b/package/python-pil=
low/<a href=3D"http://python-pillow.mk" rel=3D"noreferrer" target=3D"_blank=
">python-pillow.mk</a><br>
index 901876e0ee..ef677855b2 100644<br>
--- a/package/python-pillow/<a href=3D"http://python-pillow.mk" rel=3D"nore=
ferrer" target=3D"_blank">python-pillow.mk</a><br>
+++ b/package/python-pillow/<a href=3D"http://python-pillow.mk" rel=3D"nore=
ferrer" target=3D"_blank">python-pillow.mk</a><br>
@@ -12,7 +12,10 @@ PYTHON_PILLOW_LICENSE_FILES =3D LICENSE<br>
=C2=A0PYTHON_PILLOW_CPE_ID_VENDOR =3D python<br>
=C2=A0PYTHON_PILLOW_CPE_ID_PRODUCT =3D pillow<br>
=C2=A0PYTHON_PILLOW_SETUP_TYPE =3D setuptools<br>
-PYTHON_PILLOW_BUILD_OPTS =3D --disable-platform-guessing<br>
+PYTHON_PILLOW_ENV =3D MAX_CONCURRENCY=3D&quot;$(PARALLEL_JOBS)&quot;<br>
+<br>
+PYTHON_PILLOW_DEPENDENCIES =3D host-pkgconf<br>
+PYTHON_PILLOW_BUILD_OPTS =3D build_ext --disable-platform-guessing<br>
<br>
=C2=A0ifeq ($(BR2_PACKAGE_FREETYPE),y)<br>
=C2=A0PYTHON_PILLOW_DEPENDENCIES +=3D freetype<br>
@@ -68,22 +71,4 @@ else<br>
=C2=A0PYTHON_PILLOW_BUILD_OPTS +=3D --disable-webp --disable-webpmux<br>
=C2=A0endif<br>
<br>
-define PYTHON_PILLOW_BUILD_CMDS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd $(PYTHON_PILLOW_BUILDDIR); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG_ALLOW_SY=
STEM_CFLAGS=3D1 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_BAS=
E_ENV) $(PYTHON_PILLOW_ENV) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_PYT=
HON_INTERPRETER) setup.py build_ext \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_BAS=
E_BUILD_OPTS) $(PYTHON_PILLOW_BUILD_OPTS)<br>
-endef<br>
-<br>
-define PYTHON_PILLOW_INSTALL_TARGET_CMDS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cd $(PYTHON_PILLOW_BUILDDIR); \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CONFIG_ALLOW_SY=
STEM_CFLAGS=3D1 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_BAS=
E_ENV) $(PYTHON_PILLOW_ENV) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_PYT=
HON_INTERPRETER) setup.py build_ext \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_BUI=
LD_OPTS) install \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_BAS=
E_INSTALL_TARGET_OPTS) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(PYTHON_PILLOW_INS=
TALL_TARGET_OPTS)<br>
-endef<br>
-<br>
=C2=A0$(eval $(python-package))<br>
-- <br>
2.25.1<br>
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

--0000000000005e671c05daa62c07--

--===============7395628236159264772==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7395628236159264772==--
