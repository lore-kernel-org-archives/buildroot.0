Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120DACAC5B1
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 07:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0AEB40B01;
	Tue, 23 Sep 2025 07:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfCYltPzIXbC; Tue, 23 Sep 2025 07:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D11E340B04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D11E340B04;
	Tue, 23 Sep 2025 07:10:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E32772F4F
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 07:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D239540B00
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 07:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJwuZOr48q22 for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 07:10:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C09AF40AF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C09AF40AF7
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C09AF40AF7
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 07:10:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ECB0844249;
 Tue, 23 Sep 2025 07:10:30 +0000 (UTC)
Date: Tue, 23 Sep 2025 09:10:16 +0200
MIME-Version: 1.0
Message-Id: <20250923-update_br_links-v1-2-3fe23dc818ba@bootlin.com>
References: <20250923-update_br_links-v1-0-3fe23dc818ba@bootlin.com>
In-Reply-To: <20250923-update_br_links-v1-0-3fe23dc818ba@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeitddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudfftdevueehteehieekhfeggefgudetuddtheeltdefgeeivdeitdetfedugedtnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdhgihhtlhgrsgdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1758611431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CHaKM1tQv7ZKbck6tESu8a+GTFt+rShtb53mzRpkmtQ=;
 b=XhreK34n/0edtccpmryQIuct4kaB/qfp3QhVp1y2jN2mDKbjkp5Z3/2D4wIF8hMlTjhGzI
 0gbqohH8NqfaEnKa5iIE6mM7ZB9FnY9cIr2l77K5sNSyXaqTKBxGRJjYzG2RLvJB3C8WVt
 3jCNCp6PW4r+We6bGPRtIx4QCai0gLIUAoFhkiy6SyFTkLoE0DKjpErXJ3YO3k/mP9BxNr
 diekfD7FiCwC+8gDEkf6MwlPs3McY/FwecHkSj4WZOo+uIZ5FM08DA3v4o+9PvLxqQ2Saq
 fIj78ZjNyg07JDCYSyDx71GbvmPpc88sKWJqzHG+83kkNAXpVrapQjgE+qHy/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XhreK34n
Subject: [Buildroot] [PATCH 2/2] docs/manual: update old git links to proper
 gitlab location
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

U29tZSBsaW5rcyBhcmUgc3RpbGwgcG9pbnRpbmcgdG8gZ2l0LmJ1aWxkcm9vdC5vcmcsIHdoaWNo
IGlzIHRoZSBvbGQgVVJMCmZvciB0aGUgb2ZmaWNpYWwgQnVpbGRyb290IGdpdCByZXBvc2l0b3J5
LiBUaGUgcmVwb3NpdG9yeSBpcyBub3cgaG9zdGVkCmF0IGdpdGxhYi5jb20uIFVwZGF0ZSB0aG9z
ZSBvbGQgbGlua3MgYWNjb3JkaW5nbHkuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kg
PGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KIGRvY3MvbWFudWFsL2NvbnRyaWJ1dGUu
YWRvYyB8IDIgKy0KIGRvY3MvbWFudWFsL21hbnVhbC5hZG9jICAgICB8IDIgKy0KIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Rv
Y3MvbWFudWFsL2NvbnRyaWJ1dGUuYWRvYyBiL2RvY3MvbWFudWFsL2NvbnRyaWJ1dGUuYWRvYwpp
bmRleCBjYWVjZDA5NzY0MzM2YmM5ZDI0NGJkZmIzMmNiNTNhZmIyMWNmNzRkLi5jMTdmMTYxOWI0
MzBlNTZiN2ZkNGZhNDBkYzlhN2NkNDMwZjM3MTg5IDEwMDY0NAotLS0gYS9kb2NzL21hbnVhbC9j
b250cmlidXRlLmFkb2MKKysrIGIvZG9jcy9tYW51YWwvY29udHJpYnV0ZS5hZG9jCkBAIC01OCw3
ICs1OCw3IEBAIGJhc2ljYWxseSB0d28gdGhpbmdzIHRoYXQgY2FuIGJlIGRvbmU6CiAgIHRoZXNl
IHN0ZXBzOgogICAuIENoZWNrIGlmIHlvdSBjYW4gcmVwcm9kdWNlIHRoZSBwcm9ibGVtIGJ5IGJ1
aWxkaW5nIHdpdGggdGhlIHNhbWUKICAgICBjb25maWd1cmF0aW9uLiBZb3UgY2FuIGRvIHRoaXMg
bWFudWFsbHksIG9yIHVzZSB0aGUKLSAgICBodHRwczovL2dpdC5idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC10ZXN0L3RyZWUvdXRpbHMvYnItcmVwcm9kdWNlLWJ1aWxkW2JyLXJlcHJvZHVjZS1idWls
ZF0KKyAgICBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QtdGVzdC8t
L2Jsb2IvbWFzdGVyL3V0aWxzL2JyLXJlcHJvZHVjZS1idWlsZFtici1yZXByb2R1Y2UtYnVpbGRd
CiAgICAgc2NyaXB0IHRoYXQgd2lsbCBhdXRvbWF0aWNhbGx5IGNsb25lIGEgQnVpbGRyb290IGdp
dCByZXBvc2l0b3J5LAogICAgIGNoZWNrb3V0IHRoZSBjb3JyZWN0IHJldmlzaW9uLCBkb3dubG9h
ZCBhbmQgc2V0IHRoZSByaWdodAogICAgIGNvbmZpZ3VyYXRpb24sIGFuZCBzdGFydCB0aGUgYnVp
bGQuCmRpZmYgLS1naXQgYS9kb2NzL21hbnVhbC9tYW51YWwuYWRvYyBiL2RvY3MvbWFudWFsL21h
bnVhbC5hZG9jCmluZGV4IGQ0NzQ4YzVjNjg3YjQzNDdiNGEwMWQyMzcwNTVmYjFmYTRkNDk2NTgu
LjA2ODI3MzYxMzY2ZDliNzIxMTZmYzAwZmUxNzM5OTIwYWI1ZGVlOWUgMTAwNjQ0Ci0tLSBhL2Rv
Y3MvbWFudWFsL21hbnVhbC5hZG9jCisrKyBiL2RvY3MvbWFudWFsL21hbnVhbC5hZG9jCkBAIC05
LDcgKzksNyBAQCBCdWlsZHJvb3Qge3N5czplY2hvICRCUjJfVkVSU0lPTn0gbWFudWFsIGdlbmVy
YXRlZCBvbiB7bG9jYWxkYXRlfQogCiBUaGUgQnVpbGRyb290IG1hbnVhbCBpcyB3cml0dGVuIGJ5
IHRoZSBCdWlsZHJvb3QgZGV2ZWxvcGVycy4KIEl0IGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSwgdmVyc2lvbiAyLiBSZWZlciB0byB0aGUKLWh0dHBzOi8v
Z2l0LmJ1aWxkcm9vdC5vcmcvYnVpbGRyb290L3RyZWUvQ09QWUlORz9pZD17c3lzOmdpdCByZXYt
cGFyc2UgSEVBRH1bQ09QWUlOR10KK2h0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC8tL2Jsb2IvbWFzdGVyL0NPUFlJTkdbQ09QWUlOR10KIGZpbGUgaW4gdGhlIEJ1aWxk
cm9vdCBzb3VyY2VzIGZvciB0aGUgZnVsbCB0ZXh0IG9mIHRoaXMgbGljZW5zZS4KIAogQ29weXJp
Z2h0IChDKSBUaGUgQnVpbGRyb290IGRldmVsb3BlcnMgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
PgoKLS0gCjIuNTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
