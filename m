Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DADC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7ED36F610;
	Fri, 28 Feb 2025 17:13:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QItAEGbg-nBw; Fri, 28 Feb 2025 17:13:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF3D27087B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF3D27087B;
	Fri, 28 Feb 2025 17:13:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1305C711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E4BF42F41
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Xa2SjLYKDjg for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 735E041A23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 735E041A23
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7056385FAE; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 18:09:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ceb4cc30da8e143f9c3d25dfe4456237f8ab1274
X-Git-Newrev: 1c386996012b46205b096617474719c03633550d
X-Patchwork-Hint: ignore
Message-Id: <20250228163032.7056385FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nxp-mwifiex: new
 package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5327367366945656789=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5327367366945656789==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1c386996012b46205b096617474719c03633550d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Linux kernel driver from NXP for WiFi chipsets IW416 / IW610 / IW612 /
W8801 / W8987 / W8997 / W9098.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/nxp-mwifiex/Config.in        | 11 +++++++++++
 package/nxp-mwifiex/nxp-mwifiex.hash |  3 +++
 package/nxp-mwifiex/nxp-mwifiex.mk   | 15 +++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 909de4a871..24fb3e07e0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2948,6 +2948,7 @@ N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	board/armadeus/
 F:	configs/armadeus*
 F:	package/nxp-bt-wifi-firmware/
+F:	package/nxp-mwifiex/
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
 F:	package/python-flask-login/
diff --git a/package/Config.in b/package/Config.in
index c2d1693b46..83f69f9004 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -571,6 +571,7 @@ endmenu
 	source "package/nvidia-modprobe/Config.in"
 	source "package/nvidia-persistenced/Config.in"
 	source "package/nvme/Config.in"
+	source "package/nxp-mwifiex/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
 	source "package/open2300/Config.in"
diff --git a/package/nxp-mwifiex/Config.in b/package/nxp-mwifiex/Config.in
new file mode 100644
index 0000000000..7399705b28
--- /dev/null
+++ b/package/nxp-mwifiex/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_NXP_MWIFIEX
+	bool "nxp-mwifiex"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Linux kernel driver from NXP for WiFi chipsets
+	  IW416 / IW610 / IW612 / W8801 / W8987 / W8997 / W9098.
+
+	  https://github.com/nxp-imx/mwifiex
+
+comment "nxp-mwifiex needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/nxp-mwifiex/nxp-mwifiex.hash b/package/nxp-mwifiex/nxp-mwifiex.hash
new file mode 100644
index 0000000000..559e89cb37
--- /dev/null
+++ b/package/nxp-mwifiex/nxp-mwifiex.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  dcffe6c48babf7db82aac4704b056cffc06a1f80008cd9c23ab0479fc890ba99  nxp-mwifiex-lf-6.6.52_2.2.0.tar.gz
+sha256  67d461bc478d220fcdf99c59d8ea17fffbd1881718281aa4947eb608fcd568bb  LICENSE
diff --git a/package/nxp-mwifiex/nxp-mwifiex.mk b/package/nxp-mwifiex/nxp-mwifiex.mk
new file mode 100644
index 0000000000..faacaad289
--- /dev/null
+++ b/package/nxp-mwifiex/nxp-mwifiex.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# nxp-mwifiex
+#
+################################################################################
+
+NXP_MWIFIEX_VERSION = lf-6.6.52_2.2.0
+NXP_MWIFIEX_SITE = $(call github,nxp-imx,mwifiex,$(NXP_MWIFIEX_VERSION))
+NXP_MWIFIEX_LICENSE = GPL-2.0
+NXP_MWIFIEX_LICENSE_FILES = LICENSE
+
+NXP_MWIFIEX_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
+
+$(eval $(kernel-module))
+$(eval $(generic-package))

--===============5327367366945656789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5327367366945656789==--
