Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5C9C433F5
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 06:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FF11408C7;
	Tue, 18 Jan 2022 06:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6G0GYGasJ6wx; Tue, 18 Jan 2022 06:35:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B47408B1;
	Tue, 18 Jan 2022 06:35:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 82D481BF339
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 06:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EB3D4028D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 06:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtgjvefLGcjE for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 06:35:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp2.osuosl.org (Postfix) with ESMTP id 891C040286
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 06:35:34 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9i5bn8gPLDzPJ9i5cnWrTY; Tue, 18 Jan 2022 07:35:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642487732; bh=k6L0zNlnYSFmkUg23YE0zDBef4W7NI7g3RleZx0vG2I=;
 h=From:To:Subject:Date:MIME-Version;
 b=nl45iIi17JiyjM4taEZGBv3RMKOSxNm3kD/Zt1zksNteXyzpFYBvHDZzaUWWOVDYX
 0gQb/yjawbWJglN6AnNRI90/ACPzdkvS62W5dJ+o9c/QMS9Jfwj7UPIlshcTNLCD0D
 Dy9UceXLdp/u04GQ0FZRoaU5VQ3fSw2ne4VbWQbBGQHR/qU+eZwuo52dEzI08PuQ0p
 h15CxjXtKjIFa47L8IDgmFklDTATLzV0g/0EVorwbFtYc2z4CllJsKStdsgVxbwTp6
 /kyjfaddtY5tDJRzaP9DLmgN0q6uHC1W8okaP7BWYsIGfflGBty4e28hn5va60ES1r
 Dmabeg45j203g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 07:35:31 +0100
Message-Id: <20220118063531.2039729-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <70BDD76B-E7F2-44C0-A90B-0FABCFD8755D@benettiengineering.com>
References: <70BDD76B-E7F2-44C0-A90B-0FABCFD8755D@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEMm5v1qL0im2Za5ov832RGUXUXsWOmbgxgKtNkbfmgIBcYWo8d43gdEImbCyUZGrgZkCQB4n+/S5b7yCi0gOkP0dodJwaU5y387AmravLZbzu4wVxuU
 pMLW/xKzrf7bSievdmY4Ur1VuLFN6weZEfkdIBVHBCZlvY9OkwYrCyXBDNLpwune4GTEZ6522yyRDvkRHblk4AXm6hqTtkRWRvGgmAgHU9WWcwC8KruqmaRE
 36nsTZ3z1ZI9IsKvuwKG8s0brCG2RXSCxtBmtRzuriZmJGB34C06CCM6pWClPHiPdnHvzRAfEKJ4k7YcaMzWKbuW74P7StnYu60SxnL83vM=
Subject: [Buildroot] [PATCH v2] package/xr819-xradio: add patch to build
 with Linux >= 5.13
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
 Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
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
V1->V2:
* update local patch to build correctly also with Linux >= 5.12.1 < 5.13.0
---
 ...fix-building-with-Linux-version-5.13.patch | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 package/xr819-xradio/0001-main.c-fix-building-with-Linux-version-5.13.patch

diff --git a/package/xr819-xradio/0001-main.c-fix-building-with-Linux-version-5.13.patch b/package/xr819-xradio/0001-main.c-fix-building-with-Linux-version-5.13.patch
new file mode 100644
index 0000000000..3b9742012e
--- /dev/null
+++ b/package/xr819-xradio/0001-main.c-fix-building-with-Linux-version-5.13.patch
@@ -0,0 +1,68 @@
+From 4873746fa9d42a8edbc1e192899e00c29ed3d32a Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 17 Jan 2022 12:26:00 +0100
+Subject: [PATCH] main.c: fix building with Linux version >= 5.13
+
+of_get_mac_address() on Linux version >= 5.13 requires mac pointer as
+second argument and return an int. So let's deal with it by checking linux
+version to make it compatible with both Linux version >= 5.13 and not.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ main.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/main.c b/main.c
+index b60e18d..06cb1f6 100644
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
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 13, 0)
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
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(5, 13, 0)
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
