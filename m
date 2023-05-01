Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0848C77B73
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 08:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76E5381EF4;
	Mon,  1 May 2023 08:09:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76E5381EF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8cZEOvw9os4B; Mon,  1 May 2023 08:09:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95EBE81EEC;
	Mon,  1 May 2023 08:09:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95EBE81EEC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49BF01BF336
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 08:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A36B60F40
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 08:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A36B60F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ya5Ga13Q6oA3 for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 08:06:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9624D6112E
 for <buildroot@buildroot.org>; Mon,  1 May 2023 08:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9624D6112E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 876E184992; Mon,  1 May 2023 08:06:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 10:03:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e796e5a70be0a78c1a4cf70582f006f05bf33712
X-Git-Newrev: e4fb09f95f8dbac5c21026392ae0bcc91f17585f
X-Patchwork-Hint: ignore
Message-Id: <20230501080641.876E184992@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gstreamer1-editing-services: bump
 version to 1.22.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4fb09f95f8dbac5c21026392ae0bcc91f17585f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ix-gstreamer-validate-1.0-dependency-name.patch | 35 ----------------------
 .../gstreamer1-editing-services.hash               |  4 +--
 .../gstreamer1-editing-services.mk                 |  2 +-
 3 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch b/package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch
deleted file mode 100644
index 6c190d3727..0000000000
--- a/package/gstreamer1/gstreamer1-editing-services/0001-Fix-gstreamer-validate-1.0-dependency-name.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c3edd999195445319ea619b6d719d7743f5b560d Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Tue, 31 Jan 2023 21:38:09 -0700
-Subject: [PATCH] Fix gstreamer-validate-1.0 dependency name
-
-The gst-devtools project generates gstreamer-validate-1.0.pc, this
-must match the dependency in gst-editing-services for detection
-to work properly.
-
-Fixes:
-Run-time dependency gst-validate-1.0 found: NO (tried pkgconfig and cmake)
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/3859]
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index bdc47f5d8b..b949f55317 100644
---- a/meson.build
-+++ b/meson.build
-@@ -110,7 +110,7 @@ if host_machine.system() != 'windows'
- endif
- gstcontroller_dep = dependency('gstreamer-controller-1.0', version : gst_req,
-   fallback : ['gstreamer', 'gst_controller_dep'])
--gstvalidate_dep = dependency('gst-validate-1.0', version : gst_req, required : get_option('validate'),
-+gstvalidate_dep = dependency('gstreamer-validate-1.0', version : gst_req, required : get_option('validate'),
-   fallback : ['gst-devtools', 'validate_dep'])
- 
- gio_dep = dependency('gio-2.0', version: glib_req)
--- 
-2.34.1
-
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index bd5dcfdbaf..0cdb18ea5d 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.22.0.tar.xz.sha256sum
-sha256  2a23856379af03586b66c193910fa8bb963024580bc2337c7405578dc077aa79  gst-editing-services-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gst-editing-services-1.22.2.tar.xz.sha256sum
+sha256  453b1464fc3857de269a7cb0ebd966afe02171d97bef672a0b8a0a6d43e0cebf  gst-editing-services-1.22.2.tar.xz
 
 # Hashes for license files:
 sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 0ae9205c3b..9fdc877db0 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.22.0
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.22.2
 GSTREAMER1_EDITING_SERVICES_SOURCE = gst-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = https://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
