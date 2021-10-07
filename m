Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2952FC433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:52:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B30D361042
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B30D361042
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84B1F60F6A;
	Thu,  7 Oct 2021 09:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sOaFFEmZ0yNB; Thu,  7 Oct 2021 09:52:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E78D560754;
	Thu,  7 Oct 2021 09:52:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ACE661BF873
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C63640948
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vKvpjbMklEYy for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 09:52:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C849240947
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 09:52:00 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BBD3DC0004;
 Thu,  7 Oct 2021 09:51:58 +0000 (UTC)
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 11:51:45 +0200
Message-Id: <20211007095147.688449-5-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
References: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 5/7] package/sunxi-mali-mainline: provides
 libgbm
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Registers the package as a libgbm provider.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
Changes v1 -> v2:
 - Fixed gbm features are provided only when wayland is set
Changes v1 -> v2:
 - Fixed gbm features selected only when wayland is set

 package/sunxi-mali-mainline/Config.in              |  5 +++++
 package/sunxi-mali-mainline/gbm.pc                 | 12 ++++++++++++
 package/sunxi-mali-mainline/sunxi-mali-mainline.mk |  3 +++
 3 files changed, 20 insertions(+)
 create mode 100644 package/sunxi-mali-mainline/gbm.pc

diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
index 31a9152407..10534f263b 100644
--- a/package/sunxi-mali-mainline/Config.in
+++ b/package/sunxi-mali-mainline/Config.in
@@ -14,6 +14,9 @@ if BR2_PACKAGE_SUNXI_MALI_MAINLINE
 config BR2_PACKAGE_PROVIDES_LIBEGL
 	default "sunxi-mali-mainline"
 
+config BR2_PACKAGE_PROVIDES_LIBGBM
+	default "sunxi-mali-mainline" if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
+
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "sunxi-mali-mainline"
 
@@ -26,6 +29,8 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
 	bool "wayland"
 	depends on BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
+	select BR2_PACKAGE_HAS_LIBGBM
 
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_DMABUF
 	bool "x11 dma-buf"
diff --git a/package/sunxi-mali-mainline/gbm.pc b/package/sunxi-mali-mainline/gbm.pc
new file mode 100644
index 0000000000..593cfa0aba
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
index e058b5c3cd..8a76b46aba 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
@@ -38,6 +38,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND),y)
 SUNXI_MALI_MAINLINE_DEPENDENCIES += wayland
+SUNXI_MALI_MAINLINE_PROVIDES += libgbm
 endif
 
 # FIXME: install gbm.pc conditionally
@@ -53,6 +54,8 @@ define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
 		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
 	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/glesv2.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
+	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/gbm.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/gbm.pc
 	$(SUNXI_MALI_MAINLINE_FIXUP_EGL_PC)
 endef
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
