Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5007BCDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 22:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D8C60BDA;
	Mon, 16 Oct 2023 22:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5D8C60BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01VpwZz9uiD2; Mon, 16 Oct 2023 22:15:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0184260BEF;
	Mon, 16 Oct 2023 22:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0184260BEF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1828C1BF27E
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 22:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E49ED8138E
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 22:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E49ED8138E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0HDyyZWx648M for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 22:14:59 +0000 (UTC)
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DD2281385
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 22:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DD2281385
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id sVrTqmbnCNhdIsVrTqTkbq; Tue, 17 Oct 2023 00:14:55 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 00:14:54 +0200
Message-Id: <20231016221454.4180844-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfI3z2aVsshIpwGkYQETLVBC6AQZH7HkPQzUhor+gSxwDn7tdk8Vj3kuXLTuxuzw15hV4TuVa5J9s2o/laERQMDKjvYXoGN2rt/AlrxQJHsIC07IhemhV
 SkWRK+d/IXukC0TKXoNv+o9TWoOqjyY345TQZtnHpG6DBVNAe4K6HKEX18zMj5ho9GoO9YqYetN/Z8MUENFh3Lp4MJFFfuFxZGWzr96a7Dkuk0ec3yBP9yL5
 piTFS+4Jcg4kl85WAOpbvHJyQ0mFmf8zMf1ZFHZoGK/sp6dZLCozxFgjlqVxsuBEuoDBVHdY6bqyUqX3VLv5fw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1697494495; bh=UmDPZ/IJ1q7N4AntY18I0/nTUWjASwibxKp2SPvixSU=;
 h=From:To:Subject:Date:MIME-Version;
 b=jahff+EDfhmPftjbcX3u1QK9NeYrLBprmRPxVXM4YzXXNSY8BmR3vkHeal21uC73K
 8Oeu2t2tplV4MfSC4AXSRPwkJmnHij4J/hwulb2OUqTQSV7/CT+Xw7kJVg0sronsXm
 TBDP0whFcIQ2JsnrqaMtc5PnPzpE/hmb9ekgahVgz5nchnUl3zJWjWAl1qm2wm8ZHP
 NHiZHPjdYiGC/8aRUDcPu2a61xxa/KSuXl3YfVxtjFP2XYd15toSNzoVdp5VkJS4Q6
 6CRX3nXbdCFIUZ6mjP5gjjOtgNQ0UCCNvV3R5nQtWx7SvXmjDlv0ujK8BQwxnI5czv
 TOaOCje8IBQNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jahff+ED
Subject: [Buildroot] [PATCH] package/gcnano-binaries: bump version to 6.4.13
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jens Kleintje <scooby22@web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to the latest version 6.4.13 of the gcnano-binaries blob and driver
which are compatible with the last v6.1-stm32mp-r1 kernel from the
STMicroelectronics BSP.

The driver is not contained in a tarball anymore and it's found under
the folder gcnano-driver-stm32mp so we need to add _MODULE_SUBDIRS to
point to that folder and set AQROOT to it as well so the Linux Module
can find config file.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/gcnano-binaries/gcnano-binaries.hash |  2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
index 7bb942e6da..89a6fcbb5a 100644
--- a/package/gcnano-binaries/gcnano-binaries.hash
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b122a0cd7a1bd2cee8c6117b259ef977a765d24e48655f639694cbef471da99b  gcnano-binaries-0ac1a89d7a59d040a69745a85f0da7e98644cc4b.tar.gz
+sha256  8bb1f6ee633f3c30e16b33ff6913286edf31f77b69105a14d147509beba3ea94  gcnano-binaries-5d02efd5cb4cfa85307633891f3cf87550a8bc1d.tar.gz
 sha256  7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index 83261f3b7c..fc1cc7bab3 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-GCNANO_BINARIES_LIB_VERSION = 6.4.9
+GCNANO_BINARIES_LIB_VERSION = 6.4.13
 GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION)
-GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION)-20221206
-GCNANO_BINARIES_VERSION = 0ac1a89d7a59d040a69745a85f0da7e98644cc4b
+GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION)-20230517
+GCNANO_BINARIES_VERSION = 5d02efd5cb4cfa85307633891f3cf87550a8bc1d
 GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
+GCNANO_BINARIES_MODULE_SUBDIRS = gcnano-driver-stm32mp
 
 GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
 GCNANO_BINARIES_LICENSE_FILES = EULA
@@ -21,11 +22,10 @@ GCNANO_BINARIES_INSTALL_STAGING = YES
 GCNANO_BINARIES_PROVIDES = libegl libgles libgbm
 
 # The Github repository doesn't contain the source code as-is: it
-# contains a tarball with the kernel driver source code, and a
-# self-extractible binary for the user-space parts. So we extract both
-# below, and also extract the EULA text from the self-extractible binary
+# contains a self-extractible binary for the user-space parts.
+# So we extract both below, and also extract the EULA text from
+# the self-extractible binary.
 define GCNANO_BINARIES_EXTRACT_HELPER
-	tar --strip-components=1 -xJf $(@D)/gcnano-driver-$(GCNANO_BINARIES_DRIVER_VERSION).tar.xz -C $(@D)
 	awk 'BEGIN      { start = 0; } \
 		/^EOEULA/  { start = 0; } \
 			{ if (start) print; } \
@@ -39,7 +39,7 @@ GCNANO_BINARIES_POST_EXTRACT_HOOKS += GCNANO_BINARIES_EXTRACT_HELPER
 GCNANO_BINARIES_MODULE_MAKE_OPTS = \
 	KERNEL_DIR=$(LINUX_DIR) \
 	SOC_PLATFORM=st-mp1 \
-	AQROOT=$(@D) \
+	AQROOT=$(@D)/gcnano-driver-stm32mp \
 	DEBUG=0
 
 GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
