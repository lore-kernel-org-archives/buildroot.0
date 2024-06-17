Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9EFC2BA18
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 15:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 101144090E;
	Mon, 17 Jun 2024 15:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKWr3alJA-lY; Mon, 17 Jun 2024 15:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C91D94097B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C91D94097B;
	Mon, 17 Jun 2024 15:11:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2118A1BF296
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 15:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ED7D81CE1
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 15:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XdmF4LPcuUCz for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 15:11:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=flaniel@linux.microsoft.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7804B81C44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7804B81C44
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7804B81C44
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 15:11:23 +0000 (UTC)
Received: from pwmachine.numericable.fr
 (75.red-83-59-17.dynamicip.rima-tde.net [83.59.17.75])
 by linux.microsoft.com (Postfix) with ESMTPSA id 2205520B7009;
 Mon, 17 Jun 2024 08:11:19 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2205520B7009
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jun 2024 16:10:18 +0100
Message-Id: <20240617151020.31120-3-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617151020.31120-1-flaniel@linux.microsoft.com>
References: <20240617151020.31120-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1718637081;
 bh=DF8J2ozhdXE9Haw9neOSGg9RUn5h+H87w1ZBUKyWs8s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bFth4HSXPDzqvgx+IIiam7SOhXk/OWSan8Xas9dh1NSCJlIeNvqn2++VrQLlZbAzt
 kstr/XGFvnjTEK58jL7EHGcVxpf5ByrTHaPxMN7idv0q0zvC/XDcSGS1bhTA0LYoIB
 nEsdz4WPl3J8rpj0+OVmF0FRrhCKX4HO7gNNfXfo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linux.microsoft.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=bFth4HSX
Subject: [Buildroot] [RFC PATCH v1 2/4] package/tbb: bump to version
 2021.12.0.
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 package/tbb/tbb.hash | 2 +-
 package/tbb/tbb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
index 4d2cb10da8..14c86068ee 100644
--- a/package/tbb/tbb.hash
+++ b/package/tbb/tbb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  782ce0cab62df9ea125cdea253a50534862b563f1d85d4cda7ad4e77550ac363  tbb-2021.11.0.tar.gz
+sha256  c7bb7aa69c254d91b8f0041a71c5bcc3936acb64408a1719aec0b2b7639dd84f  tbb-2021.12.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
index 1b0afbb889..40fcb66d38 100644
--- a/package/tbb/tbb.mk
+++ b/package/tbb/tbb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBB_VERSION = 2021.11.0
+TBB_VERSION = 2021.12.0
 TBB_SITE = $(call github,01org,tbb,v$(TBB_VERSION))
 TBB_INSTALL_STAGING = YES
 TBB_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
