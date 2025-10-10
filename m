Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8961FCCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 20:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38B1A403DB;
	Fri, 10 Oct 2025 20:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RXIv498NvChA; Fri, 10 Oct 2025 20:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 415FB403D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 415FB403D7;
	Fri, 10 Oct 2025 20:31:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B5A021F
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 20:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 719D6403D7
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 20:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOgr6URExIBC for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 20:31:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ACC4C403D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC4C403D6
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ACC4C403D6
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 20:31:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 7Jm5v7x3mqmI77Jm6vBTCz; Fri, 10 Oct 2025 22:31:38 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>, Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 10 Oct 2025 22:31:36 +0200
Message-ID: <20251010203137.1817176-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGZgYORVC7YLm7rPDS80ISmXgW9sic72jrigOtyyxlOOf3IFKBy3Fd0U1HMpsdq2GJCj4aSvU2+fyQItbsYEuj/qsnwjOf77S0qSd20CBKvwziWoao8G
 Ro2lqJHaZjpDXEzUZbsWIjLy/Zu2RJtlyOBlVqOCnA1bjIUdqORAVvMYDi+h4ur0DYE0ClFwDukPrq3OmpFji/ITRZlD7otdP7WUr1f7YEwH4HoMsolL68bB
 Ifxu/dPEuH2wQIUM5iFORj23uxGZ3+alwle1s0Rn2PSI3dzF9Sjh2k7qPtErYJ3FFDjIyVmBzeZzwNA6zf5gvnNofdumVu1bZpvFyYQ+rEI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1760128298; bh=ObMmuLc9CoXgXvnTloQAvHJreb+rc+Bluc9E7+J/g5c=;
 h=From:To:Subject:Date:MIME-Version;
 b=O1pPeyJCfSqUEiGFHIHMcmVSppVu4kBn//i53Ce9RKg1Vi1ZpB6sNDI/uVgYrqGN+
 vLoggvp4/ZI5vhlMziXo1Cv9BRZG2VZxGvdsnMhlu2i69PZfv7VoiTPKpyZ+gw2G2v
 LaBccB47cKiVWm3Mo75l29V97PaUHwiCSOfgyOVDPEo4y38Nf+8tivB9kBioym44uE
 4JiMDGViXQYhbyD0Pgw9TGadnVva+MBfVVRl3jRXNWxcVzJOfHoB14S3aWZxAFHh5Y
 KFOr2AC8UBnoyE99ZG27/U9QAhg0eQwmUDisYXHu6s44cnXomxUBS5q9h+ALKgd5hd
 wQ7lzBGqURtog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=O1pPeyJC
Subject: [Buildroot] [PATCH] package/wilc-driver: fix build failure with
 Linux 6.17
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a local patch pending upstream to fix build failure with Linux 6.17

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0015-Fix-build-for-kernel-6.17.patch      | 109 ++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 package/wilc-driver/0015-Fix-build-for-kernel-6.17.patch

diff --git a/package/wilc-driver/0015-Fix-build-for-kernel-6.17.patch b/package/wilc-driver/0015-Fix-build-for-kernel-6.17.patch
new file mode 100644
index 0000000000..4d5934bdd4
--- /dev/null
+++ b/package/wilc-driver/0015-Fix-build-for-kernel-6.17.patch
@@ -0,0 +1,109 @@
+From 00895566e07808a0c61d45464797d7cba2eb256c Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 10 Oct 2025 21:58:14 +0200
+Subject: [PATCH] Fix build for kernel 6.17
+
+* With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b74947b4f6ff7c122a1bb6eb38bb7ecfbb1d3820
+set_wiphy_params(), set/get_tx_power() and set_antenna() gain argument
+radio_idx to get radio index. So let's add that argument according to
+linux version >= 6.17.
+* With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a5589313383074c48a1b3751d592a6e084ae0573
+devm_gpio_request() is dropped in favor of devm_gpio_request_one().
+devm_gpio_request_one() requires flags to setup gpio status, but it's
+not specified in wilc_of_parse_power_pins() so keep them as GPIOF_IN
+since they get defined in wilc_wlan_power() called very soon after
+wilc_of_parse_power_pins().
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/11
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ cfg80211.c | 15 +++++++++++++++
+ power.c    | 12 +++++++++++-
+ 2 files changed, 26 insertions(+), 1 deletion(-)
+
+diff --git a/cfg80211.c b/cfg80211.c
+index 0e1375c..a7db9e6 100644
+--- a/cfg80211.c
++++ b/cfg80211.c
+@@ -997,7 +997,11 @@ static int change_bss(struct wiphy *wiphy, struct net_device *dev,
+ 	return 0;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++static int set_wiphy_params(struct wiphy *wiphy, int radio_idx, u32 changed)
++#else
+ static int set_wiphy_params(struct wiphy *wiphy, u32 changed)
++#endif
+ {
+ 	int ret = -EINVAL;
+ 	struct cfg_param_attr cfg_param_val;
+@@ -2198,6 +2202,9 @@ static void wilc_set_wakeup(struct wiphy *wiphy, bool enabled)
+ }
+ 
+ static int set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++			int radio_idx,
++#endif
+ 			enum nl80211_tx_power_setting type, int mbm)
+ {
+ 	int ret;
+@@ -2230,6 +2237,9 @@ static int set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
+ }
+ 
+ static int get_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++	int radio_idx,
++#endif
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
+ 			unsigned int link_id,
+ #endif
+@@ -2252,7 +2262,12 @@ static int get_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
+ 	return ret;
+ }
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++static int set_antenna(struct wiphy *wiphy, int radio_idx, u32 tx_ant,
++		       u32 rx_ant)
++#else
+ static int set_antenna(struct wiphy *wiphy, u32 tx_ant, u32 rx_ant)
++#endif
+ {
+ 	int ret;
+ 	struct wilc *wl = wiphy_priv(wiphy);
+diff --git a/power.c b/power.c
+index 6ab8d63..1cc391d 100644
+--- a/power.c
++++ b/power.c
+@@ -1,4 +1,4 @@
+-#include <linux/delay.h>
++#include <linux/delay.h>OA
+ #include <linux/of.h>
+ #include <linux/version.h>
+ #include <linux/of_gpio.h>
+@@ -37,11 +37,21 @@ int wilc_of_parse_power_pins(struct wilc *wilc)
+ 			!gpio_is_valid(power->gpios.reset))
+ 		return -EINVAL;
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++	ret = devm_gpio_request_one(wilc->dev, power->gpios.chip_en, GPIOF_IN,
++				    "CHIP_EN");
++#else
+ 	ret = devm_gpio_request(wilc->dev, power->gpios.chip_en, "CHIP_EN");
++#endif
+ 	if (ret)
+ 		return ret;
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
++	ret = devm_gpio_request_one(wilc->dev, power->gpios.reset, GPIOF_IN,
++				    "RESET");
++#else 
+ 	ret = devm_gpio_request(wilc->dev, power->gpios.reset, "RESET");
++#endif
+ 	return ret;
+ }
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
