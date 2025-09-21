Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E87CAC5A7
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 12:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F3FA4141D;
	Sun, 21 Sep 2025 12:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jO2stGLTxKaL; Sun, 21 Sep 2025 12:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44C3641417
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44C3641417;
	Sun, 21 Sep 2025 12:39:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D6ECD3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 12:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43C5360A78
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 12:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n83T2hSBvblm for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 12:39:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D01A6073D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D01A6073D
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D01A6073D
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 12:39:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id EA3DF580019
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 12:39:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F82443B1F;
 Sun, 21 Sep 2025 12:39:16 +0000 (UTC)
Date: Sun, 21 Sep 2025 14:39:06 +0200
MIME-Version: 1.0
Message-Id: <20250921-fix_doc_dead_link-v1-1-4f39903e93c7@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAOrxz2gC/x2MXQqAIBAGrxL7nJBi9HOVCAn3q5bCQiGC6O5Jj
 wMz81BCFCTqi4ciLklyhAy6LMivU1ighDOTqUxddUarWW7Hh3eMid0uYVMeHdiitboxlLszIkv
 /cxjf9wP7dZmHYwAAAA==
X-Change-ID: 20250921-fix_doc_dead_link-ce9ed4e84172
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehgeellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteegtdegfedtkeetieehkeehhfevieffueefvefgjeegvdehleffieehtedvgfdunecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgess
 ghoohhtlhhinhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1758458356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VitV9a3GMbz6gBFUGe7se6HwDr/kMvqiesk54xONwhI=;
 b=GYgmnwVN0wBd0CDTTgRRu+FHdqVaRpXM41w/ZeroSrmQiKTni29PsSBIw8uBBHWck8uBR4
 xLQHqLa1DNaV3Jl5Joqs2g1Cr6HhzPHNPa53R5dz/d0wlo1t1ObepSas2e0nVETJTPJcmv
 yNaR29l8euJz4zF9OVfAac5/ICkE1Es64XWn2l1kVprPfsxf9Bmrf/MpPpE6NOHmy7A0oG
 myiBNouowef50bmK6DlPoPDfx/0S5ushhR5dZUSZoXzsRSico/0hH232CTsQAXBeZnk5+O
 pq+BqCpwy8etmBGTKJQccSSEy1WqPGxfo4xjrW0U4UD2P+reziQjQ3U4B4bEKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GYgmnwVN
Subject: [Buildroot] [PATCH] docs/manual/getting: fix dead link
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hlbiBzZWFyY2hpbmcgZm9yIHRoZSBvZmZpY2lhbCBnaXQgcmVwb3NpdG9yeSBpbiB0aGUgZG9j
dW1lbnRhdGlvbiwKcmVhZGVycyBhcmUgZm9yd2FyZGVkIHRvIHRoZSBidWlsZHJvb3Qgd2Vic2l0
ZSBEb3dubG9hZCBwYWdlIHdpdGggYSBsaW5rCnBvaW50aW5nIHRvIGJ1aWxkcm9vdC5vcmcvZG93
bmxvYWQsIHdoaWNoIHJldHVybnMgYSA0MDQuCgpGaXggdGhlIGRlYWQgbGluayBieSBhZGRpbmcg
dGhlIG1pc3NpbmcgLmh0bWwgc3VmZml4LgoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOp
IDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCiBkb2NzL21hbnVhbC9nZXR0aW5nLmFk
b2MgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kb2NzL21hbnVhbC9nZXR0aW5nLmFkb2MgYi9kb2NzL21hbnVhbC9nZXR0
aW5nLmFkb2MKaW5kZXggNTFjOTdkNTc5MzEwNTgwODJiNDI2ZDE5YjViZWY2Yzc0ZDFmOGE1ZC4u
MTQzN2EzY2NlZjIzNDk5NjU3MTBlNzg1YTg3ZjA3ODIyNDAyNWI1ZCAxMDA2NDQKLS0tIGEvZG9j
cy9tYW51YWwvZ2V0dGluZy5hZG9jCisrKyBiL2RvY3MvbWFudWFsL2dldHRpbmcuYWRvYwpAQCAt
MzIsNSArMzIsNSBAQCB2YWdyYW50IHVwCiAKIElmIHlvdSB3YW50IHRvIGZvbGxvdyBkZXZlbG9w
bWVudCwgeW91IGNhbiB1c2UgdGhlIGRhaWx5IHNuYXBzaG90cyBvcgogbWFrZSBhIGNsb25lIG9m
IHRoZSBHaXQgcmVwb3NpdG9yeS4gUmVmZXIgdG8gdGhlCi1odHRwOi8vYnVpbGRyb290Lm9yZy9k
b3dubG9hZFtEb3dubG9hZCBwYWdlXSBvZiB0aGUgQnVpbGRyb290IHdlYnNpdGUKK2h0dHA6Ly9i
dWlsZHJvb3Qub3JnL2Rvd25sb2FkLmh0bWxbRG93bmxvYWQgcGFnZV0gb2YgdGhlIEJ1aWxkcm9v
dCB3ZWJzaXRlCiBmb3IgbW9yZSBkZXRhaWxzLgoKLS0tCmJhc2UtY29tbWl0OiA1ZDJhYmRjNjZj
YTY4N2M5MjZlMWM0NTQ2YzEyYWNhN2Y3ZDcyY2E0CmNoYW5nZS1pZDogMjAyNTA5MjEtZml4X2Rv
Y19kZWFkX2xpbmstY2U5ZWQ0ZTg0MTcyCgpCZXN0IHJlZ2FyZHMsCi0tIApBbGV4aXMgTG90aG9y
w6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczov
L2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
