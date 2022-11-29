Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C919C4332F
	for <buildroot@archiver.kernel.org>; Tue, 29 Nov 2022 21:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CDBA81E92;
	Tue, 29 Nov 2022 21:08:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CDBA81E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVouqiXc1tzF; Tue, 29 Nov 2022 21:08:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C301E81E83;
	Tue, 29 Nov 2022 21:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C301E81E83
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5FF41BF95D
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 21:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE91B81E92
 for <buildroot@lists.busybox.net>; Tue, 29 Nov 2022 21:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE91B81E92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwMNqMLNq-Yd for <buildroot@lists.busybox.net>;
 Tue, 29 Nov 2022 21:08:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D0E481E6F
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D0E481E6F
 for <buildroot@buildroot.org>; Tue, 29 Nov 2022 21:08:03 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 07php9pOq9JRB07pipVkmo; Tue, 29 Nov 2022 22:08:02 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 29 Nov 2022 22:08:00 +0100
Message-Id: <20221129210800.802451-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129210800.802451-1-giulio.benetti@benettiengineering.com>
References: <20221129210800.802451-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfE2f9rDMQV4pP5cwjgdac4PRXP+NoPbbu5zNCwrdZ/U7nwfQJKZZaQmQyUp0hUQKmfuV+YsqktOrK2PREuQhtDo2RyGXiikG5st0jB64im9nKb1CuRAR
 Oq/xnUUdEaAmhUdyddzgYrRi3kaU9Uzu6MLahK+RDm5bkxwVKtNb1qoYaDW90Yx5Ryk1aQDXyFi5tNtr/9x2fp8sWf88bh0FYEPwmYGzG8L4iory6Bo9lY8F
 +gNrHvwFD0IbqZ90vNlW5Mj0q8gcjJCORxfLpjrLxqz1yJoOyOEznjs31kkVsuRlgTi0kI1v9QAQkg8A4r/HhQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669756082; bh=vK7eGJ2tbPjlL0oUXJMucIsoCwgBwg4/DREyHVvscmY=;
 h=From:To:Subject:Date:MIME-Version;
 b=LkQQBvC8z857ImsgHRKYc/BtyJ6LPEgAQEHxORGafEBBKq5OPks/XAUfQRNwEj+rE
 axyy/fZ6y3d1en2i0M9x6lrvuOhItycauCyyNmA01uKq603BWYCpe1GKawAZEA3CpF
 DnFEx/IcpdadE6WrVF1yFxl9lkjK0BGA/85H1w8SOkhAr6tnx5s7tCnIwMhGl8u3HG
 yTYvRDV37ymQ3zVsTdtccoNOHR2/9jJz83nrw6EumPl0DTZPk7R+IWQL/OMDo9pDY2
 DdX4W5zC06lEdg1FTZ6MTeIywFCuE6DowtnPKbiW4bLl0Onme8F/6JQef3I2Teadzd
 xr2kEHEhAZ6kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=LkQQBvC8
Subject: [Buildroot] [PATCH 2/2] package/rtl8192eu: fix build failure on Big
 Endian architectures
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch that allows to override CONFIG_LITTLE_ENDIAN in case we're
building for Big Endian architectures. Then let's undefine
CONFIG_LITTLE_ENDIAN and define endianness according to $(BR2_ENDIAN).

Fixes:
http://autobuild.buildroot.net/results/13a/13a809570423ead33628663033db4c3c4001a79b/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 40 +++++++++++++++++++
 package/rtl8192eu/rtl8192eu.mk                |  9 ++++-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch

diff --git a/package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
new file mode 100644
index 0000000000..2f6ecfb210
--- /dev/null
+++ b/package/rtl8192eu/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
@@ -0,0 +1,40 @@
+From f51cbcbeafd8d60e9b8f35b7ca62b6c941d72e3b Mon Sep 17 00:00:00 2001
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
+[Upstream status: https://github.com/clnhub/rtl8192eu-linux/pull/65]
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 32a1898..b67a5a4 100755
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,3 @@
+-EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
+ EXTRA_CFLAGS += -O1
+ #EXTRA_CFLAGS += -O3
+ #EXTRA_CFLAGS += -Wall
+@@ -2329,6 +2328,8 @@ ifneq ($(USER_MODULE_NAME),)
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
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index 0e8ffea5cb..589cb7f59e 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -7,9 +7,16 @@
 RTL8192EU_VERSION = 1e15b6d451731bc4d3ffd587194dc4bd0f286ac0
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
+
+# Undefine the hardcoded CONFIG_LITTLE_ENDIAN
+RTL8192EU_USER_EXTRA_CLAGS = -UCONFIG_LITTLE_ENDIAN
+# Set endianness
+RTL8192EU_USER_EXTRA_CLAGS += -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+RTL8192EU_USER_EXTRA_CLAGS += -Wno-error
+
 RTL8192EU_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8192EU=m \
-	USER_EXTRA_CFLAGS="-Wno-error"
+	USER_EXTRA_CFLAGS="$(RTL8192EU_USER_EXTRA_CLAGS)"
 
 define RTL8192EU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
