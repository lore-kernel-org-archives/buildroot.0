Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937B8CFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 21:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DE6A4093B;
	Sun, 30 Nov 2025 21:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GzJilMjm7SCj; Sun, 30 Nov 2025 21:40:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8133F40936
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8133F40936;
	Sun, 30 Nov 2025 21:40:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C7FA41A9
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 21:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9EF64042D
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 21:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-4713XHga8F for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 21:40:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AFFB240421
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFFB240421
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AFFB240421
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 21:40:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5E66C4E41999
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 21:40:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 17EC260706;
 Sun, 30 Nov 2025 21:40:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 34C53119110F0; Sun, 30 Nov 2025 22:40:33 +0100 (CET)
Date: Sun, 30 Nov 2025 22:40:33 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20251130224033.2217c470@windsurf>
In-Reply-To: <20251130074836.4220-2-bernd@kuhls.net>
References: <20251130074836.4220-1-bernd@kuhls.net>
 <20251130074836.4220-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764538837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=F8/IJLCNZaFDJYLyQBRFTDVPpDVCiFHTBWgBXUOFsCc=;
 b=EkRDJFB5UaPPrQ7vXbRLsopxDMuJsWx1sAhkQCLLRGBDxJXDptX52+VupSw4p8kHmGpfpw
 PS003fWsJGdHO71AsrRTch5DRKlo9rI7bT+1nDCkvZHmf1kpG3SL0CKzeQrmZdh9C3Me9E
 vbIWxlYWDVWwI7jA6iD944QVixe8ExtXjOqOIgwO88PIh8zhA+ohbdts/vau8MU5PS/ul0
 bGxY9icfN8YVO9jHkewUa65szGaQZgwZWsp/QWU5FNPtpGXWLi19Tq0AROITXSJGDQxWY+
 q6zINm9z1UMJEyQQ5RmAXxqPeRq5hVkAiJwCCV+JN8SPkKnuHJ3Ysk+rhgP8Fg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EkRDJFB5
Subject: Re: [Buildroot] [PATCH 2/4] package/wireplumber: mark broken on
 uClibc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAzMCBOb3YgMjAyNSAwODo0ODozNCArMDEwMApCZXJuZCBLdWhscyA8YmVybmRAa3Vo
bHMubmV0PiB3cm90ZToKCj4gLi4vbGliL3dwL2xvZy5jOjc4MDo0OTogZXJyb3I6IGltcGxpY2l0
IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGdldHRpZOKAmTsKPiAgZGlkIHlvdSBtZWFuIOKA
mGdldGdpZOKAmT8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4gICA3ODAgfCAg
IGdfYXV0b2ZyZWUgZ2NoYXIgKnRpZCA9IGdfc3RyZHVwX3ByaW50ZigiJWQiLCBnZXR0aWQoKSk7
Cj4gCj4gRHVlIHRvIGJ1aWxkIGVycm9ycyB3aXRoIHBpcGV3aXJlIHRoaXMgZXJyb3Igd2FzIG5v
dCBmb3VuZCBieSB0aGUKPiBhdXRvYnVpbGRlcnMuCgpJcyB0aGlzIGlzc3VlIG5ldyB3aXRoIHRo
ZSBidW1wIHRvIDEuNC45ID8gT3IgaXQgYWxyZWFkeSBleGlzdHMgd2l0aAp0aGUgY3VycmVudCAx
LjIuOCB2ZXJzaW9uIHdlIGhhdmUgaW4gQnVpbGRyb290ID8gT3IgaXQgZGlkIGV4aXN0IHdpdGgK
MS4yLjgsIGJ1dCB3YXMgaGlkZGVuIGJ5IG90aGVyIGJ1aWxkIGlzc3VlcyBlYXJsaWVyID8KClRo
b21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jv
b3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
