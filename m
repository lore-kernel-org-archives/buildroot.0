Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C1DCAC5BB
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 14:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D943740556;
	Sun, 28 Sep 2025 14:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtNFEh_me2hq; Sun, 28 Sep 2025 14:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3CC040551
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3CC040551;
	Sun, 28 Sep 2025 14:59:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4007C197
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 14:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 31B8340559
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 14:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iJc9R97_EpK for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 14:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A8AF40551
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A8AF40551
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 14:59:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 289F186603; Sun, 28 Sep 2025 14:59:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Sep 2025 16:05:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d7a2937550f7aba58f5a24e7ed33910186658fdf
X-Git-Newrev: e7f9f94a50982cee244fef81754da810139cf851
X-Patchwork-Hint: ignore
Message-Id: <20250928145915.289F186603@busybox.osuosl.org>
Subject: [Buildroot] [git commit] fs/axfs: drop support
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7f9f94a50982cee244fef81754da810139cf851
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The file system support is not mainline and hasn't been updated since 2019,
so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy  |  6 ++++++
 fs/Config.in      |  1 -
 fs/axfs/Config.in | 17 -----------------
 fs/axfs/axfs.mk   | 13 -------------
 4 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1febc3de0f..ffcd53930a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_TARGET_ROOTFS_AXFS
+	bool "AXFS root filesystem has been removed"
+	select BR2_LEGACY
+	help
+	  AXFS root filesystem support has been removed.
+
 config BR2_PACKAGE_LOGSURFER
 	bool "logsurfer has been removed"
 	select BR2_LEGACY
diff --git a/fs/Config.in b/fs/Config.in
index 6b338f8ec8..42b0e608ac 100644
--- a/fs/Config.in
+++ b/fs/Config.in
@@ -1,6 +1,5 @@
 menu "Filesystem images"
 
-source "fs/axfs/Config.in"
 source "fs/btrfs/Config.in"
 source "fs/cloop/Config.in"
 source "fs/cpio/Config.in"
diff --git a/fs/axfs/Config.in b/fs/axfs/Config.in
deleted file mode 100644
index 8dfaffab74..0000000000
--- a/fs/axfs/Config.in
+++ /dev/null
@@ -1,17 +0,0 @@
-config BR2_TARGET_ROOTFS_AXFS
-	bool "axfs root filesystem"
-	help
-	  The Advanced XIP File System is a Linux kernel filesystem
-	  driver that enables files to be executed directly from flash
-	  or ROM memory rather than being copied into RAM. It has the
-	  ability to store individual *pages* in a file
-	  uncompressed/XIP or compressed/Demand Paged.
-
-	  So far, the only supported mode is 'XIP all', so all the
-	  files that have the execute attribute set will be XIP'ed.
-
-	  At the moment, the FS is not supported in Linux mainline
-	  (v4.3-rc5), so the kernel has to be built with the axfs
-	  patches to be able to read it. Patches can be found at:
-
-	  https://github.com/jaredeh/axfs
diff --git a/fs/axfs/axfs.mk b/fs/axfs/axfs.mk
deleted file mode 100644
index 4b93df55c0..0000000000
--- a/fs/axfs/axfs.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# Build the axfs root filesystem image
-#
-################################################################################
-
-ROOTFS_AXFS_DEPENDENCIES = host-axfsutils
-
-define ROOTFS_AXFS_CMD
-	$(HOST_DIR)/bin/mkfs.axfs -s -a $(TARGET_DIR) $@
-endef
-
-$(eval $(rootfs))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
