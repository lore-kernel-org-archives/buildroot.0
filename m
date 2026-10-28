Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93976606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 20:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kePligWc;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=RzmANuZb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53D4A6071E;
	Wed, 28 Oct 2026 20:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tp6rhllPy8n3; Wed, 28 Oct 2026 20:25:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D5A1F6070F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793219109;
	b=aDCEXUjhmTSgKi4dSD3WfrcoC9AeMlnmcWy5drcRKU19xNZnWUp4YRZx3IWChuQkhVxA
	 3n/27iW7q304KWcxJEVn18Bi4tywLhxNhZ+Osz5S6W5mBLxi7f9SP9VvrdKJuWA0nid8+
	 ZC6j5Esumj177RoIgSAM5jTzMkUf/ejI78nhfAl5t7b02iLfPOD0LZHdG5l0aIZ23Is+4
	 QypSY/tmHS+6tQLUlL4UG6Nglbx0UIaT5PXdTItTwaO71fClo/wlDlfYOdox7+/Bo2beH
	 651pshcrb/fhrx2wnkg2P6prOpDs98f+AGMUMXja+TsFccXsACCHfmnCXgLtBJlvaTw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793219109;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QfRYTBqc2YLGcdHvpHWDswmAFymO7E4c/1vvFP9D0AQ=;
	b=iOmm6s/1vpEkf8967UKFzQqbWRydxQhBq7gRQqVfeIhDFqCI8HAF/BcbVp/oB2i1g/G/
	 /0hEPz9ODUXwL5WDZG1cwC/etDe+X9T2O1doTyc5zz/BFlXQvAuMIxIIwK9SoTFWeowvf
	 DutN+RNBWaL8bufm3rvsbsYTxvDJAbAam/AX6zAGX4ogISxi9drDSfMHa7LTJgbWSkgp1
	 opACYZcu86KRGNf+BThvlMtgeI73LO0CbSWvGH+2St41iP+6taM5X+FiZjdgVD51lLqG0
	 GpzQ6t/wRlyQeDbz9rT6i9NNZfpPiZm0VT1OsFC7hF7J2tSHiMzo1XlDyBjKj14MR6A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793219108;
	bh=QfRYTBqc2YLGcdHvpHWDswmAFymO7E4c/1vvFP9D0AQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kePligWcsOXzcAzm9YHH0ybXrmRZwGGp+zmtV/zC0JhiUUyw1+d/sYnjkJj8Pvt40
	 uUI6rryZVg4hO8e58PdNYcCmQh952qiQUgbmbao4F5AAFoYWdb9KsT+v0auZw5FsUJ
	 A2MHRh5QkSpA/F7p18X5s09gs7ati0uH2aSKG18uTP47grkA26uAHEDcOMx95yttA1
	 kUZC282NAwlB1PKF1ZYtvg1TQbMuVtcy48dIuh6kiZnAl47TowGy3LYYQeMPXSNQU9
	 shTEQniZYBPDEbtXZAF0r4gOvkikFl46qWzQKI+xrTpqwqCt3Nh6tGs/MuB+U3env9
	 WWrsQcZg56k7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5A1F6070F;
	Wed, 28 Oct 2026 20:25:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DD282A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 20:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 674D881919
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 20:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOAf1wplJaAD for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 20:25:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7E63681882
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793219106;
 b=oNmxKF2I8Z0qv6kD8hBYu8FILGDMgFJD3PARStGgjCsnj1IeDicnfb+jI92AmoDWRLCp
 zX2TnKgPS5e5iq4x1zt2/Zvcz8498Ym6vbycIhp2pFRbncj3StXVRnBLgukwpbLmcHsHG
 pIzN+Cv63/i3z6Uv+xYf38BTHJVYyzsXzn33a+KNdMAeMT78JlhbjELvzWpqjZodvXqdo
 4d6F+Bh49+P5aNXhbH6di/PPqJ1S3+Wwb5fhXK5T1KKCdF/WNcB7MySnsfqWvGaQMgYcL
 +tkCmEwB6LnGoFZTZdNhwYp4kEn2qeS9mY2ZLhF2oDywOnMR7/WyKd92jhJKELTSyXA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793219106;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=EgKA2aQ6RJMzhOeYj/DKbIuQteEDJU9NOKHxFtth1dc=;
 b=KwDK1h326PAFWOjtf5TSZW4UU/Gnpmr5aY7lvfMiqIIbfGwevj3mhq7ZZSjcIbmcMgtD
 NZgx0KVpBpyWZOCb26AnnBC7oYM6U0gsnudciyxB/GDR2EiVpf9Oc1J3RDY5kVQilRLe8
 QuvAhzAhb+O+V/EyxQPDnJvnT6f/VvWLmwqRCLluiOf1C8fH6DMNirXh+337O0GG8r9hV
 2c676GtOX1zHvH6kifs+CbdowujVK0tOfrp22SqstnQ2JD3uEeWfc/8y+OuO5HJMrMJjK
 Qq0kfj6rxEwprDHksQN29RjAuggOr28uwyOH01nr6sXLtW0M4MsoNvdP9htf8CoVK4w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RzmANuZb; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RzmANuZb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E63681882
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 20:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793219102;
 bh=EgKA2aQ6RJMzhOeYj/DKbIuQteEDJU9NOKHxFtth1dc=;
 h=From:To:Cc:Subject:Date:From;
 b=RzmANuZbO7aWNEgt7z9o/f/o2Ginc1tE1deBBxH1orSN5upsLfjxOvPXJT/NTNwti
 6kr6O9k1w0dTpKALd6K4Gm8s1rDjFwzrJpLFiqQSy7KPeMhZ5xyE0VI6Ux8WwiPPQ9
 aLYjCASaIfvRqfGtKrddm1y3ZcLoMCJj/yirm7jtzn4hdux+Ap/+PtRhZTTR9JxU19
 LNJZrr30MFQTUERnqlbXV9h+RkkSpAzl99SiBs0zWprdKWtW5Rpbe3ZyTjZEyGPhTd
 K4OpqUtcFQdf/ZJlsf4vZ771xWo3QcHA6sBMQIHFzrFfVn7wQltkvdNnlBjMgxKSY+
 O8Bys3/bcgY1A==
X-KAS-Sym: v3:f51bdf72230551df:ZFmkApR1VibsjJt7Rxiw73E/TfUuC2l47NCEOEFiyaEqR
 IdhoiQ+YGZzM1b6YLkQNOYDnUPRgso78ds2HVajS83W4Ah9le7nW+0ulkZwzsNQrJJDuOojXn+l
 N6TVuKh738Nfh+ttqTssLNWrtOHBvaDudfAAMSOp66Jwe5anjRUylwkg9GImoMUtoNdyJVS6r1M
 yjDDutE5CSFUQGyIDCmRr9e3VRcub4owV0TfcARgndQigQX2ey16N/r2YMHo1Nb6sXO9j6MgoAt
 rDYR1TrQs7Jz3xzydujgj5pcdBewTfLXzsIY1O4cc2zH7z3JMko8FdoA0r+8nO5aezWFygCQ==:
 YzYLRtBOWbVQzqbaagb3cw9E7L8FyDszBhB+5enNMlZ1UfBgX/RxDNvzWl4mhV0DRLGaWzYHrEy
 zNUPYeVyLw6+eBGbK8wybG3RyW11EaKd/TD1Ta3Qm3uATSCFUdozVtkF1ts8kYfH1mXqxdjyCg6
 6icO3A1f2hk6veq07s/PRoiCi4NZ/SiCWItvlNTdYleVguNbmS574ETio+Qc2W5kPnN/X+SH0p1
 L3/0rsIiiocA5c2May8qtA5CtsCnbkrcexZMxKfUGfpYMTkToda9BZpjKEygTuIYNHV1rIzV28t
 IziYOD8L6DgP02+4AAgRJY7432M1wH0hCCGexSXnLGV3ixBLW1KjZ7NtpolgW2VV7EmXDbux6iH
 l5N9wdR/W9dXdeH4QdVziojyYBeRDiLJSSVMcVZSyUsTeNTWDGQhSoSxctsLLSkI9byof0NpgT8
 pC8+U7A3FOJuPdu31HkAO6uvJGQbjKVgn8saHa+GpLnGQKenVsYzHKKoY4sKqC/w8EHQAi6bYji
 PjzYlBvP0YqGHHS9MefixpOH+Nmwjz0aP6JzTvcZjtspBYqRwR6HzNwWvgYF+9qlOOSaoIvOS49
 qhyyC8qyUlJcxU4fZf7WKbQdZ/l4++1LROtC8GX20SGAUIY6bQbV2sSVjUyo
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C590AA4C2FF7;
 Wed, 28 Oct 2026 21:25:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38376)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMACk-000000004vo-2tVT;
 Wed, 28 Oct 2026 20:25:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Wed, 28 Oct 2026 21:25:02 +0100
Message-ID: <20261028202502.299331-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.2.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://lists.freedesktop.org/archives/mesa-announce/2026-October/000872.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/cd612b6f6347a6ea3ab3071eab8a5f76edebf97d

The only broken target is
bootlin-m68k-68040-uclibc/build/mesa3d-26.2.6/.stamp_built:

../src/compiler/nir/nir_opt_varyings.c:3207:1: error: static assertion
 failed: "dedup_entry layout changed"

The assert was added to 26.2.0 with upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/136596668e09431605d5cbac79243fb935da4520

but neither do I understand it nor do I have an idea about how to fix
the build error.

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index d42e7c7a0a..a58314c049 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.2.5
+MESA3D_HEADERS_VERSION = 26.2.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index fdcc345896..4dc8b80bc0 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-October/000871.html
-sha256  794b3d1729075dae7ebd47c7283b7ca0cdb5dec668f7f11cc0a5d82f6138a0a5  mesa-26.2.5.tar.xz
-sha512  08c7d7ea426ddfb0f7bc51b06e18c363a4d31cf1a8b203828bb455eda0189e41d2215eb9f627585ed11e0d0f231a6a8c9f0c7176238760cd76b62e20c35ccd6a  mesa-26.2.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-October/000872.html
+sha256  b9436b3e1a8be76fbd4823dc884f90596ab7c6ac5e1867a305e66ffccfb31a92  mesa-26.2.6.tar.xz
+sha512  0959679a8e9560a36d63bfc67357c73fde6fd98b00c29859ab30b31454b9ef8c8def38c7e180b168fd39080681042559dfc4a4252dfb289930a9776e0243c2dc  mesa-26.2.6.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f20f02190a..38d88ddec5 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.2.5
+MESA3D_VERSION = 26.2.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
