Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DC4C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 13:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3321A40474;
	Mon, 10 Apr 2023 13:47:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3321A40474
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElmXUayAsgmA; Mon, 10 Apr 2023 13:47:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD6584155B;
	Mon, 10 Apr 2023 13:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD6584155B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBE101C3B18
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 13:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5D5681EA2
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 13:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5D5681EA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2z6f_gYqMJuN for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 13:47:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C385981EA0
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 13:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C385981EA0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB94783C40; Mon, 10 Apr 2023 13:47:44 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 15:45:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: abff5246a78e0adaf6c75b722a85fed891c3f8b1
X-Git-Newrev: 2e330dff6a7ce7965ceb0dccdc9dcbcb329167bb
X-Patchwork-Hint: ignore
Message-Id: <20230410134744.AB94783C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] sunxi-tools: bump to version
 1.4.2-168-ged3039c
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e330dff6a7ce7965ceb0dccdc9dcbcb329167bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps version of the sunxi-tools to latest commit on master branch.

There are no new tags\releases since 2016 so let's use commit hash as version.
New version brings support for the following SOCs: A63, V5, R528/T113s, V853,
F1C100s, R329, H616, H6

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
[Arnout: use full hash in VERSION]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...-meminfo-Access-to-io-memory-via-pointers.patch | 59 ----------------------
 package/sunxi-tools/Config.in                      |  1 +
 package/sunxi-tools/sunxi-tools.hash               |  2 +-
 package/sunxi-tools/sunxi-tools.mk                 |  4 +-
 4 files changed, 4 insertions(+), 62 deletions(-)

diff --git a/package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch b/package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch
deleted file mode 100644
index 997c413f23..0000000000
--- a/package/sunxi-tools/0001-meminfo-Access-to-io-memory-via-pointers.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 5c0a443ba336f10a8db6a99c769aa84ad37ed4d2 Mon Sep 17 00:00:00 2001
-From: Vadim Kochan <vadim4j@gmail.com>
-Date: Wed, 20 Feb 2019 02:48:43 +0200
-Subject: [PATCH] meminfo: Access to io memory via pointers
-
-The main reason for this is to be able compile with musl library,
-because there is no support of inx/outx functions for ARM platform.
-
-Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
----
- meminfo.c | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/meminfo.c b/meminfo.c
-index 0b0ff23..7d9f10f 100644
---- a/meminfo.c
-+++ b/meminfo.c
-@@ -22,7 +22,6 @@
- #include <sys/mman.h>
- #include <stdint.h>
- #include <errno.h>
--#include <sys/io.h>
- #include <stdbool.h>
- 
- #include "common.h"
-@@ -74,24 +73,26 @@ static enum sunxi_soc_version soc_version;
- unsigned int
- sunxi_io_read(void *base, int offset)
- {
--	return inl((unsigned long) (base + offset));
-+	unsigned long port = (unsigned long) (base + offset);
-+	return *((volatile unsigned long *) port);
- }
- 
- void
- sunxi_io_write(void *base, int offset, unsigned int value)
- {
--	outl(value, (unsigned long) (base + offset));
-+	unsigned long port = (unsigned long) (base + offset);
-+	*((volatile unsigned long *) port) = value;
- }
- 
- void
- sunxi_io_mask(void *base, int offset, unsigned int value, unsigned int mask)
- {
--	unsigned int tmp = inl((unsigned long) (base + offset));
-+	unsigned int tmp = sunxi_io_read(base, offset);
- 
- 	tmp &= ~mask;
- 	tmp |= value & mask;
- 
--	outl(tmp, (unsigned long) (base + offset));
-+	sunxi_io_write(base, offset, tmp);
- }
- 
- 
--- 
-2.14.1
-
diff --git a/package/sunxi-tools/Config.in b/package/sunxi-tools/Config.in
index 5f72667284..e748637c72 100644
--- a/package/sunxi-tools/Config.in
+++ b/package/sunxi-tools/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_SUNXI_TOOLS_FEL
 	bool "sunxi-fel"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	select BR2_PACKAGE_DTC
 	select BR2_PACKAGE_LIBUSB
 	help
 	  The sunxi-fel command can interact with a sunxi device in
diff --git a/package/sunxi-tools/sunxi-tools.hash b/package/sunxi-tools/sunxi-tools.hash
index 84acc2c76c..42d81144a3 100644
--- a/package/sunxi-tools/sunxi-tools.hash
+++ b/package/sunxi-tools/sunxi-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  81f48014a520cb83cac4e17f5ae627a637c4d6a422b60c693c5a705c92e43822  sunxi-tools-1.4.2.tar.gz
+sha256  6589f32e9c2a5991cc49928e83aceea675f0165ce6f13cdd2dd784139a8d4efd  sunxi-tools-1.4.2-168-ged3039cdbeeb28fc0011c3585d8f7dfb91038292.tar.gz
 sha256  2b0d4dda4bf8034e1506507a67f80f982131137afe62bf144d248f9faea31da4  LICENSE.md
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 59d1f3b5a0..a9569f2910 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_TOOLS_VERSION = 1.4.2
+SUNXI_TOOLS_VERSION = 1.4.2-168-ged3039cdbeeb28fc0011c3585d8f7dfb91038292
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,v$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPL-2.0+
 SUNXI_TOOLS_LICENSE_FILES = LICENSE.md
@@ -26,7 +26,7 @@ SUNXI_TOOLS_FEXC_LINKS += fex2bin bin2fex
 endif
 
 ifeq ($(BR2_PACKAGE_SUNXI_TOOLS_FEL),y)
-SUNXI_TOOLS_DEPENDENCIES += libusb host-pkgconf
+SUNXI_TOOLS_DEPENDENCIES += dtc libusb host-pkgconf
 endif
 
 define HOST_SUNXI_TOOLS_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
