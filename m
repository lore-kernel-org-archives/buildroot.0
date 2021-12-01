Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A8EC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 17:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA13E41C66;
	Wed,  1 Dec 2021 17:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3gDZ_xL7EV_4; Wed,  1 Dec 2021 17:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1933141C6B;
	Wed,  1 Dec 2021 17:55:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A1B51BF2A0
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 17:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 58F3082AC6
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 17:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmNvlhhF3JkN for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 17:55:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4BFF282AB6
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 17:55:44 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id p19so24850263qtw.12
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 09:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/pEbhejOZTVBGNM0YXsVGwd73hSHcmvbnPLblAR46kI=;
 b=AuWC1FaoIhgePDwgI/PhlL4gvoLpFeSXHnvngJf84NNTcWvkLYuR1FJCi0WvJsrd5J
 DlZiheBOwI/CirIwv5LygveHF6NDh1MGGW2tqELD6Shp7jBfzE10izT4k9SPuPQWpabG
 zGrzVYy0VzFPhon7P+MjfuDoEjrVvza9oB0WkaJf7Hjo4DvT9o/3PrPW6gyZwWaXUbB0
 5vPiaqP/nRWClytI7bJbO9ekcZ5PfoTDRG1Jmc9ijMPEDXSar3ZSpq71heobC6ZoZDHG
 puHZaYJOt65+uIR3/Z61HgeKl2cDbo3CHcZ58mSw4yJc/wbYIOxM5vGHqQR9pS4vKO1W
 oGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/pEbhejOZTVBGNM0YXsVGwd73hSHcmvbnPLblAR46kI=;
 b=a3snvYwHJNq5/ixt6tHq2ficbG4brFSaG6Vy/IR7IQA2cn4yvvF08lKVHiwdnvkVMh
 rISFxv7DGHx0CdfhA3LKJRyPtX38xDLsIRoxydDricsiq6M3ivGzcxAVQyR8357MUTcq
 v/nEH+nhstAUn6bbFRa7P9BCGc2oGfr538gW0SZroZm0hAoly9/8eRAfRkTM16ohObj9
 53zyyxEcbRDRz6ibC3QKZGqU9vPfj2Ympx/uwfc9sroTEiom94/YXuNymG80hIIj9eJW
 4SA81brEPA5EAyKJMnXFxnYQ+dyuOJ/uEX7nvQuEIr5AHOPqp4g8p8PGbakqWvGuAsD5
 J2EQ==
X-Gm-Message-State: AOAM530d3mbDlQvjIO8H0u3kdEzVNB4DuJZ3w9YlfZYOBgBGcwvPfmNc
 xgTR2CauqAqMStgt1V1WVXRyPcSg4b9pasnOq3Y=
X-Google-Smtp-Source: ABdhPJwwsHYaM3/PlsQVXFy2UnCrU1/uQyai2/3outxfiPmK7j9SKb6DMnJwG/0sMWdnkxwpQa84nN9PiWFs4ipT0+A=
X-Received: by 2002:ac8:4d87:: with SMTP id a7mr8695169qtw.410.1638381342868; 
 Wed, 01 Dec 2021 09:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20211116104534.18868-1-kory.maincent@bootlin.com>
In-Reply-To: <20211116104534.18868-1-kory.maincent@bootlin.com>
From: bryce.schober@gmail.com
Date: Wed, 1 Dec 2021 09:55:06 -0800
Message-ID: <CAJpxd06GN22pCL6SFLGomaZ174D09W-c-9RdhNqpfH=wt9Eezw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8788388098682603247=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8788388098682603247==
Content-Type: multipart/alternative; boundary="000000000000f2c97d05d2196152"

--000000000000f2c97d05d2196152
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 16, 2021 at 2:46 AM Kory Maincent <kory.maincent@bootlin.com>
wrote:
>
> Add support to three configure options:
> --enable-startup-msg: Enable text banner output on startup
> --enable-progress-bar: Enable progress bar
> --enable-img-fullscreen: Enable the logo image in fullscreen mode
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Tested-by: Bryce Schober <bryce.schober@gmail.com>

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

--000000000000f2c97d05d2196152
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Nov 16, 2021 at 2:46 AM Kory Maincent &lt;<a href=
=3D"mailto:kory.maincent@bootlin.com">kory.maincent@bootlin.com</a>&gt; wro=
te:<br>&gt;<br>&gt; Add support to three configure options:<br>&gt; --enabl=
e-startup-msg: Enable text banner output on startup<br>&gt; --enable-progre=
ss-bar: Enable progress bar<br>&gt; --enable-img-fullscreen: Enable the log=
o image in fullscreen mode<br>&gt;<br>&gt; Signed-off-by: Kory Maincent &lt=
;<a href=3D"mailto:kory.maincent@bootlin.com">kory.maincent@bootlin.com</a>=
&gt;<div><div><br></div><div>Tested-by: Bryce Schober &lt;<a href=3D"mailto=
:bryce.schober@gmail.com">bryce.schober@gmail.com</a>&gt;</div><div><br>&gt=
; ---<br>&gt;<br>&gt; Change since v1:<br>&gt; Remove the crap .config.in.s=
wp<br>&gt;<br>&gt; Change since v2:<br>&gt; Use both side of enable/disable=
 configure option condition.<br>&gt; Use positive options in Kconfig.<br>&g=
t;<br>&gt;<br>&gt; =C2=A0package/psplash/Config.in =C2=A0| 17 +++++++++++++=
++++<br>&gt; =C2=A0package/psplash/<a href=3D"http://psplash.mk">psplash.mk=
</a> | 18 ++++++++++++++++++<br>&gt; =C2=A02 files changed, 35 insertions(+=
)<br>&gt;<br>&gt; diff --git a/package/psplash/Config.in b/package/psplash/=
Config.in<br>&gt; index da99b264e0..edd30dcb4d 100644<br>&gt; --- a/package=
/psplash/Config.in<br>&gt; +++ b/package/psplash/Config.in<br>&gt; @@ -35,6=
 +35,23 @@ config BR2_PACKAGE_PSPLASH_IMAGE<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Use a personalized png image as boot splash.<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Let it empty if you want to keep the psplash de=
fault image.<br>&gt;<br>&gt; +config BR2_PACKAGE_PSPLASH_FULL_SCREEN<br>&gt=
; + =C2=A0 =C2=A0 =C2=A0 bool &quot;use fullscreen mode&quot;<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 help<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable the psp=
lash image in fullscreen mode.<br>&gt; +<br>&gt; +config BR2_PACKAGE_PSPLAS=
H_STARTUP_MSG<br>&gt; + =C2=A0 =C2=A0 =C2=A0 bool &quot;enable startup mess=
age&quot;<br>&gt; + =C2=A0 =C2=A0 =C2=A0 default y<br>&gt; + =C2=A0 =C2=A0 =
=C2=A0 help<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable text banner output=
 on startup.<br>&gt; +<br>&gt; +config BR2_PACKAGE_PSPLASH_PROGRESS_BAR<br>=
&gt; + =C2=A0 =C2=A0 =C2=A0 bool &quot;enable progress bar&quot;<br>&gt; + =
=C2=A0 =C2=A0 =C2=A0 default y<br>&gt; + =C2=A0 =C2=A0 =C2=A0 help<br>&gt; =
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable the management of the progress bar.<br=
>&gt; +<br>&gt; =C2=A0endif<br>&gt;<br>&gt; =C2=A0comment &quot;psplash nee=
ds a toolchain w/ wchar&quot;<br>&gt; diff --git a/package/psplash/<a href=
=3D"http://psplash.mk">psplash.mk</a> b/package/psplash/<a href=3D"http://p=
splash.mk">psplash.mk</a><br>&gt; index 5e61f2392f..e5b212381a 100644<br>&g=
t; --- a/package/psplash/<a href=3D"http://psplash.mk">psplash.mk</a><br>&g=
t; +++ b/package/psplash/<a href=3D"http://psplash.mk">psplash.mk</a><br>&g=
t; @@ -18,6 +18,24 @@ else<br>&gt; =C2=A0PSPLASH_CONF_OPTS +=3D --without-s=
ystemd<br>&gt; =C2=A0endif<br>&gt;<br>&gt; +ifeq ($(BR2_PACKAGE_PSPLASH_FUL=
L_SCREEN),y)<br>&gt; +PSPLASH_CONF_OPTS +=3D --enable-img-fullscreen<br>&gt=
; +else<br>&gt; +PSPLASH_CONF_OPTS +=3D --disable-img-fullscreen<br>&gt; +e=
ndif<br>&gt; +<br>&gt; +ifeq ($(BR2_PACKAGE_PSPLASH_STARTUP_MSG),y)<br>&gt;=
 +PSPLASH_CONF_OPTS +=3D --enable-startup-msg<br>&gt; +else<br>&gt; +PSPLAS=
H_CONF_OPTS +=3D --disable-startup-msg<br>&gt; +endif<br>&gt; +<br>&gt; +if=
eq ($(BR2_PACKAGE_PSPLASH_PROGRESS_BAR),y)<br>&gt; +PSPLASH_CONF_OPTS +=3D =
--enable-progress-bar<br>&gt; +else<br>&gt; +PSPLASH_CONF_OPTS +=3D --disab=
le-progress-bar<br>&gt; +endif<br>&gt; +<br>&gt; =C2=A0PSPLASH_IMAGE =3D $(=
call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))<br>&gt;<br>&gt; =C2=A0ifneq ($(PS=
PLASH_IMAGE),)<br>&gt; --<br>&gt; 2.25.1<br>&gt;<br>&gt; __________________=
_____________________________<br>&gt; buildroot mailing list<br>&gt; <a hre=
f=3D"mailto:buildroot@buildroot.org">buildroot@buildroot.org</a><br>&gt; <a=
 href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot">https://li=
sts.buildroot.org/mailman/listinfo/buildroot</a></div></div></div>

--000000000000f2c97d05d2196152--

--===============8788388098682603247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8788388098682603247==--
