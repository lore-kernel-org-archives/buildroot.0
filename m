Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF05E606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 18:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hHWWB2Mf
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94589448AC;
	Wed, 28 Oct 2026 18:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6-vTZn3N4k5; Wed, 28 Oct 2026 18:20:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C2C6144969
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793211558;
	b=lTDT/yBnOaG1AFmXTrDBC7EJ8VaDLNvgZbGnqTgiADIaMN8QKqZZ5DZLFWtS+uvwadUJ
	 Yu4Wo2JtjrW5WyvzBsg8cDSYC94h5bZgYFbYgZZA4if9O/BGs0yUfEyJh8/k1y+MvwZN+
	 KCGH7I1zPon+Asy/9+3/lP6nKdRnIoYeX6JMfL2BkL86Q6Qenz/u1Zsf7fHL79wkITL5W
	 8lwqiNPuI39+l1Mk8l5g2oblKZxVFLa5qySbKrvkVXE01FWTpkDKzx5FFynGcYXh79mBo
	 J2bfk1F0pPF11jx0ivblYlSdckA9chBkxF4aQjdw6tk5dSvybk83mL5Fk8pQ38g1WqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793211558;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=tH0FQUdSTFkC48b69OzLjDZj5IcvYGwcysBkGjwbr7A=;
	b=IzZvcQ1+xiz63Eic8jZUPROd/b/ltZqm1Uy5pGBLjwOgTCuhkqp5F+ViKNOWDp6TQRyf
	 2XVT7nWnrGpI7xFSltT5XcVohMqBYmCTOAFUkunIR5cLtcRz+7xrC9uK4bTCIR3uoqjrv
	 Vfp+ALZUpBAsYm/F3IVsF3DswjcDpzfSuka5QLRWY40apUyCDKFXegzMNkC45ogQq+pri
	 5/UmgBroESSr88Ia4TyYgLV4jR/I0K1BZA4/2CQ6DcuLeQCc4Z+vdLYT9ZGxi6Ia0ND1I
	 Bo81Z8tdHW0Ldt080pmkfJgKheBrGpxO2vnNfAzc9hyXMPk5kJGCc1kwqTI5beEUFiQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793211558;
	bh=tH0FQUdSTFkC48b69OzLjDZj5IcvYGwcysBkGjwbr7A=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hHWWB2MfVr+pdCvUBwqtmtIChzaEUfyhQ5Qr9C+bd7BL5xy0c4f8Qk4MkaIPOeUq4
	 Zlz/UroORZ4JzZn44UX82bQ8uiJc4qx6eN2eKcw3hGbhDD/YwDKfl49U3FkFmbUt9k
	 vSyDU0DY4x6VsRNW1+cjKrHFG38g0KqChoeA6dpSdA/TtLFzivBSqY8OMAsYED5luR
	 wdAGqGTOV9uoIwpK5217vwOLiYNYOF6rx5Hj3y7iSPplQhxVthiMW8fovA0VO6RyHR
	 rC2JxAEmeKSg8rh7C/R+mpB/vkCE+aokrHAgNEKiGCYy5NzvzfhycGIoXu4acdxW2x
	 ZWBS+BXWrsCJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C6144969;
	Wed, 28 Oct 2026 18:19:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C0271362
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A614661ADF
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L8mGHDionyvK for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 18:19:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0E68E6084A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793211526;
 b=mPDN/CNTB8KiOEtsAoicnXjdKV9hHbZQLerjMPvYpVIte0H26lhTPBVEGJE2xULiwIVs
 ZQBXSkml0t5oL1KlbvrRFpW3GAFH8O3uHTc+tAYg8L4Rc1gmVrPI1dTwUYuHt1LsPc8J2
 Lw5jE1U8xkKnbF/FaMOi7Wsw5TXZqqmDkGEKumxsDJtsy7iPH6ATn8l/omfSK+oTHLmS3
 BOEFs26ruWd/T7+44vsrcgLKeAUtzEwOQ3lj+7I05sJHorbzlIPWmUnTBSF/0oQmrmi9q
 M8thMnQ0/0yaCiwD5ihhLQ8tti+R0DWh0B0l/pJSWPBZ0qLQS75pn+rh4+qTt/bplZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793211526;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=/dQEDJ5ww4iLZdbBJENNrjbPEEfx/DTee5kOVCuWzhI=;
 b=sosXnQ3Wv6ghas/hFgb05w5kPVjjyI/D4QLmoK/dApir4rAz3YjX7zoSVbzb+45jl3rI
 wIM9X2fceJkZ2ytIFOq7fF8s9T0XaaV8i/hj7qav+hpRLK67G30TYFURUkQ1oqiAF/H2C
 d9ZiGfRQEjp4Xo1vkmgs00O3MB/X0YafRcJXMmJHIO1mWE7brjJfYap65Y9CGLTJD6aog
 GMtAVt3nKH53AfIOlxb0usWYX8+Pi+3+c5FcDgbX2v8+98fwODpEqDLwKHfunqf03rT/5
 ji5cz62wda75iWvXTVSkFHUXR7V1Ldgky4qdfibab25AkHMy2MRfyc7Vltf36ZXTt5g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=STTw38Da; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E68E6084A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 18:18:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D13611A137B;
 Wed, 28 Oct 2026 18:18:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A4B7F60769;
 Wed, 28 Oct 2026 18:18:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 97014103290E8; Wed, 28 Oct 2026 19:18:38 +0100 (CET)
Date: Wed, 28 Oct 2026 19:18:37 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Gary Bisson <bisson.gary@gmail.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jezz@sysmic.org>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>, 
 Petr Vorel <petr.vorel@gmail.com>, Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, 
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Message-ID: <auI8BTyNtvmooUTW@windsurf>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <at0YSHfI0gcUfMtX@windsurf>
 <fceb1e19-e9d3-4342-b1c3-d10e175dc47d@broadcom.com>
 <auCcCZK-kGH25_uM@windsurf>
 <092b4771-dc93-49eb-9803-ccfcf9ccea2b@rnout.be>
 <8605bc8e-8711-4764-8262-f37a1f32adeb@broadcom.com>
 <auD5d-yrritLxAfN@windsurf>
 <d32b0f06-9105-4ee5-99ef-84a6fdda0e41@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d32b0f06-9105-4ee5-99ef-84a6fdda0e41@gmx.de>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 00/23] Support building the Linux kernel out
 of tree with LINUX_OVERRIDE_SRCDIR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMDk6MzI6NTVQTSArMDEwMCwgRmlvbmEgS2x1dGUgd3Jv
dGU6Cgo+IEkgbGlrZSBjb25zaXN0ZW5jeSB0b28sIGJ1dCBhbHNvIHJlYWwgcGFja2FnZXMgYXJl
IGEgbWVzcy4gQXMgeW91IGtub3cgSSd2ZQo+IGJlZW4gd29ya2luZyBvbiBwYWNrYWdlL2RyYWN1
dCBsYXRlbHkuIEl0J3MgYnVpbHQgYXMKPiAiaG9zdC1hdXRvdG9vbHMtcGFja2FnZSIuIEF1dG90
b29scyBoYXMgb3V0LW9mLXRyZWUgYnVpbGQgc3VwcG9ydCAoaXQncyBiZWVuCj4gYSB3aGlsZSBz
aW5jZSBJIHRlc3RlZCB0aGF0LCBidXQgaXQgd29ya2VkIHdlbGwpLiBFeGNlcHTigKYgRHJhY3V0
IGlzbid0Cj4gYWN0dWFsbHkgYW4gYXV0b3Rvb2xzIHBhY2thZ2UuIEp1c3QgY2xvc2UgZW5vdWdo
IHRoYXQgaXQgbW9zdGx5IHdvcmtzIHRoYXQKPiB3YXkgKGkuZS4gaXQgaGFzIGEgLi9jb25maWd1
cmUgc2NyaXB0OyBidXQgaXQgZG9lc24ndCBwcmVzZXJ2ZSBhbGwgdGhlCj4gZmxhZ3MsIHNlZSA0
NWFjYjI4MWNhYTlmYTMwNzk5NDI2YmE3ZWY0Njk0YzBiNjFmYTg1ICJwYWNrYWdlL2RyYWN1dDog
cGFzcwo+IEhPU1RfQ09ORklHVVJFX09QVFMgdG8gbWFrZSIpLgo+IAo+IEkgZmVhciB3ZSBtaWdo
dCBzdHVtYmxlIHVwb24gbW9yZSBvZiB0aGF0IGtpbmQgaWYgd2UgdHJ5IHRvIG1ha2UgYWxsCj4g
YXV0b3Rvb2xzIHBhY2thZ2VzIGJ1aWxkIG91dCBvZiB0cmVlLCB3aGV0aGVyICJub3QgYWN0dWFs
bHkgYXV0b3Rvb2xzIiBvcgo+ICJhdXRvdG9vbHMgd2l0aCB3ZWlyZCBjdXN0b20gaGFja3MiLiBE
b2Vzbid0IG1lYW4gSSdtIGZ1bmRhbWVudGFsbHkgYWdhaW5zdAo+IHRyeWluZywgYnV0IHdlIG5l
ZWQgdG8gYmUgcHJlcGFyZWQgZm9yIGlzc3VlcyBsaWtlIHRoYXQuIElmIHlvdSBkb24ndCBsaWtl
Cj4gbWFraW5nIGl0IG9wdC1pbiwgbWF5YmUgb3B0LW91dCBzbyB0aGVyZSBpcyBhIHF1aWNrIGZp
eCBmb3IgdHJvdWJsZXNvbWUKPiBwYWNrYWdlcz8gRXhjZXB0IGZvciAiZ2VuZXJpYyIsIGlyb25p
Y2FsbHkuIEkgZG9uJ3Qgc2VlIGFueSBnZW5lcmljIHNvbHV0aW9uCj4gdGhlcmUuCgpUd28gYXNw
ZWN0czoKCi0gUGFja2FnZXMgdGhhdCB1c2UgdGhlIGF1dG90b29scy1wYWNrYWdlIGluZnJhc3Ry
dWN0dXJlIGJ1dCBhcmUgbm90CiAgdHJ1bHkgYXV0b3Rvb2xzLWJhc2VkIHNob3VsZCBpbiBtb3N0
IGNhc2VzIHByb2JhYmx5IG5vdCB1c2UKICBhdXRvdG9vbHMtcGFja2FnZS4KCi0gSW4gYW55IGNh
c2UsIGV2ZW4gcHVyZSBhdXRvdG9vbHMtYmFzZWQgcGFja2FnZXMgY2FuIHBvdGVudGlhbGx5IGhh
dmUKICBvdXQtb2YtdHJlZSBidWlsZCBpc3N1ZXMuIFNvIG15IGlkZWEgd2FzIHRoYXQKICBwYWNr
YWdlL3BrZy1hdXRvdG9vbHMubWsgd291bGQgYnkgZGVmYXVsdCBlbmFibGVkIG91dC1vZi10cmVl
IGJ1aWxkCiAgZm9yIHBhY2thZ2VzIHRoYXQgdXNlIGF1dG90b29scy1wYWNrYWdlIGJ1dCBzdGls
bCBhbGxvdyBlYWNoCiAgaW5kaXZpZHVhbCBwYWNrYWdlIHRvIGRpc2FibGUgb3V0LW9mLXRyZWUg
YnVpbGQuIFRoZSBsb2dpYyB3b3VsZCBiZQogIHRoZSBvcHBvc2l0ZSBmb3IgZ2VuZXJpYy1wYWNr
YWdlOiB0aGUgaW5mcmFzdHJ1Y3R1cmUgd291bGQgYXNzdW1lCiAgb3V0LW9mLXRyZWUgaXMgbm90
IHN1cHBvcnRlZCBieSB0aGUgcGFja2FnZSwgYW5kIGdlbmVyaWMtcGFja2FnZQogIHBhY2thZ2Vz
IHN1cHBvcnRpbmcgb3V0LW9mLXRyZWUgd291bGQgaGF2ZSB0byBleHBsaWNpdGx5IGVuYWJsZSBp
dC4KCkJlc3QgcmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIg
YW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFu
ZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
