Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE418C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 19:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8909340653;
	Mon, 15 Jul 2024 19:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UMocAzddz4Im; Mon, 15 Jul 2024 19:56:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E56040624
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E56040624;
	Mon, 15 Jul 2024 19:56:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B8DC1BF3D4
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67E8E4050A
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 19:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dWSuiehwor-3 for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 19:56:52 +0000 (UTC)
X-Greylist: delayed 595 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 15 Jul 2024 19:56:51 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9B1E1404FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B1E1404FE
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=188.68.63.102; helo=relay.yourmailgateway.de;
 envelope-from=mail@t-voltmer.net; receiver=<UNKNOWN> 
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B1E1404FE
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 19:56:51 +0000 (UTC)
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
 by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4WNCQ61svFz60LY
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 21:46:54 +0200 (CEST)
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4WNCQ6194Hz4xfl
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 21:46:54 +0200 (CEST)
Received: from mxe217.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4WNCQ56XFyz8sgW
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 21:46:53 +0200 (CEST)
Received: from cygn.fritz.box (ipb21a3d34.dynamic.kabel-deutschland.de
 [178.26.61.52])
 by mxe217.netcup.net (Postfix) with ESMTPSA id A8AF483C07;
 Mon, 15 Jul 2024 21:46:48 +0200 (CEST)
From: Torben Voltmer <mail@t-voltmer.net>
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 21:46:35 +0200
Message-ID: <20240715194635.949193-1-mail@t-voltmer.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Rspamd-Queue-Id: A8AF483C07
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: nLejgGFjcJ9NaU2FmRxMl7ULa3nutcr4kJkz4noewYcF5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=t-voltmer.net
X-Mailman-Original-Authentication-Results: mors-relay-2502.netcup.net;
 dkim=permerror (bad
 message/signature format)
Subject: [Buildroot] [PATCH 1/1] package/espflash: new package
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
Cc: Torben Voltmer <mail@t-voltmer.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package provides espflash. A serial flasher utilities for
Espressif devices, based loosely on esptool.py. Supports the
ESP32, ESP32-C2/C3/C6, ESP32-H2, ESP32-P4, and ESP32-S2/S3.

Signed-off-by: Torben Voltmer <mail@t-voltmer.net>
---
 package/Config.in              |  1 +
 package/espflash/Config.in     | 10 ++++++++++
 package/espflash/espflash.hash |  4 ++++
 package/espflash/espflash.mk   | 13 +++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/espflash/Config.in
 create mode 100644 package/espflash/espflash.hash
 create mode 100644 package/espflash/espflash.mk

diff --git a/package/Config.in b/package/Config.in
index 6c390f7bd3..dfd598d626 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -508,6 +508,7 @@ endmenu
 	source "package/edk2-non-osi/Config.in"
 	source "package/edk2-platforms/Config.in"
 	source "package/esp-hosted/Config.in"
+	source "package/espflash/Config.in"
 	source "package/eudev/Config.in"
 	source "package/ev3dev-linux-drivers/Config.in"
 	source "package/evemu/Config.in"
diff --git a/package/espflash/Config.in b/package/espflash/Config.in
new file mode 100644
index 0000000000..2a7a0f6b38
--- /dev/null
+++ b/package/espflash/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_ESPFLASH
+	bool "espflash"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  Serial flasher utilities for Espressif devices, based
+	  loosely on esptool.py. Supports the ESP32,
+	  ESP32-C2/C3/C6, ESP32-H2, ESP32-P4, and ESP32-S2/S3.
+
+	  https://github.com/esp-rs/espflash
diff --git a/package/espflash/espflash.hash b/package/espflash/espflash.hash
new file mode 100644
index 0000000000..ebe24ef51f
--- /dev/null
+++ b/package/espflash/espflash.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  8e5da5e90d03135a1b2af6c0b551e4f2504ad64e659b0e88e8a4ecd98cc6a6b6  espflash-3.1.0-cargo2.tar.gz
+sha256  0886cf791a43c02d71c105b4835b53293704ec407a72f84a87f73e20cb2d3251  LICENSE-APACHE
+sha256  a75018ab59a13738ed2024a0090ae8f91b7693ae84568aa0e52c3dff99e6748d  LICENSE-MIT
diff --git a/package/espflash/espflash.mk b/package/espflash/espflash.mk
new file mode 100644
index 0000000000..43532de58c
--- /dev/null
+++ b/package/espflash/espflash.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# espflash
+#
+################################################################################
+
+ESPFLASH_VERSION = 3.1.0
+ESPFLASH_SITE = $(call github,esp-rs,espflash,v$(ESPFLASH_VERSION))
+ESPFLASH_SUBDIR = espflash
+ESPFLASH_LICENSE = Apache-2.0 or MIT
+ESPFLASH_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(cargo-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
