Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06980C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86E5E84CC0;
	Fri, 28 Feb 2025 17:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cxt29-Med0gb; Fri, 28 Feb 2025 17:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7387E8574D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7387E8574D;
	Fri, 28 Feb 2025 17:16:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0770068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 369BE42D34
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZt-RMWeAsnR for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13E4D44438
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13E4D44438
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E0A887611; Fri, 28 Feb 2025 16:30:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Feb 2025 19:14:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 71b170d098119feb332d0e4ce180d132d482bf17
X-Git-Newrev: 3d60c1f109fbbc5afab1a079cfdd057460283248
X-Patchwork-Hint: ignore
Message-Id: <20250228163037.0E0A887611@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xlib_libxshmfence: bump version to 1.3.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3d60c1f109fbbc5afab1a079cfdd057460283248
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Announcement:
https://lists.x.org/archives/xorg-announce/2024-December/003572.html

Removed 0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch,
which is accepted upstream.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ce_futex.h-fix-build-on-32-bit-architectu.patch | 46 ----------------------
 .../x11r7/xlib_libxshmfence/xlib_libxshmfence.hash |  6 +--
 .../x11r7/xlib_libxshmfence/xlib_libxshmfence.mk   |  2 +-
 3 files changed, 4 insertions(+), 50 deletions(-)

diff --git a/package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch b/package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch
deleted file mode 100644
index 40a796c4f2..0000000000
--- a/package/x11r7/xlib_libxshmfence/0001-src-xshmfence_futex.h-fix-build-on-32-bit-architectu.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 4fca45a71f08a5bebd12d39c85f49e0b0e4426bf Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Fri, 5 Apr 2024 10:45:15 +0200
-Subject: [PATCH] src/xshmfence_futex.h: fix build on 32-bit architectures
- using 64-bit time_t
-
-Fix the following build failure on 32-bit architectures using 64-bit
-time_t (e.g. riscv32):
-
-xshmfence_futex.h: In function 'sys_futex':
-xshmfence_futex.h:58:24: error: 'SYS_futex' undeclared (first use in this function); did you mean 'sys_futex'?
-   58 |         return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
-      |                        ^~~~~~~~~
-      |                        sys_futex
-
-Similar to:
-https://gitlab.freedesktop.org/mesa/mesa/-/commit/7d87478124061915582412ba410759afe863d679
-
-Fixes:
-https://gitlab.com/buildroot.org/buildroot/-/commit/e39ad96136a8c340b3aea6b036024e28f14584f3
-
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
-Part-of: <https://gitlab.freedesktop.org/xorg/lib/libxshmfence/-/merge_requests/8>
-Upstream: https://gitlab.freedesktop.org/xorg/lib/libxshmfence/-/commit/4fca45a71f08a5bebd12d39c85f49e0b0e4426bf
----
- src/xshmfence_futex.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/xshmfence_futex.h b/src/xshmfence_futex.h
-index 673ac0e..4476038 100644
---- a/src/xshmfence_futex.h
-+++ b/src/xshmfence_futex.h
-@@ -53,6 +53,10 @@ static inline int futex_wait(int32_t *addr, int32_t value) {
- #include <sys/time.h>
- #include <sys/syscall.h>
- 
-+#if defined(SYS_futex_time64) && !defined(SYS_futex)
-+#define SYS_futex SYS_futex_time64
-+#endif
-+
- static inline long sys_futex(void *addr1, int op, int val1, struct timespec *timeout, void *addr2, int val3)
- {
- 	return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
--- 
-2.34.1
-
diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
index e8f83d427f..a9549ead30 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003287.html
-sha256  870df257bc40b126d91b5a8f1da6ca8a524555268c50b59c0acd1a27f361606f  libxshmfence-1.3.2.tar.xz
-sha512  e20a6827e370726cf50489a69f4a52b897f1c44e3eba8c72a4e626b08724e877d090770b8016765736d887d5d5eaba1fda9c29066e62d259b4d1e2064bc1626c  libxshmfence-1.3.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003572.html
+sha256  d4a4df096aba96fea02c029ee3a44e11a47eb7f7213c1a729be83e85ec3fde10  libxshmfence-1.3.3.tar.xz
+sha512  2261b840ea621cf4ce31961ec9df17aa2e253b268afe289dfb97c240aee27b9f443fe36de5de52a2e1210b69092efde21871e20556bac9b4f1d8a3ead1b4c498  libxshmfence-1.3.3.tar.xz
 # Locally computed
 sha256  64a579d1a0b3347301d87c94698a58ea7933d0ae6ca7e8fdd702fde2ea376301  COPYING
diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
index 4241102855..b8c9ebfe97 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXSHMFENCE_VERSION = 1.3.2
+XLIB_LIBXSHMFENCE_VERSION = 1.3.3
 XLIB_LIBXSHMFENCE_SOURCE = libxshmfence-$(XLIB_LIBXSHMFENCE_VERSION).tar.xz
 XLIB_LIBXSHMFENCE_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXSHMFENCE_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
