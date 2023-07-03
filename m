Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA08DC001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 794C881FA0;
	Mon,  3 Jul 2023 19:56:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 794C881FA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Qy1V9g1cDmQ; Mon,  3 Jul 2023 19:56:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96DF781EE4;
	Mon,  3 Jul 2023 19:56:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96DF781EE4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 917F91BF951
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79122405FD
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79122405FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ugkha0I4kh4n for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:56:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A111E40420
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A111E40420
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8FCF486545; Mon,  3 Jul 2023 19:56:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 21:56:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bc29d4eecb2aab67564cddf3afe3b297d51045c
X-Git-Newrev: 7cac499ec46655a491e59b5bbc2a83a2137099bd
X-Patchwork-Hint: ignore
Message-Id: <20230703195633.8FCF486545@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.68
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

commit: https://git.buildroot.net/buildroot/commit/?id=7cac499ec46655a491e59b5bbc2a83a2137099bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../bluez5_utils-headers/bluez5_utils-headers.mk   |  2 +-
 package/bluez5_utils/0001-musl-max-input.patch     | 37 ----------------------
 package/bluez5_utils/bluez5_utils.hash             |  2 +-
 package/bluez5_utils/bluez5_utils.mk               |  2 +-
 4 files changed, 3 insertions(+), 40 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 8ca3764935..0790dd7e0e 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.66
+BLUEZ5_UTILS_HEADERS_VERSION = 5.68
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/0001-musl-max-input.patch b/package/bluez5_utils/0001-musl-max-input.patch
deleted file mode 100644
index 8612bac07f..0000000000
--- a/package/bluez5_utils/0001-musl-max-input.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From ca6546fe521360fcf905bc115b893f322e706cb2 Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Tue, 31 Jan 2023 05:52:58 +0000
-Subject: shared: define MAX_INPUT for musl
-
-musl systems don't have MAX_INPUT. Just define it to _POSIX_MAX_INPUT
-which musl does have if it's not already defined.
-
-Note that on glibc, the values match anyway (as of glibc-2.36), and
-indeed POSIX_MAX_INPUT has the same value on musl too.
-
-Bug: https://bugs.gentoo.org/888467
-Upstream: https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=ca6546fe521360fcf905bc115b893f322e706cb2
-Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
----
- src/shared/util.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/shared/util.c b/src/shared/util.c
-index 2f0ae0e86..b466fb001 100644
---- a/src/shared/util.c
-+++ b/src/shared/util.c
-@@ -28,6 +28,11 @@
- #include <sys/random.h>
- #endif
- 
-+/* define MAX_INPUT for musl */
-+#ifndef MAX_INPUT
-+#define MAX_INPUT _POSIX_MAX_INPUT
-+#endif
-+
- #include "src/shared/util.h"
- 
- void *util_malloc(size_t size)
--- 
-cgit 
-
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 9467647592..45952e60f1 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  39fea64b590c9492984a0c27a89fc203e1cdc74866086efb8f4698677ab2b574  bluez-5.66.tar.xz
+sha256  fc505e6445cb579a55cacee6821fe70d633921522043d322b696de0a175ff933  bluez-5.68.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 37a2e79a7a..1e87041610 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.66
+BLUEZ5_UTILS_VERSION = 5.68
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
