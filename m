Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDD0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:04:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B50611C5
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65B50611C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C813403DA;
	Tue, 21 Sep 2021 13:04:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHTu-WNIhTl9; Tue, 21 Sep 2021 13:04:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52D2F402A0;
	Tue, 21 Sep 2021 13:04:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24C0A1BF9AD
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10BD040322
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmGSdIrpMNR6 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 13:03:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 765854035F
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:03:34 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 9E87FE001B;
 Tue, 21 Sep 2021 13:03:32 +0000 (UTC)
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 15:03:23 +0200
Message-Id: <20210921130326.3462783-7-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
References: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/8] package/sunxi-mali-mainline: provides libgbm
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Registers the package as a libgbm provider.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 package/sunxi-mali-mainline/Config.in              |  6 ++++++
 package/sunxi-mali-mainline/gbm.pc                 | 12 ++++++++++++
 package/sunxi-mali-mainline/sunxi-mali-mainline.mk |  1 +
 3 files changed, 19 insertions(+)
 create mode 100644 package/sunxi-mali-mainline/gbm.pc

diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
index 31a9152407..dfcca89e46 100644
--- a/package/sunxi-mali-mainline/Config.in
+++ b/package/sunxi-mali-mainline/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE
 	depends on BR2_aarch64 || (BR2_ARM_EABIHF && BR2_arm)
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGBM
+	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	select BR2_PACKAGE_HAS_LIBGLES
 	help
 	  Install userspace Allwinner OpenGL libraries.
@@ -14,6 +16,9 @@ if BR2_PACKAGE_SUNXI_MALI_MAINLINE
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "sunxi-mali-mainline"
 
+config BR2_PACKAGE_PROVIDES_LIBGBM
+	default "sunxi-mali-mainline" if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
+
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "sunxi-mali-mainline"
 
@@ -26,6 +31,7 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
 	bool "wayland"
 	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_HAS_LIBGBM
 
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_DMABUF
 	bool "x11 dma-buf"
diff --git a/package/sunxi-mali-mainline/gbm.pc b/package/sunxi-mali-mainline/gbm.pc
new file mode 100644
index 0000000000..e2f6c04a82
--- /dev/null
+++ b/package/sunxi-mali-mainline/gbm.pc
@@ -0,0 +1,12 @@
+prefix=/usr
+exec_prefix=/usr
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: gbm
+Description: ARM Mali implementation of gbm
+Requires.private: 
+Version: 1.0
+Libs: -L${libdir} -lgbm
+Libs.private: 
+Cflags: -I${includedir}
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
index e9091b05a2..8a76b46aba 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
@@ -38,6 +38,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND),y)
 SUNXI_MALI_MAINLINE_DEPENDENCIES += wayland
+SUNXI_MALI_MAINLINE_PROVIDES += libgbm
 endif
 
 # FIXME: install gbm.pc conditionally
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
