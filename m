Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2BCEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 21:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE746416D7;
	Wed, 12 Jul 2023 21:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE746416D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_ktJkLfZ_g7; Wed, 12 Jul 2023 21:39:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8F344055F;
	Wed, 12 Jul 2023 21:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8F344055F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 209341BF3A8
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE782401E1
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 21:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE782401E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZCDFhbGkLDiB for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 21:39:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAE654055F
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 21:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAE654055F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6C1486F48; Wed, 12 Jul 2023 21:39:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 23:35:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61bfe280d1dd2a822310796456041329bfa0596e
X-Git-Newrev: da2a418ff980dd8deffd8e73050d2333ae4ecfd0
X-Patchwork-Hint: ignore
Message-Id: <20230712213903.C6C1486F48@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eudev: bump version to 3.2.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=da2a418ff980dd8deffd8e73050d2333ae4ecfd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/eudev-project/eudev/releases/tag/v3.2.12

Removed patch 0001, a different fix was applied in 2015:
https://github.com/eudev-project/eudev/commit/c7badd37d3ac5b06b1fb170b7dfc8ed7c00ce64b

Removed patch 0002 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...y-use-pragma-for-ignoring-diagnostics-if-.patch | 39 -------------------
 ...ix-compile-time-issue-on-very-old-kernels.patch | 44 ----------------------
 package/eudev/eudev.hash                           |  2 +-
 package/eudev/eudev.mk                             |  2 +-
 5 files changed, 2 insertions(+), 86 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 23b0171792..b88ad4ce90 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -418,7 +418,6 @@ package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch Upstream
 package/erlang/0003-crypto-Fixes-for-LibreSSL-3-5-0.patch Upstream
 package/espeak/0001-Fix-build-of-shared-library-on-architectures-needing.patch Upstream
 package/espeak/0002-tr_languages-cast-string_ordinal-init-values.patch Upstream
-package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch Upstream
 package/eudev/S10udev ConsecutiveEmptyLines Indent Shellcheck Variables
 package/evemu/0001-Include-limits.h-for-PATH_MAX.patch Upstream
 package/evemu/0002-evemu-Update-struct-input_event.patch Upstream
diff --git a/package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch b/package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch
deleted file mode 100644
index 3046ba528b..0000000000
--- a/package/eudev/0001-Only-use-pragma-for-ignoring-diagnostics-if-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From dc8aa43b7b6d0cead7d8a0c1a151d289a5233a10 Mon Sep 17 00:00:00 2001
-From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
-Date: Wed, 2 Apr 2014 12:36:52 +0200
-Subject: [PATCH] libudev: Only use #pragma for ignoring diagnostics if GCC
- version supports it.
-
-[Peter: update for 2.1.1, fix shared_assert issue]
-Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
----
- src/shared/macro.h |    8 +++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/shared/macro.h b/src/shared/macro.h
---- a/src/shared/macro.h
-+++ b/src/shared/macro.h
-@@ -38,6 +38,7 @@
- #define _cleanup_(x) __attribute__((cleanup(x)))
- 
- /* Temporarily disable some warnings */
-+#if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)
- #define DISABLE_WARNING_DECLARATION_AFTER_STATEMENT                     \
-         _Pragma("GCC diagnostic push");                                 \
-         _Pragma("GCC diagnostic ignored \"-Wdeclaration-after-statement\"")
-@@ -48,6 +49,13 @@
- 
- #define REENABLE_WARNING                                                \
-         _Pragma("GCC diagnostic pop")
-+#else
-+#define DISABLE_WARNING_DECLARATION_AFTER_STATEMENT
-+#define DISABLE_WARNING_FORMAT_NONLITERAL
-+#define REENABLE_WARNING
-+/* glibc unconditionally defines this, but it needs GCC 4.6+ */
-+#undef static_assert
-+#endif
- 
- #define XCONCATENATE(x, y) x ## y
- #define CONCATENATE(x, y) XCONCATENATE(x, y)
--- 
-1.7.9.5
diff --git a/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch b/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
deleted file mode 100644
index 46961cc9d1..0000000000
--- a/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 09b536e0b9d0964674936901ab9d2954f935c8b4 Mon Sep 17 00:00:00 2001
-From: Stefan Ott <stefan@ott.net>
-Date: Wed, 5 Apr 2023 18:20:37 +0200
-Subject: [PATCH] Fix compile-time issue on very old kernels
-
-Kernel versions prior to 3.4 did not have V4L2_CAP_DEVICE_CAPS and
-compiling against such a kernel will fail.
-
-This patch introduces a version check and makes eudev fall back to
-v2cap.capabilities on these kernels.
-
-Upstream: https://github.com/eudev-project/eudev/commit/09b536e0b9d0964674936901ab9d2954f935c8b4
-Signed-off-by: Stefan Ott <stefan@ott.net>
----
- src/v4l_id/v4l_id.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/v4l_id/v4l_id.c b/src/v4l_id/v4l_id.c
-index 6bf45effe..702d5b687 100644
---- a/src/v4l_id/v4l_id.c
-+++ b/src/v4l_id/v4l_id.c
-@@ -28,6 +28,7 @@
- #include <sys/types.h>
- #include <sys/time.h>
- #include <sys/ioctl.h>
-+#include <linux/version.h>
- #include <linux/videodev2.h>
- 
- #include "util.h"
-@@ -71,9 +72,11 @@ int main(int argc, char *argv[]) {
-                 printf("ID_V4L_VERSION=2\n");
-                 printf("ID_V4L_PRODUCT=%s\n", v2cap.card);
-                 printf("ID_V4L_CAPABILITIES=:");
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,4,0)
-                 if (v2cap.capabilities & V4L2_CAP_DEVICE_CAPS)
-                         capabilities = v2cap.device_caps;
-                 else
-+#endif
-                         capabilities = v2cap.capabilities;
-                 if ((capabilities & V4L2_CAP_VIDEO_CAPTURE) > 0 ||
-                     (capabilities & V4L2_CAP_VIDEO_CAPTURE_MPLANE) > 0)
--- 
-2.40.0
-
diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index fe6c7ef008..d91bc761c9 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed44558b  eudev-3.2.11.tar.gz
+sha256  ccdd64ec3c381d3c3ed0e99d2e70d1f62988c7763de89ca7bdffafa5eacb9ad8  eudev-3.2.12.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index feb5505289..235a71967e 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.11
+EUDEV_VERSION = 3.2.12
 EUDEV_SITE = https://github.com/eudev-project/eudev/releases/download/v$(EUDEV_VERSION)
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
