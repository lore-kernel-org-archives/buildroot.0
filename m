Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4913C433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 21:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2913040328;
	Mon, 17 Jan 2022 21:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3iyp38zwaCR; Mon, 17 Jan 2022 21:07:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22E7E40320;
	Mon, 17 Jan 2022 21:07:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B63E91BF388
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 21:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2C464031F
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 21:07:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DfzjGzJV08gt for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 21:07:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13E1A4031E
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 21:07:41 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9ZE4n1cHxc6LX9ZE4npBl5; Mon, 17 Jan 2022 22:07:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642453660; bh=URvKWb6ppW/d+QdRkyvo/AoYvqVU4ucI6HDyZEq7w9A=;
 h=From:To:Subject:Date:MIME-Version;
 b=Vzq64BnajNdIphxeLw7sBbENfURmDnXfMFWOLasNtSdO80g8cR9F2kJT4bNoXSGTU
 OCGSxQu6Ea9HqidJpF81hcUtMDAidWP6JKyuAMWl6CUa5I4mthlNhng7frJhZbU3VL
 ixg7so38B3AFPKCodkHt6tftQGCmOS15F4mRw+VuA+ENcEgS29cGnnqjlx5WzxrWUW
 vM1DU3S7+8NXdppxmZZHAQ0p9VINkqlC3C4SHRSeXl9JQMZ3yeeG9ef/96/2kUO4x0
 5hVcV6d7Yoe3sMZr+/GGPy6K+vF4cqHnlwfvt88U2fJdYzVx7tRo9heIK4GBGpRmV7
 pmCa33ZOjvE6w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jan 2022 22:07:39 +0100
Message-Id: <20220117210739.2022551-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfLuoQ06PvFDn5J0pTNiP7AllksIwoYuASG6ISdFP8B5o20sCYTjiIouVNOex1Ao1pg7SYmO2//YCyk1kpbHpdgk7kxaKsDjwQmfrGqNf+dab1lItldnU
 bY2fdDU5/afIwRw/2clBnOqJg1rct6WklMK0QvJhnJ2+r00q0m16uqzMPz6Cjm9CsfrLysGYV5eddDtHYsCHfCjCRXCnyzRakqY41FPy6vNRuKgVtdn8bASL
 bhFQClTyBEhHq6tZMQKxP9DUGYZ4OF279IzJWEyojz5zCWRm/3BOHx1JVNxJCAmD
Subject: [Buildroot] [PATCH] package/xr819-xradio: add patch to build with
 Linux > 5.12
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As explained in the local patch itself of_get_mac_address() has changed, so
we need to check against Linux version and use it slightly differently.

Patch is pending upstream:
https://github.com/fifteenhex/xradio/pull/15
I've realized only later there was already an opened PR for this, anyway
IMHO I think my patch is written a little better, so please accept it.
And most of all Sergey already tested it and it works:
https://lists.buildroot.org/pipermail/buildroot/2022-January/634084.html

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...fix-building-with-Linux-version-5.12.patch | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 package/xr819-xradio/0001-main.c-fix-building-with-Linux-version-5.12.patch

diff --git a/package/xr819-xradio/0001-main.c-fix-building-with-Linux-version-5.12.patch b/package/xr819-xradio/0001-main.c-fix-building-with-Linux-version-5.12.patch
new file mode 100644
index 0000000000..a1d91e2ff7
--- /dev/null
+++ b/package/xr819-xradio/0001-main.c-fix-building-with-Linux-version-5.12.patch
@@ -0,0 +1,68 @@
+From 990b19664488a8a3bb8d019a3a6b242dd8ad4c29 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 17 Jan 2022 12:26:00 +0100
+Subject: [PATCH] main.c: fix building with Linux version > 5.12
+
+of_get_mac_address() on Linux version > 5.12 requires mac pointer as second
+argument and return an int. So let's deal with it by checking linux version
+to make it compatible with both Linux version > 5.12 and not.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ main.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/main.c b/main.c
+index b60e18d..d354521 100644
+--- a/main.c
++++ b/main.c
+@@ -13,6 +13,7 @@
+ #include <net/cfg80211.h>
+ #include <linux/of_net.h>
+ #include <linux/mmc/sdio_func.h>
++#include <linux/version.h>
+ 
+ #include "xradio.h"
+ #include "fwio.h"
+@@ -499,8 +500,12 @@ int xradio_core_init(struct sdio_func* func)
+ 	int if_id;
+ 	struct ieee80211_hw *dev;
+ 	struct xradio_common *hw_priv;
++#if LINUX_VERSION_CODE > KERNEL_VERSION(5, 12, 0)
++	unsigned char addr[ETH_ALEN];
++#else
+ 	unsigned char randomaddr[ETH_ALEN];
+ 	const unsigned char *addr = NULL;
++#endif
+ 
+ 	//init xradio_common
+ 	dev = xradio_init_common(sizeof(struct xradio_common));
+@@ -513,6 +518,16 @@ int xradio_core_init(struct sdio_func* func)
+ 	hw_priv->sdio_func = func;
+ 	sdio_set_drvdata(func, hw_priv);
+ 
++#if LINUX_VERSION_CODE > KERNEL_VERSION(5, 12, 0)
++	// fill in mac addresses
++	if (hw_priv->pdev->of_node) {
++		err = of_get_mac_address(hw_priv->pdev->of_node, addr);
++	}
++	if (err < 0) {
++		dev_warn(hw_priv->pdev, "no mac address provided, using random\n");
++		eth_random_addr(addr);
++	}
++#else
+ 	// fill in mac addresses
+ 	if (hw_priv->pdev->of_node) {
+ 		addr = of_get_mac_address(hw_priv->pdev->of_node);
+@@ -522,6 +537,8 @@ int xradio_core_init(struct sdio_func* func)
+ 		eth_random_addr(randomaddr);
+ 		addr = randomaddr;
+ 	}
++#endif
++
+ 	memcpy(hw_priv->addresses[0].addr, addr, ETH_ALEN);
+ 	memcpy(hw_priv->addresses[1].addr, addr, ETH_ALEN);
+ 	hw_priv->addresses[1].addr[5] += 0x01;
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
