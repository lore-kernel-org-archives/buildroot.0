Return-Path: <SRS0=b2+E=PU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F2BC433EF
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 15:08:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8400560E90
	for <buildroot@archiver.kernel.org>; Mon,  1 Nov 2021 15:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8400560E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iodoru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 297E580BF3;
	Mon,  1 Nov 2021 15:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8wsyvirecGV; Mon,  1 Nov 2021 15:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A35A680CEA;
	Mon,  1 Nov 2021 15:08:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50ECB1BF2AF
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 15:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37A3880CEA
 for <buildroot@lists.busybox.net>; Mon,  1 Nov 2021 15:08:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqWjOtTCloPY for <buildroot@lists.busybox.net>;
 Mon,  1 Nov 2021 15:08:22 +0000 (UTC)
X-Greylist: delayed 00:08:20 by SQLgrey-1.8.0
Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECCCF80C7D
 for <buildroot@busybox.net>; Mon,  1 Nov 2021 15:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.desaster-games.net (Postfix) with ESMTP id 95A0514006;
 Mon,  1 Nov 2021 15:59:55 +0100 (CET)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
 by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 42WLFrcPSQ2A; Mon,  1 Nov 2021 15:59:42 +0100 (CET)
Received: from ymir.suse.de (nat1.nue.suse.com [195.135.221.27])
 by mail.desaster-games.net (Postfix) with ESMTPSA id 3FF6414002;
 Mon,  1 Nov 2021 15:59:42 +0100 (CET)
From: Michael Vetter <jubalh@iodoru.org>
To: buildroot@busybox.net
Date: Mon,  1 Nov 2021 15:59:42 +0100
Message-Id: <20211101145942.6112-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jasper: bump version to 2.0.33
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
Cc: Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes:
  * Fix a JP2/JPC decoder bug.
  * Fix a build issue impacting some platforms.

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 67653a8e88..49d18dc34f 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b4e5f682be0ab1a5acb0eeb6bf41d6ce17a658bb8e2dbda95de40100939cc88  jasper-2.0.28.tar.gz
+sha256  28d28290cc2eaf70c8756d391ed8bcc8ab809a895b9a67ea6e89da23a611801a  jasper-2.0.28.tar.gz
 sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 6ef1afcac7..224b04b9cf 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.28
+JASPER_VERSION = 2.0.33
 JASPER_SITE = $(call github,jasper-software,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
