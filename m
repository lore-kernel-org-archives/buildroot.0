Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB84FC433FE
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 14:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D9174226E;
	Fri, 14 Oct 2022 14:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D9174226E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZbDPDcy7fuJ; Fri, 14 Oct 2022 14:10:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20521410DF;
	Fri, 14 Oct 2022 14:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20521410DF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 992E61BF2F9
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 14:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75DBE60BCE
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 14:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75DBE60BCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YvmKGZnQqtun for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 14:09:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 236F26F9FE
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 14:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 236F26F9FE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1031186CED; Fri, 14 Oct 2022 14:09:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 16:06:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63ee0e8b35e556e34e724b74b951e80d3f571f3c
X-Git-Newrev: b790f6e494e65b4704c1e6c5cd38c38fc0bd7719
X-Patchwork-Hint: ignore
Message-Id: <20221014140933.1031186CED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: bump to version 1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=b790f6e494e65b4704c1e6c5cd38c38fc0bd7719
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-src-storage.c-fix-build-with-uclibc.patch | 37 ----------------------
 package/iwd/iwd.hash                               |  2 +-
 package/iwd/iwd.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch b/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch
deleted file mode 100644
index 55fdaa86fd..0000000000
--- a/package/iwd/0001-src-storage.c-fix-build-with-uclibc.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 99e74ade2ea892e6d0b070bec1df6a135ce2c8b3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 25 Mar 2022 16:35:49 +0100
-Subject: [PATCH] src/storage.c: fix build with uclibc
-
-explicit_bzero is used in src/storage.c since commit
-01cd8587606bf2da1af245163150589834126c1c but src/missing.h is not
-included, as a result build with uclibc fails on:
-
-/home/buildroot/autobuild/instance-0/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: src/storage.o: in function `storage_init':
-storage.c:(.text+0x13a4): undefined reference to `explicit_bzero'
-
-Fixes:
- - http://autobuild.buildroot.org/results/2aff8d3d7c33c95e2c57f7c8a71e69939f0580a1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://lists.01.org/hyperkitty/list/iwd@lists.01.org/thread/WB2XXRBUDHC5IVFDEOJBK23JHPURL427]
----
- src/storage.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/storage.c b/src/storage.c
-index 82a72443..aa8066b1 100644
---- a/src/storage.c
-+++ b/src/storage.c
-@@ -44,6 +44,7 @@
- #include <ell/ell.h>
- #include "ell/useful.h"
- 
-+#include "src/missing.h"
- #include "src/common.h"
- #include "src/storage.h"
- #include "src/crypto.h"
--- 
-2.35.1
-
diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 1c34aa0a90..e7971cd637 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  3f138e03301beb2afc7b385a62f56db17059137857ab579f269c4e441783e760  iwd-1.25.tar.xz
+sha256  9fd13512dc27d83efb8d341f7df98f5488f70131686021fcd0d93fc97af013b8  iwd-1.30.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index fc10c5f1d4..4a818f0b82 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.25
+IWD_VERSION = 1.30
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
