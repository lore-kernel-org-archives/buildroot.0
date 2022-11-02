Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E798BC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 23:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9134C81EA4;
	Wed,  2 Nov 2022 23:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9134C81EA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MRrX9RmazGUQ; Wed,  2 Nov 2022 23:02:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F72D81E93;
	Wed,  2 Nov 2022 23:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F72D81E93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02DDB1BF471
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEDEF60AFC
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 23:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEDEF60AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXIA8MW2onbj for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 23:01:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 457BA606AA
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 23:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 457BA606AA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33B8E87B4E; Wed,  2 Nov 2022 23:01:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 00:00:34 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 16fdaac29da7c57f940ab6a8b2e663fbd5b1b9c9
X-Git-Newrev: 206b2e1a869a508acce7a8c4532b7654d1ade759
X-Patchwork-Hint: ignore
Message-Id: <20221102230148.33B8E87B4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/squashfs:
 security bump to version 4.5.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=206b2e1a869a508acce7a8c4532b7654d1ade759
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Fix CVE-2021-40153
- CVE-2021-41072 which is a writing outside of destination exploit, has
  been fixed.
- Drop patch (already in version)
- Set INSTALL_MANPAGES_DIR to an empty value to disable build and
  install of man pages which were added with
  https://github.com/plougher/squashfs-tools/commit/25bce9a64cc3f88f0afed9ce2f3d27beabc44d7b

https://github.com/plougher/squashfs-tools/releases/tag/4.5.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 49b11f5e787f68cc310e97a539ad7ed29b041919)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...id-use-of-INSTALL_DIR-for-symlink-targets.patch | 37 ----------------------
 package/squashfs/squashfs.hash                     |  2 +-
 package/squashfs/squashfs.mk                       |  8 +++--
 3 files changed, 6 insertions(+), 41 deletions(-)

diff --git a/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch b/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch
deleted file mode 100644
index 997719e63a..0000000000
--- a/package/squashfs/0001-Avoid-use-of-INSTALL_DIR-for-symlink-targets.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f5c908e92d4c055859be2fddbda266d9e3bfd415 Mon Sep 17 00:00:00 2001
-From: Patrick McCarty <patrick.mccarty@intel.com>
-Date: Mon, 26 Jul 2021 11:38:43 -0700
-Subject: [PATCH] Avoid use of INSTALL_DIR for symlink targets
-
-In case INSTALL_DIR is overridden with a staged install location, using
-INSTALL_DIR for the symlink target path prefix will yield an incorrect location
-for the final installation.
-
-Because the symlink itself is already installed to INSTALL_DIR, simply removing
-the INSTALL_DIR prefix suffices as a fix.
-
-Note that using $DESTDIR/$INSTALL_DIR where appropriate can avoid this type of
-issue, but that can be considered a future enhancement.
-
-Signed-off-by: Patrick McCarty <patrick.mccarty@intel.com>
-Upstream: f5c908e92d4c055859be2fddbda266d9e3bfd415
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- squashfs-tools/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/squashfs-tools/Makefile b/squashfs-tools/Makefile
-index f5a55f1..7262a2e 100755
---- a/squashfs-tools/Makefile
-+++ b/squashfs-tools/Makefile
-@@ -406,5 +406,5 @@ install: mksquashfs unsquashfs
- 	mkdir -p $(INSTALL_DIR)
- 	cp mksquashfs $(INSTALL_DIR)
- 	cp unsquashfs $(INSTALL_DIR)
--	ln -fs $(INSTALL_DIR)/unsquashfs $(INSTALL_DIR)/sqfscat
--	ln -fs $(INSTALL_DIR)/mksquashfs $(INSTALL_DIR)/sqfstar
-+	ln -fs unsquashfs $(INSTALL_DIR)/sqfscat
-+	ln -fs mksquashfs $(INSTALL_DIR)/sqfstar
--- 
-2.31.1
-
diff --git a/package/squashfs/squashfs.hash b/package/squashfs/squashfs.hash
index 09a2bae364..13d5aed71f 100644
--- a/package/squashfs/squashfs.hash
+++ b/package/squashfs/squashfs.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  b9e16188e6dc1857fe312633920f7d71cc36b0162eb50f3ecb1f0040f02edddd  squashfs-4.5.tar.gz
+sha256  277b6e7f75a4a57f72191295ae62766a10d627a4f5e5f19eadfbc861378deea7  squashfs-4.5.1.tar.gz
 
 # License files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
index f64d441c9b..323908d94e 100644
--- a/package/squashfs/squashfs.mk
+++ b/package/squashfs/squashfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUASHFS_VERSION = 4.5
+SQUASHFS_VERSION = 4.5.1
 SQUASHFS_SITE = $(call github,plougher,squashfs-tools,$(SQUASHFS_VERSION))
 SQUASHFS_LICENSE = GPL-2.0+
 SQUASHFS_LICENSE_FILES = COPYING
@@ -75,7 +75,8 @@ endef
 
 define SQUASHFS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(SQUASHFS_MAKE_ARGS) \
-		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(TARGET_DIR)/usr/bin install
+		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(TARGET_DIR)/usr/bin \
+		INSTALL_MANPAGES_DIR="" install
 endef
 
 define HOST_SQUASHFS_BUILD_CMDS
@@ -89,7 +90,8 @@ endef
 
 define HOST_SQUASHFS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_SQUASHFS_MAKE_ARGS) \
-		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/bin install
+		-C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/bin \
+		INSTALL_MANPAGES_DIR="" install
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
