Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B20C433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 00:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9A1461551;
	Tue, 30 Nov 2021 00:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0RZZw8vetdO6; Tue, 30 Nov 2021 00:52:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2550460D57;
	Tue, 30 Nov 2021 00:52:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CEC11BF989
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 00:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69ED581B25
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 00:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VW3CBktLrXjp for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 00:52:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E2B081B0A
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 00:52:04 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id m192so24985167qke.2
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 16:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=acEfMlsUhfeZA9lSXDpcGbYCz0TnJUbMNI/GoysPQRg=;
 b=Lv7qcKO6TOQJSzYTPYZ9kptnMsjCsYG3rTM70Su2sTWTRSDk5k2YsaDGOUzkMa7AUw
 C2AvWdWGwoKKn9fyeb3BB/J+ZojIZhGNKyiV84qLMT3wMV9OaA5yaZLnP6+rvd81xw19
 jsQpXR1bncnfwIJgCIzkC0U7vr8ONe9ksIRw5t9T++VC3wq1wz9mI6RlSKEJAEtST5dc
 eCPaDm2bmh6Uat8uuJCkVd8pXxdls+rC9UaebHnSHYA9dRa23RfREZr9fCvxrUg+Ud75
 rUrt99rHNaWvHMNtq01FIpq8vuyUkW1b++HQ7rkFAdzmiUMq8sWpT6fyegaNKBBRoDqf
 PVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=acEfMlsUhfeZA9lSXDpcGbYCz0TnJUbMNI/GoysPQRg=;
 b=kJvz88DXFSgBsQbbFm1inq0SR95VLz8MTW7xjjDkhP9ixfqb+JL4fbgyUGxI2z4W97
 J+SGhVafb2ir9oveT9PbrnU9a/9HQFdlfU0CSmdGzWMvoGVMHLv6bdwqKxP/piyclsSc
 akmdWYwnQ5vrZTA4ACFmfCSgtumz2/O1QSNDq2h9f0AdA+hyoWRTduOZf381u0lsj8Xx
 D9dTmFDbcZfUJzVAUL16gq2w0XytrEaCZ3Y7VY11Acvjhtqr/0UDY08q6uRMkhQRiIx0
 mgbYsZdaYzIcC4+2HQCnT7SuV8cYrlU8bDan0ohLWXlVd5Nj8aK2IMbLXWP0F5MZljvw
 Debw==
X-Gm-Message-State: AOAM531TTkW2GevAth0MKlk4sAe813Zio9oGhniLSd5Rt2j5c5AbfH8/
 X96WAQg14f8axyHM0jaXjyTh7HbhdMbbIXJkfYE=
X-Google-Smtp-Source: ABdhPJyeHsfeyWTHPHekl+uCiJOVRAIO5KYkeo2BOY/31Dv/CmS2B2L0ll59tt8RrrnMpHJk+G3buCmv7D9+87F/c0E=
X-Received: by 2002:a05:620a:2444:: with SMTP id
 h4mr41551480qkn.398.1638233522924; 
 Mon, 29 Nov 2021 16:52:02 -0800 (PST)
MIME-Version: 1.0
References: <20211116104534.18868-1-kory.maincent@bootlin.com>
In-Reply-To: <20211116104534.18868-1-kory.maincent@bootlin.com>
From: bryce.schober@gmail.com
Date: Mon, 29 Nov 2021 16:51:27 -0800
Message-ID: <CAJpxd06G+_T3MDN4hrnbYhzTYFUYx0cAAC3SJQnOa-hmxee_+A@mail.gmail.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3] package/psplash: add support for missing
 configure options
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
Cc: phil.eichinger@gmail.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7083935091032069649=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7083935091032069649==
Content-Type: multipart/alternative; boundary="000000000000316fac05d1f6f74f"

--000000000000316fac05d1f6f74f
Content-Type: text/plain; charset="UTF-8"

Bump.

<><  <><  <><
Bryce Schober


On Tue, Nov 16, 2021 at 2:46 AM Kory Maincent <kory.maincent@bootlin.com>
wrote:

> Add support to three configure options:
> --enable-startup-msg: Enable text banner output on startup
> --enable-progress-bar: Enable progress bar
> --enable-img-fullscreen: Enable the logo image in fullscreen mode
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>
> Change since v1:
> Remove the crap .config.in.swp
>
> Change since v2:
> Use both side of enable/disable configure option condition.
> Use positive options in Kconfig.
>
>
>  package/psplash/Config.in  | 17 +++++++++++++++++
>  package/psplash/psplash.mk | 18 ++++++++++++++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/package/psplash/Config.in b/package/psplash/Config.in
> index da99b264e0..edd30dcb4d 100644
> --- a/package/psplash/Config.in
> +++ b/package/psplash/Config.in
> @@ -35,6 +35,23 @@ config BR2_PACKAGE_PSPLASH_IMAGE
>           Use a personalized png image as boot splash.
>           Let it empty if you want to keep the psplash default image.
>
> +config BR2_PACKAGE_PSPLASH_FULL_SCREEN
> +       bool "use fullscreen mode"
> +       help
> +         Enable the psplash image in fullscreen mode.
> +
> +config BR2_PACKAGE_PSPLASH_STARTUP_MSG
> +       bool "enable startup message"
> +       default y
> +       help
> +         Enable text banner output on startup.
> +
> +config BR2_PACKAGE_PSPLASH_PROGRESS_BAR
> +       bool "enable progress bar"
> +       default y
> +       help
> +         Enable the management of the progress bar.
> +
>  endif
>
>  comment "psplash needs a toolchain w/ wchar"
> diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
> index 5e61f2392f..e5b212381a 100644
> --- a/package/psplash/psplash.mk
> +++ b/package/psplash/psplash.mk
> @@ -18,6 +18,24 @@ else
>  PSPLASH_CONF_OPTS += --without-systemd
>  endif
>
> +ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)
> +PSPLASH_CONF_OPTS += --enable-img-fullscreen
> +else
> +PSPLASH_CONF_OPTS += --disable-img-fullscreen
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PSPLASH_STARTUP_MSG),y)
> +PSPLASH_CONF_OPTS += --enable-startup-msg
> +else
> +PSPLASH_CONF_OPTS += --disable-startup-msg
> +endif
> +
> +ifeq ($(BR2_PACKAGE_PSPLASH_PROGRESS_BAR),y)
> +PSPLASH_CONF_OPTS += --enable-progress-bar
> +else
> +PSPLASH_CONF_OPTS += --disable-progress-bar
> +endif
> +
>  PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
>
>  ifneq ($(PSPLASH_IMAGE),)
> --
> 2.25.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000316fac05d1f6f74f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Bump.<br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmai=
l_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div =
dir=3D"ltr"><div><div><br></div><div>&lt;&gt;&lt; =C2=A0&lt;&gt;&lt; =C2=A0=
&lt;&gt;&lt;</div><div>Bryce Schober</div></div></div></div></div></div></d=
iv><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Nov 16, 2021 at 2:46 AM Kory Maincent &lt;<a href=3D"mailto:=
kory.maincent@bootlin.com">kory.maincent@bootlin.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Add support to three co=
nfigure options:<br>
--enable-startup-msg: Enable text banner output on startup<br>
--enable-progress-bar: Enable progress bar<br>
--enable-img-fullscreen: Enable the logo image in fullscreen mode<br>
<br>
Signed-off-by: Kory Maincent &lt;<a href=3D"mailto:kory.maincent@bootlin.co=
m" target=3D"_blank">kory.maincent@bootlin.com</a>&gt;<br>
---<br>
<br>
Change since v1:<br>
Remove the crap .config.in.swp<br>
<br>
Change since v2:<br>
Use both side of enable/disable configure option condition.<br>
Use positive options in Kconfig.<br>
<br>
<br>
=C2=A0package/psplash/Config.in=C2=A0 | 17 +++++++++++++++++<br>
=C2=A0package/psplash/<a href=3D"http://psplash.mk" rel=3D"noreferrer" targ=
et=3D"_blank">psplash.mk</a> | 18 ++++++++++++++++++<br>
=C2=A02 files changed, 35 insertions(+)<br>
<br>
diff --git a/package/psplash/Config.in b/package/psplash/Config.in<br>
index da99b264e0..edd30dcb4d 100644<br>
--- a/package/psplash/Config.in<br>
+++ b/package/psplash/Config.in<br>
@@ -35,6 +35,23 @@ config BR2_PACKAGE_PSPLASH_IMAGE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Use a personalized png image as boot spl=
ash.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Let it empty if you want to keep the psp=
lash default image.<br>
<br>
+config BR2_PACKAGE_PSPLASH_FULL_SCREEN<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;use fullscreen mode&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable the psplash image in fullscreen m=
ode.<br>
+<br>
+config BR2_PACKAGE_PSPLASH_STARTUP_MSG<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;enable startup message&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable text banner output on startup.<br=
>
+<br>
+config BR2_PACKAGE_PSPLASH_PROGRESS_BAR<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;enable progress bar&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0default y<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable the management of the progress ba=
r.<br>
+<br>
=C2=A0endif<br>
<br>
=C2=A0comment &quot;psplash needs a toolchain w/ wchar&quot;<br>
diff --git a/package/psplash/<a href=3D"http://psplash.mk" rel=3D"noreferre=
r" target=3D"_blank">psplash.mk</a> b/package/psplash/<a href=3D"http://psp=
lash.mk" rel=3D"noreferrer" target=3D"_blank">psplash.mk</a><br>
index 5e61f2392f..e5b212381a 100644<br>
--- a/package/psplash/<a href=3D"http://psplash.mk" rel=3D"noreferrer" targ=
et=3D"_blank">psplash.mk</a><br>
+++ b/package/psplash/<a href=3D"http://psplash.mk" rel=3D"noreferrer" targ=
et=3D"_blank">psplash.mk</a><br>
@@ -18,6 +18,24 @@ else<br>
=C2=A0PSPLASH_CONF_OPTS +=3D --without-systemd<br>
=C2=A0endif<br>
<br>
+ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)<br>
+PSPLASH_CONF_OPTS +=3D --enable-img-fullscreen<br>
+else<br>
+PSPLASH_CONF_OPTS +=3D --disable-img-fullscreen<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_PSPLASH_STARTUP_MSG),y)<br>
+PSPLASH_CONF_OPTS +=3D --enable-startup-msg<br>
+else<br>
+PSPLASH_CONF_OPTS +=3D --disable-startup-msg<br>
+endif<br>
+<br>
+ifeq ($(BR2_PACKAGE_PSPLASH_PROGRESS_BAR),y)<br>
+PSPLASH_CONF_OPTS +=3D --enable-progress-bar<br>
+else<br>
+PSPLASH_CONF_OPTS +=3D --disable-progress-bar<br>
+endif<br>
+<br>
=C2=A0PSPLASH_IMAGE =3D $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))<br>
<br>
=C2=A0ifneq ($(PSPLASH_IMAGE),)<br>
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
</blockquote></div>

--000000000000316fac05d1f6f74f--

--===============7083935091032069649==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7083935091032069649==--
