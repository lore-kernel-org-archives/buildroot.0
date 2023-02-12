Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D56C05027
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78BD080D47;
	Sun, 12 Feb 2023 20:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78BD080D47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2bsLZWQ2O8A3; Sun, 12 Feb 2023 20:53:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0DEB80CCE;
	Sun, 12 Feb 2023 20:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0DEB80CCE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DDAC1BF30E
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78405402FB
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78405402FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H6Vi8NHwBtJk for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:53:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A756402AA
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A756402AA
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:53:37 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id RJLqpJzteEyfERJLqpRXNw; Sun, 12 Feb 2023 21:53:34 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:53:34 +0100
Message-Id: <20230212205334.990478-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBx/bBNfoLFbdLOqYOKPQuCqzNu6+bMIVreGMHjCuigWm4X/+ahr8zm96KI8Qc4yugGRuNsmQcjardI4SEwNBJQqRt0IU+M6XVOXk1aTZYlTOcKUAJhC
 xFFnxMv0ot0dzhX6RNoBypZ/j3tS/Lb5ZiJZFHJFJP/8zLQ/txD1YJc8RJ4FOka4sbJVmTHNsH1UXuw1Sm34RDO82+WvDUMUwHd5JdkczG3vUFY1n6BvR3vX
 +iiGYj2oYX8/LkMlAb/IddexbOCRBNGTQoF6MQr1LAoM8SqGQEU9ExpwRBlp6JJ+
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1676235214; bh=tS+yUSiiKPiBcUC6Jq4aUUPWuEeh0Dd8nRR+s3Z8CeM=;
 h=From:To:Subject:Date:MIME-Version;
 b=D/G/gWaIaX71rUe7+o1sLjOOxDQa+ONJ2xoFiJAp/WFHi6I21i6zOsJrWBOA5GUPW
 l3CFvCnkVX4ot10EAXrpdTvVGJOlOmr4Oy87BDP4l4lzXspMSzE6XulAbFzOCLOTSr
 TqnG9l9oy5emPGyR5+W67QiQwe+A2WCkt6Cn5ttaimOwgABRUM/GQDrgYpbS4tkjez
 VKVmJDREh7r03kAxinVpOM1OefJYIFZvFhlUd6Z77SGjRFNj2FuChSvNrUcRxHIV5B
 b2a7qJzAOQZQzUPcPrD4qbvUXQDi/OAxCh3hE2aI06/I+f/c425wZYXinqfMt3PZ/l
 nB0XSRcK03RHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=D/G/gWaI
Subject: [Buildroot] [PATCH] package/cryptsetup: bump version to 2.6.1
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 149d1e71f1..87cdf840c3 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.6/sha256sums.asc
-sha256  44397ba76e75a9cde5b02177bc63cd7af428a785788e3a7067733e7761842735  cryptsetup-2.6.0.tar.xz
+sha256  410ded65a1072ab9c8e41added37b9729c087fef4d2db02bb4ef529ad6da4693  cryptsetup-2.6.1.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 659fdfa2a4..3f3034475f 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.6
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).0
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).1
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
