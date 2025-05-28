Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3562C3ABB2
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 14:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 175204085F;
	Wed, 28 May 2025 14:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKpVEpu2byFE; Wed, 28 May 2025 14:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 700EF40860
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 700EF40860;
	Wed, 28 May 2025 14:56:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 13F57B66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0598880BAE
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nc4EtJuzJyBO for <buildroot@buildroot.org>;
 Wed, 28 May 2025 14:56:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8CB780B9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8CB780B9C
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8CB780B9C
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:56:51 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 0C3EF585C7B
 for <buildroot@buildroot.org>; Wed, 28 May 2025 14:28:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4D24043A33;
 Wed, 28 May 2025 14:28:51 +0000 (UTC)
Date: Wed, 28 May 2025 16:28:45 +0200
Message-Id: <20250528-fix_license-v1-0-b59a638b0495@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ0dN2gC/x2MQQqAIBAAvyJ7TjDFrL4SEaFrLYSFCxGEf086D
 sPMC4yZkGEUL2S8ielMFdpGgN/XtKGkUBm00lZZ7WSkZznIY2KUsVfGddrY4AeoxZWx6v82zaV
 8jXQwF10AAAA=
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alistair Francis <alistair@alistair23.me>, Dick Olsson <hi@senzilla.io>, 
 Etienne Carriere <etienne.carriere@foss.st.com>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Simon Dawson <spdawson@gmail.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvfeehtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpefmohhrhicuofgrihhntggvnhhtuceokhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudeggfduffethfdtgeehtdeiieeuveelleduieeiteejkeetheelheefteeugfegnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomhepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgvohhmrghtshhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlihhsthgrihhrsegrlhhishhtrghir
 hdvfedrmhgvpdhrtghpthhtohepvghtihgvnhhnvgdrtggrrhhrihgvrhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehsphgurgifshhonhesghhmrghilhdrtghomhdprhgtphhtthhopehhihesshgvnhiiihhllhgrrdhioh
X-GND-Sasl: kory.maincent@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1748442531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KCESTELjjyKgftH0O9dBn1Ogxxrsxw9uVZUyIo6MSIo=;
 b=WLLUwFACSA/ypsExFXKVwK1ioaNkED1NQqIBR/ZvlbMmvG39KSniEXzjyLs31nlfBxz5qW
 lWZ3T8BBP5FwQni6Ut+CRCjuwY5k5/ly4geXXpOizwdnT4Fp/4gEBP5QqETuAqDqcbRgvW
 Gwz5f/QTOi6cE7K0ndE80W+imkYAsHDguGwFBcbQkIHX7O8Hl2/j5IwWVZKKHm0kye6Tof
 VZYe4ooZQz3WHdzY5pNsyrAH6/oD6tYlC7JbWzxF6R92MOXIH7jVlPax46mCPUbyeByYrS
 pMGQ27ISBleYSlfWdupeLKsncvqL506gFIPOiS2IOIR8Z+tfX3XzgiFSFd+/dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WLLUwFAC
Subject: [Buildroot] [PATCH 0/7] Add support for custom license files path
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2V2ZXJhbCBwYWNrYWdlcyB3ZXJlIG5vdCBwcm92aWRpbmcgYW55IGxpY2Vuc2UgZmlsZSB3aGVu
IGEgY3VzdG9tCnJlcG9zaXRvcnkgb3IgdmVyc2lvbiB3YXMgc2VsZWN0ZWQuCgpGaXggdGhpcyBi
eSBhZGRpbmcgYSBLY29uZmlnIG9wdGlvbiB0byBzcGVjaWZ5IHRoZSBsaWNlbnNlIGZpbGUsCndp
dGggYSBkZWZhdWx0IHZhbHVlIHNldCB0byB0aGUgY29tbW9ubHkgdXNlZCBsaWNlbnNlIHBhdGhz
LgoKU2lnbmVkLW9mZi1ieTogS29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNv
bT4KLS0tCktvcnkgTWFpbmNlbnQgKDcpOgogICAgICBsaW51eDogQWRkIHN1cHBvcnQgZm9yIGN1
c3RvbSBsaWNlbnNlIGZpbGVzCiAgICAgIHVib290OiBBZGQgc3VwcG9ydCBmb3IgY3VzdG9tIGxp
Y2Vuc2UgZmlsZXMKICAgICAgb3B0ZWUtb3M6IEFkZCBzdXBwb3J0IGZvciBjdXN0b20gbGljZW5z
ZSBmaWxlcwogICAgICBvcGVuc2JpOiBBZGQgc3VwcG9ydCBmb3IgY3VzdG9tIGxpY2Vuc2UgZmls
ZXMKICAgICAgYmFyZWJveDogQWRkIHN1cHBvcnQgZm9yIGN1c3RvbSBsaWNlbnNlIGZpbGVzCiAg
ICAgIGFybS10cnVzdGVkLWZpcm13YXJlOiBBZGQgc3VwcG9ydCBmb3IgY3VzdG9tIGxpY2Vuc2Ug
ZmlsZXMKICAgICAgYXQ5MWJvb3RzdHJhcDM6IEFkZCBzdXBwb3J0IGZvciBjdXN0b20gbGljZW5z
ZSBmaWxlcwoKIGJvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvQ29uZmlnLmluICAgICAgICAgICAg
ICAgfCA3ICsrKysrKysKIGJvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmly
bXdhcmUubWsgfCA4ICsrLS0tLS0tCiBib290L2F0OTFib290c3RyYXAzL0NvbmZpZy5pbiAgICAg
ICAgICAgICAgICAgICAgIHwgOCArKysrKysrKwogYm9vdC9hdDkxYm9vdHN0cmFwMy9hdDkxYm9v
dHN0cmFwMy5tayAgICAgICAgICAgICB8IDIgKy0KIGJvb3QvYmFyZWJveC9Db25maWcuaW4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCA3ICsrKysrKysKIGJvb3QvYmFyZWJveC9iYXJlYm94
Lm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KIGJvb3Qvb3BlbnNiaS9Db25m
aWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA3ICsrKysrKysKIGJvb3Qvb3BlbnNi
aS9vcGVuc2JpLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KIGJvb3Qvb3B0
ZWUtb3MvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA3ICsrKysrKysKIGJv
b3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0K
IGJvb3QvdWJvb3QvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA3ICsr
KysrKysKIGJvb3QvdWJvb3QvdWJvb3QubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCA0ICstLS0KIGxpbnV4L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCA3ICsrKysrKysKIGxpbnV4L2xpbnV4Lm1rICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCA4ICsrLS0tLS0tCiAxNCBmaWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCsp
LCAyNSBkZWxldGlvbnMoLSkKLS0tCmJhc2UtY29tbWl0OiA5ZDkyYzdlM2ZmODBmOGM5YTJkMDVh
MTQxYjM0ZGZiMTY0ZTdlODFmCmNoYW5nZS1pZDogMjAyNTA1MjctZml4X2xpY2Vuc2UtZjgwMzc2
MjM1ZGM5CgpCZXN0IHJlZ2FyZHMsCi0tIApLw7ZyeSBNYWluY2VudCwgQm9vdGxpbgpFbWJlZGRl
ZCBMaW51eCBhbmQga2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
