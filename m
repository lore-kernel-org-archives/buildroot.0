Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21647C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 09:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CACC660B14;
	Sat,  8 Jan 2022 09:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNAdHbHO59Bw; Sat,  8 Jan 2022 09:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22F4360AF7;
	Sat,  8 Jan 2022 09:45:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE0471BF343
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBF0C41603
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 09:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQpzqvqgmciK for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 09:45:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29B8A4090C
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 09:45:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2DCED82A99; Sat,  8 Jan 2022 09:39:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 10:45:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0233b84204766f3e6eefbc773e121a71b827eaf7
X-Git-Newrev: d4c6cf4b1fc0f34e72ff047e76de53d3634f5184
X-Patchwork-Hint: ignore
Message-Id: <20220108093945.2DCED82A99@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.63
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4c6cf4b1fc0f34e72ff047e76de53d3634f5184
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: http://www.bluez.org/release-of-bluez-5-63/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Peter: explicitly disable asan/lsan/pie/ubsan]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
 package/bluez5_utils/bluez5_utils.hash               | 2 +-
 package/bluez5_utils/bluez5_utils.mk                 | 6 +++++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index e671431093..5bfc652355 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.62
+BLUEZ5_UTILS_HEADERS_VERSION = 5.63
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 3ec4acac7f..a8f5399fa6 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  38090a5b750e17fc08d3e52178ed8d3254c5f4bd2c48830d5c1955b88e3bc0c2  bluez-5.62.tar.xz
+sha256  9349e11e8160bb3d720835d271250d8a7424d3690f5289e6db6fe07cc66c6d76  bluez-5.63.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index cf46d6e0d6..49f6eaac13 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.62
+BLUEZ5_UTILS_VERSION = 5.63
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
@@ -23,6 +23,10 @@ BLUEZ5_UTILS_CONF_OPTS = \
 	--enable-library \
 	--disable-cups \
 	--disable-manpages \
+	--disable-asan \
+	--disable-lsan \
+	--disable-ubsan \
+	--disable-pie \
 	--with-dbusconfdir=/etc
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
