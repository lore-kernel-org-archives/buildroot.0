Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AE8CAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D19B26F557;
	Thu, 11 Sep 2025 19:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A85ey8D8LpTA; Thu, 11 Sep 2025 19:52:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 111B36F55A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 111B36F55A;
	Thu, 11 Sep 2025 19:52:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD546234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFC7141FA0
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BEN4rGuxXxo4 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19FB8415A1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19FB8415A1
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:52:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 14B3F84329; Thu, 11 Sep 2025 19:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:50:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49a2905bad99d6631bf04e61e755056244352afb
X-Git-Newrev: 74a4104aa9e3be878fc41eb24a31b70f24f19483
X-Patchwork-Hint: ignore
Message-Id: <20250911195216.14B3F84329@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/leafpad: remove package
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=74a4104aa9e3be878fc41eb24a31b70f24f19483
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package needs libgtk2, which we are about to remove.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy             |  7 +++++++
 package/Config.in            |  1 -
 package/leafpad/Config.in    |  7 -------
 package/leafpad/leafpad.hash |  4 ----
 package/leafpad/leafpad.mk   | 13 -------------
 5 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e19ede11df..c65ab01930 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_LEAFPAD
+	bool "leafpad has been removed"
+	select BR2_LEGACY
+	help
+	  The leafpad package has been removed, as libgtk2 has been
+	  removed as well.
+
 config BR2_PACKAGE_GTKPERF
 	bool "gtkperf has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 2d381a64f4..abc7ddcba2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -399,7 +399,6 @@ comment "X applications"
 	source "package/dillo/Config.in"
 	source "package/docker/Config.in"
 	source "package/feh/Config.in"
-	source "package/leafpad/Config.in"
 	source "package/mupdf/Config.in"
 	source "package/nodm/Config.in"
 	source "package/pcmanfm/Config.in"
diff --git a/package/leafpad/Config.in b/package/leafpad/Config.in
deleted file mode 100644
index a4408547cd..0000000000
--- a/package/leafpad/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_LEAFPAD
-	bool "leafpad"
-	depends on BR2_PACKAGE_LIBGTK2
-	help
-	  GTK+ based simple text editor
-
-	  http://savannah.nongnu.org/download/leafpad
diff --git a/package/leafpad/leafpad.hash b/package/leafpad/leafpad.hash
deleted file mode 100644
index 4f6e68f0a2..0000000000
--- a/package/leafpad/leafpad.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# Locally calculated after checking pgp signature
-sha256  07d3f712f4dbd0a33251fd1dee14e21afdc9f92090fc768c11ab0ac556adbe97  leafpad-0.8.19.tar.gz
-# Locally computed
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
deleted file mode 100644
index 608fa37be4..0000000000
--- a/package/leafpad/leafpad.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# leafpad
-#
-################################################################################
-
-LEAFPAD_VERSION = 0.8.19
-LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
-LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
-LEAFPAD_LICENSE = GPL-2.0+
-LEAFPAD_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
