Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BE9C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B1E470B4A;
	Fri, 28 Feb 2025 17:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g-SwwR6HjfQH; Fri, 28 Feb 2025 17:12:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E10670B42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E10670B42;
	Fri, 28 Feb 2025 17:12:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15E3068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF58842D10
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMW3PKCmTAF7 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F03942F89
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F03942F89
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9619987A92; Fri, 28 Feb 2025 16:30:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 16:45:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 917495a2acb870af6f4cde39cc672b136fb89304
X-Git-Newrev: 99ea9422592798f7840dd46d28f208f75df1b456
X-Patchwork-Hint: ignore
Message-Id: <20250228163031.9619987A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] {fs/, package/gen}romfs: remove
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99ea9422592798f7840dd46d28f208f75df1b456
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/9b0/9b09c8681e1003580b766aa0d244889f3b0be0c8/

Romfs is very old and limited, the fs logic and package has not really
changed since it was added 17 years ago with Commit 4b01dfced944 ("Add romfs
target support, courtesy Josh <buildroot@digitalpeer.com>") and genromfs
crashes in some situations, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Arnout: also remove from DEVELOPERS]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                      |  1 -
 Config.in.legacy                         | 12 +++++++++++
 DEVELOPERS                               |  1 -
 fs/Config.in                             |  1 -
 fs/romfs/Config.in                       |  4 ----
 fs/romfs/romfs.mk                        | 13 ------------
 package/Config.in                        |  1 -
 package/genromfs/0001-build-system.patch | 26 ------------------------
 package/genromfs/Config.in               |  6 ------
 package/genromfs/genromfs.hash           |  3 ---
 package/genromfs/genromfs.mk             | 34 --------------------------------
 11 files changed, 12 insertions(+), 90 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8fd03b0dd6..194a2d1c72 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -518,7 +518,6 @@ package/gdb/16.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
 package/gdb/16.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
 package/gdb/16.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
 package/genpart/0001-fix-return-code.patch lib_patch.Upstream
-package/genromfs/0001-build-system.patch lib_patch.Sob lib_patch.Upstream
 package/gensio/0001-Fix-missing-EVP_PKEY_ED25519-build-error-on-libressl.patch lib_patch.Upstream
 package/gerbera/S99gerbera lib_sysv.Indent
 package/git-crypt/0001-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index a8baecad58..674299470f 100644
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
 config BR2_BINUTILS_VERSION_2_41_X
 	bool "binutils 2.41 has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index af605b388e..10b8031ad3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3188,7 +3188,6 @@ F:	package/double-conversion/
 F:	package/flashrom/
 F:	package/gcc/
 F:	package/genext2fs/
-F:	package/genromfs/
 F:	package/getent/
 F:	package/gnu-efi/
 F:	package/heirloom-mailx/
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
