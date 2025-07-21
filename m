Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5BADC87FC5
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 08:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B19861CBA;
	Mon, 21 Jul 2025 08:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FctKmc4G2nNS; Mon, 21 Jul 2025 08:20:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA02861B3D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA02861B3D;
	Mon, 21 Jul 2025 08:20:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19D5CDA
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C14D41EC1
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGG5eVzmCX6F for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 08:20:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BA33541EBE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA33541EBE
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA33541EBE
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 08:20:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72461431F3;
 Mon, 21 Jul 2025 08:20:24 +0000 (UTC)
To: buildroot@buildroot.org,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Olivier Benjamin <olivier.benjamin@bootlin.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Date: Mon, 21 Jul 2025 10:20:23 +0200
Message-ID: <5695924.rdbgypaU67@booty>
Organization: Bootlin
In-Reply-To: <20250709-perf_libtraceevent-v2-2-3ea54fbe6b5b@bootlin.com>
References: <20250709-perf_libtraceevent-v2-0-3ea54fbe6b5b@bootlin.com>
 <20250709-perf_libtraceevent-v2-2-3ea54fbe6b5b@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejudehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkohgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfggedvgeelheehheekudfhheevgfeivdejtdfhkeeijedtvdehtddujeeufeelnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrs
 hdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopeholhhivhhivghrrdgsvghnjhgrmhhinhessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753086024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4O84ltsjJ0phFQtVoYh9lGjqLUyGc4Nru3xR46NEyd4=;
 b=fsEuG3ayKfwhlbYeOriSNs7r6hCVr/yh2P0whyUxE+j/+Cq2ywT71fGVTCECBvRXoEzCcD
 fqNQzkHYXRZZXh5Z5BljxISp9PmlWNBGWyNtwhDl8n3hiewLJWgY/Uvk6FlJsii5ed51yK
 Ef+VSSM5G43HzivI5N+uHilke27L8PMWbmkxLrTHPA9b67GGjYhPGCEYGvjN89uWlcWQ5E
 PKIwPNuO6+o93ZtyScWed5q5jJWnjAbZ1A4aebB8JrxJEd/+XvPPJRmueJTxoLSfnEt2dw
 V5tojaXTaPZaH83qdchrS7ij7aqCc1msbxyFzWkZbGec/4BfFCZEYtAhHbLMcQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fsEuG3ay
Subject: Re: [Buildroot] [PATCH v2 2/2] packages/linux-tools: perf: enforce
 PKG_CONFIG_LIBDIR
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gbWVyY29sZWTDrCA5IGx1Z2xpbyAyMDI1IDE3OjA0OjE1IE9yYSBsZWdhbGUgZGVsbOKAmUV1
cm9wYSBjZW50cmFsZSAKQWxleGlzIExvdGhvcsOpIHdyb3RlOgo+Rm9yIGtlcm5lbCBwYXRjaGVk
IHdpdGggNDQwY2Y3NzYyNWUzICgicGVyZjogYnVpbGQ6IFNldHVwCj5QS0dfQ09ORklHX0xJQkRJ
UiBmb3IgY3Jvc3MgY29tcGlsYXRpb24iKSwgaWYgbmVpdGhlcgo+UEtHX0NPTkZJR19MSUJESVIs
IFBLR19DT05GSUdfUEFUSCBub3IgUEtHX0NPTkZJR19TWVNST09UX0RJUiBhcmUKPnByb3ZpZGVk
LCB0aGUgcGVyZiBNYWtlZmlsZSB3aGlsZSB0cnkgdG8gc2V0IHNvbWUgZGVmYXVsdCB2YWx1ZSBm
b3IKPlBLR19DT05GSUdfTElCRElSLCB3aGljaCB3aWxsIG5vdCBwb2ludCBjb3JyZWN0bHkgdG8g
YnVpbGRyb290IHN0YWdpbmcKPmRpcmVjdG9yeS4gVGhpcyBpc3N1ZSB3aWxsIGxlYWQgZm9yIGV4
YW1wbGUgdG8gYSBmYWlsdXJlIHRvIGZpbmQKPmxpYnRyYWNlZXZlbnQgZXZlbiBpZiBpdCBpcyBj
b3JyZWN0bHkgZW5hYmxlZCBhbmQgaW5zdGFsbGVkIGluIHRoZQo+c3RhZ2luZyBkaXIsIGFuZCBz
byBpdCB3aWxsIG1ha2UgcGVyZiBmYWlsIHRvIGJ1aWxkLgo+Cj5NYWtlIHN1cmUgdG8gY2FsbCB0
aGUgcGVyZiBtYWtlIGNvbW1hbmQgd2l0aCBQS0dfQ09ORklHX0xJQkRJUiB2YXJpYWJsZQo+c2V0
IGFuZCBwb2ludGluZyB0byBidWlsZHJvb3Qgc3RhZ2luZyBhcmVhIHRvIG1ha2Ugc3VyZSB0byBw
cm9wZXJseQo+ZGV0ZWN0IHBlcmYgZGVwZW5kZW5jaWVzLgo+Cj5TaWduZWQtb2ZmLWJ5OiBBbGV4
aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgoKUmV2aWV3ZWQtYnk6IEx1
Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+ClRlc3RlZC1ieTogTHVjYSBD
ZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4KCkx1Y2EKCi0tIApMdWNhIENlcmVz
b2xpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6
Ly9ib290bGluLmNvbQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
