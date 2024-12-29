Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA18C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 251CD8490F;
	Fri, 28 Feb 2025 16:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQ-DodSpy7ER; Fri, 28 Feb 2025 16:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3438184A18
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3438184A18;
	Fri, 28 Feb 2025 16:48:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08AE768
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC166424E6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id thDi4C0KK6qS for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F32E0424DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F32E0424DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECBF082215; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 23:11:30 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a9c8a2cf18bbd1a9d8bdf442762ba0351121df56
X-Git-Newrev: 6a4cdf2057335fc021b20488531e3293584840e7
X-Patchwork-Hint: ignore
Message-Id: <20250228162953.ECBF082215@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bluez5_utils{,
 -headers}: bump version to 5.79
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6a4cdf2057335fc021b20488531e3293584840e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Upstream changelog:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?h=5.79&id=0845b8f6ef2ac004b1c953cf4fe4ca3458cd8e36

Patch for musl compatibility taken from upstream "master".

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../bluez5_utils-headers/bluez5_utils-headers.mk   |  2 +-
 .../0001-gdbus-define-MAX_INPUT-for-musl.patch     | 33 ++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.hash             |  2 +-
 package/bluez5_utils/bluez5_utils.mk               |  2 +-
 4 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 1fd4e0fff3..7acf62b226 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.78
+BLUEZ5_UTILS_HEADERS_VERSION = 5.79
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch b/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
new file mode 100644
index 0000000000..dc823e9277
--- /dev/null
+++ b/package/bluez5_utils/0001-gdbus-define-MAX_INPUT-for-musl.patch
@@ -0,0 +1,33 @@
+From 9d69dba21f1e46b34cdd8ae27fec11d0803907ee Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
+Date: Sat, 2 Nov 2024 16:10:18 +0000
+Subject: [PATCH] gdbus: define MAX_INPUT for musl
+
+This is the same solution as was done in src/shared/util.c
+
+Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9d69dba21f1e46b34cdd8ae27fec11d0803907ee
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+---
+ gdbus/object.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/gdbus/object.c b/gdbus/object.c
+index 84f116bf1..7b0476f1a 100644
+--- a/gdbus/object.c
++++ b/gdbus/object.c
+@@ -20,6 +20,12 @@
+ #include <dbus/dbus.h>
+ 
+ #include "gdbus.h"
++
++/* define MAX_INPUT for musl */
++#ifndef MAX_INPUT
++#define MAX_INPUT _POSIX_MAX_INPUT
++#endif
++
+ #include "src/shared/util.h"
+ 
+ #define info(fmt...)
+-- 
+2.45.2
+
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 41e39e0b5c..9b39b19c08 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  830fed1915c5d375b8de0f5e6f45fcdea0dcc5ff5ffb3d31db6ed0f00d73c5e3  bluez-5.78.tar.xz
+sha256  4164a5303a9f71c70f48c03ff60be34231b568d93a9ad5e79928d34e6aa0ea8a  bluez-5.79.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 717c10e870..1695aeb210 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.78
+BLUEZ5_UTILS_VERSION = 5.79
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
