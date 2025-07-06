Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EAAC83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 14:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9990C813ED;
	Sun,  6 Jul 2025 14:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s0BwV5zwBxd4; Sun,  6 Jul 2025 14:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A564581425
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A564581425;
	Sun,  6 Jul 2025 14:28:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CCE3712E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B387540132
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:28:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 29IvDlBnsnlL for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 14:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5AE34005F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5AE34005F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 14:28:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A730A86089; Sun,  6 Jul 2025 14:28:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Jul 2025 16:27:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14272869ebdeb07f7203e4d603384581bc16a215
X-Git-Newrev: bab8ed7b0b454488456436291453751d65a35fbe
X-Patchwork-Hint: ignore
Message-Id: <20250706142840.A730A86089@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igt-gpu-tools: bump version to 2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=bab8ed7b0b454488456436291453751d65a35fbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2025-June/003614.html

Removed patch which is included in this release.

Switched _SITE to tarball and added sha512 hash, both provided by
upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ....c-since-procps-ng-4.0.5-PIDS_VAL-takes-3.patch | 66 ----------------------
 package/igt-gpu-tools/igt-gpu-tools.hash           |  5 +-
 package/igt-gpu-tools/igt-gpu-tools.mk             |  6 +-
 3 files changed, 6 insertions(+), 71 deletions(-)

diff --git a/package/igt-gpu-tools/0001-lib-igt_aux.c-since-procps-ng-4.0.5-PIDS_VAL-takes-3.patch b/package/igt-gpu-tools/0001-lib-igt_aux.c-since-procps-ng-4.0.5-PIDS_VAL-takes-3.patch
deleted file mode 100644
index 7c58024f01..0000000000
--- a/package/igt-gpu-tools/0001-lib-igt_aux.c-since-procps-ng-4.0.5-PIDS_VAL-takes-3.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 17a30d4dbd60c644244d5bc7355eeaa221aaa820 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Thu, 2 Jan 2025 14:16:47 +0100
-Subject: [PATCH] lib/igt_aux.c: since procps-ng 4.0.5, PIDS_VAL() takes 3
- arguments, not 4
-
-Unfortunately, the API of procps-ng has changed between procps-ng
-4.0.4 and procps-ng 4.0.5, with the PIDS_VAL() macro changing in
-upstream commit
-https://gitlab.com/procps-ng/procps/-/commit/967fdcfb06e20aad0f31073474cb94545c9bdea5.
-
-This API breakage has been reported upstream as of
-https://gitlab.com/procps-ng/procps/-/issues/366, but in the mean
-time, the build of igt-gpu-tools breaks with:
-
-../lib/igt_aux.c:1358:78: error: macro "PIDS_VAL" passed 4 arguments, but takes just 3
-
-We fix this by detecting the version of the libproc2 library, and
-adjusting accordingly how PIDS_VAL() gets used.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://lists.freedesktop.org/archives/igt-dev/2025-January/083809.html
----
- lib/igt_aux.c | 7 +++++++
- meson.build   | 3 +++
- 2 files changed, 10 insertions(+)
-
-diff --git a/lib/igt_aux.c b/lib/igt_aux.c
-index 3407cc4f2..f5bf48da6 100644
---- a/lib/igt_aux.c
-+++ b/lib/igt_aux.c
-@@ -1358,10 +1358,17 @@ static bool get_process_ids(struct igt_process *prcs)
- 	prcs->comm = NULL;
- 	prcs->stack = procps_pids_get(prcs->info, PIDS_FETCH_TASKS_ONLY);
- 	if (prcs->stack) {
-+#if defined(HAVE_LIBPROC2_POST_4_0_5_API)
-+		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack);
-+		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack);
-+		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack);
-+		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack);
-+#else
- 		prcs->tid = PIDS_VAL(EU_PID, s_int, prcs->stack, prcs->info);
- 		prcs->euid = PIDS_VAL(EU_EUID, s_int, prcs->stack, prcs->info);
- 		prcs->egid = PIDS_VAL(EU_EGID, s_int, prcs->stack, prcs->info);
- 		prcs->comm = PIDS_VAL(EU_CMD, str, prcs->stack, prcs->info);
-+#endif
- 	}
- #endif
- 	return prcs->tid != 0;
-diff --git a/meson.build b/meson.build
-index 8b2a2a64a..f3e645c4d 100644
---- a/meson.build
-+++ b/meson.build
-@@ -139,6 +139,9 @@ if libprocps.found()
-   config.set('HAVE_LIBPROCPS', 1)
- elif libproc2.found()
-   config.set('HAVE_LIBPROC2', 1)
-+  if libproc2.version().version_compare('>= 4.0.5')
-+    config.set('HAVE_LIBPROC2_POST_4_0_5_API', 1)
-+  endif
- else
-   error('Either libprocps or libproc2 is required')
- endif
--- 
-2.47.1
-
diff --git a/package/igt-gpu-tools/igt-gpu-tools.hash b/package/igt-gpu-tools/igt-gpu-tools.hash
index bf760b91d7..76e538e78e 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.hash
+++ b/package/igt-gpu-tools/igt-gpu-tools.hash
@@ -1,5 +1,6 @@
-# Locally calculated from download
-sha256  de6e9443d569e76333ec6c8ffc53937b6831224161fe69bf2f07efad3bd0e04a  igt-gpu-tools-0ee4074685c1e184f2d3612ea6eb4d126f9a2e23.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2025-June/003614.html
+sha256  bf72beff71093db692f386c9359b557dfa8e8c45250439c952564b1b6fe343f8  igt-gpu-tools-2.1.tar.xz
+sha512  401e9912044e2d37cc581cf01ba03b4d14c2e685e28c4764cb544c481291c6ec36cb90beaadb51537ba7cc8dc33d4aa7139dad91b4484ae0b718cbe19c1a987e  igt-gpu-tools-2.1.tar.xz
 
 # Hash for license file:
 sha256  1b7e266857b05808660f42369a4a797459d7b7bec7245e378aa28a8db2f213da  COPYING
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
index bc430b6222..d2d9889cc1 100644
--- a/package/igt-gpu-tools/igt-gpu-tools.mk
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-IGT_GPU_TOOLS_VERSION = 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23
-IGT_GPU_TOOLS_SOURCE = igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION).tar.bz2
-IGT_GPU_TOOLS_SITE = https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/archive/$(IGT_GPU_TOOLS_VERSION)
+IGT_GPU_TOOLS_VERSION = 2.1
+IGT_GPU_TOOLS_SOURCE = igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION).tar.xz
+IGT_GPU_TOOLS_SITE = https://www.x.org/releases/individual/app
 IGT_GPU_TOOLS_LICENSE = MIT
 IGT_GPU_TOOLS_LICENSE_FILES = COPYING
 IGT_GPU_TOOLS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
