Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06638C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5489742643;
	Fri, 28 Feb 2025 16:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JkmpVyYppLC; Fri, 28 Feb 2025 16:34:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A84484F106
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A84484F106;
	Fri, 28 Feb 2025 16:34:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05A2C68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA6C241A17
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFJawL1DrDVY for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2408541957
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2408541957
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BE0987A71; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Dec 2024 22:40:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8e5a5a9bcc55c17f5a515b35f92d5df8023febaa
X-Git-Newrev: 3ee745782a0802b1479eb6a8f678b6a261775295
X-Patchwork-Hint: ignore
Message-Id: <20250228162932.1BE0987A71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/android-tools: convert
 all patches to Git-formatted patches
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3ee745782a0802b1479eb6a8f678b6a261775295
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This will make it easier to modify the patch series moving forward. No
functional changes.

On one patch, we added the SoB from Giulio, which was missing. Giulio
was the original contributor of the patch, and nobody touched it since
it was introduced.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                |  8 +--
 .../0001-Fix-makefiles-for-out-of-tree-build.patch |  7 ++-
 .../0002-Fix-adbd-for-non-Ubuntu-systems.patch     |  9 ++--
 .../0003-Fix-build-issue-with-uclibc.patch         |  8 ++-
 .../0004-Fix-build-issue-with-musl.patch           | 25 ++++-----
 ...5-makefiles-use-pkgconf-to-get-libs-deps.patch} | 47 ++++++++++-------
 ... => 0006-Fix-build-on-big-endian-systems.patch} | 20 ++++++--
 ...07-Include-cdefs.h-wherever-it-is-needed.patch} | 18 ++++---
 ...de-sysmacros.h-to-compile-with-glibc-2.28.patch | 42 ---------------
 ...-fix-minor-major-build-failure-due-to-gli.patch | 59 ++++++++++++++++++++++
 ...akefiles-for-out-of-tree-ext4_utils-build.patch |  4 +-
 ...ded-patch-for-openssl-1.1.0-compatibility.patch |  4 +-
 ...ot-fastboot.c-reorder-functions-to-avoid-.patch |  4 +-
 ...rse-sparse_read.c-add-missing-output_file.patch |  4 +-
 ..._utils-make_ext4fs_main.c-disable-Android.patch |  4 +-
 .../0014-core-adbd-adb.c-open-code-capset.patch    |  4 +-
 ...bd-adb.c-include-correct-header-for-prctl.patch |  4 +-
 17 files changed, 162 insertions(+), 109 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b793026881..11e410b4ea 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -273,10 +273,10 @@ package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch lib_patch.U
 package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch lib_patch.Upstream
 package/android-tools/0003-Fix-build-issue-with-uclibc.patch lib_patch.Upstream
 package/android-tools/0004-Fix-build-issue-with-musl.patch lib_patch.Upstream
-package/android-tools/0005-Use-pkgconf-to-get-libs-deps.patch lib_patch.Upstream
-package/android-tools/0006-fix-big-endian-build.patch lib_patch.Upstream
-package/android-tools/0007-include-cdefs-h-when-needed.patch lib_patch.Upstream
-package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch lib_patch.Sob lib_patch.Upstream
+package/android-tools/0005-makefiles-use-pkgconf-to-get-libs-deps.patch lib_patch.Upstream
+package/android-tools/0006-Fix-build-on-big-endian-systems.patch lib_patch.Upstream
+package/android-tools/0007-Include-cdefs.h-wherever-it-is-needed.patch lib_patch.Upstream
+package/android-tools/0008-usb_linux.c-fix-minor-major-build-failure-due-to-gli.patch lib_patch.Upstream
 package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch lib_patch.Upstream
 package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch lib_patch.Upstream
 package/aoetools/0001-Change-shell-script-interpreter-from-bin-bash-to-bin.patch lib_patch.Upstream
diff --git a/package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch b/package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch
index af0723620f..ad047657a1 100644
--- a/package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch
+++ b/package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch
@@ -1,4 +1,7 @@
-[PATCH] Fix makefiles for out-of-tree build
+From 1fe49c34aa3e32e801af5c56293ec71ff6e7e2bc Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Sun, 1 Dec 2024 15:43:17 +0100
+Subject: [PATCH] Fix makefiles for out-of-tree build
 
 Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 ---
@@ -158,5 +161,5 @@ index 9e8b751..94a069b 100644
  LIBS+= -lz -lselinux
  
 -- 
-2.5.1
+2.47.0
 
diff --git a/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch b/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
index 35f6c8a3be..7f39e6662b 100644
--- a/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
+++ b/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
@@ -1,4 +1,7 @@
-[PATCH] Fix adbd for non-Ubuntu systems
+From d433d5c340f3b36de58ea8550fd140dbdaea13b4 Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Sun, 1 Dec 2024 15:43:33 +0100
+Subject: [PATCH] Fix adbd for non-Ubuntu systems
 
 Remove glib/dbus dependencies and partially restore services.c to be
 closer to the original source code in order to run on systems without
@@ -7,7 +10,7 @@ sudo.
 Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 ---
  core/adbd/adb.c          |   1 -
- core/adbd/services.c     | 160 ++++-------------------------------------------
+ core/adbd/services.c     | 160 +++------------------------------------
  debian/makefiles/adbd.mk |   4 +-
  3 files changed, 14 insertions(+), 151 deletions(-)
 
@@ -260,5 +263,5 @@ index 49dab8c..22c1816 100644
  OBJS= $(patsubst %, %.o, $(basename $(SRCS)))
  
 -- 
-2.5.1
+2.47.0
 
diff --git a/package/android-tools/0003-Fix-build-issue-with-uclibc.patch b/package/android-tools/0003-Fix-build-issue-with-uclibc.patch
index 95517c307b..a951271873 100644
--- a/package/android-tools/0003-Fix-build-issue-with-uclibc.patch
+++ b/package/android-tools/0003-Fix-build-issue-with-uclibc.patch
@@ -1,7 +1,11 @@
-[PATCH] Fix build issue with uclibc
+From 082ee80d3524fa3474644c09b441d7f7947675cc Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Sun, 1 Dec 2024 15:43:56 +0100
+Subject: [PATCH] Fix build issue with uclibc
 
 Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 ---
+ core/adb/adb_auth_client.c  | 2 +-
  core/adbd/adb_auth_client.c | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
@@ -32,5 +36,5 @@ index 0b4913e..068d837 100644
              D("%s: Invalid base64 data ret=%d\n", file, ret);
              free(key);
 -- 
-2.6.1
+2.47.0
 
diff --git a/package/android-tools/0004-Fix-build-issue-with-musl.patch b/package/android-tools/0004-Fix-build-issue-with-musl.patch
index 964eb87a6d..affd75b259 100644
--- a/package/android-tools/0004-Fix-build-issue-with-musl.patch
+++ b/package/android-tools/0004-Fix-build-issue-with-musl.patch
@@ -1,4 +1,7 @@
-[PATCH] Fix build issue with musl
+From d14ca3e3362448590adaebacb76d4d8046f9b556 Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Sun, 1 Dec 2024 15:44:16 +0100
+Subject: [PATCH] Fix build issue with musl
 
 arpa/nameser.h doesn't use the same macro name to avoid several
 inclusions.
@@ -8,19 +11,12 @@ TEMP_FAILURE_RETRY macro.
 
 Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 ---
- core/adbd/arpa_nameser.h              | 12 +++++++++---
- core/adbd/base64.c                    |  1 -
- core/adbd/framebuffer_service.c       |  1 +
- core/adbd/qemu_pipe.h                 |  1 -
- core/include/cutils/android_reboot.h  |  8 ++++++--
- core/include/cutils/bitops.h          | 10 ++++++----
- core/include/cutils/partition_utils.h |  8 ++++++--
- extras/ext4_utils/sha1.c              |  3 ---
- extras/ext4_utils/sha1.h              | 13 ++++++-------
- 9 files changed, 34 insertions(+), 23 deletions(-)
+ core/adbd/arpa_nameser.h        | 3 +++
+ core/adbd/framebuffer_service.c | 1 +
+ 2 files changed, 4 insertions(+)
 
 diff --git a/core/adbd/arpa_nameser.h b/core/adbd/arpa_nameser.h
-index 438dc04..b2a28d6 100644
+index 438dc04..f3d2fee 100644
 --- a/core/adbd/arpa_nameser.h
 +++ b/core/adbd/arpa_nameser.h
 @@ -52,6 +52,8 @@
@@ -32,7 +28,7 @@ index 438dc04..b2a28d6 100644
  
  #define BIND_4_COMPAT
  
-@@ -574,4 +579,5 @@ __END_DECLS
+@@ -574,4 +576,5 @@ __END_DECLS
  #define  XLOG(...)   do {} while (0)
  #endif
  
@@ -51,4 +47,5 @@ index 20c08d2..48e0241 100644
  #include <sys/ioctl.h>
  #include <sys/mman.h>
 -- 
-2.6.1
+2.47.0
+
diff --git a/package/android-tools/0005-Use-pkgconf-to-get-libs-deps.patch b/package/android-tools/0005-makefiles-use-pkgconf-to-get-libs-deps.patch
similarity index 57%
rename from package/android-tools/0005-Use-pkgconf-to-get-libs-deps.patch
rename to package/android-tools/0005-makefiles-use-pkgconf-to-get-libs-deps.patch
index 63ea1fb6a4..8136ac832d 100644
--- a/package/android-tools/0005-Use-pkgconf-to-get-libs-deps.patch
+++ b/package/android-tools/0005-makefiles-use-pkgconf-to-get-libs-deps.patch
@@ -1,4 +1,7 @@
-makefiles: use pkgconf to get libs deps
+From 10f3f6fb75da72f155e72794d6647e4fa21a87d0 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Sun, 1 Dec 2024 15:45:01 +0100
+Subject: [PATCH] makefiles: use pkgconf to get libs deps
 
 LIBS lists library dependencies without taking into account static linking
 that need ordered listing and more libraries listed since differently from
@@ -10,26 +13,36 @@ needed libraries are listed during linking.
 
 Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 ---
-diff -urpN android-tools-4.2.2+git20130218.orig/debian/makefiles/adbd.mk android-tools-4.2.2+git20130218/debian/makefiles/adbd.mk
---- android-tools-4.2.2+git20130218.orig/debian/makefiles/adbd.mk	2019-04-08 16:05:02.967710428 +0200
-+++ android-tools-4.2.2+git20130218/debian/makefiles/adbd.mk	2019-04-08 16:30:42.463084426 +0200
+ debian/makefiles/adb.mk  | 2 +-
+ debian/makefiles/adbd.mk | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/debian/makefiles/adb.mk b/debian/makefiles/adb.mk
+index 654b9f1..a03c93a 100644
+--- a/debian/makefiles/adb.mk
++++ b/debian/makefiles/adb.mk
+@@ -41,7 +41,7 @@ CPPFLAGS+= -DHAVE_TERMIO_H
+ CPPFLAGS+= -I$(SRCDIR)/core/adb
+ CPPFLAGS+= -I$(SRCDIR)/core/include
+ 
+-LIBS+= -lc -lpthread -lz -lcrypto
++LIBS+= -lc -lpthread -lz `pkg-config --libs libcrypto`
+ 
+ OBJS= $(SRCS:.c=.o)
+ 
+diff --git a/debian/makefiles/adbd.mk b/debian/makefiles/adbd.mk
+index 22c1816..a8eee3a 100644
+--- a/debian/makefiles/adbd.mk
++++ b/debian/makefiles/adbd.mk
 @@ -44,7 +44,7 @@ CPPFLAGS+= -DADBD_NON_ANDROID
  CPPFLAGS+= -I$(SRCDIR)/core/adbd
  CPPFLAGS+= -I$(SRCDIR)/core/include
-
+ 
 -LIBS+= -lc -lpthread -lz -lcrypto -lcrypt
 +LIBS+= -lc -lpthread -lz `pkg-config --libs libcrypto` -lcrypt
-
+ 
  OBJS= $(patsubst %, %.o, $(basename $(SRCS)))
+ 
+-- 
+2.47.0
 
-diff -urpN android-tools-4.2.2+git20130218.orig/debian/makefiles/adb.mk android-tools-4.2.2+git20130218/debian/makefiles/adb.mk
---- android-tools-4.2.2+git20130218.orig/debian/makefiles/adb.mk	2019-04-08 16:05:02.959701400 +0200
-+++ android-tools-4.2.2+git20130218/debian/makefiles/adb.mk	2019-04-08 16:31:06.529426250 +0200
-@@ -41,7 +41,7 @@ CPPFLAGS+= -DHAVE_TERMIO_H
- CPPFLAGS+= -I$(SRCDIR)/core/adb
- CPPFLAGS+= -I$(SRCDIR)/core/include
-
--LIBS+= -lc -lpthread -lz -lcrypto
-+LIBS+= -lc -lpthread -lz `pkg-config --libs libcrypto`
-
- OBJS= $(SRCS:.c=.o)
diff --git a/package/android-tools/0006-fix-big-endian-build.patch b/package/android-tools/0006-Fix-build-on-big-endian-systems.patch
similarity index 75%
rename from package/android-tools/0006-fix-big-endian-build.patch
rename to package/android-tools/0006-Fix-build-on-big-endian-systems.patch
index c35fdcb8c4..d7fcb1cf0f 100644
--- a/package/android-tools/0006-fix-big-endian-build.patch
+++ b/package/android-tools/0006-Fix-build-on-big-endian-systems.patch
@@ -1,4 +1,7 @@
-Fix build on big endian systems
+From 8f7e9458dbfca969d3edc9cf409b3439e98f4c5a Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 1 Dec 2024 15:45:26 +0100
+Subject: [PATCH] Fix build on big endian systems
 
 The usb_linux_client.c file defines cpu_to_le16/32 by using the C
 library htole16/32 function calls. However, cpu_to_le16/32 are used
@@ -14,9 +17,13 @@ To solve this, we simply open-code cpu_to_le16/32 in a way that allows
 them to be used when initializing structures.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ core/adb/usb_linux_client.c  | 11 +++++++++--
+ core/adbd/usb_linux_client.c | 11 +++++++++--
+ 2 files changed, 18 insertions(+), 4 deletions(-)
 
-Index: b/core/adb/usb_linux_client.c
-===================================================================
+diff --git a/core/adb/usb_linux_client.c b/core/adb/usb_linux_client.c
+index fb1dad0..a981e96 100644
 --- a/core/adb/usb_linux_client.c
 +++ b/core/adb/usb_linux_client.c
 @@ -34,8 +34,15 @@
@@ -37,8 +44,8 @@ Index: b/core/adb/usb_linux_client.c
  
  struct usb_handle
  {
-Index: b/core/adbd/usb_linux_client.c
-===================================================================
+diff --git a/core/adbd/usb_linux_client.c b/core/adbd/usb_linux_client.c
+index 33875a8..0e4d200 100644
 --- a/core/adbd/usb_linux_client.c
 +++ b/core/adbd/usb_linux_client.c
 @@ -34,8 +34,15 @@
@@ -59,3 +66,6 @@ Index: b/core/adbd/usb_linux_client.c
  
  struct usb_handle
  {
+-- 
+2.47.0
+
diff --git a/package/android-tools/0007-include-cdefs-h-when-needed.patch b/package/android-tools/0007-Include-cdefs.h-wherever-it-is-needed.patch
similarity index 71%
rename from package/android-tools/0007-include-cdefs-h-when-needed.patch
rename to package/android-tools/0007-Include-cdefs.h-wherever-it-is-needed.patch
index da4ee13a17..d4e483c6d7 100644
--- a/package/android-tools/0007-include-cdefs-h-when-needed.patch
+++ b/package/android-tools/0007-Include-cdefs.h-wherever-it-is-needed.patch
@@ -1,4 +1,7 @@
-Include cdefs.h wherever it is needed
+From d3f0157bf2ac1afc9a810ccbe188110df724129d Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 1 Dec 2024 15:46:15 +0100
+Subject: [PATCH] Include cdefs.h wherever it is needed
 
 cdefs.h is included from within a lot of glibc headers, so it almost
 invariably and automagically gets pulled in with glibc.
@@ -11,12 +14,12 @@ So we must include it when we are going to use macros it provides.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 ---
- core/adbd/services.c                  |  1 +
- core/libcutils/android_reboot.c       |  1 +
- 2 files changed, 2 insertions(+), 0 deletion(-)
+ core/adbd/services.c            | 1 +
+ core/libcutils/android_reboot.c | 1 +
+ 2 files changed, 2 insertions(+)
 
 diff --git a/core/adbd/services.c b/core/adbd/services.c
-index 20c08d2..48e0241 100644
+index 5adcefe..6de1951 100644
 --- a/core/adbd/services.c
 +++ b/core/adbd/services.c
 @@ -20,6 +20,7 @@
@@ -28,7 +31,7 @@ index 20c08d2..48e0241 100644
  #include "sysdeps.h"
  
 diff --git a/core/libcutils/android_reboot.c b/core/libcutils/android_reboot.c
-index 20c08d2..48e0241 100644
+index 79c05f8..9386006 100644
 --- a/core/libcutils/android_reboot.c
 +++ b/core/libcutils/android_reboot.c
 @@ -23,6 +23,7 @@
@@ -39,3 +42,6 @@ index 20c08d2..48e0241 100644
  
  #include <cutils/android_reboot.h>
  
+-- 
+2.47.0
+
diff --git a/package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch b/package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch
deleted file mode 100644
index 77b457f604..0000000000
--- a/package/android-tools/0008-Include-sysmacros.h-to-compile-with-glibc-2.28.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-usb_linux.c: fix minor()/major() build failure due to glibc 2.28
-
-glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
-and therefore <sys/sysmacros.h> must be included explicitly when
-major()/minor() are used.
-
-This commit adds a patch to directly include <sys/sysmacros.h> into
-all usb_linux.c files where minor() and major() macros are used.
-
-diff -urpN host-android-tools-4.2.2+git20130218.orig/core/adb/usb_linux.c host-android-tools-4.2.2+git20130218/core/adb/usb_linux.c
---- host-android-tools-4.2.2+git20130218.orig/core/adb/usb_linux.c	2013-02-18 15:49:03.000000000 +0100
-+++ host-android-tools-4.2.2+git20130218/core/adb/usb_linux.c	2018-09-09 11:47:16.476292546 +0200
-@@ -20,6 +20,7 @@
- #include <string.h>
- 
- #include <sys/ioctl.h>
-+#include <sys/sysmacros.h>
- #include <sys/types.h>
- #include <sys/time.h>
- #include <dirent.h>
-diff -urpN host-android-tools-4.2.2+git20130218.orig/core/adbd/usb_linux.c host-android-tools-4.2.2+git20130218/core/adbd/usb_linux.c
---- host-android-tools-4.2.2+git20130218.orig/core/adbd/usb_linux.c	2018-09-09 02:32:57.154503866 +0200
-+++ host-android-tools-4.2.2+git20130218/core/adbd/usb_linux.c	2018-09-09 11:47:28.148353880 +0200
-@@ -20,6 +20,7 @@
- #include <string.h>
- 
- #include <sys/ioctl.h>
-+#include <sys/sysmacros.h>
- #include <sys/types.h>
- #include <sys/time.h>
- #include <dirent.h>
-diff -urpN host-android-tools-4.2.2+git20130218.orig/core/fastboot/usb_linux.c host-android-tools-4.2.2+git20130218/core/fastboot/usb_linux.c
---- host-android-tools-4.2.2+git20130218.orig/core/fastboot/usb_linux.c	2013-02-18 15:49:03.000000000 +0100
-+++ host-android-tools-4.2.2+git20130218/core/fastboot/usb_linux.c	2018-09-09 11:46:53.028169154 +0200
-@@ -33,6 +33,7 @@
- 
- #include <sys/ioctl.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <sys/types.h>
- #include <dirent.h>
- #include <fcntl.h>
diff --git a/package/android-tools/0008-usb_linux.c-fix-minor-major-build-failure-due-to-gli.patch b/package/android-tools/0008-usb_linux.c-fix-minor-major-build-failure-due-to-gli.patch
new file mode 100644
index 0000000000..38b3b9a482
--- /dev/null
+++ b/package/android-tools/0008-usb_linux.c-fix-minor-major-build-failure-due-to-gli.patch
@@ -0,0 +1,59 @@
+From 99c20bd08065d9c78d81ba7aa48a2a113ab28c26 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Sun, 1 Dec 2024 15:46:50 +0100
+Subject: [PATCH] usb_linux.c: fix minor()/major() build failure due to glibc
+ 2.28
+
+glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
+and therefore <sys/sysmacros.h> must be included explicitly when
+major()/minor() are used.
+
+This commit adds a patch to directly include <sys/sysmacros.h> into
+all usb_linux.c files where minor() and major() macros are used.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ core/adb/usb_linux.c      | 1 +
+ core/adbd/usb_linux.c     | 1 +
+ core/fastboot/usb_linux.c | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/core/adb/usb_linux.c b/core/adb/usb_linux.c
+index 7bf2057..f748267 100644
+--- a/core/adb/usb_linux.c
++++ b/core/adb/usb_linux.c
+@@ -20,6 +20,7 @@
+ #include <string.h>
+ 
+ #include <sys/ioctl.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <dirent.h>
+diff --git a/core/adbd/usb_linux.c b/core/adbd/usb_linux.c
+index 7bf2057..f748267 100644
+--- a/core/adbd/usb_linux.c
++++ b/core/adbd/usb_linux.c
+@@ -20,6 +20,7 @@
+ #include <string.h>
+ 
+ #include <sys/ioctl.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <dirent.h>
+diff --git a/core/fastboot/usb_linux.c b/core/fastboot/usb_linux.c
+index b7a9ca3..2dac62b 100644
+--- a/core/fastboot/usb_linux.c
++++ b/core/fastboot/usb_linux.c
+@@ -33,6 +33,7 @@
+ 
+ #include <sys/ioctl.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <sys/types.h>
+ #include <dirent.h>
+ #include <fcntl.h>
+-- 
+2.47.0
+
diff --git a/package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch b/package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
index 80ea1ec1fe..94216102cf 100644
--- a/package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
+++ b/package/android-tools/0009-Fix-makefiles-for-out-of-tree-ext4_utils-build.patch
@@ -1,4 +1,4 @@
-From d24abbec201975a5eb7f8589614cfb424b8c80b6 Mon Sep 17 00:00:00 2001
+From 3c4319da20fab4e48ec02e28f5b013b4a33b5fe4 Mon Sep 17 00:00:00 2001
 From: Alex Kaplan <kaplan2539@gmail.com>
 Date: Sat, 10 Nov 2018 19:50:51 -0800
 Subject: [PATCH] Fix makefiles for out-of-tree ext4_utils build
@@ -44,5 +44,5 @@ index cb64916..c5904bf 100644
  LIBS+= -lz -lselinux
  
 -- 
-2.7.4
+2.47.0
 
diff --git a/package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch b/package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch
index 2de338368f..96ca5b737a 100644
--- a/package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch
+++ b/package/android-tools/0010-adb-added-patch-for-openssl-1.1.0-compatibility.patch
@@ -1,4 +1,4 @@
-From bb3da0e32be4f2260940edf3ee0f88103dfd0dcc Mon Sep 17 00:00:00 2001
+From 79bf5cdee607241434e0d1c5b72e724eb1d20102 Mon Sep 17 00:00:00 2001
 From: Eneas U de Queiroz <cote2004-github@yahoo.com>
 Date: Tue, 5 Feb 2019 01:12:19 +0200
 Subject: [PATCH] adb: added patch for openssl 1.1.0 compatibility
@@ -43,5 +43,5 @@ index 9039d42..debd2ef 100644
  out:
      BN_free(n0inv);
 -- 
-2.14.1
+2.47.0
 
diff --git a/package/android-tools/0011-core-fastboot-fastboot.c-reorder-functions-to-avoid-.patch b/package/android-tools/0011-core-fastboot-fastboot.c-reorder-functions-to-avoid-.patch
index b5592e6992..17a7619bf0 100644
--- a/package/android-tools/0011-core-fastboot-fastboot.c-reorder-functions-to-avoid-.patch
+++ b/package/android-tools/0011-core-fastboot-fastboot.c-reorder-functions-to-avoid-.patch
@@ -1,4 +1,4 @@
-From 9724d78fda4eb023f83d2fd30e665b436d7a7f97 Mon Sep 17 00:00:00 2001
+From 6919b6619a9c744d2220f7af6e211c50662ba94b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 14 Jul 2024 11:41:10 +0200
 Subject: [PATCH] core/fastboot/fastboot.c: reorder functions to avoid implicit
@@ -50,5 +50,5 @@ index 3de6d7d..9b2c86f 100644
  {
      if (match_fastboot_with_serial(info, NULL) == 0) {
 -- 
-2.45.2
+2.47.0
 
diff --git a/package/android-tools/0012-core-libsparse-sparse_read.c-add-missing-output_file.patch b/package/android-tools/0012-core-libsparse-sparse_read.c-add-missing-output_file.patch
index 9a6a77eceb..9e35a4782d 100644
--- a/package/android-tools/0012-core-libsparse-sparse_read.c-add-missing-output_file.patch
+++ b/package/android-tools/0012-core-libsparse-sparse_read.c-add-missing-output_file.patch
@@ -1,4 +1,4 @@
-From 2812c2005cfa4bfc5741651c8310e36f28c0327e Mon Sep 17 00:00:00 2001
+From 72b9e79c81a237f1839afb4fdee680eafdd180d9 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 14 Jul 2024 11:41:56 +0200
 Subject: [PATCH] core/libsparse/sparse_read.c: add missing output_file.h
@@ -33,5 +33,5 @@ index 704bcfa..0a8f838 100644
  #if defined(__APPLE__) && defined(__MACH__)
  #define lseek64 lseek
 -- 
-2.45.2
+2.47.0
 
diff --git a/package/android-tools/0013-extras-ext4_utils-make_ext4fs_main.c-disable-Android.patch b/package/android-tools/0013-extras-ext4_utils-make_ext4fs_main.c-disable-Android.patch
index c11e88bf07..b6902982f7 100644
--- a/package/android-tools/0013-extras-ext4_utils-make_ext4fs_main.c-disable-Android.patch
+++ b/package/android-tools/0013-extras-ext4_utils-make_ext4fs_main.c-disable-Android.patch
@@ -1,4 +1,4 @@
-From 83f9bed233b86dd2bbf603611b13b673caeccb69 Mon Sep 17 00:00:00 2001
+From 01e86db8460d873aec15d658bfc717b026c0545f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 14 Jul 2024 11:46:51 +0200
 Subject: [PATCH] extras/ext4_utils/make_ext4fs_main.c: disable
@@ -50,5 +50,5 @@ index 17d3735..cb58011 100644
  	if (!sehnd && mountpoint) {
  		sehnd = selinux_android_file_context_handle();
 -- 
-2.45.2
+2.47.0
 
diff --git a/package/android-tools/0014-core-adbd-adb.c-open-code-capset.patch b/package/android-tools/0014-core-adbd-adb.c-open-code-capset.patch
index 1496b8bca4..36a9208c60 100644
--- a/package/android-tools/0014-core-adbd-adb.c-open-code-capset.patch
+++ b/package/android-tools/0014-core-adbd-adb.c-open-code-capset.patch
@@ -1,4 +1,4 @@
-From 2b5060146b0890f7f1a63ef891af1358b8cdf9bc Mon Sep 17 00:00:00 2001
+From 850fd3f4a0384ebe492a466a9b1149060619aacb Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 14 Jul 2024 12:57:22 +0200
 Subject: [PATCH] core/adbd/adb.c: open code capset()
@@ -48,5 +48,5 @@ index 7fe6445..98b1de1 100644
          D("Local port disabled\n");
      } else {
 -- 
-2.45.2
+2.47.0
 
diff --git a/package/android-tools/0015-core-adbd-adb.c-include-correct-header-for-prctl.patch b/package/android-tools/0015-core-adbd-adb.c-include-correct-header-for-prctl.patch
index cfbefecb26..0a35dbcc74 100644
--- a/package/android-tools/0015-core-adbd-adb.c-include-correct-header-for-prctl.patch
+++ b/package/android-tools/0015-core-adbd-adb.c-include-correct-header-for-prctl.patch
@@ -1,4 +1,4 @@
-From c14070011e070d8674cf3578708cbae433090a47 Mon Sep 17 00:00:00 2001
+From 8f351150de38641c8ce2e9b7f9a5cba29ccd8f7e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 14 Jul 2024 13:00:02 +0200
 Subject: [PATCH] core/adbd/adb.c: include correct header for prctl()
@@ -30,5 +30,5 @@ index 98b1de1..10f420b 100644
  #else
  #include "usb_vendors.h"
 -- 
-2.45.2
+2.47.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
