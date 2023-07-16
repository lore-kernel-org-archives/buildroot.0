Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C5EC001B0
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 21:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17D73408CC;
	Sun, 16 Jul 2023 21:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17D73408CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSoG3EDnUXdk; Sun, 16 Jul 2023 21:29:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3C32408CA;
	Sun, 16 Jul 2023 21:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3C32408CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AE8CF1BF861
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 21:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94554408CA
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 21:29:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94554408CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OyVxVDQfG2D4 for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 21:29:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61D06408C9
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61D06408C9
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 21:29:00 +0000 (UTC)
Received: from localhost.localdomain ([146.241.50.181])
 by Aruba Outgoing Smtp  with ESMTPSA
 id L9IXq5qhQOXtDL9IXqagQI; Sun, 16 Jul 2023 23:28:57 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 23:28:56 +0200
Message-Id: <20230716212856.24353-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA+69IN8Z5G7JwZ0jBsEmkA4l8B0OPV0vlGPWjT0Qu9aLuXQ00W3fe3bTVy+7nm3Z9Ujz2/rn7cJ2EQ7D+6qsMTK0nB7hFwx0lr2azhWqNLhgD217y2s
 G7oFHdPIpjPY471heEVcg6WRMhWahkEsFkABHSF2/wcCRLCCVPK++sq2XRF0leCAI3GkUFTMB0q+RFOyn68AUMtLOqaPq1B9OmM6LvMOl4JTVCQMjFL3wzo8
 Q1iqDar/Id1+J933ioP5S6/F/cJhBsaERq7kkX12OdscWdcy0r8+Lr8wTAX5M2coRePTuawOxZhQfoGiKqkRgQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1689542937; bh=APauJKFhEh1kgG9XdmdruNca/d3ya3NbW3PtsJIme28=;
 h=From:To:Subject:Date:MIME-Version;
 b=C50Tgkb3zE6cn9OVUC1+hbuL8A1UTENoglL2I1kX3Hw+7Uj2GoiJil7bp21ay27t+
 9JMxyQ6iqxCpse6IOb8lRXxW3ebBbNp2JBaJq9PYkz21V4/+/G3fNk1IJIcRDYVfmW
 okRngaJiUJOpx5IDw8/iPh6/NYOEb+eKQ8V+rOj14Cd03Bi8W2IMQQ7wyFbJ4mtz78
 PZ6dc7UHkrwPijBMGSdOD51nqC30t44hGRZS+TAAc2QHNIbTKu92da+yHH0Jppxbh9
 p6dcu8wT3d93MCQu8v685ZfEmOqOip4ptEB1l9a/BQE+ZH9YZKRK7iUCbXxX5wS2Cy
 6vmSNTK2eSOgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=C50Tgkb3
Subject: [Buildroot] [PATCH] package/rtl8189fs: fix build with big endian
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
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch to allow to override CFLAGS and undefine
CONFIG_LITTLE_ENDIAN by default and use the correct endianness according
to target architecture.

Upstream: https://github.com/jwrdegoede/rtl8189ES_linux/pull/101

Fixes:
http://autobuild.buildroot.net/results/fe67db3884573ef750eda9d0dccd5f97b3ae698e

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 39 +++++++++++++++++++
 package/rtl8189fs/rtl8189fs.mk                |  6 ++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch

diff --git a/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
new file mode 100644
index 0000000000..93ce8ee33e
--- /dev/null
+++ b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
@@ -0,0 +1,39 @@
+From f48d99fab8b79e573850067a3ff2d8c16aa95ce1 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 28 Sep 2022 21:17:17 +0200
+Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)' at the
+ end of EXTRA_FLAGS assignment
+
+At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAGS
+since it's assigned at the beginning of the Makefile. For example it's not
+possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't
+allow to build these modules for big endian architectures. So let's move
+the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
+EXTRA_CFLAGS assignment.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index dfca305..6f91d0a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,3 @@
+-EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
+ EXTRA_CFLAGS += -O1
+ #EXTRA_CFLAGS += -O3
+ #EXTRA_CFLAGS += -Wall
+@@ -2208,6 +2207,8 @@ ifneq ($(USER_MODULE_NAME),)
+ MODULE_NAME := $(USER_MODULE_NAME)
+ endif
+ 
++EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
++
+ ifneq ($(KERNELRELEASE),)
+ 
+ ########### this part for *.mk ############################
+-- 
+2.34.1
+
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index c3eef6e071..359cee3e67 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -8,10 +8,14 @@ RTL8189FS_VERSION = 75a566a830037c7d1309c5a9fe411562772a1cf2
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
+RTL8189FS_USER_EXTRA_CFLAGS = -UCONFIG_LITTLE_ENDIAN \
+			      -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+
 RTL8189FS_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8189FS=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR)
+	KSRC=$(LINUX_DIR) \
+	USER_EXTRA_CFLAGS="$(RTL8189FS_USER_EXTRA_CFLAGS)"
 
 ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),)
 RTL8189FS_MODULE_MAKE_OPTS += CONFIG_RTW_DEBUG=n
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
