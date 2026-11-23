Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70527606A327
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 21:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=oDANUTNA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=twjvH3DQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46CE1605EE;
	Mon, 23 Nov 2026 21:53:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2188_Ga5Uogb; Mon, 23 Nov 2026 21:53:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2CEBD606A5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795470807;
	b=MvQOeAXaW4+dY+uqh47T6ZzQfw7jNF//Qnu3a+MKlKvRmzrDhHHQRYby6soDCj8c8RKO
	 jS4ENekFsTq0RiIObcPxI49aNCLMwa43W861wKTmDru2ov5Nv242MnMWL2OKQJWEhQ21S
	 f+Vx9h5D1Q3coX4qmQFS6kAaVXkmVU+FbpQ9oTADSEQDIQLMrjnAYkcFNdS5XzTwvilxg
	 6xjdbS8GV7DexqLgVPLknvBMSw1svkdBPXKXtfVlcRUeAS8QXNdnVOE9IQticebf0oW11
	 hQ2yUvWRItg3CtJpSqHzXF0wj9lnjv2C7WGGzfhcKivCyddX+d0J/t+uyQYcu+xN9kA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795470807;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Mo4mVI2TOaTT/YYrUOK/sZW/IkWybwhHQ6lApqMNkyA=;
	b=I87OzIhbLPGPH4tnqRX9+HMpzO1eX81yk+bLE74nT2zBguqVMM0AaOFQnfJl4bbDaSBw
	 itHTyrCN910cfPE2k0u4fsJkMAXE3Xz71ipS9v8xhd9h3wCIz59EJHI8SA+rw8kCPd9a8
	 2OyeomBYtOe12MSVy/ZTK0r3hm4iuGNDXLxgzqXiMuu7Q79fY/5eJEgd1ddW0AP+yVjAs
	 w/ENZzdWy9k3Ur4LecZQ/32X+cweakuifNRwAJxsO4TvFmJf9KA0jB5+24bFSGKUeNQgF
	 O1Zb4eZkLk+yJgognjavJNRb5SlDho7M5QLpjaYladqAoMvjWCtS/7dUuyFgOVzLmKw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=twjvH3DQ;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795470807;
	bh=Mo4mVI2TOaTT/YYrUOK/sZW/IkWybwhHQ6lApqMNkyA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oDANUTNAJne80B2gPUjeV0Bh/0bqgaQiQl2j6N1F31WngNtCXQVdzL9DJ0WqQvLpY
	 QPD6tLjZNDt3JZYr8Kr/rT4YvhjUgt333JR9fZ7sonQ39pvrRocQJZ6d3BTJXO6eFk
	 f5Ikz3w4YyuQU6lMVTnCCy7NSuLHgNsUYwW8MxGxtkwCWJFH6Ys8hxyrytyct6o2gq
	 IXii5TArlSBuCbJjIGU0lIHAFjcpeBrkKj3txu2pzNcPBhOqrfmY5+9MMsH6ZPFPIv
	 ratOgvJ3GMPkwk1aRkrmPJAmjcAr4cT8mNLJ8X9adn5fTWZPGjF/gsdQMPeTYd8qZN
	 rj4mjaZuKzx7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CEBD606A5;
	Mon, 23 Nov 2026 21:53:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A98E2499
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B677605EE
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OL00ndQfsGTq for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 21:53:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 339C0606A5
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=twjvH3DQ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 339C0606A5
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 21:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795470799;
 bh=ayUZ5wn76Qh30QN5dFxeATQvmQiNkN8ynIyJQIR6yNQ=;
 h=From:To:Cc:Subject:Date:From;
 b=twjvH3DQTHu8rj4wHSO13Npz9+Wc8WJDcBXlR+KGo4sMLN9wY2pqj/Hj6TVCvuzeV
 B6mlLuFpgLSWSxrmKH3CzJGPa4jStgC3Z7Prn3mKUgALIqUDK9MkmEkxusIDLEx0uH
 Q2saSWyBpdLrtEbIMI5mtTqt2BkGI41TzjaTa3mpPixkfGSxKgR1fdClqdVCSUW5QK
 Loogx0nauRGfzOpNPCGXjcbrg3v+TI2BMExgvOGbDETjJBjVnXkusGEaOrOeA4Kcao
 MI/YFEaFHzq30Voc+ZkMe6UVXgq7ZWbFpsFzh2U9Q1VqSzp7PRUsJY3t/dwDWVyDSh
 LSWw6TvNvZ/qg==
X-KAS-Sym: v3:f51bdf72230551df:L6idxqYI53bDXhSkbk5+jYR8r/CVgPq1GxHrC+9MV1O4S
 QbCgCe4mHCwbLJar9DqCDBnsq5cOU7Kag7ufa93kMhTNIv1cYhVjTzC1nfBYgTZ36nK3AKvGaf7
 HvqemW3fQ7i/QXPha56YkLJV6L55SO8CmmkLjSE0zGG2YulxsjwRLxdq2JfW1HpMs08/8n6SA7m
 wEPRIZ/xK3jNjGOEa//GXWGfHFTEIriFOcdd01Xc1760v8G0Z/RlrfGz5eIRUagYM0tvlT7BlwX
 gq72Mv/BrvaS63fNpsQ4c/1MVbYshsYLDowplzX19SbTEip1jzAQa4L0sMOI1s00Nc2zz0DQ==:
 dpOVSpHW7jnjgFAxJ2FvOK43JTG1IJ0vAni485iQmSgTSbNMii5Uvkw1t41jGpQal8PNcVRnLWq
 +VQgWJ8ekSbPd8VGHwQViBSRbnm78Bk71p4Vz5LCzhvKPjTmTdEXoF6iyFSOSkzt5TiAprgkpch
 GzXOIurztWW+udzIeDOhsMG7R3LlkOmP2ejd3pbIhrteCCWEhMgOPllSoA8xbNI6qj+TeDXAmF0
 68puSoFB47u4yAUYZJjXn+6q9Qtp/hzO9Oim4QSz39HhrhnP51Fue7c8j/9RZGJk/v4PpwhZq2o
 zPsSKYcEyqVsvxjGqntcv0q1g+3bQ8gkPAdNygUXKxv0hhnrfzv+715RH/T42BTqbI67HB9wzY2
 Z7vmONzJQCZdHETQ2F3sLc6iLN+G/Gs656JFUTeg2B7PU2Gg4okqZlKnRDc6k2TWxGXCVeDoreB
 6ouZdb1w+xt77rloNpUSMWbPfhxuBznsSTmL1ZmNhOMT56FR8t9ye41l3kKitxl251mnoWGd/HC
 gk9WrQyyN/KRQOr6z/DYmGjqUvbPOUQ/F2FlUWclSan4dE/1ZydOhzfERGtR4EEAiRRICG7GY/a
 2TxSE1+brDbKqf/X9bNd3xRwEZM8i6IT319+Qib69SA7DPiuoI9YnWQjub+IYOuDV7u5xme8/hO
 dgl68TRGdE1nubXrBEq5OUwmG
Received: from fli4l.lan.fli4l (p54a1b597.dip0.t-ipconnect.de [84.161.181.151])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 431C0A4C5A5F;
 Mon, 23 Nov 2026 22:53:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37926)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xVbyQ-000000003EP-1a1c;
 Mon, 23 Nov 2026 21:53:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 23 Nov 2026 22:53:18 +0100
Message-ID: <20261123215318.3796094-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.11.0
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/libexpat/libexpat/blob/R_2_11_0/expat/Changes
https://blog.hartwork.org/posts/expat-2-11-0-released/

Fixes CVE-2026-124317, CVE-2026-128241 & CVE-2026-134703.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/4963db600cf8667c318b44b2bea7ca05b09e83b2

 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index e8939fd38a..af431dadf8 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_10_0
-sha256  c624ba2998fc65df1163a49641ff3f9ab73138b11641d92c86bee0fb01b1bc7f  expat-2.10.0.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_11_0
+sha256  61e7614b602201c28a189dafee78f5bceaee192bbde46a930752ff09cf5542fa  expat-2.11.0.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 23a635e5d4..92f5d96473 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.10.0
+EXPAT_VERSION = 2.11.0
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
