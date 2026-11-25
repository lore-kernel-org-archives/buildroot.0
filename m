Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDAB606A321
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VJ9Db2+f
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EBBD6088E;
	Wed, 25 Nov 2026 10:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tF6pQMGLVL_d; Wed, 25 Nov 2026 10:46:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 79D1560706
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795603610;
	b=kq1a5SFFcRX2V6oFkGm6W33vSC4Ak5s26du4zCUt9JdNbDEi4Gc/Oh6RRb6a+Xfya/eZ
	 7ScoX25oW3MDS2KP5GSHygAC4Zw3Bve233GBCniDtSWmV6Snv8dbillaAe6ArsvRhqPAa
	 5ZygoIOkkqzvmpQu6fOXoq/QZmppddSiP3TEnhRuiV6+y/ZB3jawGy5ZFZWZq6YQWxOa6
	 Ct4er5IOZalhK1nUrc3TB7bgiYs+cAP5d7Qw/lQ69JKstIaQ/GZYKVaQsmrIY7mECjpM8
	 n8PgjAjAluP2drqvHDLzSYm9TfwUpuqLi9uTYBVhsGkzSq5IU1cXpHxE3nn3OFWQNPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795603610;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oAlxtsh2jMZV0daLrdGaZ/7ymOL/jZokW222KOlT/uw=;
	b=chE7W0EG03R544DksUGuLpBV1SLUHWU1dKx/3BKxm9tk6Ewvg6S/owU9183U+OriMI4N
	 MKSE+7ZIoEYesreucSvTuBgqewnOaYTANa5LGdeuv1zp0qitns9O3xp8sB0FKxq5LfC6/
	 9ttbuX93bj/sLTj6UfpT33mv0lTUj0HB7D/wkdJJPYTX3oVnzRLfr6r+P9DnWSlDLS9N6
	 W0HfJFKHqxa0arfSLCTaT1MKMWprIx5kO/sQSFF6d4VOcnwX/BEnEx4vVCvUi6PHGf9Ma
	 yjXkSCrLJMb3vqAF7//pHHp69saWQxVY3X3BTH+AdgYcBd2IvFDBxbPiB7RsshOScCw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795603610;
	bh=oAlxtsh2jMZV0daLrdGaZ/7ymOL/jZokW222KOlT/uw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=VJ9Db2+fTnp0HCS1Qri+dX20iT91K4dXLy9zX3MALnHNiPVUiPHKdnwSjx57fGhLt
	 6bOnxfIn6VmEr7bROmmO7FP1ovTU7xCo2rXe90IFxwyrCUhVParkv2hRKDF6dDte2F
	 z65pGG+Kq+0Ek7vDSxTjbJDr/QCAKXFxenpNJnKqGfB6ZndKIL9nv601WSe2juS72Q
	 FSVdxhVHgwqdnWFK1AfYQ4CI224kZNCk10CfFmOH/vPmfD5ElU5PI7ttzTG0ykejYS
	 Y9qko4+0vh9a8vz9j498VfuPcgya9Kzmti8843QpGFlOQCORc0ZMuYp2P3MV178p8a
	 RvKb7S3lk3wIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79D1560706;
	Wed, 25 Nov 2026 10:46:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CDAAA1C9
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 10:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB3D280C0F
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 10:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4rIpXq0mLaj for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 10:46:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 74CE080C47
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74CE080C47
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 10:46:46 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c5118deebcfso834647666b.1
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 02:46:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795603605; x=1796208405;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZmRg9XZzrPWOCtxlDfNT5gERiC4OC+Seczv+wTOJ1es=;
 b=pfic/DDstz2Kzd1AMBi0FI1hPfr7Exs4/f9THJFx+bgOBaxe101YM5nZhC9/XoWYY5
 86KM3G1GAhbs7Lx/otEAq6Fj2lz/jMel9MYX/PZG+7d8j1Y5IfFj2HM7t8SbsgUHP0/Y
 fxjwJA5/pC5MU3xlmuYWFg96e9+Y7K620+fne5XGbpENh9x+4AqkfKyLRK8g2S15VXAy
 Fqm95drqACcVWzz+dnqXGvIFahecOE+eR51DYvZc7wA2qZbc/ElOb3KNep8gZ8aay5DH
 r4RnU+qyNW23iAAOyIbd0K+ufAobOd6dAKwXc4WyCoXuA7/6CqwPjbG+c5Q4qm+yN930
 3Bpg==
X-Gm-Message-State: APuU4Z92C1dVaK0F77OmhqnZjcFy6yAwkmklle6w7NiKt6KWtTUY2lLy
 Kca8kkohZ9vgyKF25dtLJQmdLhpSEeL24XX/jS1DXBD3bmv+ShAxsIBAgOBDgw==
X-Gm-Gg: AZFdTZe2s91TPGaaZ7CCsSW40GU5yOrFODQsOcYnCjMSNtxU9KA+Aw3wgsFDVb8+BZX
 qgimidEL8c4wuRDkKVlSn+zor0CNAgldZsUNgmOgInF7X6hw1l2hNlD7F6Tvdykm/Z17BZRdbDC
 pBAQsHy5zGVaplvx5y+7sq5bnfkSovsoLMurGjGVwd0KTh9UnyozIXDaI0uFxOSGnyJQZZd4DnZ
 XCkJ1Qov1x5ZuCt1rWyG6Omg5PQw03VUlJ2ePBvMXY7B2AHDIbrWouGR08zWcjs4QytPZKR+Kv1
 aiy5lroQfcVGsrE0XOEKzUkH5Hg4q4noWz1Vxo5tR8yKX14e17CtW6jjKkfTh0R8V5IDcH1qp4/
 nEGgDRPhMSHfXszKinZota0fk8JGtDMfHtlaK0cWKZsetLoYleRFKTsg/DNVmS94PAPfFfkeu2x
 z3N5a5jG7BtaMcYxGzPLt93VPnW1rL6H4V2HaMmKvgfyq0vXq1y046gLhhkeHCVPG9loYnWcDSB
 vdwpQFpbvAjl4FJN7Z+rS7nNtHq5xgiZKzrJ/cIyJ/GKUMKhrFTkn/+lGAHji9TfpAdwNM1qkBr
 MmqcYRndp7nC4w/oPdIgjSn/AipSlohPpfsVJsrwevrXOQRcoviHMYcLvmsOprtn2zgEvEV3HEQ
 tCkZ9pzBO8kZDueohk++K4pDRAdkviQ==
X-Received: by 2002:a17:906:ad1:b0:c2d:d408:5d9c with SMTP id
 a640c23a62f3a-c513ac9c0d9mr1011134866b.48.1795603604990; 
 Wed, 25 Nov 2026 02:46:44 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513aec5115sm614911566b.51.2026.11.25.02.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 02:46:44 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 25 Nov 2026 11:46:44 +0100
Message-Id: <20261125104644.434701-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libroxml: switch to GitHub
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

download.libroxml.net is broken: it serves a certificate for
*.blunderer.org and answers every request with an HTTP 500 error, so the
download fails:

  HSTS in effect for download.libroxml.net:80
  [0] Downloading 'https://download.libroxml.net/pool/v3.x/libroxml-3.0.2.tar.gz' ...
  HTTP ERROR response 500  [https://download.libroxml.net/pool/v3.x/libroxml-3.0.2.tar.gz]

Fetch the 3.0.2 tag from the upstream GitHub repository instead, which
the libroxml homepage links to. Apart from the generated autotools
files, its content is identical to the release tarball, so autoreconf
the package. configure.ac uses PKG_CHECK_MODULES (for the optional fuse
helper), so add host-pkgconf to provide pkg.m4.

The download site has been used since the package was added and only
broke recently, so there is no culprit commit; all maintained branches
(2025.02.x, 2026.02.x, ...) use the same URL and are affected.

Fixes:
https://autobuild.buildroot.org/results/54c4c3522ae4e337ef7818988866dff2e961027d

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libroxml/libroxml.hash | 2 +-
 package/libroxml/libroxml.mk   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libroxml/libroxml.hash b/package/libroxml/libroxml.hash
index 547f82b60c..208272f2fa 100644
--- a/package/libroxml/libroxml.hash
+++ b/package/libroxml/libroxml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ed6d68d1bceabf98e5e76907411e2e4d93b2dbd48479ab41dede851f59dad6a3  libroxml-3.0.2.tar.gz
+sha256  de41c88952c896e9a43ca630e88ac75e24af74a8731e21858b12e3cb2385c3f4  libroxml-3.0.2.tar.gz
 sha256  fe11466c265ad0a6c3896ea113af9403c0a8372b1fdd78712db64f0f1bac6387  License.txt
diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 7e2488aea4..e658b82d15 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -5,8 +5,11 @@
 ################################################################################
 
 LIBROXML_VERSION = 3.0.2
-LIBROXML_SITE = http://download.libroxml.net/pool/v3.x
+LIBROXML_SITE = $(call github,blunderer,libroxml,$(LIBROXML_VERSION))
 LIBROXML_INSTALL_STAGING = YES
+# From GitHub, no configure script
+LIBROXML_AUTORECONF = YES
+LIBROXML_DEPENDENCIES = host-pkgconf
 LIBROXML_LICENSE = LGPL-2.1+ with static link exception
 LIBROXML_LICENSE_FILES = License.txt
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
