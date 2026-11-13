Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF3C606C180
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 08:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Y9tV73Os
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40329805E6;
	Fri, 13 Nov 2026 08:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tv8W_F8ni1ar; Fri, 13 Nov 2026 08:51:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 379A881BA9
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794559905;
	b=H+55QOFFH2zeSFNUYSgoMwr1nTajc+9hAYPUiaSvwx5nvWkALVdqEcBYoZ9+3Ye/+LDU
	 HamG6eLu4o/q3yhPeYCz4x58LfbSx5nphH5VDNVJ04VeVwke0AlCuS9NqY8C7jBNf+AWR
	 uGTozjFPKmz7WwAzotRbXCcAXzyaaCquNN8WAk9gMtGTX0AF6Wk3sMllK3liQ+oih8t7j
	 7iDQnehHjUluXJ1+8K+V1+TmmcfXDCsH3F5adcesQhXjNoROtFQa33weocGde2C000tAH
	 +lYJIv8P2/Hr7y+lCPbFoH790ZFg7XXmASpfr1RAvIn1dLJjb7n3NRjmQxK50SJ+fBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794559905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:Message-Id:MIME-Version:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=u97Qkk6X9hg8tmd9RquOM9f9Zs28npcrtZJ2+ccOQso=;
	b=jesjq03aPEuPT+C32kqU8Rw8fLcxf3Vr4zsLlbIEOX7ydHSVUEZU57CkZV0Ou/9AMZ4K
	 5THQjQFnPTex8wK2lYwkjJCEZolxP1aWpjfwL7PawMvVHLg5RIQZQEaRj3Nnw0fP2VZEL
	 ddcuiN0mqb21mQPJ/4xV5csnZ9/hM09GXQ5vclJiMc4TzaChjFs6NQmH2u75TRLttFIkO
	 98yFxGoZDpEl0Y4dp8PVgOpZQeCwFJNjxXVZZuKS2a3AJq1MwuMFV+SAahRjJE6vLZWyS
	 /+n+te+IQWNfZmzJ7pSdGY/rj/xVl6iu19y5lgfpqYyF8+x+iGfr2HzVbNFIthIjNYw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794559905;
	bh=u97Qkk6X9hg8tmd9RquOM9f9Zs28npcrtZJ2+ccOQso=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Y9tV73OsMpeToNCGh5wXWwiTNFKLlNXKq5tHNevGeHp7nJrPxExX6ABn95WyygoEa
	 b8+Ztl07o2hMPQTv+NABgpw2NSVfKZQ76iiPFJXh9QBVBii8xXV+OnlgAMuKEnpC1e
	 c6CiH8sHGVxnkrq8rHQbXUNmDpnAJuZbPw2XTHAksKNmV9aclTP8E2D3HDd8sHqjAZ
	 50fqvE2yrC77SekxKmFqELmdOlEp8OZPZfcR8lXnb+rkxMiJmOsmCQQ0Uz8xEYUZUI
	 iN2ja3pnlvx1hyhQFkhL3IcdDzjY4TbDkchc7eHCxjaAJUPDJzqAU/1JzkiiH4XHSO
	 TCoEhweWsBJTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379A881BA9;
	Fri, 13 Nov 2026 08:51:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A9BF128C
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 08:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 955C5401D1
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 08:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7O1KBfYTy_Tn for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 08:51:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 228C0400A9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 228C0400A9
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 08:51:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2F4CCC4F76D
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 08:51:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9C076601D5
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 08:51:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 556E511BC10BF; Fri, 13 Nov 2026 09:51:34 +0100 (CET)
Date: Fri, 13 Nov 2026 09:51:27 +0100
Message-Id: <20261113-libxmlsec_libressl-v1-0-8cac6c226064@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM2wqDQAwFf0Xy7IJRacVfERF3zbaR9cKmFUH8d
 2P7dobDzAFCkUmgTg6ItLHwMitgmoB79/OLDA/KkGf5AxELE9juUxByna5IIsE89SqzqkdfeVB
 xjeR5/0Wb9s/ytSO5z12C87wAeEnpPHYAAAA=
X-Change-ID: 20261113-libxmlsec_libressl-7261408a1f8f
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 0/2] package/libxmlsec1: fix build failure with
 libressl
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

SGVsbG8sCnRoaXMgc21hbGwgc2VyaWVzIGFpbXMgdG8gZml4IGEgYnVpbGQgZmFpbHVyZSB0aGF0
IGFwcGVhcmVkIHdpdGgKbGlieG1sc2VjIDEuMy4xMyBidW1wLCB3aGVuIHVzaW5nIGxpYnJlc3Ns
IGFzIGNyeXB0byBiYWNrZW5kLiBJdCBhbHNvCmJyaW5ncyBhIG5ldyBzbWFsbCB0ZXN0IHRvIGRl
dGVjdCBlYXJsaWVyIHN1Y2ggYnJlYWthZ2UgbmV4dCB0aW1lLgoKU2lnbmVkLW9mZi1ieTogQWxl
eGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCkFsZXhpcyBMb3Ro
b3LDqSAoMik6CiAgICAgIHBhY2thZ2UvbGlieG1sc2VjMTogZml4IGJ1aWxkIHdpdGggbGlicmVz
c2wKICAgICAgc3VwcG9ydC90ZXN0aW5nOiBhZGQgbmV3IGJ1aWxkIHRpbWUgdGVzdHMgZm9yIGxp
YnhtbHNlYzEKCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArCiAuLi5zc2wtQnVtcGVkLW1pbmltdW0tTGlicmVTU0wtQm9yaW5nU1NMLXZl
ci5wYXRjaCB8IDYyNSArKysrKysrKysrKysrKysrKysrKysKIHN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfbGlieG1sc2VjMS5weSAgIHwgIDM2ICsrCiAzIGZpbGVzIGNoYW5nZWQs
IDY2MiBpbnNlcnRpb25zKCspCi0tLQpiYXNlLWNvbW1pdDogY2RkMzc3NmI0ZWE3MjhmZGRhNWZj
ZGU3MDhlMjVkMGEwOTJlNjg2NApjaGFuZ2UtaWQ6IDIwMjYxMTEzLWxpYnhtbHNlY19saWJyZXNz
bC03MjYxNDA4YTFmOGYKCkJlc3QgcmVnYXJkcywKLS0gIApBbGV4aXMgTG90aG9yw6kgPGFsZXhp
cy5sb3Rob3JlQGJvb3RsaW4uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
