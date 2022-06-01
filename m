Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE65C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 868E26102F;
	Tue,  7 Jun 2022 19:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EkYf0YPGMI_w; Tue,  7 Jun 2022 19:22:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 970E261016;
	Tue,  7 Jun 2022 19:22:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3871BF475
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5871F8404D
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GhsEan4ap2Ay for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A29F183F6F
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 95D9686E21; Tue,  7 Jun 2022 19:04:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 21:34:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4141e017e199b4da088c33ce1f301d160ad23ed2
X-Git-Newrev: dd018f78de99ea78633694dba011f155849dde32
X-Patchwork-Hint: ignore
Message-Id: <20220607190457.95D9686E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8723ds: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dd018f78de99ea78633694dba011f155849dde32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package adds a driver for Realtek RTL8723DS wifi chip.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/rtl8723ds/Config.in    | 10 ++++++++++
 package/rtl8723ds/rtl8723ds.mk | 23 +++++++++++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 096ca94f4e..fe840f33f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -181,6 +181,7 @@ F:	package/python-web2py/
 F:	package/qt5/qt5coap/
 F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
+F:	package/rtl8723ds/
 F:	package/sam-ba/
 F:	package/sshguard/
 F:	package/sunwait/
diff --git a/package/Config.in b/package/Config.in
index 8892134133..4ab61713e0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -566,6 +566,7 @@ endmenu
 	source "package/rtl8189fs/Config.in"
 	source "package/rtl8723bs/Config.in"
 	source "package/rtl8723bu/Config.in"
+	source "package/rtl8723ds/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
diff --git a/package/rtl8723ds/Config.in b/package/rtl8723ds/Config.in
new file mode 100644
index 0000000000..ef7dd39a68
--- /dev/null
+++ b/package/rtl8723ds/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RTL8723DS
+	bool "rtl8723ds"
+	depends on BR2_LINUX_KERNEL
+	help
+	  rtl8723bs wifi driver
+
+	  https://github.com/lwfinger/rtl8723ds
+
+comment "rtl8723ds needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
new file mode 100644
index 0000000000..da25ffe9a7
--- /dev/null
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# rtl8723ds
+#
+################################################################################
+
+RTL8723DS_VERSION = 76146e85847beb2427b1d4958fa275822f2b04ab
+RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
+RTL8723DS_LICENSE = GPL-2.0
+
+RTL8723DS_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8723DS=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	KSRC=$(LINUX_DIR)
+
+define RTL8723DS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+endef
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
