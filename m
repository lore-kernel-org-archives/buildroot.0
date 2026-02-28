Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B6FFEE4C9
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 15:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E69B041883;
	Sat, 28 Feb 2026 15:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FmW4ZcqS1GxS; Sat, 28 Feb 2026 15:21:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D079C41867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772292066;
	bh=vGHgtGG8JAzI3yVuHYX7zhF6HfPSA3t1QutN1ky6GLg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JXPrfHezZ1EwGs20dojMKJWdkvBWF54PQDYcYpmG9YjLaRfq21/1W4ILknzx6bAGJ
	 8H7ASVGdfI4N0fmomYKreW7ToKyJAKhWXRQzfk5zrLNstWA82jTymHfQEyKL4dJ+Kn
	 lqUogoSQkJSzd6+lKPxbiUyy25r0X4fA/wimohWl1y5dxnnyfunr3iCVyFBVw5P8ZC
	 52gIyz+lS5rf0295Ib22hjGAP5htZXhExN/qOV9GqKPYbNETnStuzj9/cDoqIWnjAQ
	 0PSxSiTSPeNKoqmqtCHq+YFeAUCb3w2Z2JiaWd7Dih0us1zkE8OYYaVmEFHB+nDpPW
	 YhzS8K6//Cdlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D079C41867;
	Sat, 28 Feb 2026 15:21:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A5D924E
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 15:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F003400B1
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 15:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCc9d6SiQN-A for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 15:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB4C940027
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB4C940027
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 15:21:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A657285D4F; Sat, 28 Feb 2026 15:21:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Feb 2026 16:00:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5cdd2f3a506318b25840b294e287cec72b215cb1
X-Git-Newrev: a035a0f99fa3bbeca776d741bbdeb6c04b3b35c8
X-Patchwork-Hint: ignore
Message-Id: <20260228152101.A657285D4F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libnfs: bump version
 to 6.0.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4356159485430038612=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4356159485430038612==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a035a0f99fa3bbeca776d741bbdeb6c04b3b35c8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Removed all patches because they are included in this release.
Added two upstream patches which fix build with glibc 2.43.

Added optional dependency to gnutls introduced by upstream commit
https://github.com/sahlberg/libnfs/commit/c9215365ef932af39f3a84da071979b199b04db7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-const-and-use-const-qualifier-from-point.patch |  37 +++++++
 package/libnfs/0001-Fix-include-sys-time.h.patch   |  44 --------
 ...-const-qualifier-from-pointer-target-type.patch | 117 +++++++++++++++++++++
 .../0002-utils-nfs-stat.c-include-time.h.patch     |  39 -------
 package/libnfs/libnfs.hash                         |   2 +-
 package/libnfs/libnfs.mk                           |   6 +-
 6 files changed, 160 insertions(+), 85 deletions(-)

diff --git a/package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch b/package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch
new file mode 100644
index 0000000000..d463ecd356
--- /dev/null
+++ b/package/libnfs/0001-Do-not-edit-const-and-use-const-qualifier-from-point.patch
@@ -0,0 +1,37 @@
+From 89a795fee97a3da348c28dbd58500100a13dcec0 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sun, 25 Jan 2026 08:30:43 +0000
+Subject: [PATCH] Do not edit const and use const qualifier from pointer target
+ type
+
+Fixes:
+    ../../lib/libnfs.c: In function 'nfs_set_context_args':
+    ../../lib/libnfs.c:301:30: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+      301 |                 char *strp = strchr(val, ',');
+          |                              ^~~~~~
+
+Upstream: https://github.com/sahlberg/libnfs/commit/89a795fee97a3da348c28dbd58500100a13dcec0
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/libnfs.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/libnfs.c b/lib/libnfs.c
+index bbe6666..162492b 100755
+--- a/lib/libnfs.c
++++ b/lib/libnfs.c
+@@ -316,9 +316,8 @@ nfs_set_context_args(struct nfs_context *nfs, const char *arg, const char *val)
+ 	} else if (!strcmp(arg, "wsize")) {
+ 		nfs_set_writemax(nfs, atoi(val));
+ 	} else if (!strcmp(arg, "readdir-buffer")) {
+-		char *strp = strchr(val, ',');
++		const char *strp = strchr(val, ',');
+ 		if (strp) {
+-			*strp = 0;
+ 			strp++;
+ 			nfs_set_readdir_max_buffer_size(nfs, atoi(val), atoi(strp));
+ 		} else {
+-- 
+2.47.3
+
diff --git a/package/libnfs/0001-Fix-include-sys-time.h.patch b/package/libnfs/0001-Fix-include-sys-time.h.patch
deleted file mode 100644
index 03193d6d71..0000000000
--- a/package/libnfs/0001-Fix-include-sys-time.h.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9df082012cba1dc32d83e5e8b0bdc0892f250058 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
-Date: Mon, 5 Nov 2018 00:43:07 +0100
-Subject: [PATCH] Fix include sys/time.h
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-POSIX says `struct timeval` is defined if <sys/time.h> is included.
-
-Instead of the mess that is currently done based on the system on which
-the stuff is being compiled, include it unconditionally.
-
-Upstream: https://github.com/sahlberg/libnfs/issues/272
-
-Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
-[Fabrice: update for 5.0.2]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
----
- include/nfsc/libnfs.h | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/include/nfsc/libnfs.h b/include/nfsc/libnfs.h
-index 09dcf1c..b6db58c 100755
---- a/include/nfsc/libnfs.h
-+++ b/include/nfsc/libnfs.h
-@@ -28,12 +28,7 @@
- #endif
- 
- #include <stdint.h>
--#if defined(__ANDROID__) || defined(AROS) || defined(__PPU__) \
-- || ( defined(__APPLE__) && defined(__MACH__) ) || defined(__FreeBSD__) || defined(__OpenBSD__)
- #include <sys/time.h>
--#else
--#include <time.h>
--#endif
- 
- #ifdef __cplusplus
- extern "C" {
--- 
-2.19.1
-
diff --git a/package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch b/package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch
new file mode 100644
index 0000000000..6fe8f6433b
--- /dev/null
+++ b/package/libnfs/0002-use-const-qualifier-from-pointer-target-type.patch
@@ -0,0 +1,117 @@
+From 6a06cb6dba0065705179329729cca2f95a842a63 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sun, 25 Jan 2026 08:42:18 +0000
+Subject: [PATCH] use const qualifier from pointer target type
+
+Fixes:
+    ../../lib/nfs_v3.c: In function 'nfs3_mknod_async':
+    ../../lib/nfs_v3.c:3260:13: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+     3260 |         ptr = strrchr(path, '/');
+          |             ^
+    ../../lib/nfs_v3.c: In function 'nfs3_unlink_async':
+    ../../lib/nfs_v3.c:3361:13: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+     3361 |         ptr = strrchr(path, '/');
+          |             ^
+    ../../lib/nfs_v3.c: In function 'nfs3_rmdir_async':
+    ../../lib/nfs_v3.c:3472:13: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+     3472 |         ptr = strrchr(path, '/');
+          |             ^
+    ../../lib/nfs_v3.c: In function 'nfs3_mkdir2_async':
+    ../../lib/nfs_v3.c:3574:13: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
+     3574 |         ptr = strrchr(path, '/');
+          |             ^
+
+Upstream: https://github.com/sahlberg/libnfs/commit/6a06cb6dba0065705179329729cca2f95a842a63
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/nfs_v3.c | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/lib/nfs_v3.c b/lib/nfs_v3.c
+index addd0ae..2c32fff 100644
+--- a/lib/nfs_v3.c
++++ b/lib/nfs_v3.c
+@@ -3244,7 +3244,7 @@ int
+ nfs3_mknod_async(struct nfs_context *nfs, const char *path, int mode, int dev,
+                  nfs_cb cb, void *private_data)
+ {
+-	char *ptr;
++	const char *ptr;
+ 	struct mknod_cb_data *cb_data;
+ 
+ 	cb_data = malloc(sizeof(struct mknod_cb_data));
+@@ -3262,8 +3262,8 @@ nfs3_mknod_async(struct nfs_context *nfs, const char *path, int mode, int dev,
+                                       "buffer for mknod path");
+                         return -1;
+                 }
+-                ptr = strrchr(cb_data->path, '/');
+-                *ptr = 0;
++                char *ptr2 = strrchr(cb_data->path, '/');
++                *ptr2 = 0;
+         } else {
+                 cb_data->path = malloc(strlen(path) + 2);
+                 if (cb_data->path == NULL) {
+@@ -3353,7 +3353,7 @@ nfs3_unlink_async(struct nfs_context *nfs, const char *path, nfs_cb cb,
+                   void *private_data)
+ {
+ 	char *new_path;
+-	char *ptr;
++	const char *ptr;
+ 
+         ptr = strrchr(path, '/');
+         if (ptr) {
+@@ -3363,8 +3363,8 @@ nfs3_unlink_async(struct nfs_context *nfs, const char *path, nfs_cb cb,
+                                       "buffer for unlink path");
+                         return -1;
+                 }
+-                ptr = strrchr(new_path, '/');
+-                *ptr = 0;
++                char *ptr2 = strrchr(new_path, '/');
++                *ptr2 = 0;
+         } else {
+                 new_path = malloc(strlen(path) + 2);
+                 if (new_path == NULL) {
+@@ -3464,7 +3464,7 @@ nfs3_rmdir_async(struct nfs_context *nfs, const char *path, nfs_cb cb,
+                  void *private_data)
+ {
+ 	char *new_path;
+-	char *ptr;
++	const char *ptr;
+ 
+         ptr = strrchr(path, '/');
+         if (ptr) {
+@@ -3474,8 +3474,8 @@ nfs3_rmdir_async(struct nfs_context *nfs, const char *path, nfs_cb cb,
+                                       "buffer for rmdir path");
+                         return -1;
+                 }
+-                ptr = strrchr(new_path, '/');
+-                *ptr = 0;
++                char *ptr2 = strrchr(new_path, '/');
++                *ptr2 = 0;
+         } else {
+                 new_path = malloc(strlen(path) + 2);
+                 if (new_path == NULL) {
+@@ -3566,7 +3566,7 @@ nfs3_mkdir2_async(struct nfs_context *nfs, const char *path, int mode,
+                  nfs_cb cb, void *private_data)
+ {
+ 	char *new_path;
+-	char *ptr;
++	const char *ptr;
+ 
+         ptr = strrchr(path, '/');
+         if (ptr) {
+@@ -3576,8 +3576,8 @@ nfs3_mkdir2_async(struct nfs_context *nfs, const char *path, int mode,
+                                       "buffer for mkdir path");
+                         return -1;
+                 }
+-                ptr = strrchr(new_path, '/');
+-                *ptr = 0;
++                char *ptr2 = strrchr(new_path, '/');
++                *ptr2 = 0;
+         } else {
+                 new_path = malloc(strlen(path) + 2);
+                 if (new_path == NULL) {
+-- 
+2.47.3
+
diff --git a/package/libnfs/0002-utils-nfs-stat.c-include-time.h.patch b/package/libnfs/0002-utils-nfs-stat.c-include-time.h.patch
deleted file mode 100644
index 649d84524c..0000000000
--- a/package/libnfs/0002-utils-nfs-stat.c-include-time.h.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 034205b6b3acd64f9c75010d8da27e2c9f1bc82f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 21 Jul 2024 18:04:05 +0200
-Subject: [PATCH] utils/nfs-stat.c: include time.h
-
-Include time.h to fix the following build failure with gcc >= 14 which
-enables -Werror=implicit-function-declaration
-(https://gcc.gnu.org/gcc-14/porting_to.html):
-
-nfs-stat.c: In function 'main':
-nfs-stat.c:287:30: error: implicit declaration of function 'ctime' [-Wimplicit-function-declaration]
-  287 |         printf("Access: %s", ctime( (const time_t *) &st.nfs_atime));
-      |                              ^~~~~
-nfs-stat.c:177:1: note: 'ctime' is defined in header '<time.h>'; this is probably fixable by adding '#include <time.h>'
-  176 | #include <pwd.h>
-  +++ |+#include <time.h>
-  177 | char *uid_to_name(int uid)
-
-Fixes:
- - http://autobuild.buildroot.org/results/73c3828a4e5d275ca0dfdd5b314494e2b00393c8
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://github.com/sahlberg/libnfs/commit/39e1ae0206fb519c551b48b0e6de57f3e764e886
----
- utils/nfs-stat.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/utils/nfs-stat.c b/utils/nfs-stat.c
-index 17ddb311..0ec33544 100644
---- a/utils/nfs-stat.c
-+++ b/utils/nfs-stat.c
-@@ -50,6 +50,7 @@ WSADATA wsaData;
- #include <inttypes.h>
- #include <sys/types.h>
- #include <fcntl.h>
-+#include <time.h>
- #include "libnfs.h"
- #include "libnfs-raw.h"
- #include "libnfs-raw-mount.h"
diff --git a/package/libnfs/libnfs.hash b/package/libnfs/libnfs.hash
index c5e5197c13..c0e5ef5c81 100644
--- a/package/libnfs/libnfs.hash
+++ b/package/libnfs/libnfs.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  d945cb4f4c8f82ee1f3640893a168810f794a28e1010bb007ec5add345e9df3e  libnfs-5.0.3.tar.gz
+sha256  4e5459cc3e0242447879004e9ad28286d4d27daa42cbdcde423248fad911e747  libnfs-6.0.2.tar.gz
 sha256  edd960c0142b8ada98b43b6396b78f4e557b0bc70ac601a51e397ad04070e2c5  COPYING
 sha256  d9406ced95457941032aa11d04623b8ab71f2827a3395ebef137aec475be35b1  LICENCE-BSD.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENCE-LGPL-2.1.txt
diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index e5e302a4f8..4ba6690951 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFS_VERSION = 5.0.3
+LIBNFS_VERSION = 6.0.2
 LIBNFS_SITE = $(call github,sahlberg,libnfs,libnfs-$(LIBNFS_VERSION))
 LIBNFS_INSTALL_STAGING = YES
 LIBNFS_AUTORECONF = YES
@@ -12,6 +12,10 @@ LIBNFS_LICENSE = LGPL-2.1+ (library), BSD-2-Clause (protocol, .x files), GPL-3.0
 LIBNFS_LICENSE_FILES = COPYING LICENCE-BSD.txt LICENCE-LGPL-2.1.txt LICENCE-GPL-3.txt
 LIBNFS_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBNFS_DEPENDENCIES += gnutls
+endif
+
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LIBNFS_DEPENDENCIES += libtirpc
 endif

--===============4356159485430038612==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4356159485430038612==--
