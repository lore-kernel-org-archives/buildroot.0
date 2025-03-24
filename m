Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6113C36008
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 17:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2388460C23;
	Mon, 24 Mar 2025 17:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jk0atvK88sVe; Mon, 24 Mar 2025 17:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4648160AC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4648160AC7;
	Mon, 24 Mar 2025 17:25:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8386BE0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A32660C11
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3gwJ_vip_sR for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 17:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97B2D60C0E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97B2D60C0E
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 17:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8835A826A8; Mon, 24 Mar 2025 17:25:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 18:24:45 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f1a76fc8eca7bb850f5c9ee611483f5c31f688e1
X-Git-Newrev: aeeeefb855ab829e4de428a460ee5f59eecb6998
X-Patchwork-Hint: ignore
Message-Id: <20250324172518.8835A826A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] Update for 2024.02.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=aeeeefb855ab829e4de428a460ee5f59eecb6998
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 12 ++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 89169128c9..877c39e257 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,15 @@
+2024.02.12, released March 24st, 2025
+
+	Important / security related fixes.
+
+	Defconfigs: Octavo osd23mp1: Fix TF-A/Linux compilation after
+	move to newer toolchain versions.
+
+	Updated/fixed packages: compiler-rt, exim, expat, fio, foot,
+	jbig2dec, libjxl, libxml2, musl, optee-os, php, postgresql,
+	prboom, python-typing-extensions, systemd, util-linux,
+	watchdogd, webkitgtk
+
 2024.02.11, released February 21th, 2025
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 79394f32bb..388c7a0f02 100644
--- a/Makefile
+++ b/Makefile
@@ -90,9 +90,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.02.11
+export BR2_VERSION := 2024.02.12
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1740143000
+BR2_VERSION_EPOCH = 1742837000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 6d456ae647..d0a2ff6e66 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.02.11'
+RELEASE='2024.02.12'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
