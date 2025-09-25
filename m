Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1055CAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7D8441877;
	Thu, 25 Sep 2025 20:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JyRm3v_ExYST; Thu, 25 Sep 2025 20:20:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3B834185E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3B834185E;
	Thu, 25 Sep 2025 20:20:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1353E12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B7BA41525
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAgMyVhauNu7 for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DC1E411E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DC1E411E9
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BD5986443; Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:07:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 73aa633876e9d3e2632a9204800448cfd28227fd
X-Git-Newrev: eb81d4d8ce37d4cd27ed171859b71124802dce7c
X-Patchwork-Hint: ignore
Message-Id: <20250925201943.3BD5986443@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uclibc: bump to
 1.0.55
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eb81d4d8ce37d4cd27ed171859b71124802dce7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Finally the aarch64 tls bug is fixed. (python 3.13 segfault)
Unfortunately it is not covered by any testcase of uClibc-ng-test.

Here is the git shortlog for the release:

Marius Melzer (1):
      malloc-standard: Fix truncation problem in malloc

Waldemar Brodkorb (5):
      Fix Sysvipc for ARM, AARCH64, RISCV64, KVX and m68k
      remove uClibc specific gettext_printf
      aarch64: do not force tls-model in CPU_CFLAGS, this isn't required
      aarch64: respect r_addend for TLSDESC relocations
      bump version for 1.0.55 release

yliu (5):
      mips32: Preventing FORCE_FRAME_POINTER from being optimized away
      mips32: Define __IPC_64 according to kernel version
      time64: fixed msgctl/semctl/shmctl result errors for for MIPS32/RISCV32
      time64: fix *ctl functions in mips32eb/mips64
      time64: fix *ctl functions in mips32eb

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Tested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5250bba8e5b1aaeb58977baf1d91e2be66656476)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...001-remove-uClibc-specific-gettext_printf.patch | 34 ----------------------
 package/uclibc/uclibc.hash                         |  4 +--
 package/uclibc/uclibc.mk                           |  2 +-
 3 files changed, 3 insertions(+), 37 deletions(-)

diff --git a/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch b/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch
deleted file mode 100644
index 96736da562..0000000000
--- a/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 9ffed9adb130d45b9f31ca7a305153e86586c877 Mon Sep 17 00:00:00 2001
-From: Waldemar Brodkorb <wbx@openadk.org>
-Date: Fri, 15 Aug 2025 20:29:52 +0200
-Subject: [PATCH] remove uClibc specific gettext_printf
-
-Other C libraries like musl/glibc does not define it.
-Including stdio.h here breaks Grub2 compilation with
-gcc 14 and above.
-Thanks to Thomas Petazzoni for analyzing the Grub2 build error.
-
-Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=9ffed9adb130d45b9f31ca7a305153e86586c877
----
- include/libintl.h | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/include/libintl.h b/include/libintl.h
-index b7123a963..6d8b9f342 100644
---- a/include/libintl.h
-+++ b/include/libintl.h
-@@ -50,9 +50,6 @@ char *bindtextdomain(const char *domainname, const char *dirname);
- 
- #endif
- 
--#include <stdio.h>
--#define gettext_printf(args...) printf(args)
--
- /* to supply LC_MESSAGES and other stuff GNU expects to be exported when
-    including libintl.h */
- #include <locale.h>
--- 
-2.47.2
-
diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 8d8b333958..56174a33b8 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.54/uClibc-ng-1.0.54.tar.xz.sha256
-sha256  d1ecf65cc2217dd4118a4dafc1abf27c585b5cb578f3bd7991fc640b79643ff2  uClibc-ng-1.0.54.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.55/uClibc-ng-1.0.55.tar.xz.sha256
+sha256  5f7f3aafddb2ca08fb295be45561c0188407103d7446cfd264b9b822fed3ed2d  uClibc-ng-1.0.55.tar.xz
 # Locally calculated
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 1e49463dd4..0c303d77f8 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.54
+UCLIBC_VERSION = 1.0.55
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
