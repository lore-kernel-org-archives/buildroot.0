Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9A3CAC5A7
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 07:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96AB580FBC;
	Tue, 23 Sep 2025 07:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paoHZpSK3QBm; Tue, 23 Sep 2025 07:10:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA37A80FB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA37A80FB4;
	Tue, 23 Sep 2025 07:10:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D46AC200D
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 07:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA2D360B78
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 07:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5x_sV9mBbp0 for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 07:10:35 +0000 (UTC)
X-Greylist: delayed 153074 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 23 Sep 2025 07:10:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9189D60B6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9189D60B6E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9189D60B6E
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 07:10:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D6C044244;
 Tue, 23 Sep 2025 07:10:30 +0000 (UTC)
Date: Tue, 23 Sep 2025 09:10:14 +0200
Message-Id: <20250923-update_br_links-v1-0-3fe23dc818ba@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANZH0mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDSyNj3dKClMSS1PikoviczLzsYt3EJEsjcwuTlDQTIxMloK6CotS0zAq
 widGxtbUAh6g5m2EAAAA=
X-Change-ID: 20250923-update_br_links-ab92784df424
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeitddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdfgveefleeitdeuhfekveeitdduheetieejfeejvdegteehveeivedugeevffeknecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgpdhgihhtlhgrsgdrtghomhdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddungdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvs
 egsohhothhlihhnrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1758611430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y5rwZS389tAXRMM8y5OAMWmcdPIT/jwztAxH0yUayik=;
 b=pr1IQ1mOPfV3Reuz/T3J5SBVFqg+TggxV2ffXzVfdwNuYWOsCOqO8mT9cFGf8XXM7/5l32
 jbQGWtmooSvPboWa0Cew9s/OdDfCQ3d7vgGwRzhWR54NfVyrkE2LthiUZKTKcBCFM7CVhq
 vhVxsOewWoljVkPNgdVrnA1XjBo+F5RW+Hh/Or2RzFR19v3VElijAABFMFOk+Qr5hHaxew
 fq9i05oTqldTl8LxpYc6tY76nPVSRnvys323FN+3eN2UfDNEHUjbPjiWiarm4JBxvKi8dn
 KSlPfp0d5/cWOAK9ZSgHfqdATStOahugekEthF3bzIn771gyXS+P21SElHt/1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pr1IQ1mO
Subject: [Buildroot] [PATCH 0/2] docs/manual: update more links
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

SGVsbG8sCnRoaXMgc21hbGwgc2VyaWVzIGlzIGEgZm9sbG93LXVwIHRvIFsxXSwgd2hpY2ggZml4
ZWQgYSBkZWFkbGluay4gVGhpcwpuZXcgb25lIHVwZGF0ZXMgbGlua3MgcG9pbnRpbmcgdG8gYnVp
bGRyb290Lm9yZyAoaHR0cC0+aHR0cHMpLCBhbmQgdXNlCnRoZSBvcHBvcnR1bml0eSB0byBmaXgg
dGhlIG9mZmljaWFsIHJlcG9zaXRvcnkgbG9jYXRpb24KKGdpdC5idWlsZHJvb3Qub3JnIC0+IGdp
dGxhYi5jb20vYnVpbGRyb290Lm9yZykKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWls
ZHJvb3QvMjAyNTA5MjIxOTU3NDkuMEIzOTg4NjFFMUBidXN5Ym94Lm9zdW9zbC5vcmcvCgpTaWdu
ZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgot
LS0KQWxleGlzIExvdGhvcsOpICgyKToKICAgICAgZG9jcy9tYW51YWw6IHVwZGF0ZSBsaW5rcyB0
byBidWlsZHJvb3Qub3JnIGZyb20gaHR0cCB0byBodHRwcwogICAgICBkb2NzL21hbnVhbDogdXBk
YXRlIG9sZCBnaXQgbGlua3MgdG8gcHJvcGVyIGdpdGxhYiBsb2NhdGlvbgoKIGRvY3MvbWFudWFs
L2FkZGluZy1wYWNrYWdlcy10aXBzLmFkb2MgfCAyICstCiBkb2NzL21hbnVhbC9jb250cmlidXRl
LmFkb2MgICAgICAgICAgIHwgOCArKysrLS0tLQogZG9jcy9tYW51YWwvZ2V0dGluZy5hZG9jICAg
ICAgICAgICAgICB8IDQgKystLQogZG9jcy9tYW51YWwvbWFudWFsLmFkb2MgICAgICAgICAgICAg
ICB8IDIgKy0KIGRvY3MvbWFudWFsL3Jlc291cmNlcy5hZG9jICAgICAgICAgICAgfCA0ICsrLS0K
IDUgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCi0tLQpi
YXNlLWNvbW1pdDogMzZmOGEwZWJhN2JkZDQ2NGFkZDQzYjhkYzcwNmMzNzM5ZGIwMDk5NwpjaGFu
Z2UtaWQ6IDIwMjUwOTIzLXVwZGF0ZV9icl9saW5rcy1hYjkyNzg0ZGY0MjQKCkJlc3QgcmVnYXJk
cywKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVs
IGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
