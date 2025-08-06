Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFEDC87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 10:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 189A9610A7;
	Wed,  6 Aug 2025 10:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pIC1wqeVGhAL; Wed,  6 Aug 2025 10:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 354E460E8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 354E460E8E;
	Wed,  6 Aug 2025 10:35:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3142E31
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17E1F60E01
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qHLb4av21P8 for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 10:35:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1DE1260F69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DE1260F69
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DE1260F69
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 10:35:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE07E43280;
 Wed,  6 Aug 2025 10:35:38 +0000 (UTC)
Date: Wed, 6 Aug 2025 12:35:37 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: <buildroot@buildroot.org>, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
Message-ID: <20250806123537.16a594a3@windsurf>
In-Reply-To: <DBV97YP0K6IX.5WJ4MF4JBM8H@bootlin.com>
References: <20250806-php-lua-v1-1-e1f524fed0a5@bootlin.com>
 <20250806105707.3db4f1e8@windsurf>
 <DBV97YP0K6IX.5WJ4MF4JBM8H@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudejkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhto
 hephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754476539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQB1i8GmU1/LQxYfjYNWFEUpRT89ntBPGyaN5Ac26a8=;
 b=FiBGnH2xC4eUIP2f0OMh6GzoGPvfOipRU7HpzNIva9ZG9dG+11p7+hCvctJeBpsjnABtOy
 atfWxh9Bfm150ULIUCsscpOEOuRD5Fctt1eHOKqrJMz/qWKgIkYZyj3iAD1uUZBv8HE+2i
 VnxnPhuRMpCbd8XIhLMTuxRLb2BeryEugQh7Lqo+9uWV+3gCMgrATzx3vKhsbSg2ynVnf9
 jyZTUfwzKKqM0m1TQxZmsa+j3Pzk4cBEpgjG7mA5s4sOeea7NCDDKLuhP8Yxrt+oxixp7O
 KM0ObOXYUmtyWz+Ivtxm9ouIiD3ZSF//QCpoJVLKUduLKAfmy/A4bWL3Dz6Mzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FiBGnH2x
Subject: Re: [Buildroot] [PATCH] package/php-lua: fix build with GCC14
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

SGVsbG8gQWxleGlzLAoKT24gV2VkLCAwNiBBdWcgMjAyNSAxMTo1Nzo0NSArMDIwMApBbGV4aXMg
TG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gPiBBbHNvLCBk
byB5b3Uga25vdyB3aGF0IGNhdXNlZCB0aGUgZmFpbHVyZT8gSSB3b3VsZCBzdXNwZWN0IGFuIHVw
ZGF0ZSBvZgo+ID4gUEhQLiAgCj4gCj4gSWYgSSB0cnVzdCB0aGUgdXBzdHJlYW0gcGVuZGluZyBQ
UiwgdGhlIGZhaWx1cmUgaXMgZHVlIHRvIGNvbW1pdAo+IDkxZWY0MTI0ZTU2YSAoIlJlZmFjdG9y
IHplbmRfb2JqZWN0X2hhbmRsZXJzIEFQSSB0byBwYXNzIHplbmRfb2JqZWN0KiBhbmQKPiB6ZW5k
X3N0cmluZyogaW5zdGVkIG9mIHp2YWwocykuIikgaW4gdXBzdHJlYW0gUEhQIHByb2plY3QuIEkg
ZmFpbCB0byBmaW5kCj4gdGhlIGNvcnJlc3BvbmRpbmcgZW50cnkgaW4gYW55IFBIUCBjaGFuZ2Vs
b2csIGJ1dCBmb2xsb3dpbmcgdGhlIGdpdAo+IGhpc3RvcnksIHRoaXMgaGFzIGJlZW4gaW50cm9k
dWNlZCB3aXRoIFBIUCA4LjAuMC4gSSB0cmllZCB0byBxdWlja2x5IHJldmVydAo+IHRvIFBIUCA3
LjQuMjAsIGJ1dCB0aGlzIHZlcnNpb24gZG9lcyBub3QgZXZlbiBidWlsZCBhbnltb3JlIG9uCj4g
Y3VycmVudCBCUiAodW5yZWxhdGVkIGJ1aWxkIGZhaWx1cmVzKQo+IAo+IEhvd2V2ZXIgSSBvYnNl
cnZlIHRoYXQgaWYgSSBzd2l0Y2ggZnJvbSBCb290bGluICdibGVlZGluZyBlZGdlJyB0b29sY2hh
aW4KPiB0byAnc3RhYmxlJyB0b29sY2hhaW4sIHBocC1sdWEgYnVpbGQgc3VjY2VlZHMgb24gbWFz
dGVyLiBTbyBJIGd1ZXNzIHRoaXMKPiBpc3N1ZSBpcyBhIG1peCBvZiBBUEkgY2hhbmdlIGFuZCBj
b21waWxlciB1cGRhdGUuIFdoZW4gdXNpbmcgdGhlIHN0YWJsZQo+IHRvb2xjaGFpbiwgSSBzZWUg
dGhlIHdhcm5pbmcgdGhhdCBtYXRjaGVzIHRoZSBlcnJvciBJIHNlZSB3aGVuIHVzaW5nIHRoZQo+
IGJsZWVkaW5nLWVkZ2UgdG9vbGNoYWluICgtV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzKQoK
QXMgcG9pbnRlZCBvdXQgaW4gbXkgb3RoZXIgZS1tYWlsIHJlcGx5aW5nIHRvIHlvdXIgb3RoZXIg
cGF0Y2gsIHRoaXMKZGVmaW5pdGVseSBzb3VuZHMgbGlrZSBhIEdDQyAxNS54IHJlbGF0ZWQgaXNz
dWUsIHdoZXJlIEdDQyAxNS54IGVuYWJsZWQKbW9yZSBjaGVja3MsIGNhdXNpbmcgYSBoYXJkIGJ1
aWxkIGZhaWx1cmUgd2hlcmUgInNpbXBsZSIgd2FybmluZ3Mgd2VyZQplbWl0dGVkIGVhcmxpZXIu
CgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6
Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
