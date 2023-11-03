Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16155C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 07:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9352C8521E;
	Fri,  3 Nov 2023 07:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9352C8521E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_TFVjGUPmf8; Fri,  3 Nov 2023 07:11:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FBD985223;
	Fri,  3 Nov 2023 07:11:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FBD985223
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8137C1BF357
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 07:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37A284F338
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 07:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37A284F338
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JzNuZJltnvN9 for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 07:11:49 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D9AEA4F32C
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 07:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9AEA4F32C
Received: by mail.gandi.net (Postfix) with ESMTPSA id E33BD40006;
 Fri,  3 Nov 2023 07:11:45 +0000 (UTC)
Date: Fri, 3 Nov 2023 08:11:45 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231103081145.7b5eb9c1@bootlin.com>
In-Reply-To: <20231102210704.4817-1-fontaine.fabrice@gmail.com>
References: <20231102210704.4817-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698995506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vXpAEEt1naRZWE3EVqS/59uZPKG0ojBOho+LBIlBWBY=;
 b=No/jmOyWMR/vMfdiUBycasb8I3fiNwdNt8O3odHsXol9W2Gi5a+VfnyYQ04mvkRLbo0bhO
 uiyx9Sg0v04Y1np3whb4iShvXq+BHehNdHANJvjrodGaBeqBYTwPwB5wDU2W+v6lOFumah
 Mb0CY4Wg4xzoJ0cCHPxOS5/vjoXaVk914f+Pp1cNpIx4S2rs7LuYcQOqchHl1MGEm2H9ux
 ANrRAlXbKFd//Akam3CmoepITuhYs2DPNVrZbJ0CLHnPo5JKrQRNYplvWH3JyIiIEE5yEn
 ALZkCqgTPfsv7rAJU81ersCck4yVxPENxLoYSmdfEOaLq21ZkwSPPIwIE6FSYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=No/jmOyW
Subject: Re: [Buildroot] [PATCH 1/1] package/dtbocfg: bump to version 0.1.0
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAgMiBOb3YgMjAyMyAyMjowNzowNCArMDEwMApGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFRoaXMgYnVtcCB3aWxsIGZpeCB0aGUg
Zm9sbG93aW5nIGJ1aWxkIGZhaWx1cmUgd2l0aCBrZXJuZWwgPj0gNi42IHRoYW5rcwo+IHRvCj4g
aHR0cHM6Ly9naXRodWIuY29tL2lrd3ptL2R0Ym9jZmcvY29tbWl0LzM2ZTlkYWQ3YmRlZGM0M2I5
YzYzYWE0OGMzZmM0OGZmYzRkMmIyZGQ6Cj4gCj4gL2hvbWUvdGhvbWFzL2F1dG9idWlsZC9pbnN0
YW5jZS0zL291dHB1dC0xL2J1aWxkL2R0Ym9jZmctMC4wLjkvLi9kdGJvY2ZnLmM6IEluIGZ1bmN0
aW9uIOKAmGR0Ym9jZmdfb3ZlcmxheV9pdGVtX2NyZWF0ZeKAmToKPiAvaG9tZS90aG9tYXMvYXV0
b2J1aWxkL2luc3RhbmNlLTMvb3V0cHV0LTEvYnVpbGQvZHRib2NmZy0wLjAuOS8uL2R0Ym9jZmcu
Yzo2ODoxOTogZXJyb3I6IHRvbyBmZXcgYXJndW1lbnRzIHRvIGZ1bmN0aW9uIOKAmG9mX292ZXJs
YXlfZmR0X2FwcGx54oCZCj4gICAgNjggfCAgICAgICAgIHJldF92YWwgPSBvZl9vdmVybGF5X2Zk
dF9hcHBseShvdmVybGF5LT5kdGJvLG92ZXJsYXktPmR0Ym9fc2l6ZSwgJm92Y3NfaWQpOwo+ICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAKPiBodHRwczov
L2dpdGh1Yi5jb20vaWt3em0vZHRib2NmZy9jb21wYXJlL3YwLjAuOS4uLnYwLjEuMAo+IAo+IEZp
eGVzOgo+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2U1YmFlN2Zh
NTU1ODgwMWMzOWY1M2E0YTE1YWM1NTBjMzg1NTMyMmUKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJy
aWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtLS0KPiAgcGFja2Fn
ZS9kdGJvY2ZnL2R0Ym9jZmcuaGFzaCB8IDIgKy0KPiAgcGFja2FnZS9kdGJvY2ZnL2R0Ym9jZmcu
bWsgICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpBY2tlZC1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+
CgpSZWdhcmRzLApIZXJ2w6kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
