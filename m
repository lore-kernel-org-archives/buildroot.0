Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F66FC43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 11:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 173AC40538;
	Sun, 12 Jul 2026 11:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMtVCx4bKtMq; Sun, 12 Jul 2026 11:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 440594054C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783855537;
	bh=8y8CHkUJ2pdVaxMDyk9XXqFjk3KdF2DkpRLznWFFIq8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZPNEsoVIwpZhz4YLeOyWG3rNizeG2S7WHNT9e/+mfSU5m/oTd4ebeWKfMWhPqWFzF
	 ndUny6J95kkeN82h00uU18GzAnceB+t3Etp5DYnQnZaLSZ50gA7t9mMl0ea6K+IvBm
	 d9GJiDH85FtiMNL68C+M2SesLqCiOUha7eyL/BSFEwAk81igeGiToFHCHdBd1QB/nO
	 H1n5b3113H3cTkXp0Sf/lGGp8guKgPpiyt8/4xXmIAAhqKPM5OUjdsqXB4NPzZ8qjE
	 S76bG395rgPaOqCOftHJoxqBImoaWrk1KcuK5oerM60IUoy8ioj2PjcVFacFo2TNyc
	 xU9TW4nv+W/tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 440594054C;
	Sun, 12 Jul 2026 11:25:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3471B359
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D060814E2
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6tSXujJOUVFD for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 11:25:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1BF1814C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1BF1814C0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1BF1814C0
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 11:25:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C18F513F854;
 Sun, 12 Jul 2026 13:25:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jul 2026 13:25:26 +0200
MIME-Version: 1.0
Date: Sun, 12 Jul 2026 13:25:26 +0200
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
Cc: buildroot@buildroot.org, Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260604-mp1_update-v1-1-c54c7f5b6be0@gmail.com>
References: <20260604-mp1_update-v1-1-c54c7f5b6be0@gmail.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <a18fc5dadd86a46069f220c3e0ef5cf4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783855531;
 bh=KHhuH6hyh7uj+jSaboYovIdB96i8wXDUXVaOuZy05MA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uy16Cpm3KChHtjBuoksFqDrcK8uPbZUr0JFQ9jBdy6mn25MLaOhyzS9Z4T8402NsW
 sq161A/mq6bXVflKU8aDytVzRo2NGzKDpCfQ05Ti/OY0pLtB9MzrJe5qO1T4Lchu1E
 0dxZ0JZiNz2MOFzpfwFRoijVz7orwos/aF/FjcSa60X/6UFDanp+/dmxPWhqaF59wW
 FFi2bx1zenQVYBVnraNOyqkiev06DyBcxtoNQufp8yOW1+N8wXMbjkX9HEc2RbuzII
 D+Z1eEdnHxKJYqtC2+BlCBv3B/QxbZbZmXFmSYVmI9hVayUqGZIqkK7HChRsEq7T3g
 gYnOOV0f7PI0Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=uy16Cpm3
Subject: Re: [Buildroot] [PATCH] configs/stm32mp1*_dk*: bump OP-TEE to 4.9.0
 and TF-A to LTS 2.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDQvMDYvMjAyNiAxNjozMywgUmFwaGHDq2wgR2FsbGFpcy1Qb3Ugd3JvdGU6Cj4gQnVtcCBU
Ri1BIExUUyBMVFMgdmVyc2lvbiB0byAyLjEyIGZvcjoKPiAKPiAtIHN0bTMybXAxMzVmX2RrX2Rl
ZmNvbmZpZwo+IC0gc3RtMzJtcDE1N2FfZGsxX2RlZmNvbmZpZwo+IC0gc3RtMzJtcDE1N2NfZGsy
X2RlZmNvbmZpZwo+IAo+IEJ1bXAgdGhlIE9QLVRFRSB2ZXJzaW9uIHRvIDQuOS4wIGZvcjoKPiAK
PiAtIHN0bTMybXAxMzVmX2RrX2RlZmNvbmZpZwo+IAo+IFRlc3RlZCBvbiBTVE0zMk1QMTM1Ri1E
SyBhbmQgU1RNMzJNUDE1N0MtREsyIGJvYXJkcy4KWy4uLl0KPiBTaWduZWQtb2ZmLWJ5OiBSYXBo
YcOrbCBHYWxsYWlzLVBvdSA8cmdhbGxhaXNwb3VAZ21haWwuY29tPgoKQXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KCkZvciBpbmZvLCBJIGNoYW5nZWQgdGhlIHVib290IGJ1aWxkIGVycm9yIGxv
ZyB0byBlbmdsaXNoIGluIGNvbW1pdCBsb2cuCkkgYWxzbyBhZGRlZCBCUjJfVEFSR0VUX1VCT09U
X05FRURTX0RUQz15IGluIHN0bTMybXAxNTdjX2RrMl9kZWZjb25maWcuClNlZToKaHR0cHM6Ly9n
aXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0L2ZlODIyMWZiNGUwMDNi
ZjAyMGI2ODE3YjdmMzM3NjQyMDllZDBiNTkKCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
