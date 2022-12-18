Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EBDC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72A8282CA5;
	Mon, 20 Feb 2023 23:10:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72A8282CA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DKigWDbsiZuk; Mon, 20 Feb 2023 23:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88E1F824CB;
	Mon, 20 Feb 2023 23:10:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88E1F824CB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB9291BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FBD8612DB
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FBD8612DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5cLQ5fm7aRXP for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBB37612CF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB37612CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D73578648F; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 15:51:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f51e1f9522393864ea1543e581e485f2e7c1e683
X-Git-Newrev: 2a2db09451371d317ee119d742a62817d5f41c5f
X-Patchwork-Hint: ignore
Message-Id: <20230220205212.D73578648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rtl8723ds-bt: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a2db09451371d317ee119d742a62817d5f41c5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package install the required firmware for enabling the
Bluetooth device embedded in the RTL8723DS chip.
The driver is included in Linux main tree and can be enabled
with the BT_HCIUART_RTL symbol.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>
[Peter: use install -D]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/rtl8723ds-bt/Config.in         |  6 ++++++
 package/rtl8723ds-bt/rtl8723ds-bt.hash |  2 ++
 package/rtl8723ds-bt/rtl8723ds-bt.mk   | 18 ++++++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a0e3c14ab..b52a065dbc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -185,6 +185,7 @@ F:	package/qt5/qt5coap/
 F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
 F:	package/rtl8723ds/
+F:	package/rtl8723ds-bt/
 F:	package/sam-ba/
 F:	package/sshguard/
 F:	package/sunwait/
diff --git a/package/Config.in b/package/Config.in
index 914c3584e9..999feae08a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -585,6 +585,7 @@ endmenu
 	source "package/rtl8192eu/Config.in"
 	source "package/rtl8723bu/Config.in"
 	source "package/rtl8723ds/Config.in"
+	source "package/rtl8723ds-bt/Config.in"
 	source "package/rtl8812au-aircrack-ng/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/sane-backends/Config.in"
diff --git a/package/rtl8723ds-bt/Config.in b/package/rtl8723ds-bt/Config.in
new file mode 100644
index 0000000000..0a604310c0
--- /dev/null
+++ b/package/rtl8723ds-bt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_RTL8723DS_BT
+	bool "rtl8723ds-bt"
+	help
+	  rtl8723ds UART attached Bluetooth module firmware.
+
+	  https://github.com/wsyco/RTL8723DS_BT_Linux
diff --git a/package/rtl8723ds-bt/rtl8723ds-bt.hash b/package/rtl8723ds-bt/rtl8723ds-bt.hash
new file mode 100644
index 0000000000..1ec4e350f9
--- /dev/null
+++ b/package/rtl8723ds-bt/rtl8723ds-bt.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256  9e70a981946abeeb6437d9a27d8437cea15aa4df72f8d56ded0ae28af484d2f4  rtl8723ds-bt-14cedf3a9fec1aa8c500fa52f3e3acc433cbcf08.tar.gz
diff --git a/package/rtl8723ds-bt/rtl8723ds-bt.mk b/package/rtl8723ds-bt/rtl8723ds-bt.mk
new file mode 100644
index 0000000000..423ad74df5
--- /dev/null
+++ b/package/rtl8723ds-bt/rtl8723ds-bt.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# rtl8723ds-bt
+#
+################################################################################
+
+RTL8723DS_BT_VERSION = 14cedf3a9fec1aa8c500fa52f3e3acc433cbcf08
+RTL8723DS_BT_SITE = $(call github,wsyco,RTL8723DS_BT_Linux,$(RTL8723DS_BT_VERSION))
+RTL8723DS_BT_LICENSE = PROPRIETARY
+
+define RTL8723DS_BT_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 -D $(@D)/8723D/rtl8723d_fw \
+		$(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723ds_fw.bin
+	$(INSTALL) -m 644 -D $(@D)/8723D/rtl8723d_config \
+		$(TARGET_DIR)/lib/firmware/rtl_bt/rtl8723ds_config.bin
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
