Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B95CA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28E6E844F6;
	Fri, 29 Aug 2025 15:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0u1HT_F-Pky; Fri, 29 Aug 2025 15:34:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 266C8844F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 266C8844F8;
	Fri, 29 Aug 2025 15:34:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13B1569
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 063666164E
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKb_YaFH0pVA for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:33:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24F9D6165F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24F9D6165F
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:33:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13CBF87DB8; Fri, 29 Aug 2025 15:33:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 17:30:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdb0669e40d698a4851b8a1d0e19fc899994bd06
X-Git-Newrev: e7aa0802a7364f9559401c8c9214ca58514483ac
X-Patchwork-Hint: ignore
Message-Id: <20250829153357.13CBF87DB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsurf-buildsystem: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7aa0802a7364f9559401c8c9214ca58514483ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This host package was only used as a build dependency of libsvgtiny,
which itself has been removed, so it can be dropped as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                           |  3 ---
 package/netsurf-buildsystem/netsurf-buildsystem.hash |  3 ---
 package/netsurf-buildsystem/netsurf-buildsystem.mk   | 20 --------------------
 3 files changed, 26 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f36c13a07..32d7c8ac61 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1001,9 +1001,6 @@ F:	package/atest/
 F:	package/crucible/
 F:	package/kmscube/
 
-N:	Fabio Porcedda <fabio.porcedda@gmail.com>
-F:	package/netsurf-buildsystem/
-
 N:	Fabio Urquiza <fabiorush@gmail.com>
 F:	package/bitcoin/
 
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.hash b/package/netsurf-buildsystem/netsurf-buildsystem.hash
deleted file mode 100644
index 9da8c67aef..0000000000
--- a/package/netsurf-buildsystem/netsurf-buildsystem.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  b8620c6a95ccf071046cdb8e4e0ca149cdd58d292eb9ee02b3b0d63646466b72  netsurf-buildsystem-7574b41345968b5f7e9ca5875faccb1478ce0555-git4.tar.gz
-sha256  b2ddc1d607332423f6cf415b2ac619a1c03dd565facdc39a571282a520929a65  llvm/LICENSE.TXT
diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.mk b/package/netsurf-buildsystem/netsurf-buildsystem.mk
deleted file mode 100644
index d4efec0e1d..0000000000
--- a/package/netsurf-buildsystem/netsurf-buildsystem.mk
+++ /dev/null
@@ -1,20 +0,0 @@
-################################################################################
-#
-# netsurf-buildsystem
-#
-################################################################################
-
-NETSURF_BUILDSYSTEM_VERSION = 7574b41345968b5f7e9ca5875faccb1478ce0555
-NETSURF_BUILDSYSTEM_SITE = http://git.netsurf-browser.org/buildsystem.git
-NETSURF_BUILDSYSTEM_SITE_METHOD = git
-NETSURF_BUILDSYSTEM_LICENSE = MIT, BSD-3-Clause (for llvm/* files)
-NETSURF_BUILDSYSTEM_LICENSE_FILES = llvm/LICENSE.TXT
-
-NETSURF_BUILDSYSTEM_INSTALL_DIR = $(HOST_DIR)/share/netsurf-buildsystem
-
-define HOST_NETSURF_BUILDSYSTEM_INSTALL_CMDS
-	mkdir -p $(NETSURF_BUILDSYSTEM_INSTALL_DIR)
-	cp -dpfr $(@D)/* $(NETSURF_BUILDSYSTEM_INSTALL_DIR)
-endef
-
-$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
