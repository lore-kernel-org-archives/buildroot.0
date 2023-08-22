Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9557EC873A
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72737812E5;
	Thu,  7 Sep 2023 15:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72737812E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id El6-Jgo2uNrw; Thu,  7 Sep 2023 15:32:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BABD83CD8;
	Thu,  7 Sep 2023 15:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BABD83CD8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0F81BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C302041DAD
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C302041DAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-Fhlz2dOvlm for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4A5341D77
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4A5341D77
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D0B4886A1E; Thu,  7 Sep 2023 14:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 20:29:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07c48f5cbafc28f185b12d7a08a7a51a1e9e1731
X-Git-Newrev: 8ed8f0031908087e524550a19613b7e93ee7fbc3
X-Patchwork-Hint: ignore
Message-Id: <20230907145131.D0B4886A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libusb-compat: bump to 0.1.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ed8f0031908087e524550a19613b7e93ee7fbc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removing upstreamed patch and force autoreconf

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-fix-a-build-issue-on-linux.patch          | 32 ----------------------
 package/libusb-compat/libusb-compat.hash           |  2 +-
 package/libusb-compat/libusb-compat.mk             |  5 +++-
 4 files changed, 5 insertions(+), 35 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 88fe914d4a..356f181e76 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -805,7 +805,6 @@ package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch Upstre
 package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch Upstream
 package/liburcu/0002-fix-don-t-use-C-thread_local-on-MacOs.patch Upstream
 package/liburcu/0003-Always-use-__thread-for-Thread-local-storage-except-on-MSVC.patch Upstream
-package/libusb-compat/0001-fix-a-build-issue-on-linux.patch Upstream
 package/libusbgx/0001-Add-include-of-sys-sysmacro.h.patch Upstream
 package/libuwsc/0001-CMakeLists.txt-add-BUILD_EXAMPLE.patch Upstream
 package/libuwsc/0002-fix-bad-indentation.patch Upstream
diff --git a/package/libusb-compat/0001-fix-a-build-issue-on-linux.patch b/package/libusb-compat/0001-fix-a-build-issue-on-linux.patch
deleted file mode 100644
index d2e26b321c..0000000000
--- a/package/libusb-compat/0001-fix-a-build-issue-on-linux.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From af07587e8775c25450cda8ba9e9a8b1a58072634 Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <brgl@bgdev.pl>
-Date: Mon, 3 Jul 2017 15:55:00 +0200
-Subject: [PATCH] fix a build issue on linux
-
-On linux PATH_MAX is defined in linux/limits.h. If we include usb.h
-without previously having indirectly included it, the build fails.
-
-Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
----
- libusb/usb.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libusb/usb.h b/libusb/usb.h
-index d2c30aa..7ad9a66 100644
---- a/libusb/usb.h
-+++ b/libusb/usb.h
-@@ -41,6 +41,11 @@ typedef unsigned __int32  uint32_t;
- #include <stdint.h>
- #endif
- 
-+/* On linux PATH_MAX is defined in linux/limits.h. */
-+#if defined(__linux__)
-+#include <linux/limits.h>
-+#endif
-+
- /*
-  * USB spec information
-  *
--- 
-2.9.3
-
diff --git a/package/libusb-compat/libusb-compat.hash b/package/libusb-compat/libusb-compat.hash
index 3acf3c3408..a198e76058 100644
--- a/package/libusb-compat/libusb-compat.hash
+++ b/package/libusb-compat/libusb-compat.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8259f8d5b084fe43c47823a939e955e0ba21942b8d112266c39d228cc14764d6  libusb-compat-0.1.7.tar.bz2
+sha256  698c76484f3dec1e0175067cbd1556c3021e94e7f2313ae3ea6a66d900e00827  libusb-compat-0.1.8.tar.bz2
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 7c87b3c9d8..d49b753670 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_COMPAT_VERSION_MAJOR = 0.1
-LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).7
+LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).8
 LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
 LIBUSB_COMPAT_SITE = https://github.com/libusb/libusb-compat-0.1/releases/download/v$(LIBUSB_COMPAT_VERSION)
 LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
@@ -14,6 +14,9 @@ LIBUSB_COMPAT_INSTALL_STAGING = YES
 LIBUSB_COMPAT_CONFIG_SCRIPTS = libusb-config
 LIBUSB_COMPAT_LICENSE = LGPL-2.1+
 LIBUSB_COMPAT_LICENSE_FILES = COPYING
+# 0.1.8 tarball was released without configure script by upstream
+# discussed here: https://github.com/libusb/libusb-compat-0.1/issues/28
+LIBUSB_COMPAT_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),)
 LIBUSB_COMPAT_CONF_ENV += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
