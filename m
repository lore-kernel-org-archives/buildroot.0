Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4931C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 14:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F6EB409A3;
	Fri, 10 Dec 2021 14:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e3ELGuPbYLpn; Fri, 10 Dec 2021 14:28:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EBA8406A2;
	Fri, 10 Dec 2021 14:28:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 894F61BF4DB
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76EEF60ED2
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 14:28:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bLfTGcJLlmYJ for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 14:27:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C61660FD3
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 14:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639146477;
 bh=+lmWPlbeXRTH9YrPitC4GunZTCtAA083GL4GxOqlMUU=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=dMxuiDjfuRUy59MQ8gpmyRPpKgxyuEK3w/3kgbpYuB2yfEDDVKyAxrswWqzMhf4zE
 F81cbL2kkeqJlqC1qRIq6X95kpwWmeviyjcpQ2xYb2HnR3bYLRKp8EbG7lPpMPnDUg
 1diOQv50Oikcqkyfm9qpG8DUsPtV2Tjrm0RFJwog=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.99]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzyuS-1maKTb1Iu6-00x1fJ
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 15:27:57 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 15:27:56 +0100
Message-Id: <20211210142756.16854-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Nr1Yiud9S+xBpdsKL0YCeAnEXDR5Uif3ajSzxXj5nPnbfrgb1gf
 9cZgQzxM5qo6IXq/USC/nXRo89Jzs0BFRuX2snX2/aFPz3ByrVo9x/ud4vOej/Pskp1dL7o
 J09oBuZHPtliwPZZqsa4FdF3l7o0BXUW/ZveYvUj4mR/iUmLSOxqW4Njj9IlcXh9ZU1VFR4
 kLZN5zeJY1eVdCDQjKPWg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:y/p9aJbV0pE=:5VMsgyojtLcHyaC+oe6d2/
 hgF7NOQJFdXurta+IYi8Z6BlLxgjSLnMWIEqVSegIbaGG0lWRw0RmEnh2XcjkktomcHbsuVOb
 xdDLXGCan7TMFczajm7an1Keqs9kEzf7wZv863MenlXpf6ghpTBWdfJId7jKBp7byoNkconQq
 6iUYcaY44eZpjFBOLllHxaE/tCzihC3lCO7SNeYQoIBS1u4V31AD1d4xfi2IDS3DfN1PfhyuI
 ltaF5c/uQRfjEB3iarth3lvYvMvO8WAUytoxcR8nTLQ9w5Kupn4p36l20LCoKfoEA3MtOUEmh
 9of/yVyaT57kXzG8VI1yfb8zzQyrD6BlgRrYX4WCfUFJOJSMnCuEGIXNdCOuUU1n//mzGlDwX
 Ui/rGwTUiXGiAqhee1x/aE1ZgN+KUmUBY8HWN8z96cMNtaM7boFywIvXURS/NDRq9kSizH54X
 sSIbtyD0JbBgb8Ly4r2GAHI+wzaaHDh8EnhELhaBXuwOkRdwpg47Zw7RZ313razhUIOBmJIL1
 eTmw6+O4O86crVUuSVzm2O7yD0ryXZa2gmfB4N6vb3CTzm6kwJHnGp8rtlBNFDB/EM7FyPo+M
 WOzYv8uMjr2PEc8E7MagGNaBpok/8Ryz3KKpillDGlGbItHVl83sGMXNcyWvif5CgdyfChN5g
 imXLCyPtxCNiSI2AU8zl31Px/JpJflSBnRLZGoRqLJXU8RCDmRFFM+td059d+icOFMxF25Uu8
 9sIu1ZgE7oiQdD7y2p2ho1ROCsCpN5Mnn5E0t7VOr8HTJ4je3CrNqrOQS/0HK1XGuaIkRYKKN
 eXuKkQFIINZ4fhLaXXj003aUe7wdlx4EEJiVyo6GCVjJn11W7JE9QpWx/C+OIskdN1WZsmhDr
 UzPxtwjL31YTINTUqyFr9pCY3IHjMwyXpQc7nXJA2Ue4eMBAlaTAkvGJcuxVkL7ZMCFA7BMmZ
 Vvr7+6sPriyvSXxLKKPJxHNy6AFSotV0uwk2D1VkSkyoWUCupknj9SiQ7qIWv4jPnfmzDhwul
 RedXQhUlmMjgvxIozbNHgg04a81t6dw7WHmcRCk2qK8CUqkA5DOxnq3X0tbyk2VyS2V9nZrtz
 dSInMP4z0Bb6gCeu6Zk3NECNNJ4akrXh9J1
Subject: [Buildroot] [PATCH v1] package/assimp: bump version to 5.1.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1], [2] and [3].

[1] https://github.com/assimp/assimp/releases/tag/v5.1.1
[2] https://github.com/assimp/assimp/releases/tag/v5.1.2
[3] https://github.com/assimp/assimp/releases/tag/v5.1.3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/assimp/assimp.hash | 2 +-
 package/assimp/assimp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/assimp/assimp.hash b/package/assimp/assimp.hash
index c61bf88b29..2f4a308c3d 100644
--- a/package/assimp/assimp.hash
+++ b/package/assimp/assimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b96f609bca45cc4747bf8ea4b696816ada484aed2812e60ea4d16aae18360b0b  assimp-5.1.0.tar.gz
+sha256  50a7bd2c8009945e1833c591d16f4f7c491a3c6190f69d9d007167aadb175c35  assimp-5.1.3.tar.gz
 sha256  147874443d242b4e2bae97036e26ec9d6b37f706174c1bd5ecfcc8c1294cef51  LICENSE
diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 919f7a0a8c..90a617e0c6 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ASSIMP_VERSION = 5.1.0
+ASSIMP_VERSION = 5.1.3
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
