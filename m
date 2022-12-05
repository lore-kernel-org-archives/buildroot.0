Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EBCC4708C
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 21:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C22C040459;
	Mon,  5 Dec 2022 21:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C22C040459
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FseVy-Llh0Ty; Mon,  5 Dec 2022 21:33:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 129D64018A;
	Mon,  5 Dec 2022 21:33:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 129D64018A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 465F11BF3E8
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 21:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EF0F4018A
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 21:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EF0F4018A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CsLJ2yKdgND1 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 21:33:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57B9940104
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 21:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57B9940104
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4495D85C8B; Mon,  5 Dec 2022 21:33:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Dec 2022 22:29:52 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 73b001dd811ec43307b50d58f6ee72a5c2c1fb21
X-Git-Newrev: 3c7c6cd5982b8e7310c763f5f042c7a8f1ba1546
X-Patchwork-Hint: ignore
Message-Id: <20221205213317.4495D85C8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/wilc-driver: fix
 build failure due to missing Linux options
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3c7c6cd5982b8e7310c763f5f042c7a8f1ba1546
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Enable Linux options depending on the bus has been chosen, so:
1) enable by default common Linux options:
CONFIG_NET
CONFIG_WIRELESS
CONFIG_CFG80211
CONFIG_CRC_ITU_T
CONFIG_CRC7
2) enable for SDIO bus:
CONFIG_MMC
3) enable for SPI bus:
CONFIG_SPI

Fixes:
http://autobuild.buildroot.net/results/d8c4f0f959dd2ec110db8a75980f13172c3c116c/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Kris Bahnsen <Kris@embeddedTS.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9fe82e56d205c1fb3efe4ef6ae5b24d2284f1429)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wilc-driver/wilc-driver.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/wilc-driver/wilc-driver.mk b/package/wilc-driver/wilc-driver.mk
index a89af30e29..a7a902b6db 100644
--- a/package/wilc-driver/wilc-driver.mk
+++ b/package/wilc-driver/wilc-driver.mk
@@ -13,11 +13,17 @@ WILC_DRIVER_LICENSE_FILES = LICENSE
 ifeq ($(BR2_PACKAGE_WILC_DRIVER_SPI),y)
 WILC_DRIVER_MODULE_MAKE_OPTS += \
 	CONFIG_WILC_SPI=m
+define WILC_DRIVER_SPI_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SPI)
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_WILC_DRIVER_SDIO),y)
 WILC_DRIVER_MODULE_MAKE_OPTS += \
 	CONFIG_WILC_SDIO=m
+define WILC_DRIVER_SDIO_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
+endef
 endif
 
 ifeq ($(BR2_PACKAGE_WILC_DRIVER_SDIO_OOB),y)
@@ -25,5 +31,15 @@ WILC_DRIVER_MODULE_MAKE_OPTS += \
 	CONFIG_WILC_HW_OOB_INTR=y
 endif
 
+define WILC_DRIVER_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC_ITU_T)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CRC7)
+	$(WILC_DRIVER_SPI_LINUX_CONFIG_FIXUPS)
+	$(WILC_DRIVER_SDIO_LINUX_CONFIG_FIXUPS)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
