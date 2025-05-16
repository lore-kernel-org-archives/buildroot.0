Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E60C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFB9170EE1;
	Mon, 19 May 2025 11:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sb8FBpZCT24r; Mon, 19 May 2025 11:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1602870EF1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1602870EF1;
	Mon, 19 May 2025 11:01:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DF73E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 845D040DED
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f8NI2dTPUC1g for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5BD241A63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5BD241A63
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF15682A2E; Mon, 19 May 2025 10:40:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 19:57:59 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 10720c036eba57bf6bc6b78b4a8dc5d9f1d6f22e
X-Git-Newrev: e743759a5202d50b40b10bd9b9a1c31243621dad
X-Patchwork-Hint: ignore
Message-Id: <20250519104005.BF15682A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sysprof: bump to
 version 48.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e743759a5202d50b40b10bd9b9a1c31243621dad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This new release includes a number of improvements. Release notes:

  https://gitlab.gnome.org/GNOME/sysprof/-/blob/48.0/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysprof/sysprof.hash |  4 ++--
 package/sysprof/sysprof.mk   | 11 +++++++++--
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/sysprof/sysprof.hash b/package/sysprof/sysprof.hash
index 1d7373e16d..5084ee2b11 100644
--- a/package/sysprof/sysprof.hash
+++ b/package/sysprof/sysprof.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/sysprof/47/sysprof-47.2.sha256sum
-sha256  e4b5ede9fd978ec3f0d5a0d44d0429a6d201c362bf6cb4527319031ae462c54f  sysprof-47.2.tar.xz
+# From https://download.gnome.org/sources/sysprof/48/sysprof-48.0.sha256sum
+sha256  1b0f0380f2f30708ba87829321a06fee1db36dfa87797bbf07f0a7acf4498d18  sysprof-48.0.tar.xz
 
 # License files
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/sysprof/sysprof.mk b/package/sysprof/sysprof.mk
index 13b3de175e..abbddfb6e1 100644
--- a/package/sysprof/sysprof.mk
+++ b/package/sysprof/sysprof.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SYSPROF_VERSION_MAJOR = 47
-SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).2
+SYSPROF_VERSION_MAJOR = 48
+SYSPROF_VERSION = $(SYSPROF_VERSION_MAJOR).0
 SYSPROF_SOURCE = sysprof-$(SYSPROF_VERSION).tar.xz
 SYSPROF_SITE = https://download.gnome.org/sources/sysprof/$(SYSPROF_VERSION_MAJOR)
 SYSPROF_LICENSE = GPL-3.0+
@@ -22,6 +22,13 @@ SYSPROF_CONF_OPTS = \
 	-Dtools=true \
 	-Dsystemdunitdir=/usr/lib/systemd/system
 
+ifeq ($(BR2_PACKAGE_ELFUTILS),y)
+SYSPROF_DEPENDENCIES += elfutils
+SYSPROF_CONF_OPTS += -Ddebuginfod=enabled
+else
+SYSPROF_CONF_OPTS += -Ddebuginfod=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 SYSPROF_DEPENDENCIES += systemd
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
