Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF8760A381A
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 08:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iKufwi8n
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D38040DF5;
	Fri, 13 Nov 2026 08:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BSwppTO7B3vE; Fri, 13 Nov 2026 08:51:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C480640DD8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794559903;
	b=q9j1RI6C9fUf4xjcq1xx2OVCHwhPCjSJw9OoypyqvA42aQPKKUaGRff1rmGDy6PePG0X
	 Pc2x4fZ/mYXcdjCl+NpKednJGluFIaoUTht9pxzDOpZLshobqrU2tWgebe0RUzOkk66ms
	 ltLgX8qWk2uGGdOSvFv1kUe6uCVNY8Gx27tAIUpRS152kuTc4Vqh3REsJ+BmDMS4xw17U
	 WR5MWTDTZVg7bjoTe/9PZXgsTpwGYfTHSzJ9EzdwC0RHHNJvYMzzS82TDZE757c9l6yGX
	 Li73j/BG0y8VM7EUi2z7FReSQiaFwcZnuYC9VwtdZrtgKJbMpdgQvKXjqd9JSTxOidw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794559903;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:X-Mailer:X-Last-TLS-Session-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=u6uUN61tJK6t18r+NeuV5lkRev7eA1j6Qh314xPu9NU=;
	b=EUEMapXHKLruD5o8eS3N2kEBbt8ujtiF6Xz8duoPLQjpvd/jd6y7nVP8QvEVvAhFXnpc
	 b47/UDNA58h4n0eB8ehVKDvwv+9ll+xp2xsVjLmgpVO8gBfsSIK7hqUUNZSg0f6w8qPvJ
	 h4IR7+FMyYy7svQl3zKwUgMMFpdeMDF8wSyi0fsqhduV1dL//ihLQBQ/47FV9prwPBLlr
	 X5a5V6qqnlm9ehibXahv3yh/l6bS5W3Z2tyuxtqf2I6HJntqGM3jJ9JABFHp+aZMTn1oj
	 /DXxqKIxlfgl1BXsYqS9mAZi9VbXsWCTgk80hmfzrtKu6GFJ7jI7Dv5CK+PFcSxmlXw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794559903;
	bh=u6uUN61tJK6t18r+NeuV5lkRev7eA1j6Qh314xPu9NU=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iKufwi8nUCuglI/5+liVVJXhp/60QPb/8h9UTwzCG0sngrL/ChqnUe82aovht/UYV
	 HuoYTl/WVnewKDcPJRcDn+ZNHe2UnherkpZx8tj45xA7ZL+ZSIs+D/lB0oFXfhfbwv
	 bWgBz4g5Mi7Nz26emmrqF3znyYA/rt2Eui+T3RR/uLZN8IImgH0TOLDtwklhC8vgJP
	 dMWpzdPiMGfb1IhTYyXCqQU3VdeEe+X4GE5gEpTFxoDz1+ypEluLe3z+Em3ODHdlBA
	 OvAWzGZFNJekL5axQECcCZ+ndNuAmj/u8rbKJqalrX5BGQLYHN+ZKKRMd8Z1+Kf7gx
	 1d4qEyQAzTwxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C480640DD8;
	Fri, 13 Nov 2026 08:51:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B0FF28C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 08:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87C2940DD8
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 08:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 12TFxAOqcJGd for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 08:51:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2280940D96
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2280940D96
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 08:51:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9FE2CC4F770
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 08:51:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 19BCB601D5
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 08:51:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4CACC11BC14E7; Fri, 13 Nov 2026 09:51:37 +0100 (CET)
Date: Fri, 13 Nov 2026 09:51:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-libxmlsec_libressl-v1-2-8cac6c226064@bootlin.com>
References: <20261113-libxmlsec_libressl-v1-0-8cac6c226064@bootlin.com>
In-Reply-To: <20261113-libxmlsec_libressl-v1-0-8cac6c226064@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] support/testing: add new build time tests
 for libxmlsec1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIGEgc21hbGwgdGVzdCBlbnN1cmluZyB0aGF0IGxpYnhtbHNlYzEgY29ycmVjdGx5IGJ1aWxk
cyB3aXRoIGJvdGgKb3BlbnNzbCBhbmQgbGlicmVzc2wuIFZhbGlkYXRlIHRoZSBidWlsZCBieSBl
bnN1cmluZyB0aGF0IHRoZSBzbWFsbApiaW5hcnkgaGVscGVyICh4bWxzZWMxKSBpcyBhYmxlIHRv
IHN0YXJ0IGNvcnJlY3RseS4KClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEgKwogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9saWJ4bWxzZWMxLnB5IHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVW
RUxPUEVSUwppbmRleCBmZWJmMDM3NzNjMjEuLjA1ZjZiYjUwYTFiYiAxMDA2NDQKLS0tIGEvREVW
RUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xNTcsNiArMTU3LDcgQEAgRjoJcGFja2FnZS9s
aWJ4bWxzZWMxLwogRjoJcGFja2FnZS9vcGVuc2NhcC8KIEY6IAlwYWNrYWdlL3B5dGhvbi1zY3Av
CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2xpYmxkbnMucHkKK0Y6CXN1
cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlieG1sc2VjMS5weQogRjoJc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9vcGVuc2NhcC8KIEY6CXN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3Rfb3BlbnNjYXAucHkKIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3NjcC5weQpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9saWJ4bWxzZWMxLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9saWJ4bWxzZWMxLnB5Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAwMDAwMC4uNTgwZDAwOGJiMTg2Ci0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9saWJ4bWxzZWMxLnB5CkBAIC0wLDAgKzEsMzYgQEAKK2lt
cG9ydCBvcworCitpbXBvcnQgaW5mcmEuYmFzZXRlc3QKKworCitjbGFzcyBUZXN0TGliWE1MU2Vj
MU9wZW5TU0woaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKKyAgICBjb25maWcgPSAoCisgICAgICAg
IGluZnJhLmJhc2V0ZXN0LkJBU0lDX1RPT0xDSEFJTl9DT05GSUcKKyAgICAgICAgKyAiIiIKKyAg
ICAgICAgQlIyX1BBQ0tBR0VfTElCWE1MU0VDMT15CisgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZT
X0NQSU89eQorICAgICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0CisgICAg
ICAgICIiIgorICAgICkKKworICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKKyAgICAgICAgY3Bpb19m
aWxlID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmNwaW8i
KQorICAgICAgICBzZWxmLmVtdWxhdG9yLmJvb3QoCisgICAgICAgICAgICBhcmNoPSJhcm12NSIs
CisgICAgICAgICAgICBrZXJuZWw9ImJ1aWx0aW4iLAorICAgICAgICAgICAgb3B0aW9ucz1bIi1p
bml0cmQiLCBjcGlvX2ZpbGVdLAorICAgICAgICApCisgICAgICAgIHNlbGYuZW11bGF0b3IubG9n
aW4oKQorCisgICAgICAgIG91dCwgcmV0ID0gc2VsZi5lbXVsYXRvci5ydW4oInhtbHNlYzEgLS12
ZXJzaW9uIikKKyAgICAgICAgc2VsZi5hc3NlcnRFcXVhbChyZXQsIDApCisKKworY2xhc3MgVGVz
dExpYlhNTFNlYzFMaWJyZVNTTChUZXN0TGliWE1MU2VjMU9wZW5TU0wpOgorCisgICAgY29uZmln
ID0gKAorICAgICAgICBUZXN0TGliWE1MU2VjMU9wZW5TU0wuY29uZmlnCisgICAgICAgICsgIiIi
CisgICAgICAgIEJSMl9QQUNLQUdFX0xJQlJFU1NMPXkKKyAgICAgICAgIiIiCisgICAgKQoKLS0g
CjIuNTYuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
