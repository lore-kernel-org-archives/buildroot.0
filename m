Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D577CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 15:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F289140E4C;
	Wed,  1 Oct 2025 15:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1h9zuarcpCUM; Wed,  1 Oct 2025 15:16:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 016D340DB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 016D340DB0;
	Wed,  1 Oct 2025 15:16:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 997A9FBD
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 871C483D53
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xylH7-Rf2MrW for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 15:16:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A805783E80
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A805783E80
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A805783E80
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 15:16:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EE71CC02465;
 Wed,  1 Oct 2025 14:58:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C8583606BF;
 Wed,  1 Oct 2025 14:58:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5605B102F1A4C; 
 Wed,  1 Oct 2025 16:58:45 +0200 (CEST)
Date: Wed, 01 Oct 2025 14:58:24 +0000
MIME-Version: 1.0
Message-Id: <20251001-fix_license-v2-2-bf18911c835d@bootlin.com>
References: <20251001-fix_license-v2-0-bf18911c835d@bootlin.com>
In-Reply-To: <20251001-fix_license-v2-0-bf18911c835d@bootlin.com>
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>, 
 Alistair Francis <alistair@alistair23.me>, Dick Olsson <hi@senzilla.io>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Simon Dawson <spdawson@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1759330726; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LOEyuRZMrYSuD66uFUBy+FeCZCmUOwRhIg5IJFFlBUg=;
 b=vlyRmpq1VUfPHCYmkoXmCzW3t9XR2iOLRUvW1ph2LKUkE0YQp9pWWtcDdgtuwdXFxrraBX
 Z0fbI50ns3PeRxbx/lnn3C5cg1klmwiZI2oJvKXqU7ah7y320UuNriXycfCSjmQwQu75rv
 42cwxZoi0yqdCptQICzXe7014BzMQioj4TEn6vSLxGVjFzmF51BZAy4jRF7BTxhsroBn8K
 xLoqQBcRET2NgPpW7EXpNJnzLHU+wOgr0qHdKpZef+w3gGZU88qYXdeasxKPR4UP9rm9vN
 7kg9OjOw8nUUhORdf31+T5Jg+LYy3GQjwEdXY+A8N4IO2p4pP2n+VhqKIrptFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=vlyRmpq1
Subject: [Buildroot] [PATCH v2 2/7] uboot: Add support for custom license
 files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The U-Boot package was not providing any license file when a custom
Linux version was selected.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- Do not show license option if it is not a custom repo
---
 boot/uboot/Config.in | 16 ++++++++++++++++
 boot/uboot/uboot.mk  |  4 +---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 9320f942d674384f32e3c858e4b5134bad966834..e2547d89d08416026ce1f42d52004d3269b9d2d9 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -92,6 +92,22 @@ config BR2_TARGET_UBOOT_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || BR2_TARGET_UBOOT_CUSTOM_SVN
 
+config BR2_TARGET_UBOOT_CUSTOM_LICENSE_FILES
+	string "U-boot license files"
+	default "Licenses/gpl-2.0.txt"
+	depends on BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || \
+		   BR2_TARGET_UBOOT_CUSTOM_SVN || BR2_TARGET_UBOOT_CUSTOM_TARBALL
+	help
+	  A space-separated list of license files related to U-Boot
+	  package.
+
+config BR2_TARGET_UBOOT_LICENSE_FILES
+	string
+	default BR2_TARGET_UBOOT_CUSTOM_LICENSE_FILES \
+		if BR2_TARGET_UBOOT_CUSTOM_GIT || BR2_TARGET_UBOOT_CUSTOM_HG || \
+		   BR2_TARGET_UBOOT_CUSTOM_SVN || BR2_TARGET_UBOOT_CUSTOM_TARBALL
+	default "Licenses/gpl-2.0.txt"
+
 config BR2_TARGET_UBOOT_PATCH
 	string "Custom U-Boot patches"
 	default BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR if BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR != ""  # legacy
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index c92568a559118bda16622731aa3a90904435a8e2..db12c835fbb41ea96344e1056c9f3d25b6e4cb69 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -8,9 +8,7 @@ UBOOT_VERSION = $(call qstrip,$(BR2_TARGET_UBOOT_VERSION))
 UBOOT_BOARD_NAME = $(call qstrip,$(BR2_TARGET_UBOOT_BOARDNAME))
 
 UBOOT_LICENSE = GPL-2.0+
-ifeq ($(BR2_TARGET_UBOOT_LATEST_VERSION),y)
-UBOOT_LICENSE_FILES = Licenses/gpl-2.0.txt
-endif
+UBOOT_LICENSE_FILES = $(call qstrip,$(BR2_TARGET_UBOOT_LICENSE_FILES))
 UBOOT_CPE_ID_VENDOR = denx
 UBOOT_CPE_ID_PRODUCT = u-boot
 

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
