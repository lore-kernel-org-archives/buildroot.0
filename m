Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E3EC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 13:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B744424E7;
	Sat, 20 Jan 2024 13:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B744424E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHa79Zk0Kovz; Sat, 20 Jan 2024 13:01:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ECFF42CEE;
	Sat, 20 Jan 2024 13:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ECFF42CEE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF0261BF3A1
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 13:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7F0660E8F
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 13:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7F0660E8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRPdTKfauMIW for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 13:01:19 +0000 (UTC)
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 84AA060E35
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 13:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84AA060E35
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id RAyIrgCEmdBMvRAyIrSaHa; Sat, 20 Jan 2024 14:01:15 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 14:01:14 +0100
Message-Id: <20240120130114.1595910-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNpsqF1FjjBSJq9KRqKZArdSljP6ydVZxWHmfXh+4NNEwDsJe3Xyqma0lVF8r19V+sgMst3BF6efSB/Xnb2eNXf1SrNHpvecnTTsh3OdLtfUjBOU7PbP
 zgHoitKT18fO+Hq7E17bGikitGi+71237NXfcK7ymeyFS1RJ0Mv7Gw1X3PFvJaGB3qzgVXBpDxjZ1nXgXbRXd8lEDS327y10jv7YXyWpHWdCf+QbiXBrfVcp
 j0FtvTK+ADEqr2AItPf2redatw8DsGRYK/kzk0e5NOU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705755675; bh=1yUmtAUuYCTrVlVsUciH960wAbdYbG75Y0hOZsRNhyc=;
 h=From:To:Subject:Date:MIME-Version;
 b=Q3cqwGe1bCHxWo7lSlD7dvvAKBE9UaYhMI8XdBELVtYZ1A1v5iz3Fh2ibAVEQ99RG
 rWFZP29Juo/dz/jylEBF64F9RcSzVbWm2d+hwKyHQWK0iP8q0oEJoI6CRpcWWlRtAA
 zitilBN2gncrlyJUKZ1R5FQw4wzD1eN12bC1/vIrLLagyAis4jRRJuqKIZ4AMQ/zqA
 bUoEnWsmgzXY8/UcaPTQ5z5yYVLPcSMQlHSeGN2cZcue1w04rpqa5WEL8vIcdJ4ahV
 0Z97yRLSH37FWe3WmxQmM9Q7JmvV3rzFf/zP4Kh+VUmWnh2/Flk93QubFB7ojBoV4o
 fyY+hXg7SqP0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Q3cqwGe1
Subject: [Buildroot] [PATCH] package/libblockdev: bump to version 3.1.0
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

* Add a patch pending upstream to declare UNUSED macro only in one header
  to avoid code redundancy
* Rework strerror_l() patch by declaring it only in utils.h

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...-definition-to-common-header-utils.h.patch | 332 ++++++++++++++++++
 ...-replacement-function-for-strerror_l.patch | 161 ---------
 ...-replacement-function-for-strerror_l.patch |  50 +++
 package/libblockdev/libblockdev.hash          |   2 +-
 package/libblockdev/libblockdev.mk            |   2 +-
 5 files changed, 384 insertions(+), 163 deletions(-)
 create mode 100644 package/libblockdev/0001-Move-UNUSED-definition-to-common-header-utils.h.patch
 delete mode 100644 package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
 create mode 100644 package/libblockdev/0002-Provide-replacement-function-for-strerror_l.patch

diff --git a/package/libblockdev/0001-Move-UNUSED-definition-to-common-header-utils.h.patch b/package/libblockdev/0001-Move-UNUSED-definition-to-common-header-utils.h.patch
new file mode 100644
index 0000000000..1cf4db008d
--- /dev/null
+++ b/package/libblockdev/0001-Move-UNUSED-definition-to-common-header-utils.h.patch
@@ -0,0 +1,332 @@
+From fe77fa4a24da727385f836565b574e7ca9c7a956 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 20 Jan 2024 13:26:13 +0100
+Subject: [PATCH] Move UNUSED definition to common header utils.h
+
+Let's move UNUSED defition to avoid redundancy.
+
+Upstream: https://github.com/storaged-project/libblockdev/pull/998
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/plugins/btrfs.c      | 1 -
+ src/plugins/crypto.c     | 1 -
+ src/plugins/dm.c         | 1 -
+ src/plugins/fs/btrfs.c   | 1 -
+ src/plugins/fs/exfat.c   | 1 -
+ src/plugins/fs/ext.c     | 1 -
+ src/plugins/fs/f2fs.c    | 1 -
+ src/plugins/fs/generic.c | 1 -
+ src/plugins/fs/nilfs.c   | 1 -
+ src/plugins/fs/ntfs.c    | 1 -
+ src/plugins/fs/udf.c     | 1 -
+ src/plugins/fs/vfat.c    | 1 -
+ src/plugins/fs/xfs.c     | 1 -
+ src/plugins/loop.c       | 1 -
+ src/plugins/lvm-dbus.c   | 1 -
+ src/plugins/lvm.c        | 1 -
+ src/plugins/mdraid.c     | 1 -
+ src/plugins/nvdimm.c     | 1 -
+ src/plugins/part.c       | 1 -
+ src/plugins/swap.c       | 1 -
+ src/utils/exec.c         | 2 +-
+ src/utils/module.c       | 2 +-
+ src/utils/utils.h        | 4 ++++
+ 23 files changed, 6 insertions(+), 22 deletions(-)
+
+diff --git a/src/plugins/btrfs.c b/src/plugins/btrfs.c
+index 809e3947..2b93316e 100644
+--- a/src/plugins/btrfs.c
++++ b/src/plugins/btrfs.c
+@@ -154,7 +154,6 @@ void bd_btrfs_close (void) {
+ }
+ 
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * bd_btrfs_is_tech_avail:
+diff --git a/src/plugins/crypto.c b/src/plugins/crypto.c
+index 5120ec57..830010ab 100644
+--- a/src/plugins/crypto.c
++++ b/src/plugins/crypto.c
+@@ -60,7 +60,6 @@
+ #define DEFAULT_LUKS2_SECTOR_SIZE 512
+ #endif
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * SECTION: crypto
+diff --git a/src/plugins/dm.c b/src/plugins/dm.c
+index 98b570a3..02302f1d 100644
+--- a/src/plugins/dm.c
++++ b/src/plugins/dm.c
+@@ -30,7 +30,6 @@
+ 
+ #define DM_MIN_VERSION "1.02.93"
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * SECTION: dm
+diff --git a/src/plugins/fs/btrfs.c b/src/plugins/fs/btrfs.c
+index 3f8567ef..83dda228 100644
+--- a/src/plugins/fs/btrfs.c
++++ b/src/plugins/fs/btrfs.c
+@@ -57,7 +57,6 @@ static guint32 fs_mode_util[BD_FS_MODE_LAST+1] = {
+     DEPS_BTRFSTUNE_MASK,    /* set-uuid */
+ };
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * bd_fs_btrfs_is_tech_avail:
+diff --git a/src/plugins/fs/exfat.c b/src/plugins/fs/exfat.c
+index 7092f9dc..53ea3893 100644
+--- a/src/plugins/fs/exfat.c
++++ b/src/plugins/fs/exfat.c
+@@ -63,7 +63,6 @@ static guint32 fs_mode_util[BD_FS_MODE_LAST+1] = {
+ #define CLUSTERS_PREFIX_LEN 25
+ 
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * bd_fs_exfat_is_tech_avail:
+diff --git a/src/plugins/fs/ext.c b/src/plugins/fs/ext.c
+index 87a8787e..198c59b6 100644
+--- a/src/plugins/fs/ext.c
++++ b/src/plugins/fs/ext.c
+@@ -63,7 +63,6 @@ static guint32 fs_mode_util[BD_FS_MODE_LAST+1] = {
+     DEPS_TUNE2FS_MASK       /* set-uuid */
+ };
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ static gint8 compute_percents (guint8 pass_cur, guint8 pass_total, gint val_cur, gint val_total) {
+     gint perc;
+diff --git a/src/plugins/fs/f2fs.c b/src/plugins/fs/f2fs.c
+index 20df63a4..83c930d2 100644
+--- a/src/plugins/fs/f2fs.c
++++ b/src/plugins/fs/f2fs.c
+@@ -70,7 +70,6 @@ static guint32 fs_mode_util[BD_FS_MODE_LAST+1] = {
+     0                       /* set-uuid */
+ };
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /* option to get version was added in 1.11.0 so we need to cover situation
+    where the version is too old to check the version */
+diff --git a/src/plugins/fs/generic.c b/src/plugins/fs/generic.c
+index add47012..7bc80b2a 100644
+--- a/src/plugins/fs/generic.c
++++ b/src/plugins/fs/generic.c
+@@ -40,7 +40,6 @@
+ #include "ntfs.h"
+ #include "f2fs.h"
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ 
+ typedef enum {
+diff --git a/src/plugins/fs/nilfs.c b/src/plugins/fs/nilfs.c
+index aec41af8..92ec3997 100644
+--- a/src/plugins/fs/nilfs.c
++++ b/src/plugins/fs/nilfs.c
+@@ -54,7 +54,6 @@ static guint32 fs_mode_util[BD_FS_MODE_LAST+1] = {
+     DEPS_NILFSTUNE_MASK,        /* set-uuid */
+ };
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ #ifdef __clang__
+ #define ZERO_INIT {}
+diff --git a/src/plugins/fs/ntfs.c b/src/plugins/fs/ntfs.c
+index f7c49773..66ea78a8 100644
+--- a/src/plugins/fs/ntfs.c
++++ b/src/plugins/fs/ntfs.c
+@@ -61,7 +61,6 @@ static guint32 fs_mode_util[BD_FS_MODE_LAST+1] = {
+     DEPS_NTFSLABEL_MASK     /* set-uuid */
+ };
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * bd_fs_ntfs_is_tech_avail:
+diff --git a/src/plugins/fs/udf.c b/src/plugins/fs/udf.c
+index 787bea0d..b22d98c7 100644
+--- a/src/plugins/fs/udf.c
++++ b/src/plugins/fs/udf.c
+@@ -60,7 +60,6 @@ static guint32 fs_mode_util[BD_FS_MODE_LAST+1] = {
+     DEPS_UDFLABEL_MASK,     /* set-uuid */
+ };
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * bd_fs_udf_is_tech_avail:
+diff --git a/src/plugins/fs/vfat.c b/src/plugins/fs/vfat.c
+index 3f3024ff..97390c58 100644
+--- a/src/plugins/fs/vfat.c
++++ b/src/plugins/fs/vfat.c
+@@ -63,7 +63,6 @@ static guint32 fs_mode_util[BD_FS_MODE_LAST+1] = {
+     DEPS_FATLABELUUID_MASK, /* set-uuid */
+ };
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ #ifdef __clang__
+ #define ZERO_INIT {}
+diff --git a/src/plugins/fs/xfs.c b/src/plugins/fs/xfs.c
+index c73eb69f..0429fd82 100644
+--- a/src/plugins/fs/xfs.c
++++ b/src/plugins/fs/xfs.c
+@@ -61,7 +61,6 @@ static guint32 fs_mode_util[BD_FS_MODE_LAST+1] = {
+     DEPS_XFS_ADMIN_MASK     /* set-uuid */
+ };
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ #ifdef __clang__
+ #define ZERO_INIT {}
+diff --git a/src/plugins/loop.c b/src/plugins/loop.c
+index c7b6bb99..6407a383 100644
+--- a/src/plugins/loop.c
++++ b/src/plugins/loop.c
+@@ -75,7 +75,6 @@ void bd_loop_close (void) {
+     /* nothing to do here */
+ }
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * bd_loop_is_tech_avail:
+diff --git a/src/plugins/lvm-dbus.c b/src/plugins/lvm-dbus.c
+index 01adbea4..dae059fb 100644
+--- a/src/plugins/lvm-dbus.c
++++ b/src/plugins/lvm-dbus.c
+@@ -97,7 +97,6 @@ static gchar *global_devices_str = NULL;
+ #define METHOD_CALL_TIMEOUT 5000
+ #define PROGRESS_WAIT 500 * 1000 /* microseconds */
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ static GDBusConnection *bus = NULL;
+ 
+diff --git a/src/plugins/lvm.c b/src/plugins/lvm.c
+index 361a084b..439392e2 100644
+--- a/src/plugins/lvm.c
++++ b/src/plugins/lvm.c
+@@ -331,7 +331,6 @@ static const UtilFeatureDep features[FEATURES_LAST] = {
+ 
+ static const gchar*const module_deps[MODULE_DEPS_LAST] = { "kvdo" };
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * bd_lvm_init:
+diff --git a/src/plugins/mdraid.c b/src/plugins/mdraid.c
+index 53b7eb48..b6f64cef 100644
+--- a/src/plugins/mdraid.c
++++ b/src/plugins/mdraid.c
+@@ -179,7 +179,6 @@ void bd_md_close (void) {
+     /* nothing to do here */
+ }
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * bd_md_is_tech_avail:
+diff --git a/src/plugins/nvdimm.c b/src/plugins/nvdimm.c
+index dd52b856..3bb3204f 100644
+--- a/src/plugins/nvdimm.c
++++ b/src/plugins/nvdimm.c
+@@ -109,7 +109,6 @@ void bd_nvdimm_close (void) {
+     return;
+ }
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * bd_nvdimm_is_tech_avail:
+diff --git a/src/plugins/part.c b/src/plugins/part.c
+index 20bb3628..164200c7 100644
+--- a/src/plugins/part.c
++++ b/src/plugins/part.c
+@@ -122,7 +122,6 @@ static gint log2i (guint x) {
+     return ret;
+ }
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * get_part_num: (skip)
+diff --git a/src/plugins/swap.c b/src/plugins/swap.c
+index d9b0f7ba..cd1acfd8 100644
+--- a/src/plugins/swap.c
++++ b/src/plugins/swap.c
+@@ -87,7 +87,6 @@ void bd_swap_close (void) {
+     /* nothing to do here */
+ }
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * bd_swap_is_tech_avail:
+diff --git a/src/utils/exec.c b/src/utils/exec.c
+index 4acaeab3..0a925182 100644
+--- a/src/utils/exec.c
++++ b/src/utils/exec.c
+@@ -28,6 +28,7 @@
+ #include <sys/types.h>
+ #include <sys/wait.h>
+ #include <unistd.h>
++#include "utils.h"
+ 
+ #ifdef __clang__
+ #define ZERO_INIT {}
+@@ -35,7 +36,6 @@
+ #define ZERO_INIT {0}
+ #endif
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ extern char **environ;
+ 
+diff --git a/src/utils/module.c b/src/utils/module.c
+index 6557c3ab..e29f2c82 100644
+--- a/src/utils/module.c
++++ b/src/utils/module.c
+@@ -24,12 +24,12 @@
+ #include <syslog.h>
+ #include <locale.h>
+ #include <sys/utsname.h>
++#include "utils.h"
+ 
+ #include "module.h"
+ #include "exec.h"
+ #include "logging.h"
+ 
+-#define UNUSED __attribute__((unused))
+ 
+ /**
+  * bd_utils_module_error_quark: (skip)
+diff --git a/src/utils/utils.h b/src/utils/utils.h
+index 801a8b6e..6df11bbf 100644
+--- a/src/utils/utils.h
++++ b/src/utils/utils.h
+@@ -9,6 +9,10 @@
+ #include "dbus.h"
+ #include "logging.h"
+ 
++#ifndef UNUSED
++#define UNUSED __attribute__((unused))
++#endif
++
+ /**
+  * SECTION: utils
+  * @short_description: library providing utility functions used by the blockdev library and its plugins
+-- 
+2.34.1
+
diff --git a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
deleted file mode 100644
index 987d28f82e..0000000000
--- a/package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch
+++ /dev/null
@@ -1,161 +0,0 @@
-From 2acf5a8d4858035396ee45d96c824e0481644d36 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sat, 29 Aug 2020 16:04:15 +0200
-Subject: [PATCH] Provide replacement function for strerror_l()
-
-strerror_l() is not implemented in some C libraries, such as uClibc,
-so let's provide a simple replacement function that falls back on
-strerror().
-
-Upstream status: Not Applicable since it's due uclibc only
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: ported to version 3.0+]
----
- configure.ac                    | 2 ++
- src/plugins/crypto.c            | 7 +++++++
- src/plugins/nvme/nvme-error.c   | 8 ++++++++
- src/plugins/nvme/nvme-fabrics.c | 8 ++++++++
- src/plugins/nvme/nvme-op.c      | 8 ++++++++
- src/plugins/part.c              | 9 +++++++++
- src/utils/module.c              | 8 +++++++-
- 7 files changed, 49 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0a8ce4a7..dfbddb39 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -120,6 +120,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
-                  [LIBBLOCKDEV_SOFT_FAILURE([Header file $ac_header not found.])],
-                  [])
- 
-+AC_CHECK_FUNCS([strerror_l])
-+
- AC_ARG_WITH([escrow],
-     AS_HELP_STRING([--with-escrow], [support escrow @<:@default=yes@:>@]),
-     [],
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
-diff --git a/src/utils/module.c b/src/utils/module.c
-index 6557c3ab..69dd4731 100644
---- a/src/utils/module.c
-+++ b/src/utils/module.c
-@@ -74,6 +74,13 @@ static void set_kmod_logging (struct kmod_ctx *ctx) {
-     kmod_set_log_fn (ctx, utils_kmod_log_redirect, NULL);
- }
- 
-+#if !defined(HAVE_STRERROR_L)
-+static char *strerror_l(int errnum, locale_t locale UNUSED)
-+{
-+	return strerror(errnum);
-+}
-+#endif
-+
- /**
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
--- 
-2.34.1
-
diff --git a/package/libblockdev/0002-Provide-replacement-function-for-strerror_l.patch b/package/libblockdev/0002-Provide-replacement-function-for-strerror_l.patch
new file mode 100644
index 0000000000..8d542feef6
--- /dev/null
+++ b/package/libblockdev/0002-Provide-replacement-function-for-strerror_l.patch
@@ -0,0 +1,50 @@
+From 589837e7a0395f3e79c037b7e0b7a1c865c6d3c4 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 20 Jan 2024 13:29:28 +0100
+Subject: [PATCH] Provide replacement function for strerror_l()
+
+strerror_l() is not implemented in some C libraries, such as uClibc,
+so let's provide a simple replacement function that falls back on
+strerror().
+
+Upstream: N/A since it's due uclibc only
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Giulio: ported to version 3.0 and 3.1]
+---
+ configure.ac      | 2 ++
+ src/utils/utils.h | 4 ++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 02b26e3e..67341134 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -120,6 +120,8 @@ AC_CHECK_HEADERS([dlfcn.h string.h unistd.h sys/fcntl.h sys/ioctl.h linux/random
+                  [LIBBLOCKDEV_SOFT_FAILURE([Header file $ac_header not found.])],
+                  [])
+ 
++AC_CHECK_FUNCS([strerror_l])
++
+ AC_ARG_WITH([escrow],
+     AS_HELP_STRING([--with-escrow], [support escrow @<:@default=yes@:>@]),
+     [],
+diff --git a/src/utils/utils.h b/src/utils/utils.h
+index 6df11bbf..796ead40 100644
+--- a/src/utils/utils.h
++++ b/src/utils/utils.h
+@@ -13,6 +13,10 @@
+ #define UNUSED __attribute__((unused))
+ #endif
+ 
++#if !defined(HAVE_STRERROR_L)
++#define strerror_l(errnum, locale)      strerror(errnum)
++#endif
++
+ /**
+  * SECTION: utils
+  * @short_description: library providing utility functions used by the blockdev library and its plugins
+-- 
+2.34.1
+
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
