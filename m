Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCEDC0219D
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 21:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F34146FB86;
	Fri,  7 Feb 2025 21:49:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdR8ORAyjMz7; Fri,  7 Feb 2025 21:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B80D61288
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B80D61288;
	Fri,  7 Feb 2025 21:49:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D19F0E4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B690B61288
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:49:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HL-OHZ1JHd7h for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 21:49:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E46436FB86
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E46436FB86
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 21:49:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC1D987191; Fri,  7 Feb 2025 21:49:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 7 Feb 2025 22:47:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2f65f3a2b0201be14a740eccb189a503125b080
X-Git-Newrev: 620d0e86ee16d4438c777661774f637d6c98d3fe
X-Patchwork-Hint: ignore
Message-Id: <20250207214917.DC1D987191@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nxp-mwifiex: fix build failure due
 to missing Linux options
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2684331660763345133=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2684331660763345133==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=620d0e86ee16d4438c777661774f637d6c98d3fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Several drivers for different buses (USB, PCIe, SDIO) are compiled by
default. Enable the kernel modules needed by these drivers to prevent
build failure:

CONFIG_NET
CONFIG_WIRELESS
CONFIG_CFG80211
CONFIG_USB_SUPPORT
CONFIG_USB
CONFIG_MMC
CONFIG_PCIE

Fixes: https://autobuild.buildroot.org/results/c679b793d0b81e7569893a03f95b2e0b8c83e268/

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/nxp-mwifiex/nxp-mwifiex.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/nxp-mwifiex/nxp-mwifiex.mk b/package/nxp-mwifiex/nxp-mwifiex.mk
index faacaad289..8f085668f1 100644
--- a/package/nxp-mwifiex/nxp-mwifiex.mk
+++ b/package/nxp-mwifiex/nxp-mwifiex.mk
@@ -11,5 +11,15 @@ NXP_MWIFIEX_LICENSE_FILES = LICENSE
 
 NXP_MWIFIEX_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
 
+define NXP_MWIFIEX_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PCIE)
+endef
+
 $(eval $(kernel-module))
 $(eval $(generic-package))

--===============2684331660763345133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2684331660763345133==--
