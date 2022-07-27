Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C21C19F21
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 08:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90E1781A73;
	Wed, 27 Jul 2022 08:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90E1781A73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eq_sr0fOIe2Y; Wed, 27 Jul 2022 08:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9420581A27;
	Wed, 27 Jul 2022 08:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9420581A27
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42C8D1BF59A
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A59281A27
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 08:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A59281A27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BlgWotWMNrPI for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 08:52:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24DA381A0D
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24DA381A0D
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:52:55 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ss3so30202756ejc.11
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 01:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=huz5cD7tXSI0e7dMoHB1OhlASvcSlXRZ1yHqWgQrW5g=;
 b=ozZEox6o6Z4a3pX3RkDm0IIzALHfdFvfoJSnuMNhNz7bHX155ZnbS9qIMxO9xBdJdM
 7ujYqXEp8b4jps1cVh+MkyRcVbc6+pyKf7wAN6inNLox+0stUjiHGEAwlk/sVmerc4pE
 sb/uYZuw53r9bmQHF0OMYibtqY4fdC8lgRd2cRqkGhUvOWNfwPPCPs3+YUe/ROKq46Bv
 G6NP7gUs5Nl1DoWLUGlLk0hLXa3fGtHhDrebon5HKe5rr0ZX1CIqk4/9GSzNoY5HwtK6
 ucipV3ZRudyldTfbRBIQzroIMN3QJ8f0+dgcH1/1Rhu9iuCQvrj4DW2LtRDPP6/LwJqM
 yQbw==
X-Gm-Message-State: AJIora9oCYogffCUMlm0+sJiJEDakVHX6l3xN0RHW51dCZm4P64WfKAQ
 JMMhRMFCnMBzW4YskuYjytONGeHq4KSu8Veccd0vw9YNVDRy0g==
X-Google-Smtp-Source: AGRyM1tt2k6A3Dy//fQ0P0gJHwiN8OTU00qk3/jvylAbKJuBqtvo78lIuY06F0ERAm7oSgyWbHluH2n/F+wn+VUyg2A=
X-Received: by 2002:a17:907:3d94:b0:72b:54bc:aa38 with SMTP id
 he20-20020a1709073d9400b0072b54bcaa38mr17376324ejc.679.1658911973150; Wed, 27
 Jul 2022 01:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220726155115.2024965-1-nicolas.tran@smile.fr>
 <20220727094534.5e912b16@windsurf>
In-Reply-To: <20220727094534.5e912b16@windsurf>
From: Nicolas TRAN <nicolas.tran@smile.fr>
Date: Wed, 27 Jul 2022 10:52:37 +0200
Message-ID: <CAJdGGv5J4VJWfb3Y-r-U2EsVNKq8qG9qd3t1L9nPihK0uT3tuQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=huz5cD7tXSI0e7dMoHB1OhlASvcSlXRZ1yHqWgQrW5g=;
 b=TmNBsezwLNYS0DrnJLNuQSReYMMiNxB84ieBNvSTRTweLojTTI24QsrHZgrHsprArU
 G9tNJNDa6mRaLZ2SrT0lD9Uij4DHehRpgUIv802RSP2HdR+YtA52h2qlBb/BD5h6AIUA
 Wa3RveBPZdFdo7AbAKGKHXz3R12Q2MT9YZorc2f6Akp7vY8HC74Li1JTwO0E9jsmNmDU
 9Z/pUIgGqRoz5FRQh3pzipJuwPiKlhLsR5Y946qtx498LQ2rftZtwWgpT3ISnp/lsSyI
 Zdw8GAJ+FeshM91cXr8FJZ2N5/rsLH7Ev7V41hCdN6fg8gnLJvEyNlcfrINDJvkNuESj
 9yzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=TmNBsezw
Subject: Re: [Buildroot] [PATCH v3] package/dust: new package
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
Content-Type: multipart/mixed; boundary="===============1273230319759389760=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1273230319759389760==
Content-Type: multipart/alternative; boundary="000000000000dfacd005e4c58a7f"

--000000000000dfacd005e4c58a7f
Content-Type: text/plain; charset="UTF-8"

Hello Thomas,
Indeed, the hash value is wrong.
$ sha256sum dust-0.8.1.tar.gz
8231d045a0cca286355e89a41758b05f43238d52721bfc78e0b9bc19789bebde
 dust-0.8.1.tar.gz

The mismatched value corresponded to the v0.8.1-alpha.2 release of the
package I previously used. Sorry for the confusion.

On Wed, Jul 27, 2022 at 9:45 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Nicolas,
>
> On Tue, 26 Jul 2022 17:51:15 +0200
> Nicolas Tran <nicolas.tran@smile.fr> wrote:
>
> > diff --git a/package/dust/dust.hash b/package/dust/dust.hash
> > new file mode 100644
> > index 0000000000..82043b497d
> > --- /dev/null
> > +++ b/package/dust/dust.hash
> > @@ -0,0 +1,3 @@
> > +# Locally computed
> > +sha256
> 8231d045a0cca286355e89a41758b05f43238d52721bfc78e0b9bc19789bebde
> dust-0.8.1.tar.gz
>
> The hash doesn't match here:
>
> ERROR: dust-0.8.1.tar.gz has wrong sha256 hash:
> ERROR: expected:
> 8231d045a0cca286355e89a41758b05f43238d52721bfc78e0b9bc19789bebde
> ERROR: got     :
> 271cc0f1978049b2dbfece633b85d4dd0184df346bd93720062c13e4332f2549
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
>
> Could you check on your side if the hash of your tarball is really
> 271cc0f1978049b2dbfece633b85d4dd0184df346bd93720062c13e4332f2549 ?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000dfacd005e4c58a7f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Thomas,</div><div>Indeed, the hash value is wro=
ng.</div><div>$ sha256sum dust-0.8.1.tar.gz <br>8231d045a0cca286355e89a4175=
8b05f43238d52721bfc78e0b9bc19789bebde =C2=A0dust-0.8.1.tar.gz</div><div><br=
></div><div>The mismatched value corresponded to the v0.8.1-alpha.2 release=
 of the package I previously used. Sorry for the confusion.<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, Jul 27, 2022 at 9:45 AM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.pet=
azzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hello Nicolas,<br>
<br>
On Tue, 26 Jul 2022 17:51:15 +0200<br>
Nicolas Tran &lt;<a href=3D"mailto:nicolas.tran@smile.fr" target=3D"_blank"=
>nicolas.tran@smile.fr</a>&gt; wrote:<br>
<br>
&gt; diff --git a/package/dust/dust.hash b/package/dust/dust.hash<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..82043b497d<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/dust/dust.hash<br>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +# Locally computed<br>
&gt; +sha256=C2=A0 8231d045a0cca286355e89a41758b05f43238d52721bfc78e0b9bc19=
789bebde=C2=A0 dust-0.8.1.tar.gz<br>
<br>
The hash doesn&#39;t match here:<br>
<br>
ERROR: dust-0.8.1.tar.gz has wrong sha256 hash:<br>
ERROR: expected: 8231d045a0cca286355e89a41758b05f43238d52721bfc78e0b9bc1978=
9bebde<br>
ERROR: got=C2=A0 =C2=A0 =C2=A0: 271cc0f1978049b2dbfece633b85d4dd0184df346bd=
93720062c13e4332f2549<br>
ERROR: Incomplete download, or man-in-the-middle (MITM) attack<br>
<br>
Could you check on your side if the hash of your tarball is really<br>
271cc0f1978049b2dbfece633b85d4dd0184df346bd93720062c13e4332f2549 ?<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000dfacd005e4c58a7f--

--===============1273230319759389760==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1273230319759389760==--
