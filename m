Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F95C4332F
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 10:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7D4041852;
	Thu,  8 Dec 2022 10:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7D4041852
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1JzNyUuHMTfI; Thu,  8 Dec 2022 10:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B178040237;
	Thu,  8 Dec 2022 10:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B178040237
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA6081BF3ED
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:01:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 860EC60E59
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 10:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 860EC60E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWOoURI_wZ9s for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3E1560ACC
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3E1560ACC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E00A85E67; Thu,  8 Dec 2022 10:01:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Dec 2022 10:49:30 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 33c29319507b133b605fc9e79fb53836cbec3ff5
X-Git-Newrev: 4dda5e28809beb62745715b5c0d5ac57e55c1db6
X-Patchwork-Hint: ignore
Message-Id: <20221208100118.9E00A85E67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/rtl8723bu: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dda5e28809beb62745715b5c0d5ac57e55c1db6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

This driver requires:
CONFIG_NET
CONFIG_WIRELESS
CONFIG_CFG80211
CONFIG_USB_SUPPORT
CONFIG_USB
to build so let's add them to RTL8723BU_LINUX_CONFIG_FIXUPS.

Fixes:
http://autobuild.buildroot.net/results/7f3637760ad88d314e6812865f3667d1de091957/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1978e9b0219712b2b839d9f44a0b98b2e8280f75)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl8723bu/rtl8723bu.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 3da8d9cecf..82c487b4e1 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -12,6 +12,14 @@ RTL8723BU_MODULE_MAKE_OPTS = \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR)
 
+define RTL8723BU_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
+endef
+
 define RTL8723BU_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 644 $(@D)/rtl8723b_fw.bin $(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723b_fw.bin
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
