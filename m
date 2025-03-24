Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EBEC36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 16:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1345440D9E;
	Mon, 24 Mar 2025 16:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NFCYdRSt9Po; Mon, 24 Mar 2025 16:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 475B740DB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 475B740DB3;
	Mon, 24 Mar 2025 16:43:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7D5C1B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 16:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E73A60710
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 16:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0lRV9lZhDCO for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 16:43:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC25160653
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC25160653
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 16:43:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C39CA82691; Mon, 24 Mar 2025 16:43:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 17:43:27 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 324856a3a4d29c18e993cfd9f10dd52e2d4d3c4b
X-Git-Newrev: 8fdf9ed8d27ad4436cd9ac8a0d0c27dc47a8e285
X-Patchwork-Hint: ignore
Message-Id: <20250324164346.C39CA82691@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] Update for 2024.11.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fdf9ed8d27ad4436cd9ac8a0d0c27dc47a8e285
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 13 +++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 65990ce831..9cc41fd14d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,16 @@
+2024.11.3, released March 24st, 2025
+
+	Important / security related fixes.
+
+	Defconfigs: Octavo osd23mp1: Fix TF-A/Linux compilation after
+	move to newer toolchain versions.
+
+	Updated/fixed packages: compiler-rt, exim, expat, fio, foot,
+	go, jbig2dec, libcamera, libjxl, libopenssl, libxml2, mokutil,
+	musl, optee-os, php, pkgconf, postgresql, prboom,
+	python-typing-extensions, rauc, systemd, util-linux,
+	watchdogd, webkitgtk
+
 2024.11.2, released February 21st, 2025
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 9f95280e79..c0a8aa3c02 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2024.11.2
+export BR2_VERSION := 2024.11.3
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1740148000
+BR2_VERSION_EPOCH = 1742834500
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 34d404dc4c..7bdf3047e4 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2024.11.2'
+RELEASE='2024.11.3'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
