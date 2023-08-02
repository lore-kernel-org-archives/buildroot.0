Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC12C001E0
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 17:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03D5C40276;
	Wed,  2 Aug 2023 17:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03D5C40276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OS5AfSMW1u-a; Wed,  2 Aug 2023 17:54:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3AE3402D9;
	Wed,  2 Aug 2023 17:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3AE3402D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 881041BF3A7
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 17:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AC6140353
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 17:54:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC6140353
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aT4zOMUt17KP for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 17:54:11 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C099418A4
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 17:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C099418A4
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AADA0A4C00C6;
 Wed,  2 Aug 2023 19:54:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35912)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qRG2x-0006yM-0w;
 Wed, 02 Aug 2023 19:54:07 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 19:54:07 +0200
Message-Id: <20230802175407.537056-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690998847;
 bh=pSfy1S8yD9fgyyBv2fpox5B9pEHs5iCJKkzTGS+jrC0=;
 h=From:To:Cc:Subject:Date:From;
 b=FTd9R3g1gnKwXvgBrNBoIk6EBb46NDUHSpm9R05QOtxo8uWk96Rq0FuWpDavq1NdT
 cx8p8ekpNkGI0jOi80U9q9oze92ZE1O6+eDsMJJMWpVDYNBirPgY89VoeXLygX3AZc
 KrI0AoyQE7DtRHPR2BOB0tsjklA7iL0hiuQz2qJAYHjUChYmkfF4EmtRushRaDa7tA
 9ZnXCZVohck8PecUIh5UbXdHLFmhr0OIdfhQfmlbEvVh10F7u//uZK6QNAtlLK1Xiq
 W5GhUO+k1fMDTRDIJFIDkYiUx3RpvuBts/oelKsPRm+IwZ80ZDerGMlQLpFkSUa29v
 vtGDRsiTLQ52g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=FTd9R3g1
Subject: [Buildroot] [PATCH 1/1] package/proj: bump version to 9.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/OSGeo/PROJ/blob/master/NEWS

Switch package to cmake, add json-for-modern-cpp dependency.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/proj/Config.in |  7 ++++---
 package/proj/proj.hash |  6 +++---
 package/proj/proj.mk   | 14 +++++++-------
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/package/proj/Config.in b/package/proj/Config.in
index 1952fc7d9a..d9a9918c43 100644
--- a/package/proj/Config.in
+++ b/package/proj/Config.in
@@ -1,9 +1,10 @@
 config BR2_PACKAGE_PROJ
 	bool "proj"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # json-for-modern-cpp
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_SQLITE
 	help
 	  proj.4 is a standard UNIX filter function which converts
@@ -14,7 +15,7 @@ config BR2_PACKAGE_PROJ
 
 	  http://proj4.org/
 
-comment "proj needs a toolchain w/ C++, gcc >= 4.7, threads, wchar"
+comment "proj needs a toolchain w/ C++, gcc >= 4.9, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 96d94e458e..054499beca 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from http://download.osgeo.org/proj/proj-8.1.1.tar.gz.md5
-md5  f017fd7d35311b0d65b2cf0503844690  proj-8.1.1.tar.gz
+# From http://download.osgeo.org/proj/proj-9.2.1.tar.gz.md5
+md5  c8e878049ef27330ac94624e1a75b0db  proj-9.2.1.tar.gz
 # Locally calculated
-sha256  82f1345e5fa530c407cb1fc0752e83f8d08d2b98772941bbdc7820241f7fada2  proj-8.1.1.tar.gz
+sha256  15ebf4afa8744b9e6fccb5d571fc9f338dc3adcf99907d9e62d1af815d4971a1  proj-9.2.1.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index bc924b41fb..641613a02a 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PROJ_VERSION = 8.1.1
+PROJ_VERSION = 9.2.1
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
 PROJ_INSTALL_STAGING = YES
-PROJ_DEPENDENCIES = host-pkgconf host-sqlite sqlite
+PROJ_DEPENDENCIES = host-pkgconf host-sqlite json-for-modern-cpp sqlite
 
 PROJ_CFLAGS = $(TARGET_CFLAGS)
 PROJ_CXXFLAGS = $(TARGET_CXXFLAGS)
@@ -25,16 +25,16 @@ PROJ_CONF_ENV = \
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 PROJ_DEPENDENCIES += libcurl
-PROJ_CONF_OPTS += --with-curl=$(STAGING_DIR)/usr/bin/curl-config
+PROJ_CONF_OPTS += -DENABLE_CURL=ON
 else
-PROJ_CONF_OPTS += --without-curl
+PROJ_CONF_OPTS += -DENABLE_CURL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_TIFF),y)
 PROJ_DEPENDENCIES += tiff
-PROJ_CONF_OPTS += --enable-tiff
+PROJ_CONF_OPTS += -DENABLE_TIFF=ON
 else
-PROJ_CONF_OPTS += --disable-tiff
+PROJ_CONF_OPTS += -DENABLE_TIFF=OFF
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
