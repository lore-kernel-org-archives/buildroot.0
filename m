Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4914FC87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 082DF807AD;
	Thu,  7 Aug 2025 17:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzukOO6OEvIJ; Thu,  7 Aug 2025 17:44:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FCAE807AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FCAE807AB;
	Thu,  7 Aug 2025 17:44:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5DA831
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B742D40022
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:44:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hH7nCAkZP74E for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:44:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E607C40074
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E607C40074
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E607C40074
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:44:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EE9E442EA;
 Thu,  7 Aug 2025 17:44:08 +0000 (UTC)
Date: Thu, 07 Aug 2025 19:43:48 +0200
MIME-Version: 1.0
Message-Id: <20250807-libldns_drill-v1-2-5d8713fb0860@bootlin.com>
References: <20250807-libldns_drill-v1-0-5d8713fb0860@bootlin.com>
In-Reply-To: <20250807-libldns_drill-v1-0-5d8713fb0860@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, nicolas.carrier@nav-timing.safrangroup.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdduheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeghfetffeuhfehkeekleffffdvuefggfevjefftddvffduheettdeiveetteenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegsvghrnhgusehkuhhhlhhsrdhnvghtpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhmpdhrtghpthhtohepsghuihhlu
 ghrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754588648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F8/up8LBboC4BTwTSpW0w3I0ZSJTKqdn8nXOqStKsNY=;
 b=HEfz1puVj3DEYO6IIKZ5rd3otczS6PqQPnrLGyhGk7hf+h7HKy9BCWdMgf1iI8n1MLQcGv
 3nOtIdS5RJ+Kk9FC/ZPqtk8bDp7OyHij0kvAgQkYDm84+sGHilN+Dz6pwd+7XXFziIelJi
 c/ZsWyDxuI8+OS93Tl2hR7IUmI/0ab//7xfP3HEULUX/Cyl1rmUJ9GNtMaSufRcCfh919g
 vv3tPYmRbJMJFF2l+1LnJn/laa3WafUKkGIwDBkTVwCjVXdx2So9uxoXd31AdgPYTT5bT5
 kHigSGeEQ6VFgI/i6ogqNjqzPDbq47TmpjM1RiBsTTVhd5D3bUNYM9cpX3gdtQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HEfz1puV
Subject: [Buildroot] [PATCH 2/2] support/testing: add basic runtime test for
 libldns/drill
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

QWRkIGEgc2ltcGxlIHRlc3QgZW5zdXJpbmcgdGhhdAotIGxpYmxkbnMgaXMgY29ycmVjdGx5IGJ1
aWx0IGFuZCBpbnN0YWxsZWQKLSBkcmlsbCBpcyBjb3JyZWN0bHkgYnVpbHQgYW5kIGluc3RhbGxl
ZAotIGRyaWxsIGlzIGFibGUgdG8gZXhlY3V0ZSBvbiB0aGUgdGFyZ2V0CgpTaWduZWQtb2ZmLWJ5
OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KIHN1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlibGRucy5weSB8IDIxICsrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2xpYmxkbnMucHkgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2xpYmxkbnMucHkKbmV3IGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uNmMxYTRk
YTNmMjQ5ZTNlYWQyMTEwNzYwZjhlNTkzOThmZWMxYWYwZgotLS0gL2Rldi9udWxsCisrKyBiL3N1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlibGRucy5weQpAQCAtMCwwICsxLDIx
IEBACitpbXBvcnQgaW5mcmEuYmFzZXRlc3QKK2ltcG9ydCBvcworCisKK2NsYXNzIFRlc3RMaWJM
ZG5zKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6CisgICAgY29uZmlnID0gaW5mcmEuYmFzZXRlc3Qu
QkFTSUNfVE9PTENIQUlOX0NPTkZJRyArIFwKKyAgICAgICAgIiIiCisgICAgICAgIEJSMl9QQUNL
QUdFX0xJQkxETlM9eQorICAgICAgICBCUjJfUEFDS0FHRV9MSUJMRE5TX0RSSUxMPXkKKyAgICAg
ICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15CisgICAgICAgICMgQlIyX1RBUkdFVF9ST09URlNf
VEFSIGlzIG5vdCBzZXQKKyAgICAgICAgIiIiCisKKyAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cisg
ICAgICAgIGNwaW9fZmlsZSA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwg
InJvb3Rmcy5jcGlvIikKKyAgICAgICAgc2VsZi5lbXVsYXRvci5ib290KGFyY2g9ImFybXY1IiwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIGtlcm5lbD0iYnVpbHRpbiIsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICBvcHRpb25zPVsiLWluaXRyZCIsIGNwaW9fZmlsZV0pCisgICAgICAg
IHNlbGYuZW11bGF0b3IubG9naW4oKQorCisgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soImRyaWxs
IC12IikKCi0tIAoyLjUwLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
