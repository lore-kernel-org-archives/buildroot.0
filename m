Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64B360A260D
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Nc3N8gVe
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 931D340797;
	Wed,  4 Nov 2026 21:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsPlNd7Y_g0F; Wed,  4 Nov 2026 21:53:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8152B407BC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793829201;
	b=LCacxqdKSGWy+XVxDb12ITs7HntYCa//cJCCcrD1ig1FFYuJV5sqMFs/y4ISUYlQo1aQ
	 kNh17subzCItm+B7BQswj84BE5umR9/po/SyUbF8zJh/ZDXvNJ3DL/feg7jeCszNaCDyI
	 UkCLGXLJzAMB61IzCYI/WKjbZJ2ObOSNP5U77YnmdqOUQ0OxmQdQUDb70VnUsRc60hNMw
	 YI+HZMbA+Or293IuQoYwojARuQb2B+nA3xija8OeToWhh250iQ6Feu5Zt/30F2lK//gh4
	 Rdn/9xI8qcr3WveKzgrCEDOyelmGVQiGNoYUnX+Hp8E2cU0vgatcaoSzdM8bVvsITLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793829201;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Received:X-Forwarded-Encrypted:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Errors-To:Sender;
	bh=dySKHTRgO7n1+8ons00BQXylKxQ1SX7eOLiF6So12TY=;
	b=nIMb6lw9MnhEIu2Oku8Bwk+CafIz5P/zckoys/DnzI9DC/zx7yt3CjbHgX3sqDnujYSw
	 KGcRe8kNshHxWLQZPL6j506ZP8P8OWqHZPaTTsQqvPLAOwHrMy34q9saBRbgNBHk8SEIa
	 dtkf25yi7My5+plcGE88mTvUxunTBMFNMqy9CMrc9/J6UlQdt9JCHqWjYLEqXBJq+XtZ4
	 /CmMXQ6odzZkA/3rqj6oNIXPwq4eSPEB+u16Mv+tqs+YD7P3QdxDq+xAdoof9uXdbXvL+
	 ziwMXaKIUNkibDvXjzBBuvTt/iziC8NxBasRzeWvqdaZEV/4orr9HyhGKyFlSculnVA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793829201;
	bh=dySKHTRgO7n1+8ons00BQXylKxQ1SX7eOLiF6So12TY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nc3N8gVefPdbFXMgUOZXWcRSfzlSif8pnCwEdf3J4mM2LawwiYuArC/ofdDOcdsrz
	 i9CPzmnysDOYA3aEStCB/UmlOgJeJsz6XSWZ6pEURo41iMMGsjKxAZWGZqGF2sITge
	 fQOsIktVzilPijbGdl8s+YqkDXKp7zbJkGdjwm+JX8RPtvhqLEdlHV+1CqPL1Az+cd
	 vHwYKszKbLl7HdZoZoh1bNrxe47AH3Vhi0rF06kgDduVfu+2gfbv/hpMMf2JqcuxWb
	 6ahZa2k31jQmx0NPeRVjH2QpqmRcugos/B0cnsA+7XBH27JDSNzDoC2BIMf/KY36mY
	 MuwdCZs7a9nGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8152B407BC;
	Wed,  4 Nov 2026 21:53:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E9A1DD3A
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA715811A8
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xlUM0xQpzA8z for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:53:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C176A81199
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=209.85.160.180
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.160.180;
 helo=mail-qt1-f180.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C176A81199
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:53:18 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-53665358476so12580241cf.2
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:53:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793829197; x=1794433997;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=tP3epqcAa9LFW1nb7k5pSh1iYOrjHEElPW7ChNoK4Is=;
 b=jAqXkJoNwKABTHmEIdbdyweChO0Pm68TQIh5POa/tcnLV5H9HF1OqZWVDunESS3HE8
 qKIpaKbWKysKw+0IWo3tQRpyzouKqHz1hUtIutO3ZR3+OcWYzTOYCEavng2KqtuPYfJR
 7rSHePDjvZktpLPxxAHtc8w+1u47Vfr1lMzXamEtfUudYbOyFAUy4FiKIDg6Wv0x7y+V
 x71qH/f7T68j22TdLH5/rPNu71lq6F7Zl5wGuvuU1NTViqbbtyR3crBE6H6rlkAZAhu5
 otGCwRWH4kD8qnf5stgvZsFK4DnR1xJHUf+hL0XGEqQeRPSg21R0ua9xoHe3JJ8cA3DP
 jtUA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwax8Ag32S8QHKVq4uiP2pEQ3XHW2dItjRXw17dAy9rsva68E7y9bUjdyG4jL1T5TsbJYCvUw2H0s0=@buildroot.org
X-Gm-Message-State: APuU4Z8m1DLwa2HCDJKDuu1oKlwSKO2KjRJE55wytbfo4kEA2KI2uS6x
 XTdkogVzomXcliiP4C8LNLMyTxEEnaMH5eTB7UGV9uyQNiHH9yskoHs9vM1Zpx99
X-Gm-Gg: AYBFou0NPOwwvnVKB7PzgQUWVAign7/jM1U11m/u/V88GsPIXNIr86SPVsjfq7OwI+G
 l62M+jJJUDB50+WIq8Mt20z8806suFPgepC2qcy2soUokvZktpBTumBjtM9dSk+qIetSO5kW2jA
 x6lzkPeCustOfMSa1bZBSVVPHIxite7m39gjfh8fGfU9l9lF5uv1XlUw4o6W7EUHe+7j7GFnVAk
 DWcK3HkZ9zrUnoQQJNqZpCUKhGWHmQw972uumANUfmfF/RW25qNuivL+1o2OTeHQF8sxFjUvpLB
 yCWquR7CnJyDVFj4VWhrsoxJO3wVeIVCnniTn5Fnk3vQSPGGun532/y1uoj2C68QLk3fWT3OKtt
 EbH1AF/Z80SeHby3MZMQAlQyOtalyCYql57XcjJylFih7S3YJVbYizqHDknt/N+AID2hbvmKR+P
 riuSt6ucvwPc+/nfbDqyKyNudwZoI9NITWcMqO8XZXY2tXRClpMm2hxgKhUxLiM5xJRfTacafCd
 9XCcQv5GD8/PK1GBsJSE1NiB2m2heQEE36ptldsuEI/xcfeNkKusMa7mnoFFki+JofJXhnW33Td
 GP2SrcitVv1hIHUPWONmb+GRlll3NYeuDPkQxjxIOcPIOWNUuBi3BHr0OuHywqPvbESBPBjZ1jq
 ygmTlgnmB5VF8Pv0jCUMIirOT3G9pPeH+4UMVe+TLZOhq61cpW0FUzWrxTaC733d8JCRr/at/Ju
 U4GdnV5w==
X-Received: by 2002:a05:622a:5c8:b0:535:87c3:79e5 with SMTP id
 d75a77b69052e-542b7141181mr283241081cf.39.1793829197008; 
 Wed, 04 Nov 2026 13:53:17 -0800 (PST)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com.
 [209.85.219.43]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-54b10c48836sm34923611cf.21.2026.11.04.13.53.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Nov 2026 13:53:16 -0800 (PST)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-91c76540d0bso12983336d6.0
 for <buildroot@buildroot.org>; Wed, 04 Nov 2026 13:53:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AKwUvBzM6bil7gYdbKwcmB1OeSTIp129oIDb6tK5v1STtZMIdTo8X8n66h/MgzXIR/NQ9huKfKL8e8WEFJk=@buildroot.org
X-Received: by 2002:a05:6214:246a:b0:91e:8d1a:a198 with SMTP id
 6a1803df08f44-91e8d1aa330mr34097786d6.49.1793829195456; Wed, 04 Nov 2026
 13:53:15 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <audrTUDPjZfZpyNG@windsurf>
 <20261102160505.1754919-1-thomas.devoogdt@barco.com>
 <auuV_PCwJYLlCadf@windsurf>
In-Reply-To: <auuV_PCwJYLlCadf@windsurf>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Wed, 4 Nov 2026 22:53:04 +0100
X-Gmail-Original-Message-ID: <CACXRmJhjkduyOe2sJUJK59H9Fc-4GehP77t9PSHOnEzqYHcWtQ@mail.gmail.com>
X-Gm-Features: AclHuK8XlTtIzI9nab5yqPGrOEcKewUSZz-wMISQVVQeJrNRf_7Fg6etdR7QvPE
Message-ID: <CACXRmJhjkduyOe2sJUJK59H9Fc-4GehP77t9PSHOnEzqYHcWtQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org, 
 fontaine.fabrice@gmail.com
Subject: Re: [Buildroot] [PATCH v2] package/libgtk4: add missing direct
 dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5905740205750482334=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5905740205750482334==
Content-Type: multipart/alternative; boundary="000000000000fba77b065f7a6794"

--000000000000fba77b065f7a6794
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Op wo 4 nov 2026 om 21:31 schreef Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> On Mon, Nov 02, 2026 at 05:05:03PM +0100, Thomas Devoogdt wrote:
> > From: Thomas Devoogdt <thomas@devoogdt.com>
> >
> > GTK links directly against libdrm (mandatory on Linux), cairo,
> > harfbuzz, libfribidi, libpng, jpeg and tiff, and the X11 backend
> > additionally against fontconfig, x11, xext, xrender, xi, xcursor,
> > xdamage, xfixes, xrandr and xinerama.
> >
> > Add them to LIBGTK4_DEPENDENCIES so that they are always built before
> > libgtk4, and select the corresponding Config.in symbols instead of
> > relying on them being selected by other packages (pango, cairo, ...).
> >
> > Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
>
> I assume you verified that all those dependencies are not just direct
> dependencies, but are also _mandatory_ dependencies, correct?
>

Yes, all packages are direct and mandatory dependencies.

cairo:
https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=tags#L471-473
harfbuzz:
https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=tags#L476-478
jpeg:
https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=tags#L494
libdrm:
https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=tags#L731
libfribidi:
https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=tags#L474-475
libpng:
https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=tags#L492
tiff:
https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=tags#L493
x11:
https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=tags#L606-664

Because for the patch on libgtk3, I think you got this wrong (I'll
> reply to it separately).
>

I will have a look, and also reply separately.


> For the time being, I've applied this patch to master, because a quick
> look at meson.build indeed seems to indicate that they are all
> mandatory dependencies.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>
>
Kr,

Thomas Devoogdt

--000000000000fba77b065f7a6794
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">Op wo 4 nov 2026 om 2=
1:31 schreef Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootli=
n.com">thomas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">On Mon, Nov 02, 2026 at 05:05:03PM +0100, Thom=
as Devoogdt wrote:<br>
&gt; From: Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoogdt.com" targe=
t=3D"_blank">thomas@devoogdt.com</a>&gt;<br>
&gt; <br>
&gt; GTK links directly against libdrm (mandatory on Linux), cairo,<br>
&gt; harfbuzz, libfribidi, libpng, jpeg and tiff, and the X11 backend<br>
&gt; additionally against fontconfig, x11, xext, xrender, xi, xcursor,<br>
&gt; xdamage, xfixes, xrandr and xinerama.<br>
&gt; <br>
&gt; Add them to LIBGTK4_DEPENDENCIES so that they are always built before<=
br>
&gt; libgtk4, and select the corresponding Config.in symbols instead of<br>
&gt; relying on them being selected by other packages (pango, cairo, ...).<=
br>
&gt; <br>
&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoogdt.c=
om" target=3D"_blank">thomas@devoogdt.com</a>&gt;<br>
<br>
I assume you verified that all those dependencies are not just direct<br>
dependencies, but are also _mandatory_ dependencies, correct?<br></blockquo=
te><div><br></div><div>Yes, all packages are direct and=C2=A0mandatory=C2=
=A0dependencies.</div><div><br></div><div>cairo: <a href=3D"https://gitlab.=
gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=3Dtags#L471-473">htt=
ps://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=3Dtags#L=
471-473</a><br>harfbuzz: <a href=3D"https://gitlab.gnome.org/GNOME/gtk/-/bl=
ob/4.21.0/meson.build?ref_type=3Dtags#L476-478">https://gitlab.gnome.org/GN=
OME/gtk/-/blob/4.21.0/meson.build?ref_type=3Dtags#L476-478</a><br>jpeg: <a =
href=3D"https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_ty=
pe=3Dtags#L494">https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.buil=
d?ref_type=3Dtags#L494</a><br>libdrm: <a href=3D"https://gitlab.gnome.org/G=
NOME/gtk/-/blob/4.21.0/meson.build?ref_type=3Dtags#L731">https://gitlab.gno=
me.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=3Dtags#L731</a><br>libf=
ribidi: <a href=3D"https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.b=
uild?ref_type=3Dtags#L474-475">https://gitlab.gnome.org/GNOME/gtk/-/blob/4.=
21.0/meson.build?ref_type=3Dtags#L474-475</a><br>libpng: <a href=3D"https:/=
/gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=3Dtags#L492"=
>https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=3Dta=
gs#L492</a><br>tiff: <a href=3D"https://gitlab.gnome.org/GNOME/gtk/-/blob/4=
.21.0/meson.build?ref_type=3Dtags#L493">https://gitlab.gnome.org/GNOME/gtk/=
-/blob/4.21.0/meson.build?ref_type=3Dtags#L493</a><br>x11: <a href=3D"https=
://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_type=3Dtags#L60=
6-664">https://gitlab.gnome.org/GNOME/gtk/-/blob/4.21.0/meson.build?ref_typ=
e=3Dtags#L606-664</a></div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
Because for the patch on libgtk3, I think you got this wrong (I&#39;ll<br>
reply to it separately).<br></blockquote><div><br></div><div>I will have a =
look, and also reply=C2=A0separately.</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
For the time being, I&#39;ve applied this patch to master, because a quick<=
br>
look at meson.build indeed seems to indicate that they are all<br>
mandatory dependencies.<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
<br></blockquote><div><br></div><div>Kr,</div><div><br></div><div>Thomas De=
voogdt=C2=A0</div></div></div>

--000000000000fba77b065f7a6794--

--===============5905740205750482334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5905740205750482334==--
