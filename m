Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35846C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:16:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C26061131
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 08:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C26061131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C41D140222;
	Wed,  8 Sep 2021 08:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XzDxFPQD6qaI; Wed,  8 Sep 2021 08:16:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3F2F400DE;
	Wed,  8 Sep 2021 08:16:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC74D1BF5B4
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9227606AE
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 08:16:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OUXOcBWamefk for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 08:16:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9393D60688
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 08:16:35 +0000 (UTC)
Received: (Authenticated sender: kory.maincent@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 0FDC310000B;
 Wed,  8 Sep 2021 08:16:31 +0000 (UTC)
From: Kory Maincent <kory.maincent@bootlin.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 10:16:30 +0200
Message-Id: <20210908081630.3404221-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/arm-gnu-a-toolchain: bump to version
 10.3-2021.07
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Update to version 10.3-2021.07.
The old version contained a nasty nano.spec. The nano.spec file was adding
-lc_nano option but the c_nano.a library was not delivered in the
toolchain archive.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash | 2 +-
 package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
index b18e56c151..26b9f1be1e 100644
--- a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
+++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ac952d89ae0fc3543e81099e7d34917efc621f5def112eee843fd1ce755eca8c  gcc-arm-9.2-2019.12-x86_64-arm-none-eabi.tar.xz
+sha256 8c5b8de344e23cd035ca2b53bbf2075c58131ad61223cae48510641d3e556cea  gcc-arm-none-eabi-10.3-2021.07-x86_64-linux.tar.bz2
diff --git a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
index d7088892ca..1bbfa45d78 100644
--- a/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
+++ b/package/arm-gnu-a-toolchain/arm-gnu-a-toolchain.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ARM_GNU_A_TOOLCHAIN_VERSION = 9.2-2019.12
-ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/$(ARM_GNU_A_TOOLCHAIN_VERSION)/binrel
-ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
+ARM_GNU_A_TOOLCHAIN_VERSION = 10.3-2021.07
+ARM_GNU_A_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-rm/$(ARM_GNU_A_TOOLCHAIN_VERSION)
+ARM_GNU_A_TOOLCHAIN_SOURCE = gcc-arm-none-eabi-$(ARM_GNU_A_TOOLCHAIN_VERSION)-x86_64-linux.tar.bz2
 ARM_GNU_A_TOOLCHAIN_LICENSE = GPL-3.0+
 
 HOST_ARM_GNU_A_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
