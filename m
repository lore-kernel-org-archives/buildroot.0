Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1754DC433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 19:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFE69610E7;
	Sat, 28 May 2022 19:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xzXAOAhvxqnY; Sat, 28 May 2022 19:29:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B7360B26;
	Sat, 28 May 2022 19:29:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40CA61BF962
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CDD160A83
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AyNhNaQUk79y for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C4FB610D0
 for <buildroot@buildroot.org>; Sat, 28 May 2022 19:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 37D6285DB4; Sat, 28 May 2022 19:16:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 21:21:54 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 54f1c21802639406cee2ca0908c147566d285d10
X-Git-Newrev: 14ba7bbbab9c2561500c176e246529a14e65435b
X-Patchwork-Hint: ignore
Message-Id: <20220528191613.37D6285DB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/rtl8188eu: enable
 required kernel options
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

commit: https://git.buildroot.net/buildroot/commit/?id=14ba7bbbab9c2561500c176e246529a14e65435b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Enable Linux kernel configuration options required by the driver.

Fixes:
 - http://autobuild.buildroot.org/results/951/9514704d6d44fc1b5dd188eac06b269427d3dee2
 - http://autobuild.buildroot.org/results/9ea/9ea060cc35e859ebc73c65fe2d1f7478f9b4fa8d
 - http://autobuild.buildroot.org/results/658/658c06f8125613b56511d3351cdfd3d8e19d48da

Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f307337446ddf9024c3ba6ce17ad2f839c06c519)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8188eu/Config.in    | 2 ++
 package/rtl8188eu/rtl8188eu.mk | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
index 9263802e09..76d9085297 100644
--- a/package/rtl8188eu/Config.in
+++ b/package/rtl8188eu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RTL8188EU
 	bool "rtl8188eu"
+	depends on !BR2_s390x
 	depends on BR2_LINUX_KERNEL
 	help
 	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
@@ -16,4 +17,5 @@ config BR2_PACKAGE_RTL8188EU
 	  https://github.com/lwfinger/rtl8188eu
 
 comment "rtl8188eu needs a Linux kernel to be built"
+	depends on !BR2_s390x
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index b2066080f3..8cc863e958 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -10,6 +10,14 @@ RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
 RTL8188EU_MODULE_MAKE_OPTS = CONFIG_RTL8188EU=m
 
+define RTL8188EU_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
+endef
+
 define RTL8188EU_INSTALL_FIRMWARE
 	$(INSTALL) -D -m 644 $(@D)/rtl8188eufw.bin \
 		$(TARGET_DIR)/lib/firmware/rtlwifi/rtl8188eufw.bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
