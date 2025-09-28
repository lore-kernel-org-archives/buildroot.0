Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE507CAC5BB
	for <buildroot@archiver.kernel.org>; Sun, 28 Sep 2025 14:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE0774064C;
	Sun, 28 Sep 2025 14:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OHwog_uDLxJY; Sun, 28 Sep 2025 14:59:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F36E40595
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F36E40595;
	Sun, 28 Sep 2025 14:59:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CB34198
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 14:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ACC580D55
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 14:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-vGSj5EMjn0 for <buildroot@buildroot.org>;
 Sun, 28 Sep 2025 14:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5365880D50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5365880D50
 for <buildroot@buildroot.org>; Sun, 28 Sep 2025 14:59:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 305458660E; Sun, 28 Sep 2025 14:59:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Sep 2025 16:07:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7f9f94a50982cee244fef81754da810139cf851
X-Git-Newrev: f5e5db4b7e972d49448284c21be897d2b4e0b64b
X-Patchwork-Hint: ignore
Message-Id: <20250928145915.305458660E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/axfsutils: drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f5e5db4b7e972d49448284c21be897d2b4e0b64b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

axfsutils is a host-only package, so drop it now that the axfs root
filesystem support has been dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/axfsutils/axfsutils.hash |  3 ---
 package/axfsutils/axfsutils.mk   | 24 ------------------------
 2 files changed, 27 deletions(-)

diff --git a/package/axfsutils/axfsutils.hash b/package/axfsutils/axfsutils.hash
deleted file mode 100644
index b7a5943ddb..0000000000
--- a/package/axfsutils/axfsutils.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  7d8c0febaf6f104c2b179475ea1ee6d361688ad7fa4c98dfdf7395fcff2be685  axfsutils-384a1ea214c8cf8359faba00a12513ee7ae1a9f5.tar.gz
-sha256  1929a1e67d189aa3a24de76255841b33818f7f65944b6e73a1568ba575ab54d5  mkfs.axfs-legacy/COPYING
diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
deleted file mode 100644
index 8879221619..0000000000
--- a/package/axfsutils/axfsutils.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# axfsutils
-#
-################################################################################
-
-AXFSUTILS_VERSION = 384a1ea214c8cf8359faba00a12513ee7ae1a9f5
-AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
-AXFSUTILS_LICENSE = GPL-2.0
-AXFSUTILS_LICENSE_FILES = mkfs.axfs-legacy/COPYING
-HOST_AXFSUTILS_DEPENDENCIES = host-zlib
-
-# The 'new' mkfs.axfs version requires GNUstep which is not a buildroot
-# prerequisite. The 'legacy' one works just as well without that requirement.
-define HOST_AXFSUTILS_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/mkfs.axfs-legacy
-endef
-
-define HOST_AXFSUTILS_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/mkfs.axfs-legacy/mkfs.axfs \
-		$(HOST_DIR)/bin/mkfs.axfs
-endef
-
-$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
