Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4647C87FCA
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 09:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63C8E41404;
	Tue, 29 Jul 2025 09:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tbmkz5_kBSnl; Tue, 29 Jul 2025 09:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D3C9413BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D3C9413BC;
	Tue, 29 Jul 2025 09:45:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C744229
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39C9D4016B
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSGUhR0SOi5e for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 09:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=benoit.monin@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 678C740771
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 678C740771
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 678C740771
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:45:35 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id CAC2F580C81
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 09:21:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C3791438D5;
 Tue, 29 Jul 2025 09:21:45 +0000 (UTC)
Date: Tue, 29 Jul 2025 11:21:29 +0200
MIME-Version: 1.0
Message-Id: <20250729-cmake4-v2-1-24fd7677de1c@bootlin.com>
References: <20250729-cmake4-v2-0-24fd7677de1c@bootlin.com>
In-Reply-To: <20250729-cmake4-v2-0-24fd7677de1c@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelgeeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeeuvghnohpfthcuofhonhhinhcuoegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieffteegleevieeuhfethfdvtdegfeelleejfeeiffelvdfgjeelffekteeuhffgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeduheefjeemfhefheemleefiegumegvledvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemudehfeejmehffeehmeelfeeiugemvgelvdehpdhhvghloheplgduledvrdduieekrddutddrudejvdgnpdhmrghilhhfrhhomhepsggvnhhoihhtrdhmohhnihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegurghnohhmi
 hhmrghntghhvghgohduvdefsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplfhovghlshhonhevrghrlhesghhmrghilhdrtghomhdprhgtphhtthhopegsvghnohhithdrmhhonhhinhessghoohhtlhhinhdrtghomh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753780906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N1ll3c1J8yO2yfVpKVMEkKEIfp9E4I1aUPSD+aYI0eE=;
 b=I46GEwhvzZKKELizwQJwvuXuBHNixJfAK4SZnsRGp4nz6RTprdkJ327KaO1nVAUTBg1DVx
 6+JblXxPUKvpr/6faB+Ph/iOKjl/k+XSwjIxniLJeiztVfM+Szrv9dP7wJ2oWFIwkG0HeV
 WprRDyD/wk5It7BbpbE3boLy5oQr/pKvIPgA/P98kAT9zeIeRjeCTd6HNW6VMSmEZ8XQjE
 eZUJhg0lPCN9OmGdPXlNH+ffdz+bHUr9JDOKUPPo6F9w7gBtjSt4oO8FHYo6cQemRjzgr8
 sK0jCey6T4NzzN+BW99LTSUGzjysxnWB0ckbwA7MPyRlMREuecgDo5dL60wijg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=I46GEwhv
Subject: [Buildroot] [PATCH v2 1/2] package/cjson: fix cmake 4 compatibility
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
From: =?utf-8?q?Beno=C3=AEt_Monin_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgcGF0Y2ggZml4aW5nIGNtYWtlIDQgY29tcGF0aWJpbGl0eSwgZm91bmQgaW4gdXBzdHJl
YW0gcHVsbApyZXF1ZXN0ICM5MzUuCgpTaWduZWQtb2ZmLWJ5OiBCZW5vw650IE1vbmluIDxiZW5v
aXQubW9uaW5AYm9vdGxpbi5jb20+Ci0tLQogLi4uLzAwMDEtbWFrZV9jb21wYXRpYmxlX3dpdGhf
Y21ha2VfNC4wLnBhdGNoICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvY2pzb24vMDAw
MS1tYWtlX2NvbXBhdGlibGVfd2l0aF9jbWFrZV80LjAucGF0Y2ggYi9wYWNrYWdlL2Nqc29uLzAw
MDEtbWFrZV9jb21wYXRpYmxlX3dpdGhfY21ha2VfNC4wLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjFmZTVj
ZDQzZWYxMGRlMzY2YzI4MWM4ODgwNTlkOGU2NzRlNTNkMmEKLS0tIC9kZXYvbnVsbAorKysgYi9w
YWNrYWdlL2Nqc29uLzAwMDEtbWFrZV9jb21wYXRpYmxlX3dpdGhfY21ha2VfNC4wLnBhdGNoCkBA
IC0wLDAgKzEsMzQgQEAKK0Zyb20gNThiYzdjODIzYzJlMzlmMWE2MjZlYzRkYTg2OTUyYmM2ODE5
YmQ2YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IE1hcmt1cyBWaWV0aCA8bXZpZXRo
QHRlY2hmYWsudW5pLWJpZWxlZmVsZC5kZT4KK0RhdGU6IFN1biwgMzAgTWFyIDIwMjUgMTE6MTI6
MDcgKzAyMDAKK1N1YmplY3Q6IFtQQVRDSF0gTWFrZSBjb21wYXRpYmxlIHdpdGggQ01ha2UgNC4w
IFdoZW4gdHJ5aW5nIHRvIGJ1aWxkIHdpdGgKKyBDTWFrZSA0LjAsIHRoZSBmb2xsb3dpbmcgZXJy
b3IgaXMgc2hvd246CisKK0NNYWtlIEVycm9yIGF0IENNYWtlTGlzdHMudHh0OjIgKGNtYWtlX21p
bmltdW1fcmVxdWlyZWQpOgorICBDb21wYXRpYmlsaXR5IHdpdGggQ01ha2UgPCAzLjUgaGFzIGJl
ZW4gcmVtb3ZlZCBmcm9tIENNYWtlLgorCisgIFVwZGF0ZSB0aGUgVkVSU0lPTiBhcmd1bWVudCA8
bWluPiB2YWx1ZS4gIE9yLCB1c2UgdGhlIDxtaW4+Li4uPG1heD4gc3ludGF4CisgIHRvIHRlbGwg
Q01ha2UgdGhhdCB0aGUgcHJvamVjdCByZXF1aXJlcyBhdCBsZWFzdCA8bWluPiBidXQgaGFzIGJl
ZW4gdXBkYXRlZAorICB0byB3b3JrIHdpdGggcG9saWNpZXMgaW50cm9kdWNlZCBieSA8bWF4PiBv
ciBlYXJsaWVyLgorCisgIE9yLCBhZGQgLURDTUFLRV9QT0xJQ1lfVkVSU0lPTl9NSU5JTVVNPTMu
NSB0byB0cnkgY29uZmlndXJpbmcgYW55d2F5LgorCitUaGlzIGNoYW5nZSByYWlzZXMgdGhlIG1p
bmltdW0gcmVxdWlyZWQgQ01ha2UgdmVyc2lvbiB0byAzLjUgYW5kIHRodXMgbWFrZXMgdGhlIHBy
b2plY3QgY29tcGF0aWJsZSB3aXRoIENNYWtlIDQuMAorCitTaWduZWQtb2ZmLWJ5OiBCZW5vw650
IE1vbmluIDxiZW5vaXQubW9uaW5AYm9vdGxpbi5jb20+CitVcHN0cmVhbTogaHR0cHM6Ly9naXRo
dWIuY29tL0RhdmVHYW1ibGUvY0pTT04vcHVsbC85MzUKKy0tLQorIENNYWtlTGlzdHMudHh0IHwg
MiArLQorIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQorCitk
aWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAoraW5kZXggMzZhNmNi
NTcuLjk0MjhkYTU4IDEwMDY0NAorLS0tIGEvQ01ha2VMaXN0cy50eHQKKysrKyBiL0NNYWtlTGlz
dHMudHh0CitAQCAtMSw1ICsxLDUgQEAKKyBzZXQoQ01BS0VfTEVHQUNZX0NZR1dJTl9XSU4zMiAw
KQorLWNtYWtlX21pbmltdW1fcmVxdWlyZWQoVkVSU0lPTiAzLjApCisrY21ha2VfbWluaW11bV9y
ZXF1aXJlZChWRVJTSU9OIDMuNSkKKyAKKyBwcm9qZWN0KGNKU09OCisgICAgIFZFUlNJT04gMS43
LjE4CgotLSAKMi41MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
