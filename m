Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92438E748E5
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 412824194C;
	Sat, 30 Sep 2023 19:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 412824194C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ycKnXq35ISr; Sat, 30 Sep 2023 19:56:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09F3341927;
	Sat, 30 Sep 2023 19:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09F3341927
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CA771BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6397E415A0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6397E415A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fAGijcMvR3Cy for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66D4B4013B
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66D4B4013B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5594F83CE0; Sat, 30 Sep 2023 19:56:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 21:56:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd7bc6b1c410514765c51821bb8d843f136fea4a
X-Git-Newrev: 18420d9b6b424492741cba495cc2e7a28a409e8b
X-Patchwork-Hint: ignore
Message-Id: <20230930195629.5594F83CE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libblockdev: bump to version 3.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=18420d9b6b424492741cba495cc2e7a28a409e8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ovide-replacement-function-for-strerror_l.patch | 68 ++++++++++++++++------
 package/libblockdev/Config.in                      |  8 +++
 package/libblockdev/libblockdev.hash               |  2 +-
 package/libblockdev/libblockdev.mk                 | 15 +++--
 4 files changed, 69 insertions(+), 24 deletions(-)

diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
index d5c9b2dfdb..01e03ac6ec 100644
--- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
+++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
@@ -1,4 +1,4 @@
-From ccf93148aa3587dd98a02e253cdc42a7af14df1e Mon Sep 17 00:00:00 2001
+From 425d9ad320746298bd52b74ea3f38ad3c0468ff0 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sat, 29 Aug 2020 16:04:15 +0200
 Subject: [PATCH] Provide replacement function for strerror_l()
@@ -7,33 +7,36 @@ strerror_l() is not implemented in some C libraries, such as uClibc,
 so let's provide a simple replacement function that falls back on
 strerror().
 
+Upstream status: Not Applicable since it's due uclibc only
+
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[Upstream status:
-https://github.com/storaged-project/libblockdev/pull/701]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Giulio: ported to version 3.0]
 ---
  configure.ac         | 2 ++
  src/plugins/crypto.c | 7 +++++++
- src/utils/module.c   | 8 ++++++++
- 3 files changed, 17 insertions(+)
+ src/plugins/part.c   | 9 +++++++++
+ src/utils/module.c   | 8 +++++++-
+ 4 files changed, 25 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c2d22c2..36aeb51 100644
+index 88fa835a..4fba7b7d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -137,6 +137,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
+@@ -120,6 +120,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
                   [LIBBLOCKDEV_SOFT_FAILURE([Header file $ac_header not found.])],
                   [])
  
 +AC_CHECK_FUNCS([strerror_l])
 +
- AC_ARG_WITH([bcache],
-     AS_HELP_STRING([--with-bcache], [support bcache @<:@default=yes@:>@]),
+ AC_ARG_WITH([escrow],
+     AS_HELP_STRING([--with-escrow], [support escrow @<:@default=yes@:>@]),
      [],
 diff --git a/src/plugins/crypto.c b/src/plugins/crypto.c
-index f4a2e8f..c1bd7b5 100644
+index 503e1207..5896d211 100644
 --- a/src/plugins/crypto.c
 +++ b/src/plugins/crypto.c
-@@ -52,6 +52,13 @@
+@@ -62,6 +62,13 @@
  
  #define UNUSED __attribute__((unused))
  
@@ -47,13 +50,13 @@ index f4a2e8f..c1bd7b5 100644
  /**
   * SECTION: crypto
   * @short_description: plugin for operations with encrypted devices
-diff --git a/src/utils/module.c b/src/utils/module.c
-index 9750e24..086bec0 100644
---- a/src/utils/module.c
-+++ b/src/utils/module.c
-@@ -27,6 +27,14 @@
+diff --git a/src/plugins/part.c b/src/plugins/part.c
+index d75bb791..ba34bb93 100644
+--- a/src/plugins/part.c
++++ b/src/plugins/part.c
+@@ -26,6 +26,15 @@
  
- #include "module.h"
+ #include "part.h"
  
 +#define UNUSED __attribute__((unused))
 +
@@ -63,9 +66,36 @@ index 9750e24..086bec0 100644
 +	return strerror(errnum);
 +}
 +#endif
++
+ /**
+  * SECTION: part
+  * @short_description: plugin for operations with partition tables
+diff --git a/src/utils/module.c b/src/utils/module.c
+index 6557c3ab..69dd4731 100644
+--- a/src/utils/module.c
++++ b/src/utils/module.c
+@@ -74,6 +74,13 @@ static void set_kmod_logging (struct kmod_ctx *ctx) {
+     kmod_set_log_fn (ctx, utils_kmod_log_redirect, NULL);
+ }
  
++#if !defined(HAVE_STRERROR_L)
++static char *strerror_l(int errnum, locale_t locale UNUSED)
++{
++	return strerror(errnum);
++}
++#endif
++
  /**
-  * bd_utils_module_error_quark: (skip)
+  * bd_utils_have_kernel_module:
+  * @module_name: name of the kernel module to check
+@@ -259,7 +266,6 @@ gboolean bd_utils_unload_kernel_module (const gchar *module_name, GError **error
+     return TRUE;
+ }
+ 
+-
+ static BDUtilsLinuxVersion detected_linux_ver;
+ static gboolean have_linux_ver = FALSE;
+ 
 -- 
-2.26.2
+2.34.1
 
diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 4f98621bd8..527ba79e4e 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
 	bool "crypto"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # cryptsetup -> json-c
 	select BR2_PACKAGE_CRYPTSETUP
+	select BR2_PACKAGE_KEYUTILS
 
 config BR2_PACKAGE_LIBBLOCKDEV_FS
 	bool "filesystem"
@@ -32,6 +33,7 @@ config BR2_PACKAGE_LIBBLOCKDEV_FS
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_PARTED
+	select BR2_PACKAGE_E2FSPROGS
 
 comment "filesystem plugin needs a toolchain w/ locale"
 	depends on !BR2_ENABLE_LOCALE
@@ -52,10 +54,16 @@ config BR2_PACKAGE_LIBBLOCKDEV_MDRAID
 	bool "mdraid"
 	select BR2_PACKAGE_LIBBYTESIZE
 
+config BR2_PACKAGE_LIBBLOCKDEV_NVME
+	bool "nvme"
+	select BR2_PACKAGE_LIBNVME
+
 config BR2_PACKAGE_LIBBLOCKDEV_PART
 	bool "part"
 	depends on BR2_ENABLE_LOCALE # parted
 	select BR2_PACKAGE_PARTED
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
 
 comment "part plugin needs a toolchain w/ locale"
 	depends on !BR2_ENABLE_LOCALE
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 53a3b0737f..146f36ceed 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c4c0e10b35ac632bda8ce6d200b5601184984dec387fe59185921eb42432e069  libblockdev-2.26.tar.gz
+sha256  0f2872830293f3e222832903d80de4c38e06a9c3ea18915b3263272a72095ea8  libblockdev-3.0.3.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 36b74966fb..e117a1349c 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 2.26
+LIBBLOCKDEV_VERSION = 3.0.3
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
@@ -32,14 +32,14 @@ LIBBLOCKDEV_CONF_OPTS = \
 	--without-vdo
 
 ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_CRYPTO),y)
-LIBBLOCKDEV_DEPENDENCIES += cryptsetup
+LIBBLOCKDEV_DEPENDENCIES += cryptsetup keyutils
 LIBBLOCKDEV_CONF_OPTS += --with-crypto
 else
 LIBBLOCKDEV_CONF_OPTS += --without-crypto
 endif
 
 ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_FS),y)
-LIBBLOCKDEV_DEPENDENCIES += parted util-linux
+LIBBLOCKDEV_DEPENDENCIES += e2fsprogs parted util-linux
 LIBBLOCKDEV_CONF_OPTS += --with-fs
 else
 LIBBLOCKDEV_CONF_OPTS += --without-fs
@@ -66,7 +66,7 @@ LIBBLOCKDEV_CONF_OPTS += --without-mdraid
 endif
 
 ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_PART),y)
-LIBBLOCKDEV_DEPENDENCIES += parted
+LIBBLOCKDEV_DEPENDENCIES += parted util-linux
 LIBBLOCKDEV_CONF_OPTS += --with-part
 else
 LIBBLOCKDEV_CONF_OPTS += --without-part
@@ -79,4 +79,11 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-swap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_NVME),y)
+LIBBLOCKDEV_DEPENDENCIES += libnvme
+LIBBLOCKDEV_CONF_OPTS += --with-nvme
+else
+LIBBLOCKDEV_CONF_OPTS += --without-nvme
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
