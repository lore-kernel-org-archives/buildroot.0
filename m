Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C46EC4167B
	for <buildroot@archiver.kernel.org>; Sat, 31 Dec 2022 17:42:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3A6D81453;
	Sat, 31 Dec 2022 17:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3A6D81453
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fJsOQYyHYMrK; Sat, 31 Dec 2022 17:42:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B3B981457;
	Sat, 31 Dec 2022 17:42:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B3B981457
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB3C61BF33F
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 857C840993
 for <buildroot@lists.busybox.net>; Sat, 31 Dec 2022 17:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 857C840993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y7Of1AbSMmgE for <buildroot@lists.busybox.net>;
 Sat, 31 Dec 2022 17:42:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3C4340905
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3C4340905
 for <buildroot@buildroot.org>; Sat, 31 Dec 2022 17:42:11 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Bfs1pY1TIydI8Bfs1pclSS; Sat, 31 Dec 2022 18:42:09 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 31 Dec 2022 18:42:08 +0100
Message-Id: <20221231174208.1999716-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfC4USogEWGkEAah2r78CVTflZ47PU0SGTla1ryzgjWyRTPvGEYfmdYrM0HOUje0ErHIKGBa7y1Dm2tMsuvlAb68rHAPPYK3xT72CX1JGaGVlC/416Cul
 G/BceyrsPKES827NWmS6uaH9S50HNSOwZ6Pe7xOYvrSP3CbK6b/cGrOsvNpf8ZIRNuWUgJEXbo2vXI9cCFj49o/fHsmpc/QO3coqjxwrrKfShEJ1z2RsZRTo
 Kzl1g3NGh9gTfUojj0llFQdIaxYn3XEPa3UGSRnq1ruWIA/MLqYGxTSJYxuAdYWdtmZdIlI/7xTn5jGpmIApQQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672508529; bh=L1Csr13NfaF9XhbagD6fvlNHtVfF2at8Bkst+hRLyl8=;
 h=From:To:Subject:Date:MIME-Version;
 b=lkljSQ2pBXbzy3FvUeSy7pnlsGSAbenoKrJRqxfgCL1Y693bD+r/vNas7bamggRDH
 wEMKwPv2QTtzztUSWWS2UpGH5ZZlkaZON75+bwak6VG2PW1Vdo3/adwOTMU0lpVTJW
 JfLiWUfyrP9iwYlrD5r9FULpjyOelfiJQ2ttot+DLSHlXKpjaPl9I9c9KYoTgZL96Y
 /GMckTwuwjUHR/PrsruvqVuRPRu9lQ7sM790ZdnZIlWLTtQVTyTAY3BH8Zsy7elGEx
 8e2R2F3J+JzAHabScFTI0A39gMClqXeHSl2b1DaimRPQWmEjKFXrSvZf+zYIMn+Ai3
 CVb+EzMhugqsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=lkljSQ2p
Subject: [Buildroot] [PATCH] package/wilc-driver: fix build failure due to
 wrong pointer casts
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
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream[0] to fix the bug.

[0]: https://github.com/embeddedTS/wilc3000-external-module/pull/3

Fixes:
http://autobuild.buildroot.net/results/0a0/0a022d5c053bf8f7a53349b8bae4b2168a9cd134/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../wilc-driver/0005-Fix-cast-warnings.patch  | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/wilc-driver/0005-Fix-cast-warnings.patch

diff --git a/package/wilc-driver/0005-Fix-cast-warnings.patch b/package/wilc-driver/0005-Fix-cast-warnings.patch
new file mode 100644
index 0000000000..713a15e667
--- /dev/null
+++ b/package/wilc-driver/0005-Fix-cast-warnings.patch
@@ -0,0 +1,43 @@
+From ebd083223883d479b2dd6f8a0da272797f90d236 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 31 Dec 2022 18:38:33 +0100
+Subject: [PATCH] Fix cast warnings
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ cfg80211.c | 2 +-
+ netdev.c   | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/cfg80211.c b/cfg80211.c
+index 016aa06..2f40c9d 100644
+--- a/cfg80211.c
++++ b/cfg80211.c
+@@ -1794,7 +1794,7 @@ static int start_ap(struct wiphy *wiphy, struct net_device *dev,
+ 	if (ret != 0)
+ 		netdev_err(dev, "Error in setting channel\n");
+ 
+-	wilc_wlan_set_bssid(dev, dev->dev_addr, WILC_AP_MODE);
++	wilc_wlan_set_bssid(dev, (u8 *)dev->dev_addr, WILC_AP_MODE);
+ 
+ 	return wilc_add_beacon(vif, settings->beacon_interval,
+ 				   settings->dtim_period, &settings->beacon);
+diff --git a/netdev.c b/netdev.c
+index 824afea..5a1a51d 100644
+--- a/netdev.c
++++ b/netdev.c
+@@ -899,9 +899,9 @@ static int wilc_mac_open(struct net_device *ndev)
+ 				vif->idx);
+ 
+ 	if (is_valid_ether_addr(ndev->dev_addr))
+-		wilc_set_mac_address(vif, ndev->dev_addr);
++		wilc_set_mac_address(vif, (u8 *)ndev->dev_addr);
+ 	else
+-		wilc_get_mac_address(vif, ndev->dev_addr);
++		wilc_get_mac_address(vif, (u8 *)ndev->dev_addr);
+ 	netdev_dbg(ndev, "Mac address: %pM\n", ndev->dev_addr);
+ 
+ 	if (!is_valid_ether_addr(ndev->dev_addr)) {
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
