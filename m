Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45543D111B6
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 07:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D02FF8089D;
	Mon,  4 Nov 2024 07:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLYBKvoqdfGr; Mon,  4 Nov 2024 07:46:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F00AE808A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F00AE808A2;
	Mon,  4 Nov 2024 07:45:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CEA6B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 07:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A8C44021A
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 07:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id krMPWiAnY8yu for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 07:45:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.160;
 helo=cvsmtppost19.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75F4840169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75F4840169
Received: from cvsmtppost19.nm.naver.com (cvsmtppost19.nm.naver.com
 [114.111.35.160])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75F4840169
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 07:45:55 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo037.nm ([10.112.22.39])
 by cvsmtppost19.nm.naver.com with ESMTP id lb6OibnBR2KbKB7t8CvLYg
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 07:45:54 -0000
X-Session-ID: jSp2RhbcRyC02lCQZexWMA
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: xeYZjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAu=
X-Works-Smtp-Source: /qYXFogqFqJZ+HmZFxvq+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp010.nm.naver.com with ESMTP id jSp2RhbcRyC02lCQZexWMA
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 Nov 2024 07:45:52 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Cherniaev Andrei <dungeonlords789@naver.com>
Date: Mon,  4 Nov 2024 16:45:39 +0900
Message-ID: <20241104074539.2369910-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1730706354; bh=ufZkZU2Ta8wKy44/vbLQF/0Pv88L6FOoWPY2PLdL7VM=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=pfnaYm0ED9U5q81r8Avj1ti0XEWcahbNokteCLr/HhWz1CdZVuSVYzRJjTIsb3Hva
 1d11YddCytepTdFILXxTA7esHMCP7LPRiOHCr8cc+U/EGxdAya2RAwpF/NDUb/7gKK
 0hvgPpz7PtQT5QojIlO603H4NaMLzDxpzhZd5pHNBgEzdT3h4uGSIRzFRkgR3hK2xF
 Nngh9myF1lJxGcq4i7JGANtCNMsCSKUmBX/kEdv0Xq4Dmw16f/EJAw737STRj+APSw
 EHS/4PN60g3lc566lBSssfPmwW5u2RJccSa99LCX3Czu4E7UGYthu9lUZX+Z0+XN9V
 If9zX7d1kXA6w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=pfnaYm0E
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: use --clearcache instead
 of rm -rf
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I encountered a situation where build/ is not empty folder so when all files in build/ was removed by buildroot I was not able to use meson, example https://gitlab.com/buildroot.org/buildroot/-/issues/64

Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
---
 package/pkg-meson.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index bc805b799c..2ddf0a95eb 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -147,7 +147,6 @@ $(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
 #
 #
 define $(2)_CONFIGURE_CMDS
-	rm -rf $$($$(PKG)_SRCDIR)/build
 	mkdir -p $$($$(PKG)_SRCDIR)/build
 	sed -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
 	    -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
@@ -163,6 +162,7 @@ define $(2)_CONFIGURE_CMDS
 		--default-library=$(PKG_MESON_DEFAULT_LIBRARY) \
 		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
 		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
+		--clearcache \
 		-Db_pie=false \
 		-Db_staticpic=$(if $(BR2_m68k_cf),false,true) \
 		-Dstrip=false \
@@ -175,7 +175,6 @@ else
 
 # Configure package for host
 define $(2)_CONFIGURE_CMDS
-	rm -rf $$($$(PKG)_SRCDIR)/build
 	mkdir -p $$($$(PKG)_SRCDIR)/build
 	$$(HOST_CONFIGURE_OPTS) \
 	$$($$(PKG)_CONF_ENV) $$(MESON) setup \
@@ -186,6 +185,7 @@ define $(2)_CONFIGURE_CMDS
 		--default-library=shared \
 		--buildtype=release \
 		--wrap-mode=nodownload \
+		--clearcache \
 		-Dstrip=true \
 		$$($$(PKG)_CONF_OPTS) \
 		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
