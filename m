Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BE2C02185
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 21:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 120E6412F4;
	Sat, 18 Jan 2025 21:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RrzruzYR7MfG; Sat, 18 Jan 2025 21:41:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CEC941244
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CEC941244;
	Sat, 18 Jan 2025 21:41:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BFEE69
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CA2E606AE
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YWhMOMH66d5 for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 21:41:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0F9B460592
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F9B460592
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F9B460592
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 21:41:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c706.dip0.t-ipconnect.de [79.214.199.6])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9BFF9A4C462C;
 Sat, 18 Jan 2025 22:40:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56786)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tZGYn-000000005hH-462o;
 Sat, 18 Jan 2025 21:40:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Jan 2025 22:40:53 +0100
Message-Id: <20250118214053.115126-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250118214053.115126-1-bernd@kuhls.net>
References: <20250118214053.115126-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1737236454;
 bh=C3HbY8OgAQMyPFzWMmpmMoA9DzXBN1ZWciaY+CJMuWQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ewMdD+wJr3WYMXzZJpvM2MhwX6uWFkN3kdbVH3+1anGAGd9lnYXzJ906+Uw1ioQ+k
 jNikTQDRwhyNW3hNCcXJvAW5VDljNjm8DlMCoF2RYOxisGbP/tJsxuHUzzQlPoRQR0
 TUywz7Ot9jgL4NxR4T17thWtjkdeujwj+aQNPpvwj0xCBLe4lEj2e4hvrY+3LOTJM0
 wI5OJioIgvqcymIh4deO9sNf8j0Tg8MdejO0qN3Y860d+Q1tHe2rHsn+pt3pSJ30Co
 NACpkQkN4UInXOM40Yz1+myLu5YrW3lVoZctcCBkrYSP8F0UvqgLkAGuzsi129xxul
 hyQtCa4iYDrkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=ewMdD+wJ
Subject: [Buildroot] [PATCH 2/2] package/taglib: bump version to 2.0.2
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

Changelog: https://github.com/taglib/taglib/blob/master/CHANGELOG.md

Needs utfcpp:
https://github.com/taglib/taglib/commit/6ed0ca28db0d12a75572c0f5dcefdc5ebb34cc21

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/taglib/Config.in   | 1 +
 package/taglib/taglib.hash | 2 +-
 package/taglib/taglib.mk   | 5 +++--
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/taglib/Config.in b/package/taglib/Config.in
index 6a87a13215..5b641a9653 100644
--- a/package/taglib/Config.in
+++ b/package/taglib/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TAGLIB
 	bool "taglib"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_UTFCPP
 	help
 	  TagLib is a library for reading and editing the meta-data of
 	  several popular audio formats. Currently it supports both
diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index e83aa451f3..bbf5dd26d5 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c8da2b10f1bfec2cd7dbfcd33f4a2338db0765d851a50583d410bacf055cfd0b  taglib-1.13.1.tar.gz
+sha256  0de288d7fe34ba133199fd8512f19cc1100196826eafcb67a33b224ec3a59737  taglib-2.0.2.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 9bdf05b85d..005a6cc728 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 1.13.1
-TAGLIB_SITE = http://taglib.github.io/releases
+TAGLIB_VERSION = 2.0.2
+TAGLIB_SITE = https://taglib.org/releases
 TAGLIB_INSTALL_STAGING = YES
+TAGLIB_DEPENDENCIES += utfcpp
 TAGLIB_LICENSE = LGPL-2.1 or MPL-1.1
 TAGLIB_LICENSE_FILES = COPYING.LGPL COPYING.MPL
 TAGLIB_CPE_ID_VENDOR = taglib
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
