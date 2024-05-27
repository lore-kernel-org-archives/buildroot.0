Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C52C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 13:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34A298188D;
	Mon, 27 May 2024 13:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZZYj7pM9pMA; Mon, 27 May 2024 13:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39A8181947
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39A8181947;
	Mon, 27 May 2024 13:53:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B9461D1D22
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E8C2402FD
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wberef31wgl for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 13:53:22 +0000 (UTC)
X-Greylist: delayed 484 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 27 May 2024 13:53:21 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0E875402E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E875402E9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com; envelope-from=kieran.bingham@ideasonboard.com;
 receiver=<UNKNOWN> 
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E875402E9
 for <buildroot@buildroot.org>; Mon, 27 May 2024 13:53:21 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C84D397;
 Mon, 27 May 2024 15:45:10 +0200 (CEST)
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 14:45:05 +0100
Message-Id: <20240527134505.4017771-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1716817510;
 bh=dQQtRYvqd1XARdmdszbNRPxsOvpuTTTm5HwH0cCGu1E=;
 h=From:To:Cc:Subject:Date:From;
 b=k14M6mOvmXAEN5Ydzww53wYpJvxQyLSwOTFI35gYgsE6IRSJPLn24qILuQZxgZN41
 eYeLsE4/Cr413D5b2I3XRpyJOv0DT2Xxz0pYu7Zk6SEOmZ1iJZOdY9gYV0/BGU172a
 mN5urhzYSwNutiSNcgKjQbKCsx0hj8q2aH+3pfnY=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=k14M6mOv
Subject: [Buildroot] [PATCH] package/libcamera: bump to version 0.3.0
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index 1ae74b3b18c4..1566356b9991 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,4 +1,4 @@
-sha256  f9c3e949f9d6a42e29322833e57a0e6e8c54655507c820636470ea597e767fd8  libcamera-v0.2.0-git4.tar.gz
+sha256  1e0a3feff93577a30bcd4e67aa4c1969aecabcd90f78f540a637bb77553c5a7d  libcamera-v0.3.0-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index eecbaa44b91e..dfcd340b75a0 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.2.0
+LIBCAMERA_VERSION = v0.3.0
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
