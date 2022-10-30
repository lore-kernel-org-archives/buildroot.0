Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85106ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 20:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C6F38128B;
	Sun, 30 Oct 2022 20:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C6F38128B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8qXzXDQle9ut; Sun, 30 Oct 2022 20:53:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4572881284;
	Sun, 30 Oct 2022 20:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4572881284
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB9E81BF387
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3B92608A5
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 20:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3B92608A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJ1i7rSj2Xcn for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 20:53:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92A2060803
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92A2060803
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 20:53:09 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id r76so4705607oie.13
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 13:53:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bKrhlZif6bJgsbpWrtxLKc8iI4Pufseu6rPGpOx53jc=;
 b=uCw7KrOVXCpYRcC2O15+eSs2n8a2YYHIkQ+TnJXPbuYpK5LmfwE/V+GG+PnbY6lZaU
 Twska43PTKgeFOXNvY4zNgEav+jq3aJu6zbW/K9J5qNzMJWfKrlyYtf2sgo7X8yNy5gc
 NPTfkuMoCGEePnTfiTbzEFNm/cGYm4bYNGiUmPaV9l/TGlHkBkHD3R3t7wbU9hcOlk0+
 NzihR+dD/cvVBvha7R4Bysz+Xcpel7F8EFYUuF98+LeLIvj59ekTI+QLMJhcfmnMZjQy
 pMWjLQCsE/+caBi8oNnjwWo+kyWGnJuGAB7XhKo3xl36tIC8WL3l/pwoHVNirgz+H1sm
 qZNQ==
X-Gm-Message-State: ACrzQf0sjYoy2BiOCpN7ZiO905jro0RS3wzV9tbh6/tPoIPbbhKuT3sv
 f6xdQzIWOEsNJ+hhW64grLsfA3uZCyVa1QjWIPQ6ATYXw/g=
X-Google-Smtp-Source: AMsMyM7aAL2J5O/Z03lws/H5c7AKO3lEwz/DDFF6ypBSQxfh10S5PWsNfuxBt0sgQ6X5/yK9N8zXa15arXnencJFmuk=
X-Received: by 2002:a05:6808:120c:b0:351:6d17:1845 with SMTP id
 a12-20020a056808120c00b003516d171845mr5151541oil.254.1667163188521; Sun, 30
 Oct 2022 13:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221014065900.3311604-1-angelo@amarulasolutions.com>
 <20221014065900.3311604-2-angelo@amarulasolutions.com>
 <20221030214300.629c8f7b@windsurf>
In-Reply-To: <20221030214300.629c8f7b@windsurf>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sun, 30 Oct 2022 21:52:40 +0100
Message-ID: <CA+_SqVa0Zy8tesA+Aj_7+HwQFd0b0NP_5=iatEqF1mt55ogbKg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bKrhlZif6bJgsbpWrtxLKc8iI4Pufseu6rPGpOx53jc=;
 b=fog3cXc3wL362rdhKGJW7dvfPA4uBOxv8ZBg25sh/nKzvLhGnijaoqKT+fHg4ifFG+
 3dAIbn6gDlZiq/nbTqa/qd9TnreYs4Q1YSIPjqZqk4mBw9gndvfA/gyQnTaUw4R+8eBa
 JeG8GD6onLtC/GuPmFtbWklHCbkTP+LZd/rLA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fog3cXc3
Subject: Re: [Buildroot] [PATCH v2 1/5] linux: enable
 CONFIG_EXTRA_FIRMWARE_DIR
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
Content-Type: multipart/mixed; boundary="===============3694693018604627315=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3694693018604627315==
Content-Type: multipart/alternative; boundary="000000000000a281dd05ec46adce"

--000000000000a281dd05ec46adce
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 30, 2022 at 9:43 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Fri, 14 Oct 2022 08:58:56 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > +     # The kernel CONFIG_EXTRA_FIRMWARE feature requires to have the
> firmware full
> > +     # path for locating firmware file.
> > +     $(call
> KCONFIG_SET_OPT,CONFIG_EXTRA_FIRMWARE_DIR,"$(STAGING_DIR)/lib/firmware")
>
> Unfortunately, this is really not a good idea, especially if it is
> meant to be used with your rtl8723ds-bt package. Indeed, the
> rtl8723ds-bt firmware is according to your package under a PROPRIETARY
> license, so not compatible with the GPL.
>

Let's suppose the firware I was planning to load permits to be distributed
within the kernk, why it isn't a good idea?
I don't think technically there is some problems here, else let me
understand.


> Except that CONFIG_EXTRA_FIRMWARE_DIR can only be used for firmware
> that is GPL-compatible, as they get linked into the kernel image. What
> you're proposing to do makes it illegal to distribute the resulting
> kernel image. You can do it on your machine, but you're not allowed to
> distribute this kernel image, which for something like Buildroot is a
> bit of a problem, as you can imagine.
>
> See
>
> https://elixir.bootlin.com/linux/latest/source/Documentation/driver-api/firmware/built-in-fw.rst#L21


I don't really want to go down the rabbit hole of what is legal or not,
there are legal departments for that.
If you think the driver in question is not accptable, I'm ok with that, but
I think the mechanism should stay for all the people who need to do
something like that.


>
> The only options for such firmware is:
>
>  (1) In the root filesystem, which means the driver needs to be a
>      module... but that's anyway OK as it's going to be the case as it's an
>      out of tree kernel driver, and therefore always compiled as a
>      module.
>
>  (2) In an initramfs loaded separately from the kernel.
>

Let's discuss this in the driver, I'm more than welcome to change the way I
conceived it.


> Best regards,
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

--000000000000a281dd05ec46adce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 30, 2022 at 9:43 PM Thoma=
s Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.peta=
zzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Fri, 14 Oct 2022 08:58:56 +0200<br>
Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.com" targe=
t=3D"_blank">angelo@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# The kernel CONFIG_EXTRA_FIRMWARE feature requir=
es to have the firmware full<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# path for locating firmware file.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_SET_OPT,CONFIG_EXTRA_FIRMWARE_DIR,=
&quot;$(STAGING_DIR)/lib/firmware&quot;)<br>
<br>
Unfortunately, this is really not a good idea, especially if it is<br>
meant to be used with your rtl8723ds-bt package. Indeed, the<br>
rtl8723ds-bt firmware is according to your package under a PROPRIETARY<br>
license, so not compatible with the GPL.<br></blockquote><div><br></div><di=
v>Let&#39;s suppose the firware I was planning to load permits to be distri=
buted within the kernk, why it isn&#39;t a good idea?</div><div>I don&#39;t=
 think technically there is some problems here, else let me understand.<br>=
</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
Except that CONFIG_EXTRA_FIRMWARE_DIR can only be used for firmware<br>
that is GPL-compatible, as they get linked into the kernel image. What<br>
you&#39;re proposing to do makes it illegal to distribute the resulting<br>
kernel image. You can do it on your machine, but you&#39;re not allowed to<=
br>
distribute this kernel image, which for something like Buildroot is a<br>
bit of a problem, as you can imagine.<br>
<br>
See<br>
<a href=3D"https://elixir.bootlin.com/linux/latest/source/Documentation/dri=
ver-api/firmware/built-in-fw.rst#L21" rel=3D"noreferrer" target=3D"_blank">=
https://elixir.bootlin.com/linux/latest/source/Documentation/driver-api/fir=
mware/built-in-fw.rst#L21</a></blockquote><div><br></div><div>I don&#39;t r=
eally want to go down the rabbit hole of what is legal or not, there are le=
gal departments for that.</div><div>If you think the driver in question is =
not accptable, I&#39;m ok with that, but I think the mechanism should stay =
for all the people who need to do something like that.<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The only options for such firmware is:<br>
<br>
=C2=A0(1) In the root filesystem, which means the driver needs to be a<br>
=C2=A0 =C2=A0 =C2=A0module... but that&#39;s anyway OK as it&#39;s going to=
 be the case as it&#39;s an<br>
=C2=A0 =C2=A0 =C2=A0out of tree kernel driver, and therefore always compile=
d as a<br>
=C2=A0 =C2=A0 =C2=A0module.<br>
<br>
=C2=A0(2) In an initramfs loaded separately from the kernel.<br></blockquot=
e><div><br></div><div>Let&#39;s discuss this in the driver, I&#39;m more th=
an welcome to change the way I conceived it.</div><div> <br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
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

--000000000000a281dd05ec46adce--

--===============3694693018604627315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3694693018604627315==--
