Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B737EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F34060D80;
	Tue, 18 Jul 2023 20:51:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F34060D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vrbIbrzbbeDY; Tue, 18 Jul 2023 20:51:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D26160C2E;
	Tue, 18 Jul 2023 20:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D26160C2E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0633B1BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF51B81F70
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF51B81F70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 65NwJdUEhloo for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:51:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08482813FB
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08482813FB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9068873E5; Tue, 18 Jul 2023 20:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 22:43:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08171f1fd0c31165a39d79389300ddf9adb5bbb6
X-Git-Newrev: 76f20b728fa703bfb493482e065445da77f68893
X-Patchwork-Hint: ignore
Message-Id: <20230718205131.E9068873E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gawk: bump to version 5.2.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=76f20b728fa703bfb493482e065445da77f68893
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For news since 5.2.0, see:
https://git.savannah.gnu.org/cgit/gawk.git/tree/NEWS?h=gawk-5.2.2

For detailed change log, see:
https://git.savannah.gnu.org/cgit/gawk.git/tree/ChangeLog?h=gawk-5.2.2

This commit also removes the package patch, as it is included in
upstream version 5.2.1, in:
https://git.savannah.gnu.org/cgit/gawk.git/commit/?id=baab183439ff4e0c6b77d62156d447e61fc1dcfb

The file .checkpackageignore is also updated to reflect this patch
removal.

The motivation of this bump is mainly the RISC-V fixes.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../gawk/0001-Fix-a-bug-with-Node_elem_new.patch   | 29 ----------------------
 package/gawk/gawk.hash                             |  4 +--
 package/gawk/gawk.mk                               |  2 +-
 4 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a7bf69be39..eae64e19ff 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -495,7 +495,6 @@ package/fxload/0001-fix-static-build.patch Upstream
 package/gamin/0001-no-abstract-sockets.patch Upstream
 package/gamin/0002-no-const-return.patch Sob Upstream
 package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch Upstream
-package/gawk/0001-Fix-a-bug-with-Node_elem_new.patch Upstream
 package/gcc/10.4.0/0001-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch Upstream
 package/gcc/10.4.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch Upstream
 package/gcc/10.4.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch Upstream
diff --git a/package/gawk/0001-Fix-a-bug-with-Node_elem_new.patch b/package/gawk/0001-Fix-a-bug-with-Node_elem_new.patch
deleted file mode 100644
index 8cbe9c6d02..0000000000
--- a/package/gawk/0001-Fix-a-bug-with-Node_elem_new.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From baab183439ff4e0c6b77d62156d447e61fc1dcfb Mon Sep 17 00:00:00 2001
-From: "Arnold D. Robbins" <arnold@skeeve.com>
-Date: Wed, 14 Sep 2022 21:08:59 +0300
-Subject: [PATCH] Fix a bug with Node_elem_new.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-baab183439ff4e0c6b77d62156d447e61fc1dcfb]
-[yann.morin.1998@free.fr: drop all hunks about tests and changelogs]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- interpret.h       | 1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
-
-diff --git a/interpret.h b/interpret.h
-index 57d060e6..268655b2 100644
---- a/interpret.h
-+++ b/interpret.h
-@@ -238,6 +238,7 @@ uninitialized_scalar:
- 						_("reference to uninitialized argument `%s'") :
- 						_("reference to uninitialized variable `%s'"),
- 								save_symbol->vname);
-+				UPREF(m);
- 				PUSH(m);
- 				break;
- 
--- 
-2.34.1
-
diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index 3ab0cfdbb3..852a815d04 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/gawk/gawk-5.2.0.tar.xz.sig
+# https://ftp.gnu.org/gnu/gawk/gawk-5.2.2.tar.xz.sig
 # Primary key fingerprint: D196 7C63 7887 1317 7D86  1ED7 DF59 7815 937E C0D2
-sha256  e4ddbad1c2ef10e8e815ca80208d0162d4c983e6cca16f925e8418632d639018  gawk-5.2.0.tar.xz
+sha256  3c1fce1446b4cbee1cd273bd7ec64bc87d89f61537471cd3e05e33a965a250e9  gawk-5.2.2.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 47f681339d..62270cea9c 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 5.2.0
+GAWK_VERSION = 5.2.2
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
