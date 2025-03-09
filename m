Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAD1C28B2F
	for <buildroot@archiver.kernel.org>; Sun,  9 Mar 2025 16:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1806680DDF;
	Sun,  9 Mar 2025 16:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id un2s2RcdrgeL; Sun,  9 Mar 2025 16:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECB758205A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECB758205A;
	Sun,  9 Mar 2025 16:36:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F6E9DC
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 16:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 108DD80DE0
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 16:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yw3AOfxwlPNk for <buildroot@buildroot.org>;
 Sun,  9 Mar 2025 16:36:50 +0000 (UTC)
X-Greylist: delayed 603 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 09 Mar 2025 16:36:49 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8DF7480DDF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DF7480DDF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=114.111.35.41;
 helo=cvsmtppost33.nm.naver.com; envelope-from=dungeonlords789@naver.com;
 receiver=<UNKNOWN> 
Received: from cvsmtppost33.nm.naver.com (cvsmtppost33.nm.naver.com
 [114.111.35.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DF7480DDF
 for <buildroot@buildroot.org>; Sun,  9 Mar 2025 16:36:48 +0000 (UTC)
X-Originating-IP: 125.132.232.68
Received: from cvsendbo024.nm ([10.112.24.41])
 by cvsmtppost33.nm.naver.com with ESMTP id uhH8aerWTkaHJwu0GfCdZw
 for <buildroot@buildroot.org>; Sun, 09 Mar 2025 16:26:44 -0000
X-Session-ID: -jpE-s8yTQSaa-souvhJpg
X-Originating-IP: 125.132.232.68
X-Works-Send-Opt: E/YqjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: ZwnmFxudFqJZ+HmqKAU9+6E=
Received: from Linux.. ([125.132.232.68])
 by cvnsmtp002.nm.naver.com with ESMTP id -jpE-s8yTQSaa-souvhJpg
 for <multiple recipients>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 09 Mar 2025 16:26:43 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: buildroot@buildroot.org
Cc: Cherniaev Andrei <dungeonlords789@naver.com>,
 Thomas Petazzoni <1089203+tpetazzoni@users.noreply.github.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 10 Mar 2025 01:26:11 +0900
Message-ID: <20250309162614.2549737-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=naver.com; s=s20171208; 
 t=1741537604; bh=osFuVpyA9pOCOcctfTF/ZmoGqI0NDNmaAqyA2Bhn6/I=;
 h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
 X-Works-Security;
 b=xpsdy7mbuZ695GE0U264n6ECjPRT3ULSaVA3F8froSMyUYn3TLcMbIHbhbZ8dR1UT
 4wyJ1o45HizAga+nOL0wx7VInMY84T08f8ofER9UYppSHi/dw24dkXUI/443gXTuoc
 QlllzvdKoJDwaE0nrFLuytoXQHXLxkZ1qg1P4JoACnAeXn2hGJyfXypL2idJ4Dn4rY
 JdjxhamymqljtU71erw4dVwP20QUNM2xHz/jKAbcmidDcF1z4JIsG2WDgXN8Fh7Vg7
 ifmAwZOcS5D6Q7VGgAwjlOWTSl+niIEufGbuUKtk7UQPnHNT7w/TgqRwZmqRawyuYB
 /mRhvOm8wq58g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=naver.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256
 header.s=s20171208 header.b=xpsdy7mb
Subject: [Buildroot] [PATCH 1/2] package/pkg-meson: change build sub-dir name
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
The choice of "build" as the build sub-directorty is a bit stupid.

Co-Authored-By: Thomas Petazzoni <1089203+tpetazzoni@users.noreply.github.com>
---
 package/pkg-meson.mk | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index bc805b799c..30271e35e5 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -147,12 +147,12 @@ $(2)_CXXFLAGS ?= $$(TARGET_CXXFLAGS)
 #
 #
 define $(2)_CONFIGURE_CMDS
-	rm -rf $$($$(PKG)_SRCDIR)/build
-	mkdir -p $$($$(PKG)_SRCDIR)/build
+	rm -rf $$($$(PKG)_SRCDIR)/buildroot-build
+	mkdir -p $$($$(PKG)_SRCDIR)/buildroot-build
 	sed -e "/^\[binaries\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_BINARIES),\n$$(x)):" \
 	    -e "/^\[properties\]$$$$/s:$$$$:$$(foreach x,$$($(2)_MESON_EXTRA_PROPERTIES),\n$$(x)):" \
 	    $$(call PKG_MESON_CROSSCONFIG_SED,$(2)_CFLAGS,$(2)_CXXFLAGS,$(2)_LDFLAGS,$(2)_FCFLAGS) \
-	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
+	    > $$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf
 	PATH=$$(BR_PATH) \
 	CC_FOR_BUILD="$$(HOSTCC)" \
 	CXX_FOR_BUILD="$$(HOSTCXX)" \
@@ -162,21 +162,21 @@ define $(2)_CONFIGURE_CMDS
 		--libdir=lib \
 		--default-library=$(PKG_MESON_DEFAULT_LIBRARY) \
 		--buildtype=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
-		--cross-file=$$($$(PKG)_SRCDIR)/build/cross-compilation.conf \
+		--cross-file=$$($$(PKG)_SRCDIR)/buildroot-build/cross-compilation.conf \
 		-Db_pie=false \
 		-Db_staticpic=$(if $(BR2_m68k_cf),false,true) \
 		-Dstrip=false \
 		-Dbuild.pkg_config_path=$$(HOST_DIR)/lib/pkgconfig \
 		-Dbuild.cmake_prefix_path=$$(HOST_DIR)/lib/cmake \
 		$$($$(PKG)_CONF_OPTS) \
-		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
+		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/buildroot-build
 endef
 else
 
 # Configure package for host
 define $(2)_CONFIGURE_CMDS
-	rm -rf $$($$(PKG)_SRCDIR)/build
-	mkdir -p $$($$(PKG)_SRCDIR)/build
+	rm -rf $$($$(PKG)_SRCDIR)/buildroot-build
+	mkdir -p $$($$(PKG)_SRCDIR)/buildroot-build
 	$$(HOST_CONFIGURE_OPTS) \
 	$$($$(PKG)_CONF_ENV) $$(MESON) setup \
 		--prefix=$$(HOST_DIR) \
@@ -188,7 +188,7 @@ define $(2)_CONFIGURE_CMDS
 		--wrap-mode=nodownload \
 		-Dstrip=true \
 		$$($$(PKG)_CONF_OPTS) \
-		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
+		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/buildroot-build
 endef
 endif
 endif
@@ -203,12 +203,12 @@ ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 define $(2)_BUILD_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
+		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build
 endef
 else
 define $(2)_BUILD_CMDS
 	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build
+		$$(NINJA) $$(NINJA_OPTS) $$($$(PKG)_NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build
 endef
 endif
 endif
@@ -220,7 +220,7 @@ endif
 ifndef $(2)_INSTALL_CMDS
 define $(2)_INSTALL_CMDS
 	$$(HOST_MAKE_ENV) $$($$(PKG)_NINJA_ENV) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
 endef
 endif
 
@@ -231,7 +231,7 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
 endef
 endif
 
@@ -242,7 +242,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	$$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(TARGET_DIR) \
-		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
+		$$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/buildroot-build install
 endef
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
