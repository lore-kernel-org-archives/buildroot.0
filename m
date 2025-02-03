Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAAA6C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 14:21:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 955AC8234C;
	Mon,  3 Feb 2025 14:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVxcjQsSBMBm; Mon,  3 Feb 2025 14:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8897182385
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8897182385;
	Mon,  3 Feb 2025 14:21:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 108AD12A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE1E141037
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIvqyft6t9hA for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 14:21:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C88C9405F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C88C9405F0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C88C9405F0
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 14:21:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9EBE643215;
 Mon,  3 Feb 2025 14:21:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1texJw-00BLbQ-32;
 Mon, 03 Feb 2025 15:21:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  3 Feb 2025 15:21:03 +0100
Message-Id: <20250203142104.2704631-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 49
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucgoufhushhpvggtthffohhmrghinhculdegledmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpeekhedvfeevgfelvdekudeuuedtvddtleekffekgfdtgeejtddtjefhgfelveegvdenucffohhmrghinhepsghuihhlughrohhothdrnhgvthdpshhouhhrtggvfhhorhhgvgdrnhgvthenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvkhhosehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] {fs/,package/gen}romfs: remove
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

Fixes:
http://autobuild.buildroot.net/results/9b0/9b09c8681e1003580b766aa0d244889f3b0be0c8/

Romfs is very old and limited, the fs logic and package has not really
changed since it was added 17 years ago with Commit 4b01dfced944 ("Add romfs
target support, courtesy Josh <buildroot@digitalpeer.com>") and genromfs
crashes in some situations, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                         | 12 +++++++++
 fs/Config.in                             |  1 -
 fs/romfs/Config.in                       |  4 ---
 fs/romfs/romfs.mk                        | 13 ---------
 package/Config.in                        |  1 -
 package/genromfs/0001-build-system.patch | 26 ------------------
 package/genromfs/Config.in               |  6 -----
 package/genromfs/genromfs.hash           |  3 ---
 package/genromfs/genromfs.mk             | 34 ------------------------
 9 files changed, 12 insertions(+), 88 deletions(-)
 delete mode 100644 fs/romfs/Config.in
 delete mode 100644 fs/romfs/romfs.mk
 delete mode 100644 package/genromfs/0001-build-system.patch
 delete mode 100644 package/genromfs/Config.in
 delete mode 100644 package/genromfs/genromfs.hash
 delete mode 100644 package/genromfs/genromfs.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index abc65d0c9a..7ccb4a0cbc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,18 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_GENROMFS
+	bool "genromfs"
+	select BR2_LEGACY
+	help
+	  Romfs root filesystem support has been removed.
+
+config BR2_TARGET_ROOTFS_ROMFS
+	bool "romfs root filesystem has been removed"
+	select BR2_LEGACY
+	help
+	  Romfs root filesystem support has been removed.
+
 config BR2_GDB_VERSION_13
 	bool "gdb 13.x has been removed"
 	select BR2_LEGACY
diff --git a/fs/Config.in b/fs/Config.in
index eee5e26bb2..6b338f8ec8 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -12,7 +12,6 @@ source "fs/initramfs/Config.in"
 source "fs/iso9660/Config.in"
 source "fs/jffs2/Config.in"
 source "fs/oci/Config.in"
-source "fs/romfs/Config.in"
 source "fs/squashfs/Config.in"
 source "fs/tar/Config.in"
 source "fs/ubi/Config.in"
diff --git a/fs/romfs/Config.in b/fs/romfs/Config.in
deleted file mode 100644
index 84944a0fc0..0000000000
--- a/fs/romfs/Config.in
+++ /dev/null
@@ -1,4 +0,0 @@
-config BR2_TARGET_ROOTFS_ROMFS
-	bool "romfs root filesystem"
-	help
-	  Build a romfs image of the root filesystem.
diff --git a/fs/romfs/romfs.mk b/fs/romfs/romfs.mk
deleted file mode 100644
index 163751b4e2..0000000000
--- a/fs/romfs/romfs.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# Build the romfs root filesystem image
-#
-################################################################################
-
-ROOTFS_ROMFS_DEPENDENCIES = host-genromfs
-
-define ROOTFS_ROMFS_CMD
-	$(HOST_DIR)/bin/genromfs -d $(TARGET_DIR) -f $@
-endef
-
-$(eval $(rootfs))
diff --git a/package/Config.in b/package/Config.in
index e9c789cff2..44b285d348 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -238,7 +238,6 @@ menu "Filesystem and flash utilities"
 	source "package/fwup/Config.in"
 	source "package/genext2fs/Config.in"
 	source "package/genpart/Config.in"
-	source "package/genromfs/Config.in"
 	source "package/gocryptfs/Config.in"
 	source "package/imx-usb-loader/Config.in"
 	source "package/mmc-utils/Config.in"
diff --git a/package/genromfs/0001-build-system.patch b/package/genromfs/0001-build-system.patch
deleted file mode 100644
index 827fe75bd2..0000000000
--- a/package/genromfs/0001-build-system.patch
+++ /dev/null
@@ -1,26 +0,0 @@
----
- Makefile |    4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-Index: genromfs-0.5.2/Makefile
-===================================================================
---- genromfs-0.5.2.orig/Makefile
-+++ genromfs-0.5.2/Makefile
-@@ -6,8 +6,6 @@
- PACKAGE = genromfs
- VERSION = 0.5.2
- CC = gcc
--CFLAGS = -O2 -Wall -DVERSION=\"$(VERSION)\"#-g#
--LDFLAGS = -s#-g
- 
- DISTDIR = $(PACKAGE)-$(VERSION)
- 
-@@ -24,7 +22,7 @@
- 	$(CC) $(LDFLAGS) genromfs.o -o genromfs
- 
- .c.o:
--	$(CC) $(CFLAGS) $< -c -o $@
-+	$(CC) $(CFLAGS) -DVERSION=\"$(VERSION)\" $< -c -o $@
- 
- clean:
- 	rm -f genromfs *.o
diff --git a/package/genromfs/Config.in b/package/genromfs/Config.in
deleted file mode 100644
index e4eba9f16a..0000000000
--- a/package/genromfs/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_GENROMFS
-	bool "genromfs"
-	help
-	  Tool to generate a ROMFS filesystem.
-
-	  http://romfs.sourceforge.net/
diff --git a/package/genromfs/genromfs.hash b/package/genromfs/genromfs.hash
deleted file mode 100644
index 0be88ee1b4..0000000000
--- a/package/genromfs/genromfs.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  30f37fc734572c1dbaa2504585bc23ba6b8fd7df767ae7155995b2ca0ebed960  genromfs-0.5.2.tar.gz
-sha256  cc2a6651c315b233ebc110b49ea3c6452eff9a28f8bc051ffd2bb92a8dcfa3d2  COPYING
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
deleted file mode 100644
index fd696b45b2..0000000000
--- a/package/genromfs/genromfs.mk
+++ /dev/null
@@ -1,34 +0,0 @@
-################################################################################
-#
-# genromfs
-#
-################################################################################
-
-GENROMFS_VERSION = 0.5.2
-GENROMFS_SITE = http://downloads.sourceforge.net/project/romfs/genromfs/$(GENROMFS_VERSION)
-GENROMFS_LICENSE = GPL-2.0+
-GENROMFS_LICENSE_FILES = COPYING
-
-define GENROMFS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		CC="$(TARGET_CC)" \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDFLAGS="$(TARGET_LDFLAGS)"
-endef
-
-# "PREFIX" is the equivalent of DESTDIR in autotools, "prefix" is the
-# traditional prefix. "prefix" defaults to /usr so no need to set it.
-define GENROMFS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install
-endef
-
-define HOST_GENROMFS_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
-endef
-
-define HOST_GENROMFS_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) prefix=$(HOST_DIR) install
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
