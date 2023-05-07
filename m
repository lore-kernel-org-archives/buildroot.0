Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E028C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 14:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7318661388;
	Sun,  7 May 2023 14:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7318661388
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AQVTxyM-t5Y5; Sun,  7 May 2023 14:17:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75C8A61352;
	Sun,  7 May 2023 14:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75C8A61352
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A2D71BF2F8
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 14:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7F064020B
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 14:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7F064020B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QSLJp8PeLOdC for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 14:17:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01090400CF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01090400CF
 for <buildroot@buildroot.org>; Sun,  7 May 2023 14:17:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.193]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95iR-1qFcS40ubX-016BQa; Sun, 07
 May 2023 16:17:31 +0200
Date: Sun, 7 May 2023 16:17:30 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <ZFey+o0AMgSGDnba@probook>
References: <20230429124731.4014394-1-j.neuschaefer@gmx.net>
 <20230507124056.GO252090@scaer>
MIME-Version: 1.0
In-Reply-To: <20230507124056.GO252090@scaer>
X-Provags-ID: V03:K1:doBdZsZmI9gsasgqH27D5ATtUgBfYMSzNlhcPS275c889aBuXmf
 GROUgUJSsQMd7oamtVXfi6AovybEagBgmq8radAtNu9VG8dUCKSgjATYP6fX9ILvE3UJnR5
 L8POHRIf2HHCB8dIrVNSXAii01sB20Zsz6x+kZkW8unCEWnAGBqIzzVE4AwIsMhUzP625jp
 oa0o0m05p5b8qi/I8dcYQ==
UI-OutboundReport: notjunk:1;M01:P0:XPjoG09YNRY=;/7FleB3BkEYGdEtd1AaWCXmU7f2
 9agIlOixSVzYNw+XodrxOYeg4ACSjOw8qVly1/y6zjfKCclXnePOWi5evrgXB1mGU0aePGjoq
 axSNx2UTLjiAnWMW3IzER1Y95ZYUdiEp+27QAuJJQte+MHA6b0D23XxUvc66EhrPXInsGw3gd
 nc1JhVL/UB+80fZPuiJdR68g/lUDq1x8i65BO81aMGer5NeZ7J88d7fVtu79MjLuvBQDyzGHX
 R+RgKkT2jL1huY7cPb9NKtXkDfseD7EUaI8eVrZ4rhasclgdpPU9Zkbc7a5FhKu04mrgjWj8s
 BfyWuzHDchrnTUIDHGdoDj0jr9LWnrQ1b+apr8Wlk0gcRLBJrbUTPcZAKt0WetnAYi/kTcgC6
 vbeyVi0BM2OPID9+PdyeekR7vNxpKDju0KQ+9zyhjhpYE8cbhgIaQ2G/+8xcjTmhnDstccXPU
 K9jdFwIgA3+0m9w00GB11sQQWrfGNKhIsV352wqgcEVYl5CH7Sik18rSDaiUlDd7B7K6SjXP7
 MxNz1iAdXJ/S0wfbZ2oCf+Xl+jR/k8810WmXxpMQWB2tug7vS/1HwsifLxyUdhxEvwAeyFTDR
 j7hoez0nViw9ZPz9GdCqJab5Hb36+4FBU/aUbgtn0Q+u7TJa9PX8xttDAIWInFgOJuKKnUOwc
 ILhrdcJ25CYoe4Jd5SIuE/pU8Hc8VhWx185ZjbG5SLOzvWRZaa8AN3DokanM7qk/wuK+PFVnW
 EM1s5ouVkCjIbmu7fX+2MPgEYVnS5iqJMEPadmVTwEuZ7GgY/kE41t7Jx8oA3PcdtbyPEqmor
 780UDHUR/EkTMOjnoJAcl+orLXdowKKRGiiICDFckU1HTaLMUUyoF3AvoHVEbJwbIALF7KjlZ
 lD35kyylEas2pDevXmuI6VQ3yeFiWBDeMogKzh6Fi0XShc5AN8HBdWm+nRAenzyLDtFoE6DLw
 CnBd7tjBVZZqpO6UBFCsuJanXw0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683469051; i=j.neuschaefer@gmx.net;
 bh=lhUMpWpHpDPri0bpLDE5RnDcWuM/6AiOqST/5HlINi0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=YXaoYyvbSesTLUnXAhhj/so4XPACP/w+bZIIVkDuvpgC6eGp/0SpWxHcgeDOEzmLa
 62q56FL7OQyroyPkymJgWjc+VhhWyg+cq2fXpiYPpgQHWmUUUd1oE4o0C54HyG3r5J
 WQXfKrp5jh12760tVnh+RlAjPSAV7inkbibMKux+ftCDRGdTmgnqp/rEdQMUkdk/di
 GZ8LV7DhUvA8jLzfTKoYCpQAy/IT+9XBHIgQ3W1m8cYJUvi/4NieqgtXJ7Wy+Jk2zq
 fj3YRbkguuuEmf0Z538vph/R2dZ49jOuOU+w0xv+4d9CPpoPysM2XmtfktLLSgak99
 Euod2VV7UtQ4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=YXaoYyvb
Subject: Re: [Buildroot] [PATCH] package/micropython: pass $TARGET_LDFLAGS
 to build
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
Cc: Chris Packham <judge.packham@gmail.com>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5574291509867835702=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5574291509867835702==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="le6MkdpL73p1sUeW"
Content-Disposition: inline


--le6MkdpL73p1sUeW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 07, 2023 at 02:40:56PM +0200, Yann E. MORIN wrote:
> Jonathan, All,
>=20
> On 2023-04-29 14:47 +0200, Jonathan Neusch=C3=A4fer spake thusly:
> > LDFLAGS need to be passed to the micropython build system via the
> > LDFLAGS_EXTRA variable, which was so far missing. This patch adds it.
>=20
> Is this fixing an actual issue, or did you just happen to notice by
> chance?

It fixes the issue that global linker flags (such as from
BR2_TARGET_LDFLAGS) are not applied to the micropython build.

Extra LDFLAGS are not necessary most of the time, but I was using
BR2_TARGET_LDFLAGS=3D"-z text" to check for textrels, because micropython
produces one[1] and it causes a crash with musl-libc.


Jonathan


[1]: https://github.com/micropython/micropython/pull/11353

--le6MkdpL73p1sUeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmRXstQACgkQCDBEmo7z
X9vC0w/yA6vbQuYii5f8/PpM7GD5v1iBZHNirXB6AIg5mORhe7+tRAeA/XDozXVo
4TwqMdAVioOxwNaZPEEYq/S275h40SfLE3Uqyeai3OmhsUD6QeNK6SOsS/UkPHA3
gxe2j4PihP9QHCZIF1o/5VeGvNdgkt8YIoBj0WM5UnS2GBsYw/06fF5ST6PT1eHl
eCgteY2UW1G1O18v5Qt1m9Uru5ViGVGyMWx5kqpIqQFbNy5W1vM5qs3lJZ6pBOhe
OHnZRhLddQmBWIWAgDaNWsBz7VchniH+SIv9FWdcjxX87BhFC4pIi2h81sLCBMIs
4NqF5S5YIE7c8RJXrzsXSAowlmuS8HKJqB2pIksr8lu9K8vawVrGzX3vjF60bvFi
IOx/0A1fj7aBtRby+oPPrKKMbLV47yv4AgbJK10DogZk8j/8Mh1ciKXZX+9fm1dg
xVAXgCxoBlsQaVsPe9A6nfqOFKg62CVjAPnZXKHo/6hnFcVI5l2+WA4L/v8oXZPa
6Ykqdy1h58g5uJyUzKRx/40fQgPoeBFKKVDpDdwkBHCZARnDA6atk4XFW7P+5BXN
ShHp8JJLQ2HoKgR4y18i7tNbaEEiS3nGK+hqeRg3jmD1agdpK9w/u+Qvc0lcmDsB
i4VGJFsG91hyAqRzhqHO7vPvOqf1fsuxXKQVAQlKZa82+9sFeg==
=j/HU
-----END PGP SIGNATURE-----

--le6MkdpL73p1sUeW--

--===============5574291509867835702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5574291509867835702==--
