Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6302ACAC58E
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20EFE6F58D;
	Thu, 11 Sep 2025 19:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7eMSlnuMexT; Thu, 11 Sep 2025 19:52:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 496786F566
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 496786F566;
	Thu, 11 Sep 2025 19:52:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EDD1C443
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFDAF4246B
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jIBvmP20Pf-Y for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18B0A42330
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18B0A42330
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:52:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0805984323; Thu, 11 Sep 2025 19:52:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 21:49:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d979430dbb00b6cb6f4307b66a45f58abf71422
X-Git-Newrev: 49a2905bad99d6631bf04e61e755056244352afb
X-Patchwork-Hint: ignore
Message-Id: <20250911195216.0805984323@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtkperf: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=49a2905bad99d6631bf04e61e755056244352afb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package requires libgtk2, which we are about to remove.
It has not seen an update in 20 years.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout: add legacy handling.]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy             |  7 +++++++
 package/Config.in            |  1 -
 package/gtkperf/Config.in    | 11 -----------
 package/gtkperf/gtkperf.hash |  3 ---
 package/gtkperf/gtkperf.mk   | 15 ---------------
 5 files changed, 7 insertions(+), 30 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 5ad8ba55b3..e19ede11df 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_GTKPERF
+	bool "gtkperf has been removed"
+	select BR2_LEGACY
+	help
+	  The gtkperf package has been removed, as libgtk2 has been
+	  removed as well.
+
 config BR2_PACKAGE_GTK2_ENGINES
 	bool "gtk2-engines has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 7234d06483..2d381a64f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -399,7 +399,6 @@ comment "X applications"
 	source "package/dillo/Config.in"
 	source "package/docker/Config.in"
 	source "package/feh/Config.in"
-	source "package/gtkperf/Config.in"
 	source "package/leafpad/Config.in"
 	source "package/mupdf/Config.in"
 	source "package/nodm/Config.in"
diff --git a/package/gtkperf/Config.in b/package/gtkperf/Config.in
deleted file mode 100644
index a763e305c7..0000000000
--- a/package/gtkperf/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_GTKPERF
-	bool "gtkperf (performance test for GTK2)"
-	depends on BR2_PACKAGE_LIBGTK2
-	help
-	  GtkPerf is an application designed to test GTK+ performance.
-	  The point is to create common testing platform to run
-	  predefined GTK+ widgets
-	  e.g. (opening comboboxes, toggling buttons, scrolling text
-	  yms.) and this way define the speed of device/platform.
-
-	  http://gtkperf.sourceforge.net/
diff --git a/package/gtkperf/gtkperf.hash b/package/gtkperf/gtkperf.hash
deleted file mode 100644
index 72f35a26f2..0000000000
--- a/package/gtkperf/gtkperf.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  9704344e732038eecbd007dd996a56293a6b027b5b76f3f036273a3fae1ab27b  gtkperf_0.40.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/gtkperf/gtkperf.mk b/package/gtkperf/gtkperf.mk
deleted file mode 100644
index cc0433984c..0000000000
--- a/package/gtkperf/gtkperf.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# gtkperf
-#
-################################################################################
-
-GTKPERF_VERSION = 0.40
-GTKPERF_SOURCE = gtkperf_$(GTKPERF_VERSION).tar.gz
-GTKPERF_SITE = http://downloads.sourceforge.net/project/gtkperf/gtkperf/$(GTKPERF_VERSION)
-GTKPERF_DEPENDENCIES = libgtk2 $(TARGET_NLS_DEPENDENCIES)
-GTKPERF_LICENSE = GPL-2.0
-GTKPERF_LICENSE_FILES = COPYING
-GTKPERF_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
