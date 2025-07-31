Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8738C87FCA
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 14:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C00D61AE2;
	Thu, 31 Jul 2025 14:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbdFXwIl8LFa; Thu, 31 Jul 2025 14:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C46D9612AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C46D9612AD;
	Thu, 31 Jul 2025 14:39:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5543C13D
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 14:39:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B5E560D69
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 14:39:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8wboL99l4p3 for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 14:39:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5CB0C60BD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5CB0C60BD3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5CB0C60BD3
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 14:39:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CF9144427;
 Thu, 31 Jul 2025 14:39:25 +0000 (UTC)
Date: Thu, 31 Jul 2025 16:39:23 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: <tim.hammer@nav-timing.safrangroup.com>,
 <nicolas.carrier@nav-timing.safrangroup.com>, <buildroot@buildroot.org>
Message-ID: <20250731163923.3d7a5eff@windsurf>
In-Reply-To: <DBQ9NNWKH3VS.KK3SWYJH4GQY@bootlin.com>
References: <20250730-openscap-v1-0-46e4a32e26da@bootlin.com>
 <20250730-openscap-v1-3-46e4a32e26da@bootlin.com>
 <20250730190231.51e0715e@windsurf>
 <DBQ8SCGP37TS.2V8HRWA7RWPTW@bootlin.com>
 <20250731144852.25bb9e9e@windsurf>
 <DBQ9NNWKH3VS.KK3SWYJH4GQY@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutddutdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtihhmrdhhrghmmhgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgr
 hhouhhprdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753972765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5hhJbpsk+HV8bCR+oDod/fMY+o2B23v7uUEN5ENUYL8=;
 b=LEGW4Y3iFRrLMMm91CsW8iCmfxFQfyyfXNVdNm6+J9wmSytPws4MNr/KuTCpjG2QAmwqme
 DCoepnRZ4zb1rraoOMzCLfwWH3GIJB9DFKAGDOqY0Rr1HTrZOprAIdK8iScmbosZfYwtdJ
 GcWNJPquAP3g1pEvovdpeyKCxzIXOCgFfcWj8dYOvfrpXKhFbL15Y9yBVNNEJhxc1/12D4
 x3jjFxwlZmYUx3x9NuZA8tYujqyEo6b7o79bzwegLzThB+ugwmDsgVK58pPArI3gVndA3K
 pJlxAvuptrbI9ow/xlqDKf5oF19Z4jy/PKPS58a6pBKUu0k/tpt7bzkGA7Izug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LEGW4Y3i
Subject: Re: [Buildroot] [PATCH 3/4] package/openscap: add openscap package
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

T24gVGh1LCAzMSBKdWwgMjAyNSAxNToxNDo1NiArMDIwMApBbGV4aXMgTG90aG9yw6kgPGFsZXhp
cy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gQXMgc2hvd25lZCBpbiB0aGUgc2FtcGxl
IGFib3ZlOiB5ZXMsIGJvdGggYXJlIG5lZWRlZCwgT3BlblNTTCBiZWNhdXNlIGl0IGlzCj4gYSBo
YXJkIGRlcGVuZGVuY3kgaW4gQ01ha2VMaXN0cy50eHQgKHRlc3RlZCBieSByZW1vdmluZyBsaWJz
c2wtZGV2IGZyb20gbXkKPiB0ZXN0aW5nIGVudiwgaXQgaW5kZWVkIGZhaWxzIHRvIGNvbmZpZ3Vy
ZSB0aGUgcHJvamVjdCwgYW5kIHRoZXJlIGlzIG5vCj4gb3B0aW9uIHRvIGRpc2FibGUgaXQpLCBh
bmQgbGliZ2NyeXB0LCBiZWNhdXNlIGxpbmthZ2Ugd2lsbCBmYWlsIG90aGVyd2lzZS4KCkZhaXIg
ZW5vdWdoLCB0aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiEKClRob21hcwotLSAKVGhvbWFzIFBl
dGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2Vy
bmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
