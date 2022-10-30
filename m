Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AC6ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84A7E4014D;
	Sun, 30 Oct 2022 20:55:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84A7E4014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r_3cHb8uERE0; Sun, 30 Oct 2022 20:55:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65116400FD;
	Sun, 30 Oct 2022 20:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65116400FD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 976AF1BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CCD9402B5
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CCD9402B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QMJlvB-2J7sh for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:55:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD8FA401A2
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD8FA401A2
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:55:39 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id g10so11223173oif.10
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 13:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZClqMTOCDo1vaZoYiHNPeDV4R0+ipepRYafkjLXo4f4=;
 b=x8p/J26ybh5Dzgcms3kNQlTOmHGbEmW44yW4GQO67GQKb6tGbVRn9EdUHdEmXwtI9Y
 jOnfC8NPC157ZVvWGU5R7OHBOrgVry/vXkZoSvGVNMB6g7Zs8zZ4nCzi5XSfFl/Rpk7b
 XxAhojs+xxt3jI9lC9h7s8jJx0twyjU09ZwQ0jDwam2Zf5vsfPSdPqgyngofyUu8QAS6
 +GrMwa/pMOKXrI65h9c4QU4sMy1iwODYBoPfUTkdZ0rJzW5ci/P7ZpgHxR+1OjP85aFq
 KTHfsQ2txAQi6r8oUmhst95f11OtD3BEowOVBY8wZ4ntW04Nh8kw43IJdjCcnCJTJ2UV
 bSlQ==
X-Gm-Message-State: ACrzQf3ppr1YYnGSMeKTatnZ7uA2ERIAZCGrwI7AhWCvdX9biMYhefKS
 vXJs5l8x1tJ+GYW5KKg1YjVenuemz6G+O3elv9o1vveTzPQ=
X-Google-Smtp-Source: AMsMyM6r2TXj0HTNtS0sCssIHDvEFlr3Qin//FTGAewNEaqU5hzmFzqYRfCdmUlHidPL/zQFnYa8uYbX3eYG30n9pik=
X-Received: by 2002:a05:6808:120c:b0:351:6d17:1845 with SMTP id
 a12-20020a056808120c00b003516d171845mr5154700oil.254.1667163338905; Sun, 30
 Oct 2022 13:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221014065900.3311604-1-angelo@amarulasolutions.com>
 <20221014065900.3311604-4-angelo@amarulasolutions.com>
 <20221030214809.1fa5997c@windsurf>
In-Reply-To: <20221030214809.1fa5997c@windsurf>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun, 30 Oct 2022 21:55:10 +0100
Message-ID: <CA+_SqVZvmi+iVGF=ig6ct4fbygRaL63KwJ-AQzCL1piTixgQVQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZClqMTOCDo1vaZoYiHNPeDV4R0+ipepRYafkjLXo4f4=;
 b=jfK+ODqgw2ka2A/hlIi7MnS/LJqJZczwQLmvLq0XK/8ZH5w4cvtzvzS6h5ofK1lty9
 Vq/USj5oQrarCVOjmthxnmpWfjlTyrNwAy5gWBmHstGNzRgd9LELz7tM61qpceuIi93J
 UNJ3k/tN8M0+meqIPsMy9x+fi5/Ja36nEWuqA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jfK+ODqg
Subject: Re: [Buildroot] [PATCH v2 3/5] ackage/rtl8723ds-bt: new package
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
Content-Type: multipart/mixed; boundary="===============7209255693898614710=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7209255693898614710==
Content-Type: multipart/alternative; boundary="000000000000992de805ec46b617"

--000000000000992de805ec46b617
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 30, 2022 at 9:48 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Fri, 14 Oct 2022 08:58:58 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > @@ -78,7 +78,8 @@ LINUX_DEPENDENCIES += \
> >       $(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-microcode) \
> >       $(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-firmware) \
> >       $(if $(BR2_PACKAGE_FIRMWARE_IMX),firmware-imx) \
> > -     $(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb)
> > +     $(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb) \
> > +     $(if $(BR2_PACKAGE_RTL8723DS_BT),rtl8723ds-bt)
> >
> >  # Starting with 4.16, the generated kconfig paser code is no longer
> >  # shipped with the kernel sources, so we need flex and bison, but
> > diff --git a/package/Config.in b/package/Config.in
> > index e3a34d6e97..4f6e508106 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -578,6 +578,7 @@ endmenu
> >       source "package/rtl8189fs/Config.in"
> >       source "package/rtl8723bu/Config.in"
> >       source "package/rtl8723ds/Config.in"
> > +     source "package/rtl8723ds-bt/Config.in"
> >       source "package/rtl8812au-aircrack-ng/Config.in"
> >       source "package/rtl8821au/Config.in"
> >       source "package/sane-backends/Config.in"
> > diff --git a/package/rtl8723ds-bt/Config.in
> b/package/rtl8723ds-bt/Config.in
> > new file mode 100644
> > index 0000000000..ab4ba0bf11
> > --- /dev/null
> > +++ b/package/rtl8723ds-bt/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_RTL8723DS_BT
> > +     bool "rtl8723ds-bt"
> > +     help
> > +       rtl8723ds UART attached Bluetooth driver
>
> So here you're saying this package is for a driver.
>
> > +define RTL8723DS_BT_LINUX_CONFIG_FIXUPS
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_SERIAL_DEV_BUS)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_SERIAL_DEV_CTRL_TTYPORT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_BT)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_BT_HCIUART)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_BT_HCIUART_3WIRE)
> > +     $(call KCONFIG_ENABLE_OPT,CONFIG_BT_HCIUART_RTL)
> > +     $(call
> KCONFIG_APPEND_OPT,CONFIG_EXTRA_FIRMWARE,rtl_bt/rtl8723ds_fw.bin
> rtl_bt/rtl8723ds_config.bin)
> > +endef
> > +
> > +define RTL8723DS_BT_INSTALL_STAGING_CMDS
> > +     mkdir -p $(STAGING_DIR)/lib/firmware/rtl_bt/
> > +     cp $(@D)/8723D/rtl8723d_fw
> $(STAGING_DIR)/lib/firmware/rtl_bt/rtl8723ds_fw.bin
> > +     cp $(@D)/8723D/rtl8723d_config
> $(STAGING_DIR)/lib/firmware/rtl_bt/rtl8723ds_config.bin
>
> But here you are only installing the firmware file, and you're not
> building the kernel module that is provided in this Git repository.
>
> Is it because the driver is in the upstream kernel, and the only part
> that it lacks is the firmware?
>
> This is not really clear in your commit log nor in the Config.in help
> text.
>

Thi package "enables" (as in the commit log) the module, I didn't want to
word differently, because what we are really doing here is simply enabling
some kernel drivers and offering a way to download the firmware. Anyway, I
will reword it better.


>
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

--000000000000992de805ec46b617
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 30, 2022 at 9:48 PM Thoma=
s Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.peta=
zzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Fri, 14 Oct 2022 08:58:58 +0200<br>
Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.com" targe=
t=3D"_blank">angelo@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; @@ -78,7 +78,8 @@ LINUX_DEPENDENCIES +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_INTEL_MICROCODE),intel-mi=
crocode) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_LINUX_FIRMWARE),linux-fir=
mware) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_FIRMWARE_IMX),firmware-im=
x) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_WIRELESS_REGDB),wireless-regdb=
) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_RTL8723DS_BT),rtl8723ds-bt)<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Starting with 4.16, the generated kconfig paser code is no lon=
ger<br>
&gt;=C2=A0 # shipped with the kernel sources, so we need flex and bison, bu=
t<br>
&gt; diff --git a/package/Config.in b/package/Config.in<br>
&gt; index e3a34d6e97..4f6e508106 100644<br>
&gt; --- a/package/Config.in<br>
&gt; +++ b/package/Config.in<br>
&gt; @@ -578,6 +578,7 @@ endmenu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/rtl8189fs/Config.in&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/rtl8723bu/Config.in&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/rtl8723ds/Config.in&quo=
t;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0source &quot;package/rtl8723ds-bt/Config.in&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/rtl8812au-aircrack-ng/C=
onfig.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/rtl8821au/Config.in&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/sane-backends/Config.in=
&quot;<br>
&gt; diff --git a/package/rtl8723ds-bt/Config.in b/package/rtl8723ds-bt/Con=
fig.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ab4ba0bf11<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/rtl8723ds-bt/Config.in<br>
&gt; @@ -0,0 +1,6 @@<br>
&gt; +config BR2_PACKAGE_RTL8723DS_BT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;rtl8723ds-bt&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rtl8723ds UART attached Bluetooth driver<b=
r>
<br>
So here you&#39;re saying this package is for a driver.<br>
<br>
&gt; +define RTL8723DS_BT_LINUX_CONFIG_FIXUPS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_SERIAL_DEV_BUS)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_SERIAL_DEV_CTRL_=
TTYPORT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_BT)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_BT_HCIUART)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_BT_HCIUART_3WIRE=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_BT_HCIUART_RTL)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_APPEND_OPT,CONFIG_EXTRA_FIRMWARE,r=
tl_bt/rtl8723ds_fw.bin rtl_bt/rtl8723ds_config.bin)<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define RTL8723DS_BT_INSTALL_STAGING_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mkdir -p $(STAGING_DIR)/lib/firmware/rtl_bt/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp $(@D)/8723D/rtl8723d_fw $(STAGING_DIR)/lib/fir=
mware/rtl_bt/rtl8723ds_fw.bin<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cp $(@D)/8723D/rtl8723d_config $(STAGING_DIR)/lib=
/firmware/rtl_bt/rtl8723ds_config.bin<br>
<br>
But here you are only installing the firmware file, and you&#39;re not<br>
building the kernel module that is provided in this Git repository.<br>
<br>
Is it because the driver is in the upstream kernel, and the only part<br>
that it lacks is the firmware?<br>
<br>
This is not really clear in your commit log nor in the Config.in help<br>
text.<br></blockquote><div><br></div><div>Thi package &quot;enables&quot; (=
as in the commit log) the module, I didn&#39;t want to word differently, be=
cause what we are really doing here is simply enabling some kernel drivers =
and offering a way to download the firmware. Anyway, I will reword it bette=
r.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
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

--000000000000992de805ec46b617--

--===============7209255693898614710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7209255693898614710==--
