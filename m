Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEF2C43217
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 13:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58345610B0;
	Wed, 19 Oct 2022 13:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58345610B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id guFg32xLuevN; Wed, 19 Oct 2022 13:48:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8948460AC6;
	Wed, 19 Oct 2022 13:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8948460AC6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 809151BF375
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 13:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B2F041BB4
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 13:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B2F041BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CitR2I-ML15i for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 13:48:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60A4A41B7C
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60A4A41B7C
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 13:48:26 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id l9Qlo3kK7sjaWl9QmoP4P7; Wed, 19 Oct 2022 15:48:24 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 15:48:23 +0200
Message-Id: <20221019134823.12594-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIU51aYuS//WLSfYKdmwa/IoZvtaGZJ+KW2PJRMMIcB8RaKthHmrXktlLXg1ypFwaFD5Qb8TwR25uj2yJYMkfGzrP+RljWuOw3OhSh1mQMDjk+98HZQy
 yhvx7zshV09q8WT7IH/3RmmSV8Uw+59zGXixgBsoJ5YiDAqkShwAgmM9z3i3KVEKoiBVFg9hDwa8vdRmbKJCXldJPJqgLNylRyAxmEyZkS/YbeFVH0cMC6QV
 eOdiIQ5Sd1AR3GCAlGAdO1gAbgNggXA7R336sAqpGDziXAcRk/hijGTU1C1EowDi/zIcgLC4xJ+SXgPHsQzXy7lBeX7hlOTBb4zhsgWwi6U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666187304; bh=Ll58ZMe7PC1Ym7NQjCfQVlgvtTY8o+v2eUaAm4ub7B4=;
 h=From:To:Subject:Date:MIME-Version;
 b=FFXKYtHRuhhQaA95Zr86i2vR6F330cBRO3uTg0D63t0m0DyYEgoE12LvDjHAy7YcK
 ftazzlvKQM/Wj0D8C94EmqZBkuZq9yoznIRH3EpQF/L/IMUD2l1SKLgM3VGORglma+
 22qPby4mtQb9bkGhfRRZ5sxoc290wLtTsRoc601MhSEbHBnPF/YQ3qC1wrq+mkv7w1
 fJoCkAMf7MQPKD0X/wt/ZsvN8BCzeOh9zC49FDnsCpe8s6jfkWmS2fLbr8A6D85qdW
 2Ruc9Tn7A5AAZ1yIkTnuPceSYTyAH9vFbjftakOUHLD/JPbHICxDHwgzQ0/pcMzyPx
 /WjIcW2Q9m9Zw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=FFXKYtHR
Subject: [Buildroot] [PATCH v2] package/rtl8188eu: remove wrong description
 in Config.in
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This rtl8188eu driver is not the same as the one in mainline Linux that
still has pending work to be done that in this driver is done, check:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/TODO
specifically:
* Switch to use LIB80211.
* Switch to use MAC80211.
* Switch to use CFG80211.
So let's remove the description that is not valid anymore.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* improve Config.in description as pointed by Luca Ceresoli
---
 package/rtl8188eu/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
index 76d9085297..2fab1fd5c0 100644
--- a/package/rtl8188eu/Config.in
+++ b/package/rtl8188eu/Config.in
@@ -4,9 +4,10 @@ config BR2_PACKAGE_RTL8188EU
 	depends on BR2_LINUX_KERNEL
 	help
 	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
-	  This is needed only for Linux kernels before 3.12.
-	  Since 3.12, there is a (staging) driver in mainline, with a
-	  similar codebase.
+	  This rtl8188eu driver is not the same as the one in mainline
+	  Linux that still has pending work to be done that in this
+	  driver is done, check:
+	  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/TODO
 
 	  Make sure your target kernel has the CONFIG_WIRELESS_EXT
 	  config option enabled.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
