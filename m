Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50D9C28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 17:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14F7D41E55;
	Thu, 20 Mar 2025 17:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6u0as2U-jTqj; Thu, 20 Mar 2025 17:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 346D7419B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 346D7419B6;
	Thu, 20 Mar 2025 17:25:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F13B01A4
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 17:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDE7E810A6
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 17:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BRrQ9Bv3eKpm for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 17:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1DFE281053
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DFE281053
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1DFE281053
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 17:25:47 +0000 (UTC)
Received: from 91-153-34-249.elisa-laajakaista.fi ([91.153.34.249] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tvJeL-003q4P-11; Thu, 20 Mar 2025 18:25:45 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id dc0114dc;
 Thu, 20 Mar 2025 17:25:44 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 20 Mar 2025 19:25:42 +0200
Message-ID: <20250320172543.2490556-1-aperez@igalia.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ebQkrI2ii1+gC/ST82ctz1G+Ha/x+nxQlE7+Fzptpo8=; b=cNSyolEtRrr6jUVxWfikyDuZnK
 ydnZmQ8AvwfpCfnX5FZSjuDDcFeOzdl7IliBWV3f4O41VKSzuSYUCgwSKaGyUMtUYThAtw2oP0of/
 9Jw2lNCY9JGj4mHzolaai3dqzACsnrDiHNiVzywMDixZ6rSTD6GRrhO0SIlS+iqGra5L+Oy/TzbQD
 0a1Z21kUGzNBY6BJoxMJ7wpi8XtpbS8oVkn6UDxSU4LkObx+TyGG2roC3n7nrXyxEFaOpn3ZZA6ja
 2+Q/hnRFOBYaB07yemLsHiWjeA1zNVwRTn91KSmJEr6dWop8E8zX1wXf9Pnx865rt4IpTPu0y4CjR
 2zuSZsDA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=cNSyolEt
Subject: [Buildroot] [PATCH 1/1] package/libmanette: bump to version 0.2.11
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

Bugfix release with a number of fixes, it also adds support for the
Steam Deck gamepad. Release notes:

  https://gitlab.gnome.org/GNOME/libmanette/-/blob/1acb46943d4d970abe594b634a058c93b3021258/NEWS

This version introduces a dependency on the hidapi package.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libmanette/Config.in       | 7 +++++--
 package/libmanette/libmanette.hash | 4 ++--
 package/libmanette/libmanette.mk   | 3 ++-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/libmanette/Config.in b/package/libmanette/Config.in
index 31fff15286..cbf6a5085b 100644
--- a/package/libmanette/Config.in
+++ b/package/libmanette/Config.in
@@ -2,8 +2,10 @@ config BR2_PACKAGE_LIBMANETTE
 	bool "libmanette"
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_USE_WCHAR # libglib2 -> gettext
+	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+	select BR2_PACKAGE_HIDAPI
 	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -11,7 +13,8 @@ config BR2_PACKAGE_LIBMANETTE
 
 	  https://gitlab.gnome.org/GNOME/libmanette
 
-comment "libmanette needs a toolchain w/ wchar, threads, headers >= 4.16"
+comment "libmanette needs a toolchain w/ wchar, threads, headers >= 4.16, udev"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16 || \
+		!BR2_PACKAGE_HAS_UDEV
diff --git a/package/libmanette/libmanette.hash b/package/libmanette/libmanette.hash
index 3653d672de..0ec6077c2c 100644
--- a/package/libmanette/libmanette.hash
+++ b/package/libmanette/libmanette.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.9.sha256sum
-sha256  29366be5452f60a74c65fc64ffe2d74eddd4e6e6824c2cefa567a43bd92b688f  libmanette-0.2.9.tar.xz
+# From https://download.gnome.org/sources/libmanette/0.2/libmanette-0.2.11.sha256sum
+sha256  b812b94e08632ba62a30960a8de29217a73a2fff5da2f12acc8a5d4771a49a70  libmanette-0.2.11.tar.xz
 
 # Locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libmanette/libmanette.mk b/package/libmanette/libmanette.mk
index 7872c8b796..44beef836f 100644
--- a/package/libmanette/libmanette.mk
+++ b/package/libmanette/libmanette.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBMANETTE_VERSION_MAJOR = 0.2
-LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).9
+LIBMANETTE_VERSION = $(LIBMANETTE_VERSION_MAJOR).11
 LIBMANETTE_SOURCE = libmanette-$(LIBMANETTE_VERSION).tar.xz
 LIBMANETTE_SITE = https://download.gnome.org/sources/libmanette/$(LIBMANETTE_VERSION_MAJOR)
 LIBMANETTE_LICENSE = LGPL-2.1+
@@ -14,6 +14,7 @@ LIBMANETTE_INSTALL_STAGING = YES
 LIBMANETTE_DEPENDENCIES = \
 	libevdev \
 	libglib2 \
+	hidapi \
 	$(TARGET_NLS_DEPENDENCIES)
 
 LIBMANETTE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
