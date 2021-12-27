Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53171C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 10:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AFBD60E3F;
	Mon, 27 Dec 2021 10:21:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbkmXEVAgOIB; Mon, 27 Dec 2021 10:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F01560E38;
	Mon, 27 Dec 2021 10:21:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06D961BF4DB
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0271440210
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qT78AjZbQZHo for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 10:20:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18F0540354
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:20:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3A74281848; Mon, 27 Dec 2021 10:14:16 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 11:19:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbce57579b942e7fec28abbfacbaa2bfaf4f9c1e
X-Git-Newrev: a1f04eb87273cde5555413ebe97f392096fbc513
X-Patchwork-Hint: ignore
Message-Id: <20211227101417.3A74281848@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pdbg: bump version to v3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1f04eb87273cde5555413ebe97f392096fbc513
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch that is now upstream.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pdbg/0001-template-Fix-alignment.patch | 39 --------------------------
 package/pdbg/pdbg.hash                         |  2 +-
 package/pdbg/pdbg.mk                           |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/pdbg/0001-template-Fix-alignment.patch b/package/pdbg/0001-template-Fix-alignment.patch
deleted file mode 100644
index e95d8344e2..0000000000
--- a/package/pdbg/0001-template-Fix-alignment.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0080d0a64da274207bc341491f87863952bb6e3b Mon Sep 17 00:00:00 2001
-From: Joel Stanley <joel@jms.id.au>
-Date: Tue, 3 Aug 2021 17:28:17 +0930
-Subject: [PATCH] template: Fix alignment
-
-The assembler complains about unaliged data:
-
- ./template.S: Assembler messages:
- ./template.S:21: Error: misaligned data
-
-If the included data is not an aligned size, the the symbols following
-will be unaligned.
-
-We lost the alignment directive in commit 5f3deee1289e ("template: new
-libfdt requires 8-byte aligned fdt"), so add it back as it was before
-that commit.
-
-Reported by the buildroot autobuilder.
-
-Signed-off-by: Joel Stanley <joel@jms.id.au>
----
- template.S | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/template.S b/template.S
-index ecf9bba0656d..df8c064d6bc0 100644
---- a/template.S
-+++ b/template.S
-@@ -17,6 +17,7 @@
- SYM_START(SYMBOL_PREFIX):
- .incbin FILENAME
- SYM_END(SYMBOL_PREFIX):
-+.align 4
- SYM_SIZE(SYMBOL_PREFIX):
- 	.long	SYM_END(SYMBOL_PREFIX) - SYM_START(SYMBOL_PREFIX)
- .globl SYM_START(SYMBOL_PREFIX)
--- 
-2.32.0
-
diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index 9a58fa842c..df7ba314bf 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 87fe68977f72885e46d321da806d30f33a901de817461eb44fa727cd81d1d109 pdbg-3.3.tar.gz
+sha256 5b721fd5551591cd5626ccf72c8d9096d902de4da10324097a37b4763815f0d7 pdbg-3.4.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 7f6b48e6eb..5a5cfbc62d 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = 3.3
+PDBG_VERSION = 3.4
 PDBG_SITE = $(call github,open-power,pdbg,v$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
