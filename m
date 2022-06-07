Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCA6C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 15:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B91786100D;
	Tue,  7 Jun 2022 15:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id orfhS7-93Jz7; Tue,  7 Jun 2022 15:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6498A60FF3;
	Tue,  7 Jun 2022 15:01:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BC3F81BF397
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A30576100F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96e0O1iAkmEl for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 15:01:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9915060FAB
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 15:01:05 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id o7so2476567eja.1
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3oQtiiRnk0V4EQgxNX2LLm6qAzLqpYKDwRlEpFYGmgI=;
 b=agXLNwK+Fk1GB3r2VrVKEJs02q02oJ2S4xUgFjc4XE7aIsuTqdUn/BgS5MBZrrNcw3
 Dl4O9R9hSOD4MvYKfLBygxzHgD4aUgAVpIWrzvJiNXg6oCC3V5ga2BFlMECgmJN1GfT+
 jAkrQV9fDIbPjRtrn53+s0GdcDjCLym3kQoPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3oQtiiRnk0V4EQgxNX2LLm6qAzLqpYKDwRlEpFYGmgI=;
 b=rlJfPLoDJaJcvCNXOGzUCaTOxO3zqs8ZBBiMrfbbu7fYdvzukK7xwlMCPbto+5e3Iv
 TOrw/9BDw101iFzJ+xa0UuUMY3GQwTqcX/DaHQluJk26Qj3pOrwe+mig3/xHIyo9Txrr
 YRRXi0ge0ZYewLCgR2c9mfBg47Ef8f5iWeJzWLPotic2AmCifauFthV8+CWHXYJG6W2U
 YELPNxAVxZbOgJlkS8euiAjKKJwtL8UO88FyHa06E2bZCiSF3tHnChiW7X6lXnyvSNK8
 BLh8+LiFo229r7GoSmOMTDdPP8RL4eGFysstdcMzKIuhheRwja93ddTpHyonsX9k50z2
 IKFQ==
X-Gm-Message-State: AOAM532JdPDWrbW+x3TBGTvyFmxUIwVB1CQhaIMGpfSlGycgPY3hnDVe
 YnQK/FM7iklYNfI9n6E2hVS1NZgk46W1Xxqbfg1CMg==
X-Google-Smtp-Source: ABdhPJw/vOIxUVzEeEmxe0P/Lufw+YcqIKXVIwQe1B7x+iiF3upuSCgJiWPsUA22NAOCDb8nyfQmtfn+wvmjcEj67Us=
X-Received: by 2002:a17:907:1b1a:b0:703:a290:98f1 with SMTP id
 mp26-20020a1709071b1a00b00703a29098f1mr27111582ejc.418.1654614063732; Tue, 07
 Jun 2022 08:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-3-angelo@amarulasolutions.com>
 <ce3dbd69-bb72-a8ff-2ce8-e52da3133d9a@green-communications.fr>
In-Reply-To: <ce3dbd69-bb72-a8ff-2ce8-e52da3133d9a@green-communications.fr>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 7 Jun 2022 17:00:27 +0200
Message-ID: <CA+_SqVYYLqrjuYyFcOmoLd=e6Rsk+3eMVSkMNjEAMu0YF4a+eA@mail.gmail.com>
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
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
Content-Type: multipart/mixed; boundary="===============1251251982019071808=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1251251982019071808==
Content-Type: multipart/alternative; boundary="0000000000008289db05e0dcdbfd"

--0000000000008289db05e0dcdbfd
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 5:09 PM Nicolas Cavallari <
Nicolas.Cavallari@green-communications.fr> wrote:

> Hello,
>
> On 27/05/2022 12:33, Angelo Compagnucci wrote:
> > Actually, configuring a wifi interface as per "interfaces" man:
> >
> > auto wlan0
> > iface wlan0 inet dhcp
> > wpa-conf /etc/wpa_supplicant.conf
> >
> > doesn't work on buildroot because the line wpa-conf is ignored due to
> > the lack of a proper ifupdown script to handle the wpa_supplicant
> > initialization.
> >
> > The provided file is a simplified version based on the one available
> > on debian.
> >
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> > ---
> >   package/wpa_supplicant/ifupdown.sh       | 71 ++++++++++++++++++++++++
> >   package/wpa_supplicant/wpa_supplicant.mk | 10 ++++
> >   2 files changed, 81 insertions(+)
> >   create mode 100755 package/wpa_supplicant/ifupdown.sh
> >
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
>
> It is also executed for every interface regardless of if wpa-* options are
> specified or not. ifupdown works by turning all options into IF_*
> environment
> variables and running all hooks with it.
>
> Right now this hook starts wpa_supplicant on every non-lo interface.
> It probably needs a if [ -z "$IF_WPA_CONF" ]; then exit 0; fi somewhere.
> The earliest the better.
>

Not entirely sure, wpa_supplicant can be used on Ethernet interfaces too.
Better to check if the IF_WPA_CONF has a value or exit silently.


>
> > +
> > +WPA_SUP_BIN="/usr/sbin/wpa_supplicant"
> > +
> > +if [ -n "$IF_WPA_MAINT_DEBUG" ]; then
> > +     set -x
> > +fi
>
> It is really necessary to support the "wpa-maint-debug yes"
> /etc/network/interfaces option ?  This script is simple enough, unlike
> Debian's.
>

Right.


>
> > +
> > +# quit if we're called for the loopback
> > +if [ "$IFACE" = lo ]; then
> > +     exit 0
> > +fi
>
> Special-casing lo can be removed by filtering on -z IF_WPA_CONF.  Nobody
> is
> going to specify a wpa-conf on the lo interface, and if they do, they
> should
> assume the consequences.
>

Right.


>
> > +
> > +# allow wpa_supplicant interface to be specified via wpa-iface
> > +# useful for starting wpa_supplicant on one interface of a bridge
> > +if [ -n "$IF_WPA_IFACE" ]; then
> > +     WPA_IFACE="$IF_WPA_IFACE"
> > +else
> > +     WPA_IFACE="$IFACE"
> > +fi
> > +
> > +WPA_SUP_PIDFILE="/run/wpa_supplicant.${WPA_IFACE}.pid"
> > +
> > +# quit if executables are not installed
> > +if [ ! -x "$WPA_SUP_BIN" ]; then
> > +     exit 0
> > +fi
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
> $WPA_SUP_CONF_CTRL_DI > +              else
> > +                     WPA_SUP_CONF="-c $IF_WPA_CONF"
> > +             fi
> > +     else
> > +             # specify the default ctrl_interface
> > +             WPA_SUP_CONF="-C $WPA_CTRL_DIR"
> > +     fi
> > +}
>
> Debian's ifupdown script need wpa_supplicant to have a ctrl_interface
> because it
> want to use wpa_cli for all the other wpa-* options, and wpa_cli works by
> connecting to a ctrl_interface.
>
> This script does not use wpa_cli so all the ctrl_interface handling can be
> removed, unless you want to implement the other options later.
>
> By the way, "wpa-conf "managed" is mostly used with the other wpa-*
> options to
> configure the ssid/passphrase within /etc/network/interfaces, which is
> something
> your script does not support, so you can remove the first 'if'.
>

Right.


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

--0000000000008289db05e0dcdbfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 6, 2022 at 5:09 PM Nicola=
s Cavallari &lt;<a href=3D"mailto:Nicolas.Cavallari@green-communications.fr=
">Nicolas.Cavallari@green-communications.fr</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
On 27/05/2022 12:33, Angelo Compagnucci wrote:<br>
&gt; Actually, configuring a wifi interface as per &quot;interfaces&quot; m=
an:<br>
&gt; <br>
&gt; auto wlan0<br>
&gt; iface wlan0 inet dhcp<br>
&gt; wpa-conf /etc/wpa_supplicant.conf<br>
&gt; <br>
&gt; doesn&#39;t work on buildroot because the line wpa-conf is ignored due=
 to<br>
&gt; the lack of a proper ifupdown script to handle the wpa_supplicant<br>
&gt; initialization.<br>
&gt; <br>
&gt; The provided file is a simplified version based on the one available<b=
r>
&gt; on debian.<br>
&gt; <br>
&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarula=
solutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/wpa_supplicant/ifupdown.sh=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 71 ++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk=
" rel=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a> | 10 ++++<br>
&gt;=C2=A0 =C2=A02 files changed, 81 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100755 package/wpa_supplicant/ifupdown.sh<br>
&gt; <br>
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
<br>
It is also executed for every interface regardless of if wpa-* options are =
<br>
specified or not. ifupdown works by turning all options into IF_* environme=
nt <br>
variables and running all hooks with it.<br>
<br>
Right now this hook starts wpa_supplicant on every non-lo interface.<br>
It probably needs a if [ -z &quot;$IF_WPA_CONF&quot; ]; then exit 0; fi som=
ewhere.<br>
The earliest the better.<br></blockquote><div><br></div><div>Not entirely s=
ure, wpa_supplicant can be used on Ethernet interfaces too. Better to check=
 if the IF_WPA_CONF has a value or exit silently.<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +WPA_SUP_BIN=3D&quot;/usr/sbin/wpa_supplicant&quot;<br>
&gt; +<br>
&gt; +if [ -n &quot;$IF_WPA_MAINT_DEBUG&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0set -x<br>
&gt; +fi<br>
<br>
It is really necessary to support the &quot;wpa-maint-debug yes&quot; <br>
/etc/network/interfaces option ?=C2=A0 This script is simple enough, unlike=
 Debian&#39;s.<br></blockquote><div><br></div><div>Right.</div><div>=C2=A0<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +# quit if we&#39;re called for the loopback<br>
&gt; +if [ &quot;$IFACE&quot; =3D lo ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0exit 0<br>
&gt; +fi<br>
<br>
Special-casing lo can be removed by filtering on -z IF_WPA_CONF.=C2=A0 Nobo=
dy is <br>
going to specify a wpa-conf on the lo interface, and if they do, they shoul=
d <br>
assume the consequences.<br></blockquote><div><br></div><div>Right.</div><d=
iv>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +# allow wpa_supplicant interface to be specified via wpa-iface<br>
&gt; +# useful for starting wpa_supplicant on one interface of a bridge<br>
&gt; +if [ -n &quot;$IF_WPA_IFACE&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0WPA_IFACE=3D&quot;$IF_WPA_IFACE&quot;<br>
&gt; +else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0WPA_IFACE=3D&quot;$IFACE&quot;<br>
&gt; +fi<br>
&gt; +<br>
&gt; +WPA_SUP_PIDFILE=3D&quot;/run/wpa_supplicant.${WPA_IFACE}.pid&quot;<br=
>
&gt; +<br>
&gt; +# quit if executables are not installed<br>
&gt; +if [ ! -x &quot;$WPA_SUP_BIN&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0exit 0<br>
&gt; +fi<br>
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
 =C2=A0WPA_SUP_CONF=3D&quot;-c $IF_WPA_CONF -C $WPA_SUP_CONF_CTRL_DI &gt; +=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0WPA_SUP_CONF=3D&quot;-c $IF_WPA_CONF&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# specify the default=
 ctrl_interface<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WPA_SUP_CONF=3D&quot;=
-C $WPA_CTRL_DIR&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +}<br>
<br>
Debian&#39;s ifupdown script need wpa_supplicant to have a ctrl_interface b=
ecause it <br>
want to use wpa_cli for all the other wpa-* options, and wpa_cli works by <=
br>
connecting to a ctrl_interface.<br>
<br>
This script does not use wpa_cli so all the ctrl_interface handling can be =
<br>
removed, unless you want to implement the other options later.<br>
<br>
By the way, &quot;wpa-conf &quot;managed&quot; is mostly used with the othe=
r wpa-* options to <br>
configure the ssid/passphrase within /etc/network/interfaces, which is some=
thing <br>
your script does not support, so you can remove the first &#39;if&#39;.<br>=
</blockquote><div><br></div><div>Right. <br></div></div><br clear=3D"all"><=
br>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-weight:400;font-style:normal;font-variant:normal;text-de=
coration:none;vertical-align:baseline;white-space:pre-wrap"></span><span st=
yle=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-weight:500;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Angelo=
 Compagnucci</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubunt=
u Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;font-w=
eight:400;font-style:normal;font-variant:normal;text-decoration:none;vertic=
al-align:baseline;white-space:pre-wrap">Software Engineer</span></p><p dir=
=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span s=
tyle=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:=
rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;f=
ont-variant:normal;text-decoration:none;vertical-align:baseline;white-space=
:pre-wrap"><a href=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank"=
>angelo@amarulasolutions.com</a>=C2=A0<br></span><span style=3D"font-size:1=
0pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(241,194,50);bac=
kground-color:transparent;font-weight:400;font-style:normal;font-variant:no=
rmal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">___=
_______________________________</span><span style=3D"font-size:10pt;font-fa=
mily:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span st=
yle=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);backgr=
ound-color:transparent;font-weight:500;font-style:normal;font-variant:norma=
l;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">Amarul=
a Solutions SRL</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ub=
untu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;fon=
t-weight:400;font-style:normal;font-variant:normal;text-decoration:none;ver=
tical-align:baseline;white-space:pre-wrap">Via le Canevare 30, 31100 Trevis=
o, Veneto, IT</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubun=
tu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;font-=
weight:400;font-style:normal;font-variant:normal;text-decoration:none;verti=
cal-align:baseline;white-space:pre-wrap">T. +39 (0)42 243 5310</span><span =
style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color=
:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:&quot;Ubun=
tu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;font-=
weight:400;font-style:normal;font-variant:normal;text-decoration:none;verti=
cal-align:baseline;white-space:pre-wrap"><a href=3D"mailto:info@amarulasolu=
tions.com" target=3D"_blank">info@amarulasolutions.com</a></span></p><p dir=
=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><a href=
=3D"http://www.amarulasolutions.com/" style=3D"text-decoration:none" target=
=3D"_blank"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quo=
t;,monospace;color:rgb(0,0,0);background-color:transparent;font-weight:400;=
font-style:normal;font-variant:normal;text-decoration:none;vertical-align:b=
aseline;white-space:pre-wrap">www.amarulasolutions.com</span></a></p><div>[=
`as] <a href=3D"https://www.amarulasolutions.com" target=3D"_blank">https:/=
/www.amarulasolutions.com</a>|</div></div></div></div>

--0000000000008289db05e0dcdbfd--

--===============1251251982019071808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1251251982019071808==--
