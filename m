Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F90AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 16:19:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDAD340B6B;
	Mon, 16 May 2022 16:19:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YzzoBDV3rAj7; Mon, 16 May 2022 16:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 758B540ADF;
	Mon, 16 May 2022 16:19:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2278C1BF362
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 16:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DAF940ADF
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 16:19:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hszq773kVKlG for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 16:19:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2604404F8
 for <buildroot@buildroot.org>; Mon, 16 May 2022 16:19:27 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ef5380669cso159065017b3.9
 for <buildroot@buildroot.org>; Mon, 16 May 2022 09:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dynonavionics.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4tyO9gOK2fe+whKAaTIMZe90B6aIUicZynrGcFtECRk=;
 b=GGP3QtkDdR8F/8sMXGrFiFYMWgEAWEuQUxJtGDkuOq1BmGxYSjcUinahs64FZEN3U1
 kihYIKJ+gQh3IGYrnmd4t6/kh2WZ+dRXf0JfVXyyT0imS0uKmnNWHkfkaomQCyEp/jiO
 JqNnLTdMfWy6Mwaj4y0PexVj2crEvM3q7pE0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tyO9gOK2fe+whKAaTIMZe90B6aIUicZynrGcFtECRk=;
 b=v5HM3Dr+o/NGKnJ4JjUceXAldxY1sINViy7GzvWMtFe3e6Hjpz81ml1tKBkdT/XYba
 HrnP18Es+xCtRhT3YJWVpqsPWhpnVqUiBQPQNkD8pRHvnIwn/CjD2OTOOWKvs+0OZVPF
 Sqr8nL/cyhFKzNBU63hT8H1qFN2EcYaZNxQvgipOaxXtwtnL3yIxwpda5bIzZNO1xDRo
 FfzQJQIKkYzE7G3WT4Z+QiTqTnzFKgfZdZh4oLBdo62ozx2ftRd2Or/+ppr6b8z3nRkZ
 QOaHwFo2Rq6HgQkj+wMcgE4l9EwN+fsb9Vg/MWZplcj4rAR7sdYIxIVQekUvr6ZZltJH
 TBRQ==
X-Gm-Message-State: AOAM533f9+Gf761t++LFRuB/rn0oOlmBoMJmm9hf7UXSMl8PlntXugsn
 ubDT2s31XuXuA/YF1e/GQq9OiDwq6oFe5hKLNXMW+A==
X-Google-Smtp-Source: ABdhPJybfRO0MBdrojOpaHXlebwUZgs+9TGkPzxeeh4HC9SLHcuW7n1UU4F2vKlOV7ISWUC6QBHS06NnGnZq2iul5Pw=
X-Received: by 2002:a81:805:0:b0:2f4:ce73:58c6 with SMTP id
 5-20020a810805000000b002f4ce7358c6mr20828436ywi.160.1652717966538; Mon, 16
 May 2022 09:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20211116104534.18868-1-kory.maincent@bootlin.com>
 <4122452e-38c1-7044-398f-81c965bce9f9@mind.be>
 <1935f55e-e2a5-1a4e-6bc2-135d8c8931cf@mind.be>
In-Reply-To: <1935f55e-e2a5-1a4e-6bc2-135d8c8931cf@mind.be>
From: David Corbeil <david.corbeil@dynonavionics.com>
Date: Mon, 16 May 2022 09:19:16 -0700
Message-ID: <CAHth+TVks46DRgjU=f7me-92yevVWQU5H8w_sYVWessx_sJHxA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, phil.eichinger@gmail.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1167867904091718966=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1167867904091718966==
Content-Type: multipart/alternative; boundary="0000000000004f503b05df23634c"

--0000000000004f503b05df23634c
Content-Type: text/plain; charset="UTF-8"

Ping

On Sat, Dec 11, 2021 at 1:55 AM Arnout Vandecappelle <arnout@mind.be> wrote:

>
> On 11/12/2021 10:51, Arnout Vandecappelle wrote:
> >
> >
> > On 16/11/2021 11:45, Kory Maincent wrote:
> >> Add support to three configure options:
> >> --enable-startup-msg: Enable text banner output on startup
> >> --enable-progress-bar: Enable progress bar
> >> --enable-img-fullscreen: Enable the logo image in fullscreen mode
>
>   I forgot to mention before: the commit message should say explicitly
> that
> startup-msg and progress-bar default to enabled, so they have the
> corresponding
> default in Config.in.
>
>
>
>   Regards,
>   Arnout
>
>
> >>
> >> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> >> ---
> >>
> >> Change since v1:
> >> Remove the crap .config.in.swp
> >>
> >> Change since v2:
> >> Use both side of enable/disable configure option condition.
> >> Use positive options in Kconfig.
> >>
> >>
> >>   package/psplash/Config.in  | 17 +++++++++++++++++
> >>   package/psplash/psplash.mk | 18 ++++++++++++++++++
> >>   2 files changed, 35 insertions(+)
> >>
> >> diff --git a/package/psplash/Config.in b/package/psplash/Config.in
> >> index da99b264e0..edd30dcb4d 100644
> >> --- a/package/psplash/Config.in
> >> +++ b/package/psplash/Config.in
> >> @@ -35,6 +35,23 @@ config BR2_PACKAGE_PSPLASH_IMAGE
> >>         Use a personalized png image as boot splash.
> >>         Let it empty if you want to keep the psplash default image.
> >>   +config BR2_PACKAGE_PSPLASH_FULL_SCREEN
> >> +    bool "use fullscreen mode"
> >> +    help
> >> +      Enable the psplash image in fullscreen mode.
> >> +
> >> +config BR2_PACKAGE_PSPLASH_STARTUP_MSG
> >> +    bool "enable startup message"
> >> +    default y
> >> +    help
> >> +      Enable text banner output on startup.
> >> +
> >> +config BR2_PACKAGE_PSPLASH_PROGRESS_BAR
> >> +    bool "enable progress bar"
> >> +    default y
> >> +    help
> >> +      Enable the management of the progress bar.
> >> +
> >>   endif
> >>     comment "psplash needs a toolchain w/ wchar"
> >> diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
> >> index 5e61f2392f..e5b212381a 100644
> >> --- a/package/psplash/psplash.mk
> >> +++ b/package/psplash/psplash.mk
> >> @@ -18,6 +18,24 @@ else
> >>   PSPLASH_CONF_OPTS += --without-systemd
> >>   endif
> >>   +ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)
> >> +PSPLASH_CONF_OPTS += --enable-img-fullscreen
> >> +else
> >> +PSPLASH_CONF_OPTS += --disable-img-fullscreen
> >
> >  Have you actually tested this?
> >
> >  I haven't, but I see this in configure.ac:
> >
> > AC_ARG_ENABLE([img-fullscreen],
> >     AS_HELP_STRING([--enable-img-fullscreen], [Enable the logo image in
> > fullscreen mode)]),
> >     [img_fullscreen=true],
> >     [img_fullscreen=false])
> > AS_IF([test x$img_fullscreen = xtrue], [
> >     EXTRA_GCC_FLAGS="$EXTRA_GCC_FLAGS -DPSPLASH_IMG_FULLSCREEN=1"
> > ])
> >
> > i.a. AC_ARG_ENABLE is used incorrectly. That means that both
> > --enable-img-fullscreen and --disable-image-fullscreen will enable the
> option
> > (because the action-if-present is img_fullscreen=true), while if nothing
> is
> > set it will be disbled.
> >
> >  Same for the other two options, but there the logic is inverted (i.e.
> it's
> > disabled if present and enabled if not).
> >
> >  I don't know if psplash is still an active project; if so, I would
> propose to
> > fix this in configure.ac and send the patch upstream. The fix is simple:
> >
> >
> > AC_ARG_ENABLE([img-fullscreen],
> >     AS_HELP_STRING([--enable-img-fullscreen], [Enable the logo image in
> > fullscreen mode)]))
> > AS_IF([test "x$enable_img_fullscreen" != "xno"], [
> >     EXTRA_GCC_FLAGS="$EXTRA_GCC_FLAGS -DPSPLASH_IMG_FULLSCREEN=1"
> > ])
> >
> >
> >  and for enable-startup-msg:
> >
> > AC_ARG_ENABLE([startup-msg],
> >     AS_HELP_STRING([--disable-startup-msg], [Disable text banner output
> on
> > startup]),
> >     [],[enable_startup_msg=yes])
> > AS_IF([test "x$enable_startup_msg" = "xno"], [
> >     EXTRA_GCC_FLAGS="$EXTRA_GCC_FLAGS -DPSPLASH_DISABLE_STARTUP_MSG"
> > ])
> >
> > (note: you have to use "no" because that is the value that is set when
> > --disable-foo is given. You shouldn't use anything else because
> > --enable-foo=no or --enable-foo=yes are also allowed).
> >
> >
> >  Regards,
> >  Arnout
> >
> >> +endif
> >> +
> >> +ifeq ($(BR2_PACKAGE_PSPLASH_STARTUP_MSG),y)
> >> +PSPLASH_CONF_OPTS += --enable-startup-msg
> >> +else
> >> +PSPLASH_CONF_OPTS += --disable-startup-msg
> >> +endif
> >> +
> >> +ifeq ($(BR2_PACKAGE_PSPLASH_PROGRESS_BAR),y)
> >> +PSPLASH_CONF_OPTS += --enable-progress-bar
> >> +else
> >> +PSPLASH_CONF_OPTS += --disable-progress-bar
> >> +endif
> >> +
> >>   PSPLASH_IMAGE = $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE))
> >>     ifneq ($(PSPLASH_IMAGE),)
> >>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>


-- 
*David Corbeil-Stroombergen*
Software development engineer
Dynon
425-402-0433 Main
www.dynon.aero <http://www.dynonavionics.com/>

--0000000000004f503b05df23634c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Dec 11, 2021 at 1:55 AM Arnout Vandecappelle &=
lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 11/12/2021 10:51, Arnout Vandecappelle wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 16/11/2021 11:45, Kory Maincent wrote:<br>
&gt;&gt; Add support to three configure options:<br>
&gt;&gt; --enable-startup-msg: Enable text banner output on startup<br>
&gt;&gt; --enable-progress-bar: Enable progress bar<br>
&gt;&gt; --enable-img-fullscreen: Enable the logo image in fullscreen mode<=
br>
<br>
=C2=A0=C2=A0I forgot to mention before: the commit message should say expli=
citly that <br>
startup-msg and progress-bar default to enabled, so they have the correspon=
ding <br>
default in Config.in.<br>
<br>
<br>
<br>
=C2=A0=C2=A0Regards,<br>
=C2=A0=C2=A0Arnout<br>
<br>
<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Kory Maincent &lt;<a href=3D"mailto:kory.maincent@b=
ootlin.com" target=3D"_blank">kory.maincent@bootlin.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; Change since v1:<br>
&gt;&gt; Remove the crap .config.in.swp<br>
&gt;&gt;<br>
&gt;&gt; Change since v2:<br>
&gt;&gt; Use both side of enable/disable configure option condition.<br>
&gt;&gt; Use positive options in Kconfig.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0 package/psplash/Config.in=C2=A0 | 17 +++++++++++++++++<br>
&gt;&gt; =C2=A0 package/psplash/<a href=3D"http://psplash.mk" rel=3D"norefe=
rrer" target=3D"_blank">psplash.mk</a> | 18 ++++++++++++++++++<br>
&gt;&gt; =C2=A0 2 files changed, 35 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/package/psplash/Config.in b/package/psplash/Config.in=
<br>
&gt;&gt; index da99b264e0..edd30dcb4d 100644<br>
&gt;&gt; --- a/package/psplash/Config.in<br>
&gt;&gt; +++ b/package/psplash/Config.in<br>
&gt;&gt; @@ -35,6 +35,23 @@ config BR2_PACKAGE_PSPLASH_IMAGE<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Use a personalized png =
image as boot splash.<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Let it empty if you wan=
t to keep the psplash default image.<br>
&gt;&gt; =C2=A0 +config BR2_PACKAGE_PSPLASH_FULL_SCREEN<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 bool &quot;use fullscreen mode&quot;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 help<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enable the psplash image in fullsc=
reen mode.<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_PSPLASH_STARTUP_MSG<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 bool &quot;enable startup message&quot;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 default y<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 help<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enable text banner output on start=
up.<br>
&gt;&gt; +<br>
&gt;&gt; +config BR2_PACKAGE_PSPLASH_PROGRESS_BAR<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 bool &quot;enable progress bar&quot;<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 default y<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0 help<br>
&gt;&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Enable the management of the progr=
ess bar.<br>
&gt;&gt; +<br>
&gt;&gt; =C2=A0 endif<br>
&gt;&gt; =C2=A0 =C2=A0 comment &quot;psplash needs a toolchain w/ wchar&quo=
t;<br>
&gt;&gt; diff --git a/package/psplash/<a href=3D"http://psplash.mk" rel=3D"=
noreferrer" target=3D"_blank">psplash.mk</a> b/package/psplash/<a href=3D"h=
ttp://psplash.mk" rel=3D"noreferrer" target=3D"_blank">psplash.mk</a><br>
&gt;&gt; index 5e61f2392f..e5b212381a 100644<br>
&gt;&gt; --- a/package/psplash/<a href=3D"http://psplash.mk" rel=3D"norefer=
rer" target=3D"_blank">psplash.mk</a><br>
&gt;&gt; +++ b/package/psplash/<a href=3D"http://psplash.mk" rel=3D"norefer=
rer" target=3D"_blank">psplash.mk</a><br>
&gt;&gt; @@ -18,6 +18,24 @@ else<br>
&gt;&gt; =C2=A0 PSPLASH_CONF_OPTS +=3D --without-systemd<br>
&gt;&gt; =C2=A0 endif<br>
&gt;&gt; =C2=A0 +ifeq ($(BR2_PACKAGE_PSPLASH_FULL_SCREEN),y)<br>
&gt;&gt; +PSPLASH_CONF_OPTS +=3D --enable-img-fullscreen<br>
&gt;&gt; +else<br>
&gt;&gt; +PSPLASH_CONF_OPTS +=3D --disable-img-fullscreen<br>
&gt;<br>
&gt; =C2=A0Have you actually tested this?<br>
&gt;<br>
&gt; =C2=A0I haven&#39;t, but I see this in <a href=3D"http://configure.ac"=
 rel=3D"noreferrer" target=3D"_blank">configure.ac</a>:<br>
&gt;<br>
&gt; AC_ARG_ENABLE([img-fullscreen],<br>
&gt; =C2=A0=C2=A0=C2=A0 AS_HELP_STRING([--enable-img-fullscreen], [Enable t=
he logo image in <br>
&gt; fullscreen mode)]),<br>
&gt; =C2=A0=C2=A0=C2=A0 [img_fullscreen=3Dtrue],<br>
&gt; =C2=A0=C2=A0=C2=A0 [img_fullscreen=3Dfalse])<br>
&gt; AS_IF([test x$img_fullscreen =3D xtrue], [<br>
&gt; =C2=A0=C2=A0=C2=A0 EXTRA_GCC_FLAGS=3D&quot;$EXTRA_GCC_FLAGS -DPSPLASH_=
IMG_FULLSCREEN=3D1&quot;<br>
&gt; ])<br>
&gt;<br>
&gt; i.a. AC_ARG_ENABLE is used incorrectly. That means that both <br>
&gt; --enable-img-fullscreen and --disable-image-fullscreen will enable the=
 option <br>
&gt; (because the action-if-present is img_fullscreen=3Dtrue), while if not=
hing is <br>
&gt; set it will be disbled.<br>
&gt;<br>
&gt; =C2=A0Same for the other two options, but there the logic is inverted =
(i.e. it&#39;s <br>
&gt; disabled if present and enabled if not).<br>
&gt;<br>
&gt; =C2=A0I don&#39;t know if psplash is still an active project; if so, I=
 would propose to <br>
&gt; fix this in <a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a> and send the patch upstream. The fix is simple=
:<br>
&gt;<br>
&gt;<br>
&gt; AC_ARG_ENABLE([img-fullscreen],<br>
&gt; =C2=A0=C2=A0=C2=A0 AS_HELP_STRING([--enable-img-fullscreen], [Enable t=
he logo image in <br>
&gt; fullscreen mode)]))<br>
&gt; AS_IF([test &quot;x$enable_img_fullscreen&quot; !=3D &quot;xno&quot;],=
 [<br>
&gt; =C2=A0=C2=A0=C2=A0 EXTRA_GCC_FLAGS=3D&quot;$EXTRA_GCC_FLAGS -DPSPLASH_=
IMG_FULLSCREEN=3D1&quot;<br>
&gt; ])<br>
&gt;<br>
&gt;<br>
&gt; =C2=A0and for enable-startup-msg:<br>
&gt;<br>
&gt; AC_ARG_ENABLE([startup-msg],<br>
&gt; =C2=A0=C2=A0=C2=A0 AS_HELP_STRING([--disable-startup-msg], [Disable te=
xt banner output on <br>
&gt; startup]),<br>
&gt; =C2=A0=C2=A0=C2=A0 [],[enable_startup_msg=3Dyes])<br>
&gt; AS_IF([test &quot;x$enable_startup_msg&quot; =3D &quot;xno&quot;], [<b=
r>
&gt; =C2=A0=C2=A0=C2=A0 EXTRA_GCC_FLAGS=3D&quot;$EXTRA_GCC_FLAGS -DPSPLASH_=
DISABLE_STARTUP_MSG&quot;<br>
&gt; ])<br>
&gt;<br>
&gt; (note: you have to use &quot;no&quot; because that is the value that i=
s set when <br>
&gt; --disable-foo is given. You shouldn&#39;t use anything else because <b=
r>
&gt; --enable-foo=3Dno or --enable-foo=3Dyes are also allowed).<br>
&gt;<br>
&gt;<br>
&gt; =C2=A0Regards,<br>
&gt; =C2=A0Arnout<br>
&gt;<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt; +ifeq ($(BR2_PACKAGE_PSPLASH_STARTUP_MSG),y)<br>
&gt;&gt; +PSPLASH_CONF_OPTS +=3D --enable-startup-msg<br>
&gt;&gt; +else<br>
&gt;&gt; +PSPLASH_CONF_OPTS +=3D --disable-startup-msg<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt; +ifeq ($(BR2_PACKAGE_PSPLASH_PROGRESS_BAR),y)<br>
&gt;&gt; +PSPLASH_CONF_OPTS +=3D --enable-progress-bar<br>
&gt;&gt; +else<br>
&gt;&gt; +PSPLASH_CONF_OPTS +=3D --disable-progress-bar<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt; =C2=A0 PSPLASH_IMAGE =3D $(call qstrip,$(BR2_PACKAGE_PSPLASH_IMAGE=
))<br>
&gt;&gt; =C2=A0 =C2=A0 ifneq ($(PSPLASH_IMAGE),)<br>
&gt;&gt;<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div><b style=
=3D"color:rgb(68,68,68);font-size:12.8px">David Corbeil-Stroombergen</b><br=
></div><font color=3D"#444444">Software development=C2=A0engineer<br></font=
></div><div dir=3D"ltr"><font color=3D"#444444">Dynon</font></div><div dir=
=3D"ltr"><span style=3D"color:rgb(68,68,68)">425-402-0433 Main</span>=C2=A0=
<font color=3D"#444444"><br></font></div><div dir=3D"ltr"><font color=3D"#4=
44444"><a href=3D"http://www.dynonavionics.com/" style=3D"color:rgb(17,85,2=
04);font-size:12.8px" target=3D"_blank">www.dynon.aero</a></font></div></di=
v></div>

--0000000000004f503b05df23634c--

--===============1167867904091718966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1167867904091718966==--
