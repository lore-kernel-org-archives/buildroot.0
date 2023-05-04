Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68249C77B78
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 17:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1376F40C13;
	Thu,  4 May 2023 17:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1376F40C13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UJJl_B9RjXJe; Thu,  4 May 2023 17:39:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FCA2429FA;
	Thu,  4 May 2023 17:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FCA2429FA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1ADF11BF3BC
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 17:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B0CC429D1
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 17:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B0CC429D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TbbYeVvoW0Cu for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 17:36:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DC4F429E6
 for <buildroot@buildroot.org>; Thu,  4 May 2023 17:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DC4F429E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D65885D34; Thu,  4 May 2023 17:36:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 19:30:02 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7f0dac02345547724f1d1a84bd9d220add826ffc
X-Git-Newrev: cb7d10bcbe6f5d7723ef8611c5eff613b5c34d7c
X-Patchwork-Hint: ignore
Message-Id: <20230504173637.5D65885D34@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/gstreamer1-editing-services: bump version to 1.22.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb7d10bcbe6f5d7723ef8611c5eff613b5c34d7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e4fb09f95f8dbac5c21026392ae0bcc91f17585f)
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
