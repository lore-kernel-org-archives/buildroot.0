Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168B2C0015E
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 22:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6AE40A02;
	Sat, 15 Jul 2023 22:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D6AE40A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUKc_daD4skV; Sat, 15 Jul 2023 22:36:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6577A40A05;
	Sat, 15 Jul 2023 22:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6577A40A05
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 877C31BF2F5
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 22:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DD1A607F7
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 22:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DD1A607F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IZOCVvLO56VC for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 22:36:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2744360792
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2744360792
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 22:36:26 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1496F13F892;
 Sun, 16 Jul 2023 00:36:22 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 00:36:16 +0200
Message-ID: <20230715223616.847847-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1689460583;
 bh=QJsJpAjHNAED626H61VNIfbc+cbqFuLYtKvYBqkFg2E=;
 h=From:To:Cc:Subject:Date:From;
 b=jl8UPOp8x9/JpxiySrI8AQsTP3JSjW/qTQjBqAIuxTdVIb6FwhaiYdr99ZfqL+pe/
 SWw2TpFAybGXeBWeujBPNUCfIgSz5nI2+r5yFS7dSrp7XyOgF/6VGKCF9hhIzMeV+X
 pYZ2J1NpvNkgKF/IZTUBhO+VzI0dCmPfbnqaz591SRzsfAQdeQ0JMbfdrW+l4Qovx2
 LlNLMp8ET7WU6bBHQOGvmYOJ9KB3baj5UT9RnK77r1VZKShoX7BqFjbC0odO5wlySm
 t1UKPWZTXO/qrTcGkWBwM+0Nv7xdP/AsRQ6JvubnBWSTLx/6jfOADZBx+3VmQXVhyp
 q9D6vNbl8VASQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jl8UPOp8
Subject: [Buildroot] [PATCH 1/1] package/gawk: bump to version 5.2.2
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 .checkpackageignore                           |  1 -
 .../0001-Fix-a-bug-with-Node_elem_new.patch   | 29 -------------------
 package/gawk/gawk.hash                        |  4 +--
 package/gawk/gawk.mk                          |  2 +-
 4 files changed, 3 insertions(+), 33 deletions(-)
 delete mode 100644 package/gawk/0001-Fix-a-bug-with-Node_elem_new.patch

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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
