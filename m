Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69673C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20113605EB;
	Fri, 16 May 2025 11:53:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zg4jQpHfpJIg; Fri, 16 May 2025 11:53:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53C64608FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53C64608FA;
	Fri, 16 May 2025 11:53:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FD6E13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 160EE608FA
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFQJk1Du7P58 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:53:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5464D605EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5464D605EB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:53:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E4478694B; Fri, 16 May 2025 11:53:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 13:53:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a1aaec3f3db99bd8fda26cbaf476f4c20dd6740
X-Git-Newrev: 0c230eef9075a37248488ecf0a877012115f7b58
X-Patchwork-Hint: ignore
Message-Id: <20250516115331.4E4478694B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: update to 2.3.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0c230eef9075a37248488ecf0a877012115f7b58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://git.infradead.org/?p=mtd-utils.git;a=blob;f=CHANGELOG.md

The TestMtd build fails with the following error

  checking pkg-config is at least version 0.9.0... ./configure: line
  5375: .../output/TestMtd/host/bin/pkg-config: No such file or
  directory

So we promote host-pkgconf to be a required dependency for the build.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtd/mtd.hash | 4 ++--
 package/mtd/mtd.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 0eb90a5118..84b9e83bff 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc
-sha256  f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c803  mtd-utils-2.2.1.tar.bz2
+# https://infraroot.at/pub/mtd/mtd-utils-2.3.0.tar.bz2.asc
+sha256  2db102908b232406ccb20719c0f43b61196aef4534493419fbf98a273c598c10  mtd-utils-2.3.0.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 77050e7e40..4ff43a1dce 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.2.1
+MTD_VERSION = 2.3.0
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = https://infraroot.at/pub/mtd
 MTD_LICENSE = GPL-2.0
@@ -12,6 +12,7 @@ MTD_LICENSE_FILES = COPYING
 MTD_CPE_ID_VENDOR = mtd-utils_project
 MTD_CPE_ID_PRODUCT = mtd-utils
 MTD_INSTALL_STAGING = YES
+MTD_DEPENDENCIES = host-pkgconf
 
 MTD_LDFLAGS = $(TARGET_LDFLAGS)
 
@@ -28,7 +29,7 @@ MTD_CONF_OPTS += --without-lzo
 endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
-MTD_DEPENDENCIES += host-pkgconf zlib
+MTD_DEPENDENCIES += zlib
 MTD_CONF_OPTS += --with-zlib
 else
 MTD_CONF_OPTS += --without-zlib
@@ -43,7 +44,7 @@ MTD_CONF_OPTS += --without-jffs
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
-MTD_DEPENDENCIES += util-linux host-pkgconf
+MTD_DEPENDENCIES += util-linux
 MTD_CONF_OPTS += --with-ubifs
 # crypto needs linux/hash_info.h
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12)$(BR2_PACKAGE_OPENSSL),yy)
@@ -83,7 +84,7 @@ else
 MTD_CONF_OPTS += --without-xattr
 endif
 
-HOST_MTD_DEPENDENCIES = host-acl host-zlib host-lzo host-util-linux host-zstd
+HOST_MTD_DEPENDENCIES = host-pkgconf host-acl host-zlib host-lzo host-util-linux host-zstd
 HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
