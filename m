Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A391F428F6
	for <buildroot@archiver.kernel.org>; Wed, 15 Apr 2026 20:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBCD260B55;
	Wed, 15 Apr 2026 20:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAHwx9wH3LZv; Wed, 15 Apr 2026 20:42:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C05F960E22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776285764;
	bh=FaBVA+0uQxShzbcEoscnvk5rtZ9gz0sWgcaj3lpRjcI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=S1VQ/LDQ7YrDwzQxm6VLTD7d+8f1f1OQzvSAtlc1a4DzQra0TexZYWZ+tK1YMIor3
	 ItHgoFcwDffBT7kvBh82cK4y/15pstZaH57v22Eya2QNH8pio2N9/kFoPr9VPaivAx
	 8RxLLqUoqQNWK9kFO9tnpcrWWcqeNNKgnv3XFQdqUA+VbIKMiERGcrw0KfEIz31uDy
	 qPkWm+aqakIHM9I1yXrawhIfh6z6mwl4X8XqvGML8tojJPw0TmBzLMDsHMQhJvb/FC
	 ARFQjA9IJ0+DgxvoNASAMudsRyvVLZyVRZVa5O2dSy/29c1HNqL5tV3sRKHi/xQzjF
	 HTH2GbLBkqcWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C05F960E22;
	Wed, 15 Apr 2026 20:42:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EE8C5283
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D404A40639
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNoiiwMq5C3A for <buildroot@buildroot.org>;
 Wed, 15 Apr 2026 20:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4B1A400A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4B1A400A7
 for <buildroot@buildroot.org>; Wed, 15 Apr 2026 20:42:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 52A2A816A4; Wed, 15 Apr 2026 20:42:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 15 Apr 2026 21:39:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3d0050e3d044ee5e83f3a8df38806f4df9ebbb1
X-Git-Newrev: 1124bc4b836a0f16ce46088f0dd7e595a4d1b2ab
X-Patchwork-Hint: ignore
Message-Id: <20260415204240.52A2A816A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtd: bump to version 2.3.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1124bc4b836a0f16ce46088f0dd7e595a4d1b2ab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See release announce:
2.3.1: https://lists.infradead.org/pipermail/linux-mtd/2026-April/113302.html
2.3.0: https://lists.infradead.org/pipermail/linux-mtd/2025-February/108248.html

Version 2.3.0 added the fsck.ubifs utility, so support it with
the new Kconfig option BR2_PACKAGE_MTD_FSCKUBIFS.

The new version also needs host-pkgconfig, as can be seen from the error
triggered during build tests:

checking pkg-config is at least version 0.9.0... ./configure: line 5613: buildroot/test-output/TestMtd/host/bin/pkg-config: No such file or directory
no
configure: error: pkg-config not found
make[1]: *** [package/pkg-generic.mk:263: buildroot/test-output/TestMtd/build/mtd-2.3.1/.stamp_configured] Error 1

Changelog: https://git.infradead.org/?p=mtd-utils.git;a=blob;f=CHANGELOG.md

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien:
 - add link to announce in commit log
 - split long host dependency line
 - reorder host dependencies alphabetically
 - fix MTD_INSTALL_DEPENDENCIES to MTD_DEPENDENCIES
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mtd/Config.in |  4 ++++
 package/mtd/mtd.hash  |  4 ++--
 package/mtd/mtd.mk    | 17 +++++++++++++----
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index 0c95e3cc54..1054106f81 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -58,6 +58,10 @@ config BR2_PACKAGE_MTD_FLASH_UNLOCK
 	bool "flash_unlock"
 	default y
 
+config BR2_PACKAGE_MTD_FSCKUBIFS
+	bool "fsck.ubifs"
+	select BR2_PACKAGE_MTD_UBIFS_UTILS
+
 config BR2_PACKAGE_MTD_FTL_CHECK
 	bool "ftl_check"
 
diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index 0eb90a5118..5f02e698d1 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://infraroot.at/pub/mtd/mtd-utils-2.2.1.tar.bz2.asc
-sha256  f7ae20b2eb79ee83441468f0b99d897024cd96ff853eea59106fb1952065c803  mtd-utils-2.2.1.tar.bz2
+# https://infraroot.at/pub/mtd/mtd-utils-2.3.1.tar.bz2.asc
+sha256  03d9dc58ad10ea3549d9528f6b17a44d8944e18e96c0f31474f9f977078b83dc  mtd-utils-2.3.1.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 77050e7e40..2a625fccce 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.2.1
+MTD_VERSION = 2.3.1
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
@@ -83,7 +84,14 @@ else
 MTD_CONF_OPTS += --without-xattr
 endif
 
-HOST_MTD_DEPENDENCIES = host-acl host-zlib host-lzo host-util-linux host-zstd
+HOST_MTD_DEPENDENCIES = \
+	host-acl \
+	host-lzo \
+	host-pkgconf \
+	host-util-linux \
+	host-zlib \
+	host-zstd
+
 HOST_MTD_CONF_OPTS = \
 	--with-jffs \
 	--with-ubifs \
@@ -145,6 +153,7 @@ MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDBITERRS)	+= nandbiterrs
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDPAGETEST)	+= nandpagetest
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDSUBPAGETEST)	+= nandsubpagetest
 MTD_TARGETS_$(BR2_PACKAGE_MTD_NANDFLIPBITS)	+= nandflipbits
+MTD_TARGETS_$(BR2_PACKAGE_MTD_FSCKUBIFS)	+= fsck.ubifs
 
 define MTD_INSTALL_TARGET_CMDS
 	$(foreach f,$(MTD_TARGETS_y), \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
