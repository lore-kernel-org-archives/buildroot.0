Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E96C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 22:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFCFF41622;
	Fri, 13 May 2022 22:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uOYm2xu0kper; Fri, 13 May 2022 22:15:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 790BA4150F;
	Fri, 13 May 2022 22:15:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB0C91C1189
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE96081DB2
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jbjQ3i-ygIn6 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3859681D5C
 for <buildroot@buildroot.org>; Fri, 13 May 2022 22:11:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0129285E2B; Fri, 13 May 2022 22:00:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:54:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2712e320287106c6892abedecb427fb8d5f7d81d
X-Git-Newrev: f307337446ddf9024c3ba6ce17ad2f839c06c519
X-Patchwork-Hint: ignore
Message-Id: <20220513220046.0129285E2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8188eu: enable required kernel
 options
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

commit: https://git.buildroot.net/buildroot/commit/?id=f307337446ddf9024c3ba6ce17ad2f839c06c519
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable Linux kernel configuration options required by the driver.

Fixes:
 - http://autobuild.buildroot.org/results/951/9514704d6d44fc1b5dd188eac06b269427d3dee2
 - http://autobuild.buildroot.org/results/9ea/9ea060cc35e859ebc73c65fe2d1f7478f9b4fa8d
 - http://autobuild.buildroot.org/results/658/658c06f8125613b56511d3351cdfd3d8e19d48da

Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
index fa420b0d57..ebce4617ac 100644
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
