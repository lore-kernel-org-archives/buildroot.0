Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6CDC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 21:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCC9B60773;
	Tue, 27 Dec 2022 21:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCC9B60773
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmUFpf_a8RTo; Tue, 27 Dec 2022 21:41:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DE8E60C24;
	Tue, 27 Dec 2022 21:41:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DE8E60C24
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 85EBE1BF847
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E0014018F
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E0014018F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9V7lvqXobVEI for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 21:41:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A59A64031E
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A59A64031E
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 21:41:04 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d3so14318916plr.10
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 13:41:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SLoJOZ7xUTIyICQvNy86ohOM8qP7iiOtHRG+KlpgnT8=;
 b=KOHjLD/Tt8GRKZ21UDMWz/JyAPkDx/xEQ3Vu0LKMWIpT0TyqBDIX5wwp112j7cecAm
 I88tafk2TpF5cXGGNTHY2fBdc3F2hUrWbqqcUNtWkJ18LKFnNb8eZeQ0if0UFFpqA9vT
 +nLVIQuGRZLga2f68nFFriX40AINOkVqlWb7lmObJeTMdNuR0Tt1xgIjRjE527VbOxoz
 jh6g4O17xXQe8qGLjJsuAglg5QJFJWtYXa49FiZ42nqStU8CpxILK6HLTgL+Rvr5eG1b
 YMJU7lChehVYDGauPoeGJyjlWhccMCwpD9/OSImO3ei+JAKJ3L8ONdVCQAx/3XusC578
 dCOg==
X-Gm-Message-State: AFqh2krvlm/D5vEBEyo/Eikn4zaTXIMhWETOar0IRkCtv3fCUB5JEqNF
 h3zG0LZrPMS0X/rvLEmCsxOELmWuoSozcbnHXJ6+vNTz
X-Google-Smtp-Source: AMrXdXuE9PWdFO6ZCu59nmgN+kbfuAJTEe7EqrgC0djOLzJSY4iU0ycqpwkYRV2HtV/fgoXOy1t7QDHxCZgohvC/Fqg=
X-Received: by 2002:a17:90a:5e02:b0:221:5f8e:7bec with SMTP id
 w2-20020a17090a5e0200b002215f8e7becmr2121724pjf.140.1672177263898; Tue, 27
 Dec 2022 13:41:03 -0800 (PST)
MIME-Version: 1.0
References: <20221222165117.62002-1-fontaine.fabrice@gmail.com>
 <20221227223514.503ad1c2@windsurf>
In-Reply-To: <20221227223514.503ad1c2@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 27 Dec 2022 22:40:52 +0100
Message-ID: <CAPi7W82v_acXo1qva_7No-_0+zm-k79PyZ2k28tfi8sFP=EbrA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SLoJOZ7xUTIyICQvNy86ohOM8qP7iiOtHRG+KlpgnT8=;
 b=ljJl90BfCYN7VVlJBh2+TQhfW58A7zGiH8n/lYFRiRHuMzIow8XQoXTuZi5oEFPR1j
 XLVYMUHTqUJ6lp/CFUI8GpYksIna3nXYQO9MFmbnJx5A5Hjd1ulgz7wEx6e+UXGIo101
 GvW1ApAfaL9oOkZnpIjgD41+/UVUOjxYxdnk7HbFzskQXdQdQhs9irPyShu+r/fzL2ta
 I2CA/mzYosjopOxE2MVdiMRiooH1bxm4LT5OinV5FflxKSwR/143WvcgGwixeJQRHWzY
 uuI3YyWdfvCmDrHCwTE7DWlh94wjZKa1ZNPb0ElFdSmI9yYpeTbDvchnHrDujdQSFoQ0
 0E/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ljJl90Bf
Subject: Re: [Buildroot] [PATCH 1/1] package/tiff: add libdeflate optional
 dependency
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
Content-Type: multipart/mixed; boundary="===============0716048841155398600=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0716048841155398600==
Content-Type: multipart/alternative; boundary="000000000000d0f93205f0d61b03"

--000000000000d0f93205f0d61b03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,


Le mar. 27 d=C3=A9c. 2022 =C3=A0 22:35, Thomas Petazzoni <thomas.petazzoni@=
bootlin.com>
a =C3=A9crit :

> On Thu, 22 Dec 2022 17:51:17 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > libdeflate is an optional dependency which is enabled by default since
> > version 4.2.0 and
> >
> https://gitlab.com/libtiff/libtiff/-/commit/3a2de853a932bd0ea79d1677d3198=
41edb736c38
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/tiff/Config.in | 6 ++++++
> >  package/tiff/tiff.mk   | 7 +++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/package/tiff/Config.in b/package/tiff/Config.in
> > index f842c2ead8..58e2052ea5 100644
> > --- a/package/tiff/Config.in
> > +++ b/package/tiff/Config.in
> > @@ -11,6 +11,12 @@ config BR2_PACKAGE_TIFF_CCITT
> >       bool "CCITT Group 3 & 4 support"
> >       default y
> >
> > +config BR2_PACKAGE_TIFF_LIBDEFLATE
> > +     bool "Libdeflate usage (still requires Zlib)"
> > +     default y
>
> Is there any reason to have this "default y"? We normally try to
> disable optional features by default, especially if they bring extra
> dependencies.
>
> I see it's a policy that has not been really applied to the tiff
> package, but I'm wondering if there's a particular reason to not apply
> our normal policy to this new option?
>

I decided to enable it by default for backward compatibility and because
(for an unknown reason) most tiff options are enabled by default but I can
send a v2 if needed.


>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

Best Regards,

Fabrice

--000000000000d0f93205f0d61b03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div dir=3D"ltr"><br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 27 d=C3=A9c. 2022 =
=C3=A0=C2=A022:35, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@=
bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 22 Dec 2022 1=
7:51:17 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; libdeflate is an optional dependency which is enabled by default since=
<br>
&gt; version 4.2.0 and<br>
&gt; <a href=3D"https://gitlab.com/libtiff/libtiff/-/commit/3a2de853a932bd0=
ea79d1677d319841edb736c38" rel=3D"noreferrer" target=3D"_blank">https://git=
lab.com/libtiff/libtiff/-/commit/3a2de853a932bd0ea79d1677d319841edb736c38</=
a><br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/tiff/Config.in | 6 ++++++<br>
&gt;=C2=A0 package/tiff/<a href=3D"http://tiff.mk" rel=3D"noreferrer" targe=
t=3D"_blank">tiff.mk</a>=C2=A0 =C2=A0| 7 +++++++<br>
&gt;=C2=A0 2 files changed, 13 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/tiff/Config.in b/package/tiff/Config.in<br>
&gt; index f842c2ead8..58e2052ea5 100644<br>
&gt; --- a/package/tiff/Config.in<br>
&gt; +++ b/package/tiff/Config.in<br>
&gt; @@ -11,6 +11,12 @@ config BR2_PACKAGE_TIFF_CCITT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;CCITT Group 3 &amp; 4 support&quo=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default y<br>
&gt;=C2=A0 <br>
&gt; +config BR2_PACKAGE_TIFF_LIBDEFLATE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;Libdeflate usage (still requires Zlib)=
&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default y<br>
<br>
Is there any reason to have this &quot;default y&quot;? We normally try to<=
br>
disable optional features by default, especially if they bring extra<br>
dependencies.<br>
<br>
I see it&#39;s a policy that has not been really applied to the tiff<br>
package, but I&#39;m wondering if there&#39;s a particular reason to not ap=
ply<br>
our normal policy to this new option?<br></blockquote><div><br></div><div>I=
 decided to enable it by default for backward compatibility and because (fo=
r an unknown reason) most tiff options are enabled by default but I can sen=
d a v2 if needed.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Best Regards,</div><d=
iv><br></div><div>Fabrice <br></div></div></div>

--000000000000d0f93205f0d61b03--

--===============0716048841155398600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0716048841155398600==--
