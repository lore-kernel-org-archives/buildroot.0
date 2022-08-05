Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79653C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 23:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7C7E83F7B;
	Fri,  5 Aug 2022 23:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7C7E83F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lciR40wQN0Gb; Fri,  5 Aug 2022 23:31:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E48E283F77;
	Fri,  5 Aug 2022 23:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E48E283F77
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 273661BF429
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 23:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 024FF83F77
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 23:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 024FF83F77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jidl0MQ_hG6l for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 23:31:13 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCAE783F76
Received: from smtpcmd13156.aruba.it (smtpcmd13156.aruba.it [62.149.156.156])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCAE783F76
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 23:31:12 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id K6flo5nboTCpUK6fmoJ9wZ; Sat, 06 Aug 2022 01:24:06 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  6 Aug 2022 01:24:04 +0200
Message-Id: <20220805232404.3586797-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPCzLZMUmfRXGRrtE3JgjMxHQ0jCqGljxpH/bodVJrPZtO/erNF7CGd9DSnoKxFIUfvZ1zTTtopew6Sk7mDGfaJiCKWWMByJtW7qtN/uI+SNbERHCr2m
 bFl89TxJ71SwFfJW5GPblvtvihgwaoLDdHWR3hjledFcVHnK4FuhUdfc0ZpdS41wAP8moqzmXY2+CAI7i8ZKyIcqrkdrUBS1AzQH5ccqblO01eVkHZhIrBbG
 9mUENfAXW8OdqxM+GKpGzc5ERLBeXTyN6DeG3lKwU7s=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659741846; bh=9XyP/B/RPQkr6VG9BVhV1Wv1d8VN7TO7odKk8l19P/g=;
 h=From:To:Subject:Date:MIME-Version;
 b=HmEcVOHQG9TdVTi0SoTWUMAvnhqYmcY3KpLm2TxU5LxFtdybkoTEbixFSTom68vBl
 xNGLbClDwbj2Ocz4ZlzH+CEs4WzWTxT9N6aTK4xPHE4+6KSjZjNpJGgoB9HM/UY6F4
 z5Io4sE7DTOG7OdvUfyRzRfPEE9Qd36DA5GCbTbRY4supEF+1xYVN4QASwMsPZGOh+
 M4uSmjxT60NC1fMJtDaXIIkRjSrI11cIjROSj1F4TKKEM6SRM2Z8U/4koRYcMks6qW
 H3gzvLK/sT97trm3pAAbCJIWOvicTsR0w1r1GaeAE9znK+2lDb+FPKV6iaFGAzq2nJ
 VluNJGubyrFlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=HmEcVOHQ
Subject: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: move package
 SITE to Github giuliobenetti/sunxi-mali
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Github repository mripard/sunxi-mali states to use Lima in place of
sunxi-mali because it's deprecated, but this package is still useful in
Buildroot so I want to move the SITE to my Github fork of the original
repository that already contains a patch to fix a build failure showing
up with Linux version >= 5.15.

The upstream patch fixes missing DMA_BUF module inclusion that leads to
build failure. The patch includes DMA_BUF by using:
MODULE_IMPORT_NS(DMA_BUF);

My idea is to continue to maintain this package in parallel to Lima since
it seems to be still useful.

Fixes:
http://autobuild.buildroot.net/results/8f25c26de737c358b3b43a10737609465b4e1398/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash    | 2 +-
 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
index 4b276fecb7..ac6587b27a 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0197271dbf503e866dd4873091f61bb3de1f2c3031701aac1ba205d1e2f267ac  sunxi-mali-utgard-driver-e4a91c95096bb31450b556fcb13f3c4ba79f60b4.tar.gz
+sha256  64f15a8c7d383ac92230ef82711507a7f3a309462999f6694863fbbb4f12e0be  sunxi-mali-utgard-driver-c4cf7aabed25e0fd27159564caf588a37016870d.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
index 5f9090f492..594a770e61 100644
--- a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUNXI_MALI_UTGARD_DRIVER_VERSION = e4a91c95096bb31450b556fcb13f3c4ba79f60b4
-SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
+SUNXI_MALI_UTGARD_DRIVER_VERSION = c4cf7aabed25e0fd27159564caf588a37016870d
+SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,giuliobenetti,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
 SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
 SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
 SUNXI_MALI_UTGARD_DRIVER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
