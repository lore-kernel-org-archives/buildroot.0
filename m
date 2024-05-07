Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D89C10F1A
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 07:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17DEA40160;
	Tue,  7 May 2024 07:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bfskwbK8TIfU; Tue,  7 May 2024 07:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BD9540136
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BD9540136;
	Tue,  7 May 2024 07:48:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 257431BF32C
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DA1082092
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 07:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqwnPVT6AJkN for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 07:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C6988208F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C6988208F
 for <buildroot@buildroot.org>; Tue,  7 May 2024 07:48:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0487686973; Tue,  7 May 2024 07:48:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 May 2024 09:48:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b235e3cacb32b002a624cf47fb3393a875df968
X-Git-Newrev: c6ef948f298dcfe68942787c0ce5040105f65395
X-Patchwork-Hint: ignore
Message-Id: <20240507074830.0487686973@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libusbgx: bump to recent git
 version
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6ef948f298dcfe68942787c0ce5040105f65395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current tagged version is more than 6 years old, and no new tags
have been made upstream, so let's update to the latest git version.

The current version contains many fixes and improvements and supports
several new types of USB gadgets.

The patch was a backport from upstream, so it can be dropped.

Also, upstream has changed from https://github.com/libusbgx/libusbgx
to https://github.com/linux-usb-gadgets/libusbgx: the former is a
redirect to the latter.

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-Add-include-of-sys-sysmacro.h.patch       | 98 ----------------------
 package/libusbgx/Config.in                         |  2 +-
 package/libusbgx/libusbgx.hash                     |  2 +-
 package/libusbgx/libusbgx.mk                       |  4 +-
 5 files changed, 4 insertions(+), 103 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2118269003..3be4f6a1df 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -982,7 +982,6 @@ package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.pa
 package/libuhttpd/0001-add-compatibility-for-wolfssl-5-0.patch lib_patch.Upstream
 package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch lib_patch.Upstream
 package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch lib_patch.Upstream
-package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch lib_patch.Upstream
 package/libvpx/0001-vpx_mem-vpx_mem.h-Fix-compilation-with-uClibc.patch lib_patch.Upstream
 package/libwebsock/0001-Switch-to-use-pkg-config-to-detect-libevent-and-open.patch lib_patch.Upstream
 package/libwebsock/0002-fix-ssl.patch lib_patch.Upstream
diff --git a/package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch b/package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch
deleted file mode 100644
index 0f47454f7a..0000000000
--- a/package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 45c14ef4d5d7ced0fbf984208de44ced6d5ed898 Mon Sep 17 00:00:00 2001
-From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
-Date: Mon, 10 Sep 2018 15:52:09 +0200
-Subject: [PATCH] libusbgx: fix build with glibc-2.28 since <sys/sysmacros.h>
- is no more included by <sys/types.h>
-
-Since https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html sys/sysmacros.h
-must be explicitly included.
-Without sys/sysmacros.h and with glibc-2.28 build fails with error like:
-src/.libs/libusbgx.so: undefined reference to minor' src/.libs/libusbgx.so: undefined reference tomajor'
-src/.libs/libusbgx.so: undefined reference to `makedev'
-
-Signed-off-by: Sid Spry <R030t1@gmail.com>
-Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
----
- examples/gadget-acm-ecm.c              | 1 +
- examples/gadget-import.c               | 1 +
- examples/gadget-ms.c                   | 1 +
- examples/show-gadgets.c                | 1 +
- examples/show-udcs.c                   | 1 +
- include/usbg/usbg_internal_libconfig.h | 1 +
- 6 files changed, 6 insertions(+)
-
-diff --git a/examples/gadget-acm-ecm.c b/examples/gadget-acm-ecm.c
-index 1c5e2ca..29360da 100644
---- a/examples/gadget-acm-ecm.c
-+++ b/examples/gadget-acm-ecm.c
-@@ -20,6 +20,7 @@
- 
- #include <errno.h>
- #include <stdio.h>
-+#include <sys/sysmacros.h>
- #include <linux/usb/ch9.h>
- #include <usbg/usbg.h>
- 
-diff --git a/examples/gadget-import.c b/examples/gadget-import.c
-index e684fdb..63df449 100644
---- a/examples/gadget-import.c
-+++ b/examples/gadget-import.c
-@@ -25,6 +25,7 @@
- #include <errno.h>
- #include <string.h>
- #include <stdio.h>
-+#include <sys/sysmacros.h>
- #include <usbg/usbg.h>
- 
- int main(int argc, char **argv)
-diff --git a/examples/gadget-ms.c b/examples/gadget-ms.c
-index 478c370..a5c6681 100644
---- a/examples/gadget-ms.c
-+++ b/examples/gadget-ms.c
-@@ -23,6 +23,7 @@
- 
- #include <errno.h>
- #include <stdio.h>
-+#include <sys/sysmacros.h>
- #include <linux/usb/ch9.h>
- #include <usbg/usbg.h>
- #include <usbg/function/ms.h>
-diff --git a/examples/show-gadgets.c b/examples/show-gadgets.c
-index 707d448..a2a21c8 100644
---- a/examples/show-gadgets.c
-+++ b/examples/show-gadgets.c
-@@ -21,6 +21,7 @@
- #include <errno.h>
- #include <stdio.h>
- #include <string.h>
-+#include <sys/sysmacros.h>
- #include <netinet/ether.h>
- #include <usbg/usbg.h>
- #include <usbg/function/ms.h>
-diff --git a/examples/show-udcs.c b/examples/show-udcs.c
-index 66e950f..2f5cc45 100644
---- a/examples/show-udcs.c
-+++ b/examples/show-udcs.c
-@@ -23,6 +23,7 @@
- 
- #include <errno.h>
- #include <stdio.h>
-+#include <sys/sysmacros.h>
- #include <usbg/usbg.h>
- 
- int main(void)
-diff --git a/include/usbg/usbg_internal_libconfig.h b/include/usbg/usbg_internal_libconfig.h
-index ac51758..3fa55c0 100644
---- a/include/usbg/usbg_internal_libconfig.h
-+++ b/include/usbg/usbg_internal_libconfig.h
-@@ -12,6 +12,7 @@
- #ifndef USBG_INTERNAL_LIBCONFIG_H
- #define USBG_INTERNAL_LIBCONFIG_H
- 
-+#include <sys/sysmacros.h>
- #include <libconfig.h>
- #ifdef __cplusplus
- extern "C" {
--- 
-2.16.4
-
diff --git a/package/libusbgx/Config.in b/package/libusbgx/Config.in
index fcebf3cfaa..09a2b8f15e 100644
--- a/package/libusbgx/Config.in
+++ b/package/libusbgx/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBUSBGX
 	  libusbgx is a C library encapsulating the kernel USB
 	  gadget-configfs userspace API functionality.
 
-	  https://github.com/libusbgx/libusbgx
+	  https://github.com/linux-usb-gadgets/libusbgx
 
 comment "libusbgx needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libusbgx/libusbgx.hash b/package/libusbgx/libusbgx.hash
index dd43ec7b97..b18258978f 100644
--- a/package/libusbgx/libusbgx.hash
+++ b/package/libusbgx/libusbgx.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  b15abc89a0ef82c6a650cc1d58b5ba50f7ce076db392add84caabcd86c608ee2  libusbgx-0.2.0.tar.gz
+sha256  d0b483d8b190a75a1f9b52d6db229de5580c78b201077361a524cf32c5aad517  libusbgx-a5bfa81017a9b2064bc449cf74f5f9d106445f62.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
diff --git a/package/libusbgx/libusbgx.mk b/package/libusbgx/libusbgx.mk
index 516ad25970..03e8dff6bb 100644
--- a/package/libusbgx/libusbgx.mk
+++ b/package/libusbgx/libusbgx.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBUSBGX_VERSION = 0.2.0
-LIBUSBGX_SITE = $(call github,libusbgx,libusbgx,libusbgx-v$(LIBUSBGX_VERSION))
+LIBUSBGX_VERSION = a5bfa81017a9b2064bc449cf74f5f9d106445f62
+LIBUSBGX_SITE = $(call github,linux-usb-gadgets,libusbgx,$(LIBUSBGX_VERSION))
 LIBUSBGX_LICENSE = GPL-2.0+ (examples), LGPL-2.1+ (library)
 LIBUSBGX_LICENSE_FILES = COPYING COPYING.LGPL
 LIBUSBGX_DEPENDENCIES = host-pkgconf libconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
