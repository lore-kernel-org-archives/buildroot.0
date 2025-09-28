Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B381CAC5BB
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 12:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC8D640687;
	Sun, 28 Sep 2025 12:04:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xai24e_ZJYDK; Sun, 28 Sep 2025 12:04:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E968A40572
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E968A40572;
	Sun, 28 Sep 2025 12:04:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56F93111
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 12:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45FFB401D4
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 12:04:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7M8phR62qnW for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 12:04:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCEB44011D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCEB44011D
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 12:04:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBB1B865F4; Sun, 28 Sep 2025 12:04:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Sep 2025 14:02:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e9e4feae1c17d8f34d12953cb4583a77086e3de
X-Git-Newrev: d7a2937550f7aba58f5a24e7ed33910186658fdf
X-Patchwork-Hint: ignore
Message-Id: <20250928120406.CBB1B865F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/logsurfer: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7a2937550f7aba58f5a24e7ed33910186658fdf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The logsurfer package has not received updates since 2011 according to
its website [1].

It also fails on the autobuilder when building with GCC14.

Package author did a single contribution to buildroot by adding this
package.

[1] https://crypt.gen.nz/logsurfer/

Fixes: https://autobuild.buildroot.org/results/ed9/ed906670ab7b901d95289b388262d9eded8b2c18
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                 |  7 +++++++
 DEVELOPERS                       |  3 ---
 package/Config.in                |  1 -
 package/logsurfer/Config.in      |  8 --------
 package/logsurfer/logsurfer.hash |  3 ---
 package/logsurfer/logsurfer.mk   | 15 ---------------
 6 files changed, 7 insertions(+), 30 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4c76ba4205..1febc3de0f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LOGSURFER
+	bool "logsurfer has been removed"
+	select BR2_LEGACY
+	help
+	  Logsurfer last updates was on 2011 and fails to build with
+	  GCC14.
+
 config BR2_LINUX_KERNEL_EXT_FBTFT
 	bool "FB TFT drivers are deprecated"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 8dded9800b..71a9b1a157 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -881,9 +881,6 @@ F:	board/qemu/sparc-ss10/
 F:	configs/qemu_sparc_ss10_defconfig
 F:	package/uclibc-ng-test/
 
-N:	Dominik Faessler <faessler@was.ch>
-F:	package/logsurfer/
-
 N:	Dominik Michael Rauh <dmrauh@posteo.de>
 F:	package/gdal/
 
diff --git a/package/Config.in b/package/Config.in
index f12cfeb394..756f48266e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2789,7 +2789,6 @@ comment "Utilities"
 	source "package/inotify-tools/Config.in"
 	source "package/lockfile-progs/Config.in"
 	source "package/logrotate/Config.in"
-	source "package/logsurfer/Config.in"
 	source "package/lowdown/Config.in"
 	source "package/minisign/Config.in"
 	source "package/neofetch/Config.in"
diff --git a/package/logsurfer/Config.in b/package/logsurfer/Config.in
deleted file mode 100644
index 43e2f519e6..0000000000
--- a/package/logsurfer/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_LOGSURFER
-	bool "logsurfer"
-	depends on BR2_USE_MMU # fork()
-	help
-	  Logsurfer is a program for monitoring system logs in
-	  real-time, and reporting on the occurrence of events.
-
-	  http://www.crypt.gen.nz/logsurfer/
diff --git a/package/logsurfer/logsurfer.hash b/package/logsurfer/logsurfer.hash
deleted file mode 100644
index 8e9f5c95bd..0000000000
--- a/package/logsurfer/logsurfer.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://www.crypt.gen.nz/logsurfer/
-md5  4c26a74d813ccf766117c95c644aa601  logsurfer-1.8.tar.gz
-sha256  74a36e8530a884031b4ae2344a46b9aaa07a1ee36d143802f6b64f817c5bd1af  logsurfer-1.8.tar.gz
diff --git a/package/logsurfer/logsurfer.mk b/package/logsurfer/logsurfer.mk
deleted file mode 100644
index 8eb9dc8f8a..0000000000
--- a/package/logsurfer/logsurfer.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# logsurfer
-#
-################################################################################
-
-LOGSURFER_VERSION = 1.8
-LOGSURFER_SITE = http://downloads.sourceforge.net/project/logsurfer/logsurfer/logsurfer-$(LOGSURFER_VERSION)
-
-define LOGSURFER_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/src/logsurfer \
-		$(TARGET_DIR)/usr/bin/logsurfer
-endef
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
