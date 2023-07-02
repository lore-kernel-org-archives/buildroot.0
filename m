Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872C2EB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 16:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8181B4098E;
	Sun,  2 Jul 2023 16:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8181B4098E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02rKC23hvmhE; Sun,  2 Jul 2023 16:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81B8E415D6;
	Sun,  2 Jul 2023 16:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81B8E415D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A38441BF280
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 16:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CD3540AEB
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 16:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CD3540AEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RUGzCqBKaGwC for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 16:40:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 563A140122
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 563A140122
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 16:40:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E8352A4C0355;
 Sun,  2 Jul 2023 18:40:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44050)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qG07e-00053w-1y;
 Sun, 02 Jul 2023 18:40:26 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 18:40:26 +0200
Message-Id: <20230702164026.3466342-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702164026.3466342-1-bernd@kuhls.net>
References: <20230702164026.3466342-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688316026;
 bh=nRzgS3CenGA5Iinm2I3w2dYM8WYBCYhft3odFTh3G8E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G2AgDv45ghbiRX+B+eCBPjCNj4ir//8Sk+Tpa/DmmG7CHL8eIXnCJt/7pwZ6tmBGc
 JC6soiKDC6HmUkx4bF6mxSQlgKuK+d9MtPBrOklF41ORagfTR3BaiiJCHPPS2RbLGR
 XV9FbYba9usGhlA6h9t5kY7fTW1Mrbgzn3UddLQ6qcWgBXM9xZiuK1bEtZYlsVDRJm
 BwWR64Sx0N0g/xcaKc4mlW5lJl4sATd2qazmBlIOqVxnFyjpywkwr0XpQTnQwcbDse
 LucQYt93cQIsUBExF1PILR5Mk834JZiZj6t0ahH787DpLepIrUwNRmSEhrvUzsol6C
 QVOHSeA/TlLdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=G2AgDv45
Subject: [Buildroot] [PATCH 2/2] package/{bluez5_utils,
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../bluez5_utils-headers.mk                   |  2 +-
 .../bluez5_utils/0001-musl-max-input.patch    | 37 -------------------
 package/bluez5_utils/bluez5_utils.hash        |  2 +-
 package/bluez5_utils/bluez5_utils.mk          |  2 +-
 4 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 package/bluez5_utils/0001-musl-max-input.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
