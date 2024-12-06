Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F54E77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 21:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 496A860655;
	Fri,  6 Dec 2024 21:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLSnNw4zhYn2; Fri,  6 Dec 2024 21:11:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48AE560693
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48AE560693;
	Fri,  6 Dec 2024 21:11:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FAD5ED7
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D3568115C
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:11:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f73jSlc7Ilbm for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 21:11:03 +0000 (UTC)
X-Greylist: delayed 449 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 06 Dec 2024 21:11:02 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5055B8114D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5055B8114D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.23.81.152;
 helo=mail-a.sr.ht; envelope-from=outgoing@sr.ht; receiver=<UNKNOWN> 
Received: from mail-a.sr.ht (mail-a.sr.ht [46.23.81.152])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5055B8114D
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:11:02 +0000 (UTC)
Received: from git.sr.ht (unknown [46.23.81.155])
 by mail-a.sr.ht (Postfix) with ESMTPSA id 90F89208F3
 for <buildroot@buildroot.org>; Fri, 06 Dec 2024 21:03:29 +0000 (UTC)
From: ~ysi-camerona <ysi-camerona@git.sr.ht>
Date: Fri, 06 Dec 2024 14:55:33 -0600
Message-ID: <173351900956.17386.4143656986869554215-0@git.sr.ht>
X-Mailer: git.sr.ht
To: buildroot@buildroot.org
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=rh1B5OFn3goAGpiWAevQGe8UHC8lsGcKz8CY9z0w4GM=; 
 c=simple/simple; d=git.sr.ht; h=From:Date:Subject:Reply-to:To; q=dns/txt;
 s=20240113; t=1733519009; v=1;
 b=fiQ9vu3Jl2sZne0NjvdZssLR8L97pyUxwIXT7VItNkC6zoruBaqvWF7qY/Xe1ndyRTT9ThPy
 3SNJBGOTPXLc7wA+ZX7Sc6LPM+ekg7SWZ8FBRxItI+B/A9xRElbw4Dvc1GG8w/JqCN/u5u7FK1T
 AM8gpqxcpJ2hD5e24FEj+XKCQ+puhQfHll4jdcEspWzhOXIuxR/aqNARcc6YXtgkpaaTjgu4DZ9
 M+yKeE2PCHvo97oGXhLVY51IWCcSaYcukAlGPpDpOUyxit/pYbQFIhcrIgaXSUB6bhrrdnA1vS6
 tW+byRGKKxBtvKEy0U5dY1D54deE6rDh3bIqUdyZIamBw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=git.sr.ht
Subject: [Buildroot] [PATCH buildroot] package/rpi-pinctrl: create package
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
Reply-To: ~ysi-camerona <cameron.auser@yardi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Cameron Auser <cameron.auser@yardi.com>

pinctrl supersedes raspi-gpio for GPIO control on Raspberry Pi boards.

Signed-off-by: Cameron Auser <cameron.auser@yardi.com>
---
 package/Config.in                    |  1 +
 package/rpi-pinctrl/Config.in        | 11 +++++++++++
 package/rpi-pinctrl/rpi-pinctrl.hash |  3 +++
 package/rpi-pinctrl/rpi-pinctrl.mk   | 13 +++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/rpi-pinctrl/Config.in
 create mode 100644 package/rpi-pinctrl/rpi-pinctrl.hash
 create mode 100644 package/rpi-pinctrl/rpi-pinctrl.mk

diff --git a/package/Config.in b/package/Config.in
index 1eb5e1e020..0709d043d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -602,6 +602,7 @@ endmenu
 	source "package/rng-tools/Config.in"
 	source "package/rockchip-mali/Config.in"
 	source "package/rockchip-rkbin/Config.in"
+	source "package/rpi-pinctrl/Config.in"
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
diff --git a/package/rpi-pinctrl/Config.in b/package/rpi-pinctrl/Config.in
new file mode 100644
index 0000000000..1549e3ade9
--- /dev/null
+++ b/package/rpi-pinctrl/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_RPI_PINCTRL
+	bool "rpi-pinctrl"
+	select BR2_PACKAGE_LIBGPIOD2
+	help
+	  pinctrl is a more powerful replacement for raspi-gpio,
+	  a tool for displaying and modifying the GPIO and
+	  pin muxing state of a system. It accesses the hardware
+	  directly, bypassing the kernel drivers, and as such
+	  requires root privilege
+
+	  https://github.com/raspberrypi/utils
diff --git a/package/rpi-pinctrl/rpi-pinctrl.hash b/package/rpi-pinctrl/rpi-pinctrl.hash
new file mode 100644
index 0000000000..f5eca23cb0
--- /dev/null
+++ b/package/rpi-pinctrl/rpi-pinctrl.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  a7283b964982f1cced58f6b357a3e14090db2d54f4fe91340e448e2443cb9d9c  rpi-pinctrl-2a79d719687d5cea097927069434b8075df06850.tar.gz
+sha256  731da956431d1a7c5073e7ee5ebe01f54e359c5339310b32f0893c6fe6507d5a  LICENCE
diff --git a/package/rpi-pinctrl/rpi-pinctrl.mk b/package/rpi-pinctrl/rpi-pinctrl.mk
new file mode 100644
index 0000000000..ef7c07e3fb
--- /dev/null
+++ b/package/rpi-pinctrl/rpi-pinctrl.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# rpi-pinctrl
+#
+################################################################################
+
+RPI_PINCTRL_VERSION = 2a79d719687d5cea097927069434b8075df06850
+RPI_PINCTRL_SITE = $(call github,raspberrypi,utils,$(RPI_PINCTRL_VERSION))
+RPI_PINCTRL_LICENSE = BSD-3-Clause
+RPI_PINCTRL_LICENSE_FILES = LICENSE
+RPI_PINCTRL_SUBDIR = pinctrl
+
+$(eval $(cmake-package))
-- 
2.45.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
