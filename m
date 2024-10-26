Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C237D10BFC
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 488AA600CC;
	Sat, 26 Oct 2024 14:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UtutO1lxy2wt; Sat, 26 Oct 2024 14:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A67560644
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A67560644;
	Sat, 26 Oct 2024 14:36:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 49C265C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F06E4018E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RKbdPt4ZAdSR for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F212401CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F212401CC
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:36:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3A2F183C05; Sat, 26 Oct 2024 14:36:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:35:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d28ee3318dee87e4339e709a46ac1eac25810f6
X-Git-Newrev: 5207e5dab7530541c4dd106959f7d1ab1645e065
X-Patchwork-Hint: ignore
Message-Id: <20241026143610.3A2F183C05@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ustreamer: bump version to 6.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=5207e5dab7530541c4dd106959f7d1ab1645e065
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog - https://github.com/pikvm/ustreamer/compare/v6.11...v6.16

Drop upstream patch 0001-src-libs-types.h-include-sys-types.h.patch.
(https://github.com/pikvm/ustreamer/pull/273/commits/0ce1d6e1f61dfbebae35a9c3a8a77c69ee43a8b0)

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-src-libs-types.h-include-sys-types.h.patch | 36 ----------------------
 package/ustreamer/ustreamer.hash                   |  2 +-
 package/ustreamer/ustreamer.mk                     |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch b/package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch
deleted file mode 100644
index 82fe596963..0000000000
--- a/package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 6c24c9ea610e7cc0e47d1e7124697098d5ef365e Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 15 May 2024 19:56:49 +0200
-Subject: [PATCH] src/libs/types.h: include sys/types.h (#273)
-
-Include sys/types.h to avoid the following uclibc build failure since
-version 5.52 and
-https://github.com/pikvm/ustreamer/commit/2d6716aa4762151f0fb1b900d3cd3295d328cab6:
-
-In file included from libs/base64.h:25,
-                 from libs/base64.c:23:
-libs/types.h:30:9: error: unknown type name 'ssize_t'
-   30 | typedef ssize_t sz;
-      |         ^~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/24498049d7beb4afaaf9f9a0c2fc0bcd26a3ee04
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/pikvm/ustreamer/commit/6c24c9ea610e7cc0e47d1e7124697098d5ef365e
----
- src/libs/types.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libs/types.h b/src/libs/types.h
-index 54e42325..b35bbaea 100644
---- a/src/libs/types.h
-+++ b/src/libs/types.h
-@@ -24,6 +24,7 @@
- #include <stdio.h>
- #include <stdbool.h>
- #include <stdint.h>
-+#include <sys/types.h>
- 
- 
- typedef long long sll;
diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index 7c70f0195f..7a03b21b86 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80ab01eeaa81c7d8e9c7f62304287d176fd729cb12ca5adb2e181b5a3da79216  ustreamer-6.11.tar.gz
+sha256  88ac5e99c56729fecba2cf7f63b690a126dcaef420e2cce9c25c66c55c097f64  ustreamer-6.16.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index 5b73e387d6..2944827083 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.11
+USTREAMER_VERSION = 6.16
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
