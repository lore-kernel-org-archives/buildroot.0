Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06548C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 09:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B707360BF1;
	Fri,  3 Nov 2023 09:33:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B707360BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sxDdm6nAcX6V; Fri,  3 Nov 2023 09:33:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEDD56FAE2;
	Fri,  3 Nov 2023 09:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEDD56FAE2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14CD01BF27E
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D742E4F333
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D742E4F333
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eN6jqrob-_tP for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 09:32:31 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B56A94F32B
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 09:32:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B56A94F32B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 897D5E000A;
 Fri,  3 Nov 2023 09:32:27 +0000 (UTC)
Date: Fri, 3 Nov 2023 10:32:26 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231103103226.6e232b18@windsurf>
In-Reply-To: <20231102210704.4817-1-fontaine.fabrice@gmail.com>
References: <20231102210704.4817-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699003947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RuyowgrgcIynJyIVjOaWcFDw90GtiVp3bvcO7egOeS0=;
 b=W0cRGiy82Io2wFCwufcwDqtJATkYkLz4gvNB8tvaJAO+NnSAP1bk+YBEoIiZMfoPtsxyJa
 Z3hV+wUxwb+PdS8hupHZkUZSqQ1ul1q+xJuqXVeNg7kbbBJHEgUWfnGQf0f8waGyNxRR68
 YwhLJF6O7eplI+UNrwY/bUje7Ck3XxLJ7iig0UjbP1mlHsUqx4BMrq9YJPmAPVbCwVqO3y
 42uYGAZ4QtXcv/W08C93/mW9PxL36TVEu4fKf5uV4oSAIwr2/rLZd/STpInnZxbm+PACmA
 kDvpWS5+hZ/MJOFgSHKL4okk0vrI0lc2gUJwiPHcv310zmDcrw5nqY2ouKKSdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=W0cRGiy8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 buildroot@buildroot.org
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
b25zKC0pCgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0
YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
ZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
