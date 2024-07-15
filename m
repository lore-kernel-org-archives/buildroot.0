Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C772DC3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 19:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBB9D40674;
	Mon, 15 Jul 2024 19:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7o4d-1eVtlvh; Mon, 15 Jul 2024 19:43:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5866A4067D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5866A4067D;
	Mon, 15 Jul 2024 19:43:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B4D11BF3D4
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5687D6074B
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mym_cYoTOIEI for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 19:43:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6554A607B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6554A607B1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 19:43:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10FB686C71; Mon, 15 Jul 2024 19:43:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 21:42:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5511e26b4f39c42c57a202d5da53c3cb570961d9
X-Git-Newrev: f7aac1c008f9c59f8c669bade17864b099221065
X-Patchwork-Hint: ignore
Message-Id: <20240715194317.10FB686C71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/picotool: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7aac1c008f9c59f8c669bade17864b099221065
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the raspberry pi picotool for interacting with rp2040 binaries and
devices.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/picotool/Config.in     | 16 ++++++++++++++++
 package/picotool/picotool.hash |  3 +++
 package/picotool/picotool.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7e709feb3a..f7b7db53ce 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2187,6 +2187,7 @@ F:	utils/diffconfig
 
 N:	Marcus Hoffmann <bubu@bubu1.eu>
 F:	package/pico-sdk/
+F:	package/picotool/
 F:	package/python-jc/
 F:	package/python-ruamel-yaml-clib/
 F:	support/testing/tests/package/test_python_fastapi.py
diff --git a/package/Config.in b/package/Config.in
index 0ba816d378..b9f5c4d7c2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -585,6 +585,7 @@ endmenu
 	source "package/pciutils/Config.in"
 	source "package/pdbg/Config.in"
 	source "package/picocom/Config.in"
+	source "package/picotool/Config.in"
 	source "package/pifmrds/Config.in"
 	source "package/pigpio/Config.in"
 	source "package/powertop/Config.in"
diff --git a/package/picotool/Config.in b/package/picotool/Config.in
new file mode 100644
index 0000000000..0046f8ad61
--- /dev/null
+++ b/package/picotool/Config.in
@@ -0,0 +1,16 @@
+comment "picotool needs a toolchain w/ C++ and gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_4_9
+
+config BR2_PACKAGE_PICOTOOL
+	bool "picotool"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libusb
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_PICO_SDK
+	help
+	  picotool is a tool for inspecting rp2040 binaries and
+	  interacting with rp2040 devices when they are in bootsel
+	  mode or devices USBstdio support from the Raspberry Pi Pico
+	  SDK.
+
+	  https://github.com/raspberrypi/picotool
diff --git a/package/picotool/picotool.hash b/package/picotool/picotool.hash
new file mode 100644
index 0000000000..26b790d968
--- /dev/null
+++ b/package/picotool/picotool.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f1746ead7815c13be1152f0645db8ea3b277628eb0110d42a0a186db37d40a91  picotool-1.1.2.tar.gz
+sha256  483f865953435b66c443dee7558debe3cc3cf8fcbb6a112fd9fc6a795d53f1f6  LICENSE.TXT
diff --git a/package/picotool/picotool.mk b/package/picotool/picotool.mk
new file mode 100644
index 0000000000..42f74fb244
--- /dev/null
+++ b/package/picotool/picotool.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# picotool
+#
+################################################################################
+
+PICOTOOL_VERSION = 1.1.2
+PICOTOOL_SITE = $(call github,raspberrypi,picotool,$(PICOTOOL_VERSION))
+PICOTOOL_CONF_OPTS = -DPICO_SDK_PATH=$(STAGING_DIR)/usr/share/pico-sdk
+PICOTOOL_DEPENDENCIES = libusb pico-sdk
+PICOTOOL_LICENSE = BSD-3-Clause
+PICOTOOL_LICENSE_FILES = LICENSE.TXT
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
