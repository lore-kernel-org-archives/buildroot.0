Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC1AC25B7B
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 19:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BB4B607E1;
	Mon, 20 May 2024 19:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXO1AU18i896; Mon, 20 May 2024 19:41:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C24C26080E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C24C26080E;
	Mon, 20 May 2024 19:41:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4EF1C4CC7
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 19:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A42D40017
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 19:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lx9JnjHUu-h7 for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 19:41:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.162;
 helo=smtpcmd14162.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81BC84000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81BC84000B
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81BC84000B
 for <buildroot@buildroot.org>; Mon, 20 May 2024 19:41:41 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 98t8svTx30ADe98t8slFXG; Mon, 20 May 2024 21:41:38 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 20 May 2024 21:41:36 +0200
Message-Id: <20240520194136.2470200-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520194136.2470200-1-giulio.benetti@benettiengineering.com>
References: <20240520194136.2470200-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGTGXZNM2yx7dTAvXsByYygL/8InqFyovHaeGKgn1UwWjPzbdGvUCo/Ydo4CGDjhw6IN/kMDsNZ/R9kxNnxYnUwVqMxBDWoCmaKsOe55i07rniSwKHJL
 TBx7++vJ0yd4GbPrpN7S+zWxsuM/1Lv5Du6l4vIrvE+PebnI20LW2PXyHCktElzPbC7MykRAnv1pCxuMC4aQ5cIv3Z37fVXpSpsi4S4+s2YTx7LQhhh7M1fg
 PtvuvcXULdaOe+P0L2PBklEOODrVMSIjc5Yu2NWqf8V7wDKBaVxcw9bEjm8el8qXhFj/6hzvQ/HIRKtI+7hM9B1I6wuxb/Fhbu7MNxOXrq5tc+BFWeiozFgz
 luPOic3N
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1716234098; bh=1XVu6pe/FuuD30IXZyREK/aD2ZAudUp6qPg3t7DKXQ8=;
 h=From:To:Subject:Date:MIME-Version;
 b=KXf7+deSAClSxMTr8aGpLwQBtUtMIPR/39NpBVxTh1xmxKInGk0PK6XYfCYP5KH48
 KQYZsSm3ei2h2jD+Q1no0rBKVFqLyuRGS5QCOTyjj5tRxCwyvWByEOjgGnU7kqi8Ug
 CxPekYMyuEKHy3f4vbUBZ1bqyIPul6irTJLwSNTFEtV+hIBi6mymwwzI2xIaFzz8W/
 f9OxelGcuoi46Fw0U/XirHXZ0/dO6d8k4hFMHQ0xd9eap6O6UFhCBw+pmn9NQRIfg7
 wXLroF/5Ez1A2aH/2FIzsPyyUipWXPLYaBAs1The4J0o+EZ6cVgqMQlX1MbH+SuDPH
 ONO4iKUHYui5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=KXf7+deS
Subject: [Buildroot] [PATCH] package/rtl8189fs: bump to version 2024-05-19
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this version we can build with Linux 6.9.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index 2746194f43..5ed0bbd376 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b28c15f4631f4151ea6fca96d59aec931766af49ccb7a0d5e1080fc41a323713  rtl8189fs-eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715.tar.gz
+sha256  a5063b1554acd08bcc084926d1ff80148fe8521a6aefb7061cae68b7c4a7cdb1  rtl8189fs-9a82349c2c40515f9d20b9f6721670f76b4e1c7a.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 174bb346ca..afb8685bac 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = eb51e021b0e1b6f94a4b49da3f4ee5c5fb20b715
+RTL8189FS_VERSION = 9a82349c2c40515f9d20b9f6721670f76b4e1c7a
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
