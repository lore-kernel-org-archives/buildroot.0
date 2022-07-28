Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22980C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 06:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E4C260EB1;
	Thu, 28 Jul 2022 06:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E4C260EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C1XcyxVPvRaN; Thu, 28 Jul 2022 06:07:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 707CE60E45;
	Thu, 28 Jul 2022 06:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 707CE60E45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F40951BF364
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 06:07:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF49082BC4
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 06:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF49082BC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tKm2FK4zJ8-0 for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 06:07:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21B7282B08
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21B7282B08
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 06:07:40 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id oy13so1400423ejb.1
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 23:07:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QJ92uGFNPRJkWio4wLQgC6HAuwq9xBmAXy16YXUutWk=;
 b=DGTkAaJ0CMgx3OggUmDH+9/mynUcfoBVMfKgW6Bqh9M23fhZFQpAsPDBKtxKeuSDb6
 dAl8aNGWvLDWqkHNQcj8mu01k7gGZ0WbajsVBkT0yySsiLYSPLrdqpIL9DejZdPs7BGC
 427qy0bL7FUni3Omn/tM/K88Duxv3jIjuTrQqvrhxHRbOPKRz/j5ZMHgLQzBLPA/PNU5
 JpQaf2Pi1GzN2svOdMek2pGS8bSXUt4k9XlcmBpsA5OFmr2lWCpefTz+DgGyRh/I1mcM
 n+OhNtbZ+KxOdoObgj2ENUYeQtEtlmHIe1ZWcEbKY0Xu763olcc64GsZ/NNyrjD3jdNh
 d0CA==
X-Gm-Message-State: AJIora8VIty152UlkyH0XaqvwFRciYQ56cUQFaPnj2+dlqJWpRRLA0Aw
 kj9GvnGb7JhfzUw3+pWbatQGLM47X+6z2Z2rIOuAxQ==
X-Google-Smtp-Source: AGRyM1uDYtHKT1vGcFNyz63piWQR+LvfRsWwozMurWg/N5WpBk04L9skmhgwxj7VDBHi0y2TrHYnbFU5HFP+UnyY6T8=
X-Received: by 2002:a17:907:1c8a:b0:6e9:2a0d:d7b7 with SMTP id
 nb10-20020a1709071c8a00b006e92a0dd7b7mr19488832ejc.572.1658988459111; Wed, 27
 Jul 2022 23:07:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <20211210141209.1812043-7-jose.pekkarinen@unikie.com>
 <20220726102142.71da58e4@windsurf>
In-Reply-To: <20220726102142.71da58e4@windsurf>
Date: Thu, 28 Jul 2022 09:07:03 +0300
Message-ID: <CAJPV9MqbH=-7WHDPPxZ6EJ5qoarUfyun-EGXs7tcXp3kcasytg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=QJ92uGFNPRJkWio4wLQgC6HAuwq9xBmAXy16YXUutWk=;
 b=DlhzrsGn7iaXUUefIf9S0uuDkVOOb4lDpjX91Uwi2AscGrvdfjcqMIQn7Fq/ZNq67H
 h4w8Gq4LSOq5vrnxWMmzilAEwnjg9k+c5MwrGAUUDpH/hPiEzGjYqp54pj08thHy5ONP
 NRy5NQs9Ptt39qBr/1AcdEIu5DxfnKsKFAmrRLzobxqHAY2XuUQV+2f6851YB+5LDF0I
 ynvgy41DM0gvumGUkCe9qOLJyJVnqPRt4r9wgupzWucM0PUe58qpEEfaop6FEiEi2r2x
 vSoNFUaa2EszcuMc+Hy84qlrsi7QkJBhbMtIeMg+K9fmnefuPvxmOkpk6hlmfHPIKReP
 PZOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=unikie.com header.i=@unikie.com
 header.a=rsa-sha256 header.s=google header.b=DlhzrsGn
Subject: Re: [Buildroot] [PATCH 7/7] package/avocado-vt: new package
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
From: =?utf-8?q?Jos=C3=A9_Pekkarinen_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4954038501624014545=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4954038501624014545==
Content-Type: multipart/alternative; boundary="000000000000cad61305e4d75918"

--000000000000cad61305e4d75918
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2022 at 11:21 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Jos=C3=A9,
>
> On Fri, 10 Dec 2021 16:12:09 +0200
> Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com> wrote:
>
> > This patch adds a basic package for avocado-vt
> > plugin.
> >
> > Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
>
> Thanks a lot for your contribution!
>
> Do you have an example on how to use this in the context of Buildroot?
>
> First, your patch was missing lots of dependencies: python-netaddr,
> python-netifaces, python-simplejson, and one more I can't remember.
>
> Then, I tried to follow
> https://avocado-vt.readthedocs.io/en/latest/GetStartedGuide.html by
> running "avocado vt-bootstrap --vt-type qemu" on the target, but this
> checks if gcc is installed on the target, which obviously fails because
> we don't support installing a compiler on the target.
>
> Could you show a simple example of using avocado-vt in the context of
> Buildroot? Ideally, a runtime test in support/testing/ would be useful.
> See support/testing/tests/package/test_avocado.py for an example test
> case I have added for avocado itself.
>

Hi,

I'm afraid, I find no traces of it being used in our records, we

targeted to set it up to have a testing facility that could be used by a
tester that never came to the table. Please feel free to ignore this patch,
we don't need it anymore.

Best regards.


Jos=C3=A9.

--000000000000cad61305e4d75918
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 26, 2022 at 11:21 AM Thom=
as Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.pet=
azzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hello Jos=C3=A9,<br>
<br>
On Fri, 10 Dec 2021 16:12:09 +0200<br>
Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com" targ=
et=3D"_blank">jose.pekkarinen@unikie.com</a>&gt; wrote:<br>
<br>
&gt; This patch adds a basic package for avocado-vt<br>
&gt; plugin.<br>
&gt; <br>
&gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkari=
nen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
<br>
Thanks a lot for your contribution!<br>
<br>
Do you have an example on how to use this in the context of Buildroot?<br>
<br>
First, your patch was missing lots of dependencies: python-netaddr,<br>
python-netifaces, python-simplejson, and one more I can&#39;t remember.<br>
<br>
Then, I tried to follow<br>
<a href=3D"https://avocado-vt.readthedocs.io/en/latest/GetStartedGuide.html=
" rel=3D"noreferrer" target=3D"_blank">https://avocado-vt.readthedocs.io/en=
/latest/GetStartedGuide.html</a> by<br>
running &quot;avocado vt-bootstrap --vt-type qemu&quot; on the target, but =
this<br>
checks if gcc is installed on the target, which obviously fails because<br>
we don&#39;t support installing a compiler on the target.<br>
<br>
Could you show a simple example of using avocado-vt in the context of<br>
Buildroot? Ideally, a runtime test in support/testing/ would be useful.<br>
See support/testing/tests/package/test_avocado.py for an example test<br>
case I have added for avocado itself.<br></blockquote><div><br></div></div>=
<blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=
=3D"gmail_quote"><div>Hi,</div><div><br></div></div></blockquote><blockquot=
e style=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_q=
uote"><div>I&#39;m afraid, I find no traces of it being used in our records=
, we</div></div></blockquote>targeted to set it up to have a testing facili=
ty that could be used by a<div>tester that never came to the table. Please =
feel free to ignore this patch,</div><div>we don&#39;t need it anymore.</di=
v><div><br></div><div><blockquote style=3D"margin:0 0 0 40px;border:none;pa=
dding:0px"><div>Best regards.</div></blockquote><br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0=
px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></div></div><=
/div>

--000000000000cad61305e4d75918--

--===============4954038501624014545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4954038501624014545==--
