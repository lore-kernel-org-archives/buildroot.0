Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F359DC46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 16:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8032640450;
	Wed, 27 Dec 2023 16:58:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8032640450
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nVp0HjAaQzQe; Wed, 27 Dec 2023 16:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1EB740422;
	Wed, 27 Dec 2023 16:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1EB740422
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CF7A1BF5A3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 16:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B17540422
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 16:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B17540422
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gEeIL8psTonq for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 16:58:45 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0CCE403C1
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 16:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0CCE403C1
Received: by mail.gandi.net (Postfix) with ESMTPA id 09B24FF806;
 Wed, 27 Dec 2023 16:58:41 +0000 (UTC)
To: Buildroot List <buildroot@buildroot.org>
Date: Wed, 27 Dec 2023 17:58:40 +0100
Message-ID: <20231227165840.2900718-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1703696322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tbj60dMP26NhIgl05dAt1BuPxvuuxlfUmtW+WxWuQKU=;
 b=Iy5Br4i1MsplLgU83NCAU7D67b/Njeo6ta61aqrISyDt1o7/uI7kztE2Z8jd5GL3J2ZHvF
 VBmYNa9vPm8nsdtzCB862S+M6s/TbolAwz1hBnXKk7VlYBZe+mPkor0MB/qfAsl10fiEvQ
 K+PMWrkM6EBKS8xd56US0/zKZZymxwq4iURpdglbew285oZ8EEqPnb+/z0bYQNHGjfC2sU
 qisazst0ZR2rEcKF/NeLoJ3sk62MK7VV4mLfLcmmlMJ351YfiS3VInXpD54o0lrp9xYVw1
 wuX3x7RnzWEOH2is4/HQquHxqE5/23Qxy672xNTfbFQTBzFGk1rTWGLy06ndWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Iy5Br4i1
Subject: [Buildroot] [PATCH] Config.in: change default optimization level
 from -Os to -O2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: louis.chauvet@bootlin.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Historically, Buildroot has defaulted to -Os as the gcc optimization
flags. However, this default is probably not the most appropriate
anymore, and this commit therefore changes the default to -O2.

Here are some arguments in favor of this change:

- Most Buildroot uses use Buildroot for platforms that have a
  reasonable amount of storage, and the difference between -Os and -O2
  in terms of code size is no longer than significant compared to the
  size of storage typically available on average embedded Linux
  devices

- -Os can have a pretty bad performance impact, compared to -O2.

- -Os is much less widely tested than -O2. For example, with recent
   versions of gcc, there are parts of Qt5 that segfault when compiled
   with -Os and work perfectly fine with -O2. Yes, it's a compiler bug
   that should be fixed, but in the mean time, having a default that's
   more widely used/tested makes sense.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 554b4062eb..c38b1e6454 100644
--- a/Config.in
+++ b/Config.in
@@ -474,7 +474,7 @@ config BR2_STRIP_EXCLUDE_DIRS
 
 choice
 	prompt "gcc optimization level"
-	default BR2_OPTIMIZE_S
+	default BR2_OPTIMIZE_2
 	help
 	  Set the optimization level for gcc
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
