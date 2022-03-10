Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87611C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 18:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C8C684273;
	Thu, 10 Mar 2022 18:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QPUq0Y5Rgmiy; Thu, 10 Mar 2022 18:59:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21151841DE;
	Thu, 10 Mar 2022 18:59:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 96C8C1BF2F3
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 18:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 838234053E
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 18:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=embeddedts.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 97uCxdKqGtGn for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 18:59:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out3.electric.net (smtp-out3.electric.net [208.70.128.185])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 749AD4018E
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 18:59:40 +0000 (UTC)
Received: from 1nSO0g-0003fM-Ul by out3b.electric.net with emc1-ok (Exim
 4.94.2) (envelope-from <kris@embeddedTS.com>)
 id 1nSO0h-0003ib-U8; Thu, 10 Mar 2022 10:59:39 -0800
Received: by emcmailer; Thu, 10 Mar 2022 10:59:39 -0800
Received: from [66.210.251.27] (helo=mail.embeddedts.com)
 by out3b.electric.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <kris@embeddedTS.com>)
 id 1nSO0g-0003fM-Ul; Thu, 10 Mar 2022 10:59:38 -0800
Received: from tsdebian.Massive (unknown [75.164.75.221])
 by mail.embeddedts.com (Postfix) with ESMTPSA id E1A8D3218;
 Thu, 10 Mar 2022 11:59:37 -0700 (MST)
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 10:59:21 -0800
Message-Id: <20220310185921.8852-1-kris@embeddedTS.com>
X-Mailer: git-send-email 2.11.0
X-Outbound-IP: 66.210.251.27
X-Env-From: kris@embeddedTS.com
X-Proto: esmtps
X-Revdns: wsip-66-210-251-27.ph.ph.cox.net
X-HELO: mail.embeddedts.com
X-TLS: TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256
X-Authenticated_ID: 
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (b)
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedTS.com; s=mailanyone20220121; h=Message-Id:Date:To:From;
 bh=mgXg3MGnzaJipaQhMSnFY3lzDiS2Joantqu7MFDs214=;
 b=WlrvONKSlcqt6MW/StR3eoJMLlnjwthYCfTYU6Xt6+wsgRSm3T20NlWzfDkRWL0ITuoEDVLS/HW1aIJodQB3DlKWHdrpnxxdpa58sXd7oMRrMyQeBefK137hN/2mG5VFSKuu7C7PIn3NwYiyELzgFBxNqjYS878NtgQ0x3PtPhheGT3hkKBBbv23hcsFU5KqSeMmzZrJuUe1g/SZJlqGnSK8j2O+Ir+LiAz6NWwPjEOJB12DamHaz/fuEpjer9N6xn9wscY9HOyOitq4KSOhEqvIzBMuBCwMZrD9j23f0XI29bgGez9PdaKcvBykT403NCXMjKI6F6uagUW5kSQezg==;
X-FM-Delivery-Delay: 15749372,23518412
X-PolicySMART: 13164782, 15749372, 26810492
Subject: [Buildroot] [PATCH 1/1] package/ts4900-fpga: bump version to
 20170510
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
From: Kris Bahnsen via buildroot <buildroot@buildroot.org>
Reply-To: Kris Bahnsen <kris@embeddedTS.com>
Cc: Kris Bahnsen <kris@embeddedTS.com>, Mathieu Audat <mathieuaudat@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes TXEN on CPU UARTs not correctly asserting in some multi-byte
transmits.

Signed-off-by: Kris Bahnsen <kris@embeddedTS.com>
---
 package/ts4900-fpga/ts4900-fpga.hash | 6 +++---
 package/ts4900-fpga/ts4900-fpga.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ts4900-fpga/ts4900-fpga.hash b/package/ts4900-fpga/ts4900-fpga.hash
index 9ffff643af..1d3c62bfd1 100644
--- a/package/ts4900-fpga/ts4900-fpga.hash
+++ b/package/ts4900-fpga/ts4900-fpga.hash
@@ -1,5 +1,5 @@
-# From https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga//ts4900-fpga-20150930.bin.md5
-md5  bf93c03ef914cf008287c8cd60781cc8  ts4900-fpga-20150930.bin
+# From https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga//ts4900-fpga-20170510.bin.md5
+md5  86c7c3d7fb9c607af1ef55e1222b4416  ts4900-fpga-20170510.bin
 
 # Locally calculated
-sha256  242ac6a90bea9a95c937ea8952cdc9b02f543cea24a0359bed66a408a6dd8bf9  ts4900-fpga-20150930.bin
+sha256  f15edd6813ee5e93e7f380d85df2dc31e764ebca465093fb9006d56ee15b476b  ts4900-fpga-20170510.bin
diff --git a/package/ts4900-fpga/ts4900-fpga.mk b/package/ts4900-fpga/ts4900-fpga.mk
index a3e42c0812..73e7a28e31 100644
--- a/package/ts4900-fpga/ts4900-fpga.mk
+++ b/package/ts4900-fpga/ts4900-fpga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TS4900_FPGA_VERSION = 20150930
+TS4900_FPGA_VERSION = 20170510
 TS4900_FPGA_SOURCE = ts4900-fpga-$(TS4900_FPGA_VERSION).bin
 TS4900_FPGA_SITE = https://files.embeddedts.com/ts-socket-macrocontrollers/ts-4900-linux/fpga
 # No license file provided, Yocto recipe from the vendor claims MIT.
-- 
2.11.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
