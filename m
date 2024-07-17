Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32B4C3DA60
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 21:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84F08400C1;
	Wed, 17 Jul 2024 21:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNSi3r_hu6lE; Wed, 17 Jul 2024 21:32:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23B6C40C56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23B6C40C56;
	Wed, 17 Jul 2024 21:32:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 628391BF385
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B7BB40C56
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 21:32:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_oLk3jt1kUw for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 21:32:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2901740C0E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2901740C0E
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 21:32:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11D9886D23; Wed, 17 Jul 2024 21:32:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 23:32:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 281134f346ad8652dffd89b4488beb00e8ccd5d0
X-Git-Newrev: 23fd1f85543f2aa048914834252a659989c81db2
X-Patchwork-Hint: ignore
Message-Id: <20240717213233.11D9886D23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/espflash: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=23fd1f85543f2aa048914834252a659989c81db2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides espflash. A serial flasher utilities for
Espressif devices, based loosely on esptool.py. Supports the
ESP32, ESP32-C2/C3/C6, ESP32-H2, ESP32-P4, and ESP32-S2/S3.

Signed-off-by: Torben Voltmer <mail@t-voltmer.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                     |  3 +++
 package/Config.in              |  1 +
 package/espflash/Config.in     | 10 ++++++++++
 package/espflash/espflash.hash |  4 ++++
 package/espflash/espflash.mk   | 13 +++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 08c120a60f..e51d56daa2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3193,6 +3193,9 @@ F:	support/testing/tests/package/test_redis.py
 N:	Tobias Waldekranz <tobias@waldekranz.com>
 F:	package/kmemd/
 
+N:	Torben Voltmer <mail@t-voltmer.net>
+F:	package/espflash/
+
 N:	Tudor Holton <buildroot@tudorholton.com>
 F:	package/openjdk/
 
diff --git a/package/Config.in b/package/Config.in
index a7cb768dcd..d6658f185f 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
