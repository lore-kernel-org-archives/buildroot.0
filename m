Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A0EC77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 11:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CEF4400CC;
	Mon,  1 May 2023 11:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CEF4400CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wt5RQVlfD2U4; Mon,  1 May 2023 11:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 474E9409F1;
	Mon,  1 May 2023 11:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 474E9409F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 347BC1BF336
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C05C40965
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 11:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C05C40965
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tDHYBjW_RwWk for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 11:40:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F01F04152D
 for <buildroot@buildroot.org>; Mon,  1 May 2023 11:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F01F04152D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE00284F4A; Mon,  1 May 2023 11:40:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 1 May 2023 13:39:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e863bdef45c3f4ffabcc8d007f658ea04cb9908
X-Git-Newrev: 0f1d33b6c8666d765f25d81b777aa666a9b492a8
X-Patchwork-Hint: ignore
Message-Id: <20230501114025.DE00284F4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crun: bump to version 1.8.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f1d33b6c8666d765f25d81b777aa666a9b492a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
https://github.com/containers/crun/releases/tag/1.8.4

Also emoved 0001-src-crun.c-fix-build-without-dlfcn.h.patch, this
commit has already existed in the latest version release.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...0001-src-crun.c-fix-build-without-dlfcn.h.patch | 39 ----------------------
 package/crun/crun.hash                             |  2 +-
 package/crun/crun.mk                               |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch b/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch
deleted file mode 100644
index 104c19a40f..0000000000
--- a/package/crun/0001-src-crun.c-fix-build-without-dlfcn.h.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 278b9b447bec3fb81bf252eb2fe2c856892ec802 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 30 Dec 2022 18:40:15 +0100
-Subject: [PATCH] src/crun.c: fix build without dlfcn.h
-
-Fix the following build failure without dlfcn.h raised since version 1.7
-and
-https://github.com/containers/crun/commit/5837234e9840cd067edd9f6cd2ed9cae9a0e6570:
-
-src/crun.c:26:10: fatal error: dlfcn.h: No such file or directory
-   26 | #include <dlfcn.h>
-      |          ^~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/a5f52a7ee757c92c9571261c0ed884d05caeaf2f
-
-[fontaine.fabrice@gmail.com: backport upstream commit]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/crun.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/crun.c b/src/crun.c
-index cbfe900..af0cc97 100644
---- a/src/crun.c
-+++ b/src/crun.c
-@@ -23,7 +23,9 @@
- #include <string.h>
- #include <libgen.h>
- 
-+#ifdef HAVE_DLOPEN
- #include <dlfcn.h>
-+#endif
- 
- #include "crun.h"
- #include "libcrun/utils.h"
--- 
-2.25.1
-
diff --git a/package/crun/crun.hash b/package/crun/crun.hash
index 2b21800f02..bdffb0c6aa 100644
--- a/package/crun/crun.hash
+++ b/package/crun/crun.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  f669ecd3d1895dcaa8425eabb707c06eb3bdb5ae5201a50a423c3cace36c4a05  crun-1.7.2.tar.gz
+sha256  5b8b5adb1dff7af768b69d2b0b4f2cd785ec931e7aa10138aa29812c46ee09ff  crun-1.8.4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index ddb96a0b33..15438a44b3 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUN_VERSION = 1.7.2
+CRUN_VERSION = 1.8.4
 CRUN_SITE = https://github.com/containers/crun/releases/download/$(CRUN_VERSION)
 CRUN_DEPENDENCIES = host-pkgconf yajl
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
