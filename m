Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E442606A337
	for <buildroot@archiver.kernel.org>; Thu, 12 Nov 2026 15:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iDw3StA5
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A572811DA;
	Thu, 12 Nov 2026 15:13:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyPsUCUwfKKX; Thu, 12 Nov 2026 15:12:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A53FB811CF
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794496378;
	b=Na1u9NK9nQmYGE3ig5SgP9rkBaHHodm8aDLTmQK9do6aL80cVBT7/3g1zt14rQy0MpN+
	 hO4Mjnusb7B5KUaX1Ej3C+12uSSA/lY3OWVNYjg5hvTRGRquUbNsdMHbItS5AngrFiA0l
	 7YCIHQf47wqYkA8TP8cne0bGzkFSl7O0Q89Q4z+yJCEVdv7W1dheHPQsjrnLn7+s3iR+p
	 HSHz5iHt/H7F1JHpM6Yw8wYFjokv7G9uL177mu+XPQYnG1MGNfTwO41wZJbC93KBb8R40
	 suerEKqpPFgNXiDHUxK158jXTAR/p8WHKWQg8EcW2mZlE7Lk/gf58Y8XIhmt0Sk+S2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794496378;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tthpd3kP8LkbYJlXsegm2octdEJnu9MgZrZbCJ003ow=;
	b=MC3EaGi+tZWx77BxdtkEtaTHCgxIcUHXdRnQ7hFsiT1xAZlJek/3WB13+pZaj0l4KEdU
	 GoIzw8D8L2AA8Pvuf7Yf+zkvik2WlCro+kjycAtxkQSAahJYwdtuYQCbGhnSjOHvUM048
	 2FJtityN/xKYD2lVu6G537qpl3RoJRrrPWPBIoPWApHxvlcfnQTMy653tSQ3pEV7UINXZ
	 PCmAW403UJHkXLKjNrzsXk/qRS0CLIZEAKGFz5i8OQ+Yvy6uarWDKtGv3Y+32y8+aPSFh
	 iUQpQ27+XlJC1yOdpTolUa4nQGOFqz6fjtCxoOWGZuoJyG1wMZ/u3mA6LjILmeUUkDA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794496378;
	bh=Tthpd3kP8LkbYJlXsegm2octdEJnu9MgZrZbCJ003ow=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=iDw3StA57cpRngRRezipsMYI7BGRKqBxXv4AwZ6TUY6uo7zdFydKRiLkM61MOeQuZ
	 tybtsfNjg72tg7QQ0yh8Zf8qb0REjkYJsEZ6g/cuXFValau8U7rYFuLA8upUJOJaZE
	 SEU9EId1PjTwpwW3nW0+FfruekqgSALLgXjzHEeSjpY8CAyKyiXEF81ljzEUCSZT0p
	 zrTjnNpXAYyggaWiYt8HA0p3wO5TC66xkeG7UhhrIip6v6X9mdtEdMYmFjcRuJygkM
	 vlMuL2p1gqGrGyi/0rJ2nzmmMfQHgk5T9VWWBsFaRhKRttdG9hPG7WR9eTdoQHDPQ2
	 J17W8+VEZdMjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A53FB811CF;
	Thu, 12 Nov 2026 15:12:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3507A156
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 15:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26C0B401A1
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 15:12:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dXmlIUiEN0ZO for <buildroot@buildroot.org>;
 Thu, 12 Nov 2026 15:12:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0CDEA400B0
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CDEA400B0
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 15:12:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a60f9474c4so54779955e9.0
 for <buildroot@buildroot.org>; Thu, 12 Nov 2026 07:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794496373; x=1795101173;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=96dFLbkFZSh49+QL4YugwJRo1hFhkUKNNb8K/Xbkue8=;
 b=mjo6GiapWmYCQVU024NVp8skFOuMG8q/y0AdaK3LI7/E8mPgs0MY2KD+6pFe/Z/xFT
 o/JsoYQ+EPf9Gdi+qWmriZVaiQ1OLK5975/AB5nNWwofscrzwWeaouBVnm3edwUjkbg0
 EY9IQQKrWexubj8niLffTHNL4dV799haQl3qmPfvljLJarQlA6klsMWCiynXJhoEYX3Z
 u4uclU4XvoanB6vofObtKulmDGlijfd3rKr/6OVigDOoFRienXur3Ly3Mggr31TgZphB
 0IQZAZgs5r4TqbAOn64hBEzGIRTRItENhN11iACJQFVJW+kMltu4jjuTEkNS/BE0QEUv
 PyOw==
X-Gm-Message-State: APuU4Z8tKjpWMmkvfcG2RtqmZ8ia39tnLyVbeklJeyER8hthP0VyJKMv
 VkSRMKXZ6xIsC0WNS3S+AG8OqgUCe4P1M3dmDiUePJC20NHK6YMKUhZdGBWvmQ0ZmTRLPpJnHxd
 KcESkGVw=
X-Gm-Gg: AYBFou2O4o5cEPf+bR5M8untJDjHU6FAAlB74KcbNL5HYAz+ngJzeqNM1t/SXURrUSE
 h2iSqmgZ3BMt1KK2O4CnCH6NWxPeAeTq9AEc3g+aJ01UjGTMPyrzdTRyJt5eGm1tvSCo/PrS69Q
 F/7YZayJVCrnv/8k/4i4ovSh/6p59DRWoogd6AOjJ1QCBl1hG8UxSwE7Rsn9UjegNtaVejU+rpm
 zyBd7LLKAoHZfGYX59MYQGOt8XhH7jYl+ieqYIJIV1eIG5xfLxgJsEu62p7U4WkmSMpSA/nUNbp
 uQZPqMhqXZ4S4iq3KYFgfpOlWME0Ex5o+RTm7J3UHd5wkV9A9pf+H6PMsUfLhtfFBRs+NXyVtZc
 XVqIngzwl30xGOiDbx4LJ/l3p4GivHogQHZfkf8jx54bM5VtjZoTqYgICOBBPOYN78KPcNMUe6R
 SlqyNahVYv8dYYm89gF7Nx5ouQHGAYTinFNKcTTffwKlMvi6J8d2KU9bMzmoVbVb85uw8LT72ho
 MvNzj49vIVYxiUdOtoRtbv5VpM/fbDy8Nz8CskVaIYnbRvc+gzd/FSPEj3BzWDXlHvApZWOzVWD
 xYDsWjwWs7iU9W2Y021eVM8Ps25IQOE=
X-Received: by 2002:a05:600c:a0c:b0:4b8:4af2:88b3 with SMTP id
 5b1f17b1804b1-4ba0938b7f3mr121534155e9.22.1794496372739; 
 Thu, 12 Nov 2026 07:12:52 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e2842e6sm75503175e9.4.2026.11.12.07.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2026 07:12:50 -0800 (PST)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Nov 2026 16:12:25 +0100
Message-ID: <20261112151229.2256576-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qt6/qt6quick3d: add back the Godot
 license files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Q29tbWl0IDVhZTMwNGQ5NmMgKCJwYWNrYWdlL3F0NjogYnVtcCB2ZXJzaW9uIHRvIDYuOS4xIikg
cmVtb3ZlZApzcmMvaGVscGVycy9HT0RPVF9MSUNFTlNFLnR4dCBhbmQgc3JjL3J1bnRpbWVyZW5k
ZXIvR09ET1RfTElDRU5TRS50eHQKZnJvbSB0aGUgbGljZW5zZSBmaWxlcywgYmVjYXVzZSBsZWdh
bC1pbmZvIGNvdWxkIG5vdCBmaW5kIHRoZW0KYW55bW9yZS4gQnV0IHVwc3RyZWFtIG9ubHkgcmVu
YW1lZCB0aGVzZSBmaWxlcyB0byBMSUNFTlNFLkdPRE9ULnR4dCwKd2l0aG91dCBjaGFuZ2UgaW4g
Y29udGVudC4gVGhleSBhcmUgc3RpbGwgaW4gdGhlIDYuMTEuMyB0YXJiYWxsLCBhbmQKc3JjL3to
ZWxwZXJzLHJ1bnRpbWVyZW5kZXJ9L3F0X2F0dHJpYnV0aW9uLmpzb24gc3RpbGwgZGVjbGFyZSBN
SVQKY29kZSBmcm9tIHRoZSBHb2RvdCBlbmdpbmUgKHByb2NlZHVyYWwgc2t5IGFuZCBmb2cpLCB3
aXRoCkxJQ0VOU0UuR09ET1QudHh0IGFzIGxpY2Vuc2UgZmlsZS4KCkFkZCB0aGUgdHdvIGZpbGVz
IGJhY2sgd2l0aCB0aGVpciBuZXcgbmFtZXMuCgpGaXhlczogNWFlMzA0ZDk2YyAoInBhY2thZ2Uv
cXQ2OiBidW1wIHZlcnNpb24gdG8gNi45LjEiKQpBc3Npc3RlZC1ieTogTExNClNpZ25lZC1vZmYt
Ynk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KLS0tCiBwYWNr
YWdlL3F0Ni9xdDZxdWljazNkL3F0NnF1aWNrM2QuaGFzaCB8IDIgKysKIHBhY2thZ2UvcXQ2L3F0
NnF1aWNrM2QvcXQ2cXVpY2szZC5tayAgIHwgNCArKystCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ2L3F0NnF1
aWNrM2QvcXQ2cXVpY2szZC5oYXNoIGIvcGFja2FnZS9xdDYvcXQ2cXVpY2szZC9xdDZxdWljazNk
Lmhhc2gKaW5kZXggYmViN2IxMTM0NS4uNWEzYThiMzlmMyAxMDA2NDQKLS0tIGEvcGFja2FnZS9x
dDYvcXQ2cXVpY2szZC9xdDZxdWljazNkLmhhc2gKKysrIGIvcGFja2FnZS9xdDYvcXQ2cXVpY2sz
ZC9xdDZxdWljazNkLmhhc2gKQEAgLTEwLDMgKzEwLDUgQEAgc2hhMjU2ICBjZmM3NzQ5Yjk2ZjYz
YmQzMWMzYzQyYjVjNDcxYmY3NTY4MTQwNTNlODQ3YzEwZjNlYjAwMzQxN2JjNTIzZDMwICBzcmMv
M3IKIHNoYTI1NiAgZTRhMjYwMzNlMzU1MWZiMjcyMjg4ODk0OWZiYjQxZTc3YWVlNjI4ZThlOGYw
NGRjZmZlZWUzMDFhYTdlNTYzNCAgc3JjLzNyZHBhcnR5L21lc2hvcHRpbWl6ZXIvTElDRU5TRS5t
ZAogc2hhMjU2ICBiOTAzODhhYWFkYzJiNmY3N2E1YzAxMjc4Njk3YTJhMDUzOWVhYjQ3MWEzYmVm
YzZhMDgxNzI4YmVjZGMzMzkwICBzcmMvM3JkcGFydHkvdGlueWV4ci9MSUNFTlNFCiBzaGEyNTYg
IDJjMTZkNWIxYzI4MDgyNzdmZTk3NWI0ZjcwZjBmZDlhZmM5YjNiY2YwNGU2YzY3NjY2NWE4MmNi
MmQ1NTc5ZTMgIHNyYy8zcmRwYXJ0eS94YXRsYXMvTElDRU5TRQorc2hhMjU2ICA5NjYzMTNlODEy
OWRiNWQwYjNiMDgxZDFhNTBhZTEwN2RhOWEzZGEyZDhmYWEwNTg5OWUzMDQyYTMzMTkyNTI1ICBz
cmMvaGVscGVycy9MSUNFTlNFLkdPRE9ULnR4dAorc2hhMjU2ICA5NjYzMTNlODEyOWRiNWQwYjNi
MDgxZDFhNTBhZTEwN2RhOWEzZGEyZDhmYWEwNTg5OWUzMDQyYTMzMTkyNTI1ICBzcmMvcnVudGlt
ZXJlbmRlci9MSUNFTlNFLkdPRE9ULnR4dApkaWZmIC0tZ2l0IGEvcGFja2FnZS9xdDYvcXQ2cXVp
Y2szZC9xdDZxdWljazNkLm1rIGIvcGFja2FnZS9xdDYvcXQ2cXVpY2szZC9xdDZxdWljazNkLm1r
CmluZGV4IGNkMzEzODg1MjkuLmZkZDA4MDRkY2EgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcXQ2L3F0
NnF1aWNrM2QvcXQ2cXVpY2szZC5taworKysgYi9wYWNrYWdlL3F0Ni9xdDZxdWljazNkL3F0NnF1
aWNrM2QubWsKQEAgLTIwLDcgKzIwLDkgQEAgUVQ2UVVJQ0szRF9MSUNFTlNFX0ZJTEVTID0gXAog
CXNyYy8zcmRwYXJ0eS9lbWJyZWUvTElDRU5TRS50eHQgXAogCXNyYy8zcmRwYXJ0eS9tZXNob3B0
aW1pemVyL0xJQ0VOU0UubWQgXAogCXNyYy8zcmRwYXJ0eS90aW55ZXhyL0xJQ0VOU0UgXAotCXNy
Yy8zcmRwYXJ0eS94YXRsYXMvTElDRU5TRQorCXNyYy8zcmRwYXJ0eS94YXRsYXMvTElDRU5TRSBc
CisJc3JjL2hlbHBlcnMvTElDRU5TRS5HT0RPVC50eHQgXAorCXNyYy9ydW50aW1lcmVuZGVyL0xJ
Q0VOU0UuR09ET1QudHh0CiAKIFFUNlFVSUNLM0RfQ09ORl9PUFRTID0gXAogCS1EUVRfSE9TVF9Q
QVRIPSQoSE9TVF9ESVIpIFwKLS0gCjIuNTQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
