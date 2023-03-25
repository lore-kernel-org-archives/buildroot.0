Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D12C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 21:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D43A081762;
	Sat, 25 Mar 2023 21:08:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D43A081762
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0W6phASqj3-d; Sat, 25 Mar 2023 21:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10F7481FB1;
	Sat, 25 Mar 2023 21:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10F7481FB1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE55F1BF86D
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C4FF606E6
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C4FF606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n_Kncp223Hjp for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90ADB60A8A
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90ADB60A8A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FA0982ACC; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 21:47:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf7b3a1a36c7f60cc32117f4521c6571f68416a3
X-Git-Newrev: 8962eb6749f62fbf1f5ef3ef65d385a13e029e98
X-Patchwork-Hint: ignore
Message-Id: <20230325210739.7FA0982ACC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/motion: migrate to new autopoint
 flag
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

commit: https://git.buildroot.net/buildroot/commit/?id=8962eb6749f62fbf1f5ef3ef65d385a13e029e98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch that is no longer necessary.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-configure.ac-remove-po-Makefile.in.patch  | 29 ----------------------
 package/motion/motion.mk                           |  2 +-
 2 files changed, 1 insertion(+), 30 deletions(-)

diff --git a/package/motion/0001-configure.ac-remove-po-Makefile.in.patch b/package/motion/0001-configure.ac-remove-po-Makefile.in.patch
deleted file mode 100644
index 9b514bafcd..0000000000
--- a/package/motion/0001-configure.ac-remove-po-Makefile.in.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0e05d4116678de3a7d913177a8fc63f10e58ad24 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 18 Jan 2020 00:00:21 +0100
-Subject: [PATCH] configure.ac: remove po/Makefile.in
-
-The file po/Makefile.in is automatically added to AC_OUTPUT while using
-gettexize
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not upstreamable]
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3876adb..221dacf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -471,7 +471,6 @@ LDFLAGS="$TEMP_LDFLAGS"
- AC_CONFIG_FILES([
- 	Makefile
- 	src/Makefile
--  po/Makefile.in
-   man/Makefile
-   data/camera1-dist.conf
-   data/camera2-dist.conf
--- 
-2.24.1
-
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index 4e9ccdc3f7..2cce6cd1ff 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -12,7 +12,7 @@ MOTION_CPE_ID_VENDOR = motion_project
 MOTION_DEPENDENCIES = host-pkgconf jpeg libmicrohttpd $(TARGET_NLS_DEPENDENCIES)
 # From git
 MOTION_AUTORECONF = YES
-MOTION_GETTEXTIZE = YES
+MOTION_AUTOPOINT = YES
 
 MOTION_CONF_OPTS += --without-optimizecpu
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
