Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8652FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 13 Dec 2021 21:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E75A81351;
	Mon, 13 Dec 2021 21:17:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDb2Bch32fjj; Mon, 13 Dec 2021 21:17:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F8E38134C;
	Mon, 13 Dec 2021 21:17:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 21A6F1BF2B0
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 264D3402B7
 for <buildroot@lists.busybox.net>; Mon, 13 Dec 2021 21:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVigmoCJ4tjV for <buildroot@lists.busybox.net>;
 Mon, 13 Dec 2021 21:15:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7B2840292
 for <buildroot@buildroot.org>; Mon, 13 Dec 2021 21:15:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 09629810AE; Mon, 13 Dec 2021 21:09:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Dec 2021 22:09:26 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: cc31f56295ef47c5f4a7d93612669ac2531f86c0
X-Git-Newrev: e23a8a497b1e71dd8b71ae7b549aecdf497a0935
X-Patchwork-Hint: ignore
Message-Id: <20211213210952.09629810AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.60
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

commit: https://git.buildroot.net/buildroot/commit/?id=e23a8a497b1e71dd8b71ae7b549aecdf497a0935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Release notes:
http://www.bluez.org/release-of-bluez-5-59/
http://www.bluez.org/release-of-bluez-5-60/

Added configure option to disable manpages to avoid rst2man dependency
introduced by version 5.59.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 861775ebbe34d4548259e58a3af6b725c62a2a4b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez5_utils-headers/bluez5_utils-headers.mk | 2 +-
 package/bluez5_utils/bluez5_utils.hash               | 3 ++-
 package/bluez5_utils/bluez5_utils.mk                 | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 1e8b6ad01a..815cf4b160 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.58
+BLUEZ5_UTILS_HEADERS_VERSION = 5.60
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 01bcd2ac50..117f39cc93 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  c8065e75a5eb67236849ef68a354b1700540305a8c88ef0a0fd6288f19daf1f1  bluez-5.58.tar.xz
+sha256  710999580d01ee59ec585e5e7c07fd94eddedc001aa26fe7464c546f9d945304  bluez-5.60.tar.xz
+# Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 4c1575f69a..3bd3f5490d 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.58
+BLUEZ5_UTILS_VERSION = 5.60
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
@@ -23,6 +23,7 @@ BLUEZ5_UTILS_CONF_OPTS = \
 	--enable-tools \
 	--enable-library \
 	--disable-cups \
+	--disable-manpages \
 	--with-dbusconfdir=/etc
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
