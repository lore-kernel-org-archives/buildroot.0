Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B72C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 22:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB50C83365;
	Wed,  1 Jun 2022 22:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YdCZpZR_m5lv; Wed,  1 Jun 2022 22:07:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A722B8333E;
	Wed,  1 Jun 2022 22:07:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3F411BF282
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 22:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2EBE60B2D
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 22:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBmYJArDcW36 for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 22:07:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A51E60A6D
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 22:07:18 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id er5so3950880edb.12
 for <buildroot@buildroot.org>; Wed, 01 Jun 2022 15:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U3YCHwd4DCU6JcuWcdORv5p/eMYs9j4XZEnyIEeL7zw=;
 b=DVM+MvJES/XdZC9U3owmq+z0cLMfNcqEu28Fu7z6M61TvsadePvOEzEzvD6FuHNM6E
 iCOHCrfJoEjWlSWFKDAv26Mr030mse/p0TUHlYjwmyUfOnKDp2ZzJYrhztdmQk0DWqpJ
 Kenq2pdd4JqLK4ENzIjXSeptNbb3qId0dfoo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U3YCHwd4DCU6JcuWcdORv5p/eMYs9j4XZEnyIEeL7zw=;
 b=sec4iBI82ouLvXQ86G0fgo77H9PpJtSI8iG+6jvsruW1v6EYGjHiIrDRRtPV412seq
 0C7ZlYAyk8E0H9kEKHGn2hlF+Y+INLrVXH/I/Aqf6mDuUWq+rjBKaudUaOv93URKNN4z
 FzsyV725LBP+n/JfZi8EGP+Y26GIkqZXmeARi7rHny2Rjz30S7uwdaTkA0wTl6GD+cE6
 x8g9lQSDXLPq7BW+KBYp5kMYEpTi5eeAIeEx1R/kZO0xo5p/uH0qRs5M7AnzvcjaRxZM
 F/Xprww9MmJ0cE5TcrfersnRbGRzid7dEZEGZJLGV1qjjcDJ5HV9mtaF7g45c0oHQssw
 i/0w==
X-Gm-Message-State: AOAM531HDhlLeHgT5bSEzGCtf6E8BYAgEIwO7y0ZvVRIHvNrPqHVSVTY
 AxAEQs9gorRyXFkSsE8Jnm629p3Ox4MThtNeLSFfM7WHcOHD4A==
X-Google-Smtp-Source: ABdhPJx8Q8+xkBN5lxKQYVnTRH9cyQwZEFGIKzC3ipz9rZxceYabapHp2kodfdQRbrAuJAS6A6hm1eDD1UXemnwshhA=
X-Received: by 2002:a05:6402:520e:b0:42b:360b:78e1 with SMTP id
 s14-20020a056402520e00b0042b360b78e1mr2116060edd.186.1654121236585; Wed, 01
 Jun 2022 15:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-3-angelo@amarulasolutions.com>
 <20220601212552.479542be@windsurf>
In-Reply-To: <20220601212552.479542be@windsurf>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Thu, 2 Jun 2022 00:06:40 +0200
Message-ID: <CA+_SqVY0JQbjAw9hM5Nym9AwB0_9TEd8NtfqLDa+pM03JA=ogg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 2/4] package/wpa_supplicant: adding ifupdown
 support
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
Cc: jagan@amarulasolutions.com, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3793964665506049470=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3793964665506049470==
Content-Type: multipart/alternative; boundary="000000000000b8f5f805e06a1cdf"

--000000000000b8f5f805e06a1cdf
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 1, 2022 at 9:25 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Fri, 27 May 2022 12:33:33 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > Actually, configuring a wifi interface as per "interfaces" man:
> >
> > auto wlan0
> > iface wlan0 inet dhcp
> > wpa-conf /etc/wpa_supplicant.conf
>
> Do you have a link to an interfaces manpage that documents wpa-conf?
>

Not really, I had a look at the source code for busybox and general
debian/ifupdown documentation. The better info I could find is this
stackoverflow page
https://unix.stackexchange.com/questions/262094/where-is-wpa-conf-documented


> Is this supported by the Busybox ifupdown?
>

Yes it is.


>
> > diff --git a/package/wpa_supplicant/ifupdown.sh
> b/package/wpa_supplicant/ifupdown.sh
> > new file mode 100755
> > index 0000000000..8eecf73436
> > --- /dev/null
> > +++ b/package/wpa_supplicant/ifupdown.sh
> > @@ -0,0 +1,71 @@
> > +#!/bin/sh
> > +
> > +# This file is executed by ifupdown in pre-up, post-up, pre-down and
> > +# post-down phases of network interface configuration.
> > +
> > +WPA_SUP_BIN="/usr/sbin/wpa_supplicant"
> > +
> > +if [ -n "$IF_WPA_MAINT_DEBUG" ]; then
> > +     set -x
> > +fi
>
> Where is IF_WPA_MAINT_DEBUG supposed to be defined?
>

In your console before running the script manually if you need to debug it.

> +# allow wpa_supplicant interface to be specified via wpa-iface
> > +# useful for starting wpa_supplicant on one interface of a bridge
> > +if [ -n "$IF_WPA_IFACE" ]; then
> > +     WPA_IFACE="$IF_WPA_IFACE"
> > +else
> > +     WPA_IFACE="$IFACE"
> > +fi
>
> I'm curious to understand how wpa-iface ends up in IP_WPA_IFACE. I
> guess I'm missing a piece of the puzzla.
>

If you add an "echo $@" at the beginning of the script, you could see that
when "wpa-conf" option is defined, those variables are injected into the
environment by busybox while calling the ifup/ifdown scripts.


>
> > +WPA_SUP_PIDFILE="/run/wpa_supplicant.${WPA_IFACE}.pid"
> > +
> > +# quit if executables are not installed
> > +if [ ! -x "$WPA_SUP_BIN" ]; then
> > +     exit 0
> > +fi
>
> This can be removed in the context of Buildroot. We tend to not check
> for the installation of executables from the same package, as it's
> quite useless.
>

Fair enough.


> > +
> > +do_start () {
> > +     if [ -n "$IF_WPA_CONF" ] && [ "$IF_WPA_CONF" != "managed" ]; then
> > +             if [ ! -s "$IF_WPA_CONF" ]; then
> > +                     echo "cannot read contents of $IF_WPA_CONF"
> > +                     exit 1
> > +             fi
> > +             WPA_SUP_CONF_CTRL_DIR=$(sed -n -e 's/[[:space:]]*#.*//g'
> -e 's/[[:space:]]\+.*$//g' \
> > +                     -e 's/^ctrl_interface=\(DIR=\)\?\(.*\)/\2/p'
> "$IF_WPA_CONF")
> > +             if [ -n "$WPA_SUP_CONF_CTRL_DIR" ]; then
> > +                     WPA_SUP_CONF="-c $IF_WPA_CONF -C
> $WPA_SUP_CONF_CTRL_DIR"
>
> The manpage of wpa_supplicant says:
>
>        -C ctrl_interface
>               Path to ctrl_interface socket (Per interface. Only used if
> -c is not).
>
> so passing -C when -c is passed does not make sense. Or am I missing
> something?
>

Not entirely sure, need to check on this.  From my testing, that is working
fine. Let me review that.


> > +             else
> > +                     WPA_SUP_CONF="-c $IF_WPA_CONF"
> > +             fi
> > +     else
> > +             # specify the default ctrl_interface
> > +             WPA_SUP_CONF="-C $WPA_CTRL_DIR"
>
> How is WPA_CTRL_DIR defined?
>

It should be injected too, but I'll do a recheck to be completely sure.


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
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

--000000000000b8f5f805e06a1cdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 1, 2022 at 9:25 PM Thomas=
 Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petaz=
zoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hello,<br>
<br>
On Fri, 27 May 2022 12:33:33 +0200<br>
Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.com" targe=
t=3D"_blank">angelo@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; Actually, configuring a wifi interface as per &quot;interfaces&quot; m=
an:<br>
&gt; <br>
&gt; auto wlan0<br>
&gt; iface wlan0 inet dhcp<br>
&gt; wpa-conf /etc/wpa_supplicant.conf<br>
<br>
Do you have a link to an interfaces manpage that documents wpa-conf?<br></b=
lockquote><div><br></div><div>Not really, I had a look at the source code f=
or busybox and general debian/ifupdown documentation. The better info I cou=
ld find is this stackoverflow page</div><div><a href=3D"https://unix.stacke=
xchange.com/questions/262094/where-is-wpa-conf-documented">https://unix.sta=
ckexchange.com/questions/262094/where-is-wpa-conf-documented</a> <br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Is this supported by the Busybox ifupdown?<br></blockquote><div><br></div><=
div>Yes it is.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
&gt; diff --git a/package/wpa_supplicant/ifupdown.sh b/package/wpa_supplica=
nt/ifupdown.sh<br>
&gt; new file mode 100755<br>
&gt; index 0000000000..8eecf73436<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/wpa_supplicant/ifupdown.sh<br>
&gt; @@ -0,0 +1,71 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +# This file is executed by ifupdown in pre-up, post-up, pre-down and<=
br>
&gt; +# post-down phases of network interface configuration.<br>
&gt; +<br>
&gt; +WPA_SUP_BIN=3D&quot;/usr/sbin/wpa_supplicant&quot;<br>
&gt; +<br>
&gt; +if [ -n &quot;$IF_WPA_MAINT_DEBUG&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0set -x<br>
&gt; +fi<br>
<br>
Where is IF_WPA_MAINT_DEBUG supposed to be defined?<br></blockquote><div><b=
r></div><div>In your console before running the script manually if you need=
 to debug it. <br></div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
&gt; +# allow wpa_supplicant interface to be specified via wpa-iface<br>
&gt; +# useful for starting wpa_supplicant on one interface of a bridge<br>
&gt; +if [ -n &quot;$IF_WPA_IFACE&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0WPA_IFACE=3D&quot;$IF_WPA_IFACE&quot;<br>
&gt; +else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0WPA_IFACE=3D&quot;$IFACE&quot;<br>
&gt; +fi<br>
<br>
I&#39;m curious to understand how wpa-iface ends up in IP_WPA_IFACE. I<br>
guess I&#39;m missing a piece of the puzzla.<br></blockquote><div><br></div=
><div>If you add an &quot;echo $@&quot; at the beginning of the script, you=
 could see that when &quot;wpa-conf&quot; option is defined, those variable=
s are injected into the environment by busybox while calling the ifup/ifdow=
n scripts.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
&gt; +WPA_SUP_PIDFILE=3D&quot;/run/wpa_supplicant.${WPA_IFACE}.pid&quot;<br=
>
&gt; +<br>
&gt; +# quit if executables are not installed<br>
&gt; +if [ ! -x &quot;$WPA_SUP_BIN&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0exit 0<br>
&gt; +fi<br>
<br>
This can be removed in the context of Buildroot. We tend to not check<br>
for the installation of executables from the same package, as it&#39;s<br>
quite useless.<br></blockquote><div><br></div><div>Fair enough. <br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +do_start () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ -n &quot;$IF_WPA_CONF&quot; ] &amp;&amp; [ &=
quot;$IF_WPA_CONF&quot; !=3D &quot;managed&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -s &quot;$IF_W=
PA_CONF&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0echo &quot;cannot read contents of $IF_WPA_CONF&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0exit 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WPA_SUP_CONF_CTRL_DIR=
=3D$(sed -n -e &#39;s/[[:space:]]*#.*//g&#39; -e &#39;s/[[:space:]]\+.*$//g=
&#39; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0-e &#39;s/^ctrl_interface=3D\(DIR=3D\)\?\(.*\)/\2/p&#39; &quot;$IF_W=
PA_CONF&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -n &quot;$WPA_SU=
P_CONF_CTRL_DIR&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0WPA_SUP_CONF=3D&quot;-c $IF_WPA_CONF -C $WPA_SUP_CONF_CTRL_DIR&quot;=
<br>
<br>
The manpage of wpa_supplicant says:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0-C ctrl_interface<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Path to ctrl_interface soc=
ket (Per interface. Only used if -c is not).<br>
<br>
so passing -C when -c is passed does not make sense. Or am I missing<br>
something?<br></blockquote><div><br></div><div>Not entirely sure, need to c=
heck on this.=C2=A0 From my testing, that is working fine. Let me review th=
at.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0WPA_SUP_CONF=3D&quot;-c $IF_WPA_CONF&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# specify the default=
 ctrl_interface<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WPA_SUP_CONF=3D&quot;=
-C $WPA_CTRL_DIR&quot;<br>
<br>
How is WPA_CTRL_DIR defined?<br></blockquote><div><br></div><div>It should =
be injected too, but I&#39;ll do a recheck to be completely sure.</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
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

--000000000000b8f5f805e06a1cdf--

--===============3793964665506049470==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3793964665506049470==--
