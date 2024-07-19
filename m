Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A8CC3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 06:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26D88607C4;
	Fri, 19 Jul 2024 06:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoxmOouWnpun; Fri, 19 Jul 2024 06:49:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E93560E85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E93560E85;
	Fri, 19 Jul 2024 06:49:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8131A1BF362
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EAB260E85
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 06:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwSSL1wT_CGy for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 06:49:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C3CC607C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C3CC607C4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C3CC607C4
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 06:49:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([151.216.37.99]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9UK-1sEP1r24No-011akn; Fri, 19
 Jul 2024 08:49:07 +0200
Date: Fri, 19 Jul 2024 08:49:06 +0200
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <ZpoMYixDlvqpfpJ6@probook>
References: <20240718-ztext-v4-1-15a9744f1edb@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240718-ztext-v4-1-15a9744f1edb@gmx.net>
X-Provags-ID: V03:K1:Ozjn+wfMstuaNaOFrT7K0qkme19oXyrOc+CxrVF8ndK5E2of3nV
 t1UmU5h+EUTdl4FEZXORgqceQnb+mNZrPy/P9ZnKazdT4l7T4gz68o6h1p2GVGOM9GMtRdS
 6mRhBOPVxR3y/hFzCJtq/nnbf+UtFPKDcASxivnZYWK1UIwe/tngma0fBDOM7diYhJ7vSOr
 7y+QyU9MNDIoiETG1fgsw==
UI-OutboundReport: notjunk:1;M01:P0:4T7dQRFS9vs=;ybQxI8zAAOjfIG1hoR4UfQCq2/U
 8kuzGnv9wvYZ2bv3MZi0Hmu1FEyTwEna18bUdR417B9AB+WdVcg3ecycNQoQ5wrqLIXkF7prL
 mc1y9xofy7j51yg6x+J4wcmFy3hXYkhEHW8p4LtSd8NMEGgDZ4jZO3NxkTpFckwBbFBUcOqly
 jkQNl13q/+8iFU5OxQ77LUP/0k3I5t6EMkBav6ysncvde90jqErM/HnQecyBZ2M+ep0F5uCKe
 ra7+527x+nH5cWLsulBsWKaVBfkyY5e8WJ+y1QuS6QSS4wJyDOARQdi70BCK5S1Hc+EqaTIP+
 Qnifa4MHgDuyV5HyU+UBjPTfLaNtnBDof0ebICJwAK47KofDpeCbvHaT+lIdMBglAPY5JwN5S
 bNqqL2uUtoCqxPobFGTB3zbUp4AQnstv+2JwyqjUlIbtKSzmxeEs2j+3YIWzA2ccSfrKuOwOZ
 GhUnkXuA0bG3QdTi2ZsBPZ1c/ei+XOgGBoZHKp31wqR5rrcaNj1nJiJzgk+uepDJTHmZOndSX
 uqTlypKQU2Ely85XPNBYu3PTxoYARvtzqbvkqzHnrHjRwwzyka+REwc/XVyNJRJxriOSOvwfn
 fQoEJiGaGJdKMZapatQct1i2PHPtIOt7DtsVUmVW0mFNbEULMm1jpHe1NHUgVWDCEC1taYwD8
 44np4TtsOALfDsVlKjaW6Yzk9B1GUhVik2kyls/V7cGSnNXxCL+iSCD4SLdsdOhJfbKxnbgJB
 Y0bg7gB5r1SHZdDcY9FR3LnfdpwNRp8y7q6FV9zfUOH7FJrfuMt/ayLdwPlqFGCZePkiJXJkX
 O/g6a5TozSCcRZMaUhrAcPdQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1721371747; x=1721976547; i=j.neuschaefer@gmx.net;
 bh=WMTvhqH41yYB4y3kJSThONo/4ikrWRFsVEFOVqmsxzU=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=LI5Wxf/AfL04124OQDW6khy/Z5rkuysOjCcgJM9DIA2QWKWmDRF1TNCNlt70GiPd
 HiXfh6wO1DJs7NqNfH1dB7tw0/rdwmE894RKEfZP7jSPj0/UH04ohZRHwcn22vMUT
 vYHQdr3ofePCmCWMeAUd3aV7Z3G5f5+IleMmIDRSZiDkITx0rrsVB3EAokhnwe40A
 1fH2fFrM7abIihMz59rElfISFHwGircQ1fTW1Xj4c2CT62WfoWMJdRT91TjyK142F
 OH90jkID+L60LC0UhTp6mLor/ghsdzoxcKrsMHuDJftKML1AQ6lmdMxofMSAmeORq
 xntOg4xMyeZjD3okrA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=LI5Wxf/A
Subject: Re: [Buildroot] [PATCH v4] Config.in: ban textrels on musl
 toolchains
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBKdWwgMTgsIDIwMjQgYXQgMTA6MzM6MjNQTSArMDIwMCwgSi4gTmV1c2Now6RmZXIg
d3JvdGU6Cj4gK2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX01VU0wpJChCUjJfQklORk1UX1NV
UFBPUlRTX1NIQVJFRCkseXkpCgpJIGp1c3Qgbm90aWNlZCB0aGF0IEJSMl9CSU5GTVRfU1VQUE9S
VFNfU0hBUkVEIGlzIGluY29ycmVjdCwgYmVjYXVzZQppdCdzIHRydWUgcmVnYXJkbGVzcyBvZiB3
aGV0aGVyIHNoYXJlZCBsaWJyYXJpZXMgYXJlIGFjdHVhbGx5IHVzZWQuCldoYXQgSSB3YXMgYWlt
aW5nIGZvciBpcyAiQlIyX1NIQVJFRF9MSUJTIG9yIEJSMl9TSEFSRURfU1RBVElDX0xJQlMiLgoK
SSBzdXBwb3NlIHRoaXMgc2hvdWxkIHdvcms6CgppZmVxICgkKEJSMl9UT09MQ0hBSU5fVVNFU19N
VVNMKSQoQlIyX1NIQVJFRF9MSUJTKSQoQlIyX1NIQVJFRF9TVEFUSUNfTElCUykseXkpCgouLi4g
YnV0IEkgZmluZCBpdCBhIGJpdCB1bmNsZWFyIGJlY2F1c2UgaXQgdGVjaG5pY2FsbHkgZG9lc24n
dCBsaW1pdAp3aGljaCB0d28gb2YgdGhlIHRocmVlIG9wdGlvbnMgaGF2ZSB0byBiZSB0cnVlICh0
aGlzIGlzIGRvbmUgZWxzZXdoZXJlLAppbiB0aGUgS2NvbmZpZyBsb2dpYyB0aGF0IG1ha2VzIEJS
Ml9TSEFSRURfTElCUyBhbmQgQlIyX1NIQVJFRF9TVEFUSUNfTElCUwptdXR1YWxseSBleGNsdXNp
dmUpLiBJJ2xsIHJhdGhlciBnbyBmb3IgdHdvIGlmZXFzIGluIHRoaXMgY2FzZToKCmlmZXEgKCQo
QlIyX1RPT0xDSEFJTl9VU0VTX01VU0wpLHkpCmlmZXEgKCQoQlIyX1NIQVJFRF9MSUJTKSQoQlIy
X1NIQVJFRF9TVEFUSUNfTElCUykseSkKCgotLSBqbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
