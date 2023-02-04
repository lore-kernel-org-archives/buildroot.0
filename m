Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E51C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:26:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FED1617A4;
	Tue, 21 Feb 2023 01:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FED1617A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xmtAHHYb8Aiu; Tue, 21 Feb 2023 01:26:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 399BB6FB94;
	Tue, 21 Feb 2023 01:25:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 399BB6FB94
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 649BB1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00CF26FBD7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00CF26FBD7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2R49PBizH_RT for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B7326FBF5
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B7326FBF5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00BE881979; Mon, 20 Feb 2023 20:52:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 00:07:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fbca109741661d39d7eeaf7ea0e2f25ecbd3bfb5
X-Git-Newrev: abfea72d452b1279244f4cc33c2919ea32719306
X-Patchwork-Hint: ignore
Message-Id: <20230220205246.00BE881979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/gstreamer1-editing-services: bump version to 1.22.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=abfea72d452b1279244f4cc33c2919ea32719306
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add a patch fixing an incorrect gstreamer-validate-1.0 dependency
name.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ix-gstreamer-validate-1.0-dependency-name.patch | 35 ++++++++++++++++++++++
 .../gstreamer1-editing-services.hash               |  4 +--
 .../gstreamer1-editing-services.mk                 |  2 +-
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch b/package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch
new file mode 100644
index 0000000000..6c190d3727
--- /dev/null
+++ b/package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch
@@ -0,0 +1,35 @@
+From c3edd999195445319ea619b6d719d7743f5b560d Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 31 Jan 2023 21:38:09 -0700
+Subject: [PATCH] Fix gstreamer-validate-1.0 dependency name
+
+The gst-devtools project generates gstreamer-validate-1.0.pc, this
+must match the dependency in gst-editing-services for detection
+to work properly.
+
+Fixes:
+Run-time dependency gst-validate-1.0 found: NO (tried pkgconfig and cmake)
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3859]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index bdc47f5d8b..b949f55317 100644
+--- a/meson.build
++++ b/meson.build
+@@ -110,7 +110,7 @@ if host_machine.system() != 'windows'
+ endif
+ gstcontroller_dep = dependency('gstreamer-controller-1.0', version : gst_req,
+   fallback : ['gstreamer', 'gst_controller_dep'])
+-gstvalidate_dep = dependency('gst-validate-1.0', version : gst_req, required : get_option('validate'),
++gstvalidate_dep = dependency('gstreamer-validate-1.0', version : gst_req, required : get_option('validate'),
+   fallback : ['gst-devtools', 'validate_dep'])
+ 
+ gio_dep = dependency('gio-2.0', version: glib_req)
+-- 
+2.34.1
+
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index 308596d7cd..bd5dcfdbaf 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.20.4.tar.xz.sha256sum
-sha256  aa03e983af5d79c1befffe3575b034e60960619a96bf877447cb73c28016fc41  gst-editing-services-1.20.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.22.0.tar.xz.sha256sum
+sha256  2a23856379af03586b66c193910fa8bb963024580bc2337c7405578dc077aa79  gst-editing-services-1.22.0.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 77feb15991..0ae9205c3b 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.20.4
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.22.0
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
