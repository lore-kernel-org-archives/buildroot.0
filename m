Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F03C47DD9
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 16:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EAFF60675;
	Mon, 22 Jan 2024 16:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EAFF60675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPMSCnSxEUxX; Mon, 22 Jan 2024 16:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 581FE606CB;
	Mon, 22 Jan 2024 16:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 581FE606CB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D6D791BF378
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 16:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA2F24167F
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 16:09:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA2F24167F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0WFVTtHCQns for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 16:09:54 +0000 (UTC)
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA36D4167B
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 16:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA36D4167B
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id RwrtrAvARKiS4RwrtrPOhx; Mon, 22 Jan 2024 17:09:50 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jan 2024 17:09:49 +0100
Message-Id: <20240122160949.4052959-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHdKkh6e3BwL6+TYCda2+9/54ILj4DvIgV+dH1As0dckS0ljMzNiGYlkdonlicopC46OTzukJQ0PdVoJRT/BRS8w0c1ECEuSKc4FDQHSW7TJiZFDJDIq
 jpEqgwJ15758Grk5T/BLUnx6KBkHzBYU5LgKUdcNM5fVKvCdNX8VrqVNu11cjRkc4uqI2ufDFlh+jReBwRRjXmFGlG7am+P4pGdMWucZkHqw/5RokXYE8ouX
 xGJ2stoAK5pYOz0Ze4yhHE9z9mD60aV7fW6Jz1NQ1b4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705939790; bh=2nDZ2SOujkdhodEAe5J14uXzarHEMKcmc1CxIS9uhMs=;
 h=From:To:Subject:Date:MIME-Version;
 b=d2TorMKm1oKbZ12Htv6kRlRfWdQYgxSrQH7ujusYgO7HM/WJwmCNFMDdda73gaNYV
 ucUwO7QwrFYwe0kHpkaJHVUOVcX3aZiy044052qCBZHUUGNUZQqpzDyOk8d8gw39Pb
 SbcUuPydjVIh8mcUjVTL+8lOeUsXIyIK5e/X/dvjwd9JhSMRBXIKnT/bYcrQKoc/fj
 eGor+DDxFAPalrTsVVhdJifpmdaAxVPNK2Cx87jkvPm9T6MlX9RlhZhq6kxrgpEaGZ
 h6DvX9IAqoDxMhhXKe5rFb5XGsCs8XlIflhAKKbyXDoDnJkvDdH3mnwSQqPWl+WwDa
 NIbvUX0Gme8iw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=d2TorMKm
Subject: [Buildroot] [PATCH v2] package/libblockdev: bump to version 3.1.0
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

* Rework strerror_l() patch by declaring it only in utils.h as a macro
* select BR2_PACKAGE_UTIL_LINUX_LIBUUID since it's now mandatory

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* reworked local strerror_l() patch as a macro to avoid adding a second patch
* selected BR2_PACKAGE_UTIL_LINUX_LIBUUID by default
---
 ...-replacement-function-for-strerror_l.patch | 160 ++++--------------
 package/libblockdev/Config.in                 |   5 +-
 package/libblockdev/libblockdev.hash          |   2 +-
 package/libblockdev/libblockdev.mk            |   2 +-
 4 files changed, 35 insertions(+), 134 deletions(-)

diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
index 987d28f82e..e5819a4e9c 100644
--- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
+++ b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
@@ -1,29 +1,25 @@
-From 2acf5a8d4858035396ee45d96c824e0481644d36 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 29 Aug 2020 16:04:15 +0200
+From 01883cc14904e55d90955ad7cd9fc55bc18364ac Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 20 Jan 2024 13:29:28 +0100
 Subject: [PATCH] Provide replacement function for strerror_l()
 
 strerror_l() is not implemented in some C libraries, such as uClibc,
-so let's provide a simple replacement function that falls back on
-strerror().
+so let's provide a simple replacement define that falls back on
+strerror() in utils.h header and include it where missing.
 
-Upstream status: Not Applicable since it's due uclibc only
+Upstream: N/A since it's due uclibc only
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: ported to version 3.0+]
+[Giulio: ported to version 3.0 and 3.1]
 ---
- configure.ac                    | 2 ++
- src/plugins/crypto.c            | 7 +++++++
- src/plugins/nvme/nvme-error.c   | 8 ++++++++
- src/plugins/nvme/nvme-fabrics.c | 8 ++++++++
- src/plugins/nvme/nvme-op.c      | 8 ++++++++
- src/plugins/part.c              | 9 +++++++++
- src/utils/module.c              | 8 +++++++-
- 7 files changed, 49 insertions(+), 1 deletion(-)
+ configure.ac       | 2 ++
+ src/utils/module.c | 1 +
+ src/utils/utils.h  | 4 ++++
+ 3 files changed, 7 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 0a8ce4a7..dfbddb39 100644
+index 02b26e3e..67341134 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -120,6 +120,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
@@ -35,127 +31,33 @@ index 0a8ce4a7..dfbddb39 100644
  AC_ARG_WITH([escrow],
      AS_HELP_STRING([--with-escrow], [support escrow @<:@default=yes@:>@]),
      [],
-diff --git a/src/plugins/crypto.c b/src/plugins/crypto.c
-index c5f719ca..b2ae3f56 100644
---- a/src/plugins/crypto.c
-+++ b/src/plugins/crypto.c
-@@ -62,6 +62,13 @@
- 
- #define UNUSED __attribute__((unused))
- 
-+#if !defined(HAVE_STRERROR_L)
-+static char *strerror_l(int errnum, locale_t locale UNUSED)
-+{
-+	return strerror(errnum);
-+}
-+#endif
-+
- /**
-  * SECTION: crypto
-  * @short_description: plugin for operations with encrypted devices
-diff --git a/src/plugins/nvme/nvme-error.c b/src/plugins/nvme/nvme-error.c
-index 4bd4d771..618b6aef 100644
---- a/src/plugins/nvme/nvme-error.c
-+++ b/src/plugins/nvme/nvme-error.c
-@@ -34,6 +34,14 @@
- #include "nvme.h"
- #include "nvme-private.h"
- 
-+#define UNUSED __attribute__((unused))
-+
-+#if !defined(HAVE_STRERROR_L)
-+static char *strerror_l(int errnum, locale_t locale UNUSED)
-+{
-+    return strerror(errnum);
-+}
-+#endif
- 
- /**
-  * bd_nvme_error_quark: (skip)
-diff --git a/src/plugins/nvme/nvme-fabrics.c b/src/plugins/nvme/nvme-fabrics.c
-index 1877845f..5fcbeddc 100644
---- a/src/plugins/nvme/nvme-fabrics.c
-+++ b/src/plugins/nvme/nvme-fabrics.c
-@@ -36,6 +36,14 @@
- #include "nvme.h"
- #include "nvme-private.h"
- 
-+#define UNUSED __attribute__((unused))
-+
-+#if !defined(HAVE_STRERROR_L)
-+static char *strerror_l(int errnum, locale_t locale UNUSED)
-+{
-+    return strerror(errnum);
-+}
-+#endif
- 
- /* nvme-cli defaults */
- #define PATH_NVMF_CONFIG  "/etc/nvme/config.json"
-diff --git a/src/plugins/nvme/nvme-op.c b/src/plugins/nvme/nvme-op.c
-index dbef4f3a..7bafd7a3 100644
---- a/src/plugins/nvme/nvme-op.c
-+++ b/src/plugins/nvme/nvme-op.c
-@@ -35,6 +35,14 @@
- #include "nvme.h"
- #include "nvme-private.h"
- 
-+#define UNUSED __attribute__((unused))
-+
-+#if !defined(HAVE_STRERROR_L)
-+static char *strerror_l(int errnum, locale_t locale UNUSED)
-+{
-+    return strerror(errnum);
-+}
-+#endif
- 
- /**
-  * bd_nvme_device_self_test:
-diff --git a/src/plugins/part.c b/src/plugins/part.c
-index 46d31137..6234e013 100644
---- a/src/plugins/part.c
-+++ b/src/plugins/part.c
-@@ -26,6 +26,15 @@
- 
- #include "part.h"
- 
-+#define UNUSED __attribute__((unused))
-+
-+#if !defined(HAVE_STRERROR_L)
-+static char *strerror_l(int errnum, locale_t locale UNUSED)
-+{
-+	return strerror(errnum);
-+}
-+#endif
-+
- /**
-  * SECTION: part
-  * @short_description: plugin for operations with partition tables
 diff --git a/src/utils/module.c b/src/utils/module.c
-index 6557c3ab..69dd4731 100644
+index 6557c3ab..5893f0ac 100644
 --- a/src/utils/module.c
 +++ b/src/utils/module.c
-@@ -74,6 +74,13 @@ static void set_kmod_logging (struct kmod_ctx *ctx) {
-     kmod_set_log_fn (ctx, utils_kmod_log_redirect, NULL);
- }
+@@ -28,6 +28,7 @@
+ #include "module.h"
+ #include "exec.h"
+ #include "logging.h"
++#include "utils.h"
+ 
+ #define UNUSED __attribute__((unused))
+ 
+diff --git a/src/utils/utils.h b/src/utils/utils.h
+index 801a8b6e..b2bdf0d0 100644
+--- a/src/utils/utils.h
++++ b/src/utils/utils.h
+@@ -9,6 +9,10 @@
+ #include "dbus.h"
+ #include "logging.h"
  
 +#if !defined(HAVE_STRERROR_L)
-+static char *strerror_l(int errnum, locale_t locale UNUSED)
-+{
-+	return strerror(errnum);
-+}
++#define strerror_l(errnum, locale)      strerror(errnum)
 +#endif
 +
  /**
-  * bd_utils_have_kernel_module:
-  * @module_name: name of the kernel module to check
-@@ -259,7 +266,6 @@ gboolean bd_utils_unload_kernel_module (const gchar *module_name, GError **error
-     return TRUE;
- }
- 
--
- static BDUtilsLinuxVersion detected_linux_ver;
- static gboolean have_linux_ver = FALSE;
- 
+  * SECTION: utils
+  * @short_description: library providing utility functions used by the blockdev library and its plugins
 -- 
 2.34.1
 
diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 527ba79e4e..e0449628b4 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_LIBBLOCKDEV
 	depends on BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_KMOD
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  libblockdev is a C library supporting GObject introspection
 	  for manipulation of block devices. It has a plugin-based
@@ -30,7 +32,6 @@ config BR2_PACKAGE_LIBBLOCKDEV_CRYPTO
 config BR2_PACKAGE_LIBBLOCKDEV_FS
 	bool "filesystem"
 	depends on BR2_ENABLE_LOCALE # parted
-	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_E2FSPROGS
@@ -62,7 +63,6 @@ config BR2_PACKAGE_LIBBLOCKDEV_PART
 	bool "part"
 	depends on BR2_ENABLE_LOCALE # parted
 	select BR2_PACKAGE_PARTED
-	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
 
 comment "part plugin needs a toolchain w/ locale"
@@ -70,7 +70,6 @@ comment "part plugin needs a toolchain w/ locale"
 
 config BR2_PACKAGE_LIBBLOCKDEV_SWAP
 	bool "swap"
-	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
 
 endif
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 5f9a8a7e6c..79700a4996 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  49841ff92db0ab032931e6f2b5eab63e5969b0ddc14b067b60e46a6eb6c60e47  libblockdev-3.0.4.tar.gz
+sha256  41e4af66c9d78e795302d37825dfd88a4970f82da7b4ebe6487feba2afae44fb  libblockdev-3.1.0.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index e0fca2b95c..ebf01acfb5 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.0.4
+LIBBLOCKDEV_VERSION = 3.1.0
 LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
