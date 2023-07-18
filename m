Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9C5EB64DA
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 09:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B67544017A;
	Tue, 18 Jul 2023 09:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B67544017A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JyZAZznunUZJ; Tue, 18 Jul 2023 09:36:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF78840BFA;
	Tue, 18 Jul 2023 09:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF78840BFA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F4DA1BF267
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 09:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 852D04161C
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 09:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 852D04161C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JSAz4-aXf9xl for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 09:36:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99A4F41619
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99A4F41619
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 09:36:21 +0000 (UTC)
Received: from localhost.localdomain ([146.241.105.132])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Lh7yq3an9bLDjLh7yqknqU; Tue, 18 Jul 2023 11:36:18 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 11:36:16 +0200
Message-Id: <20230718093616.48126-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718112050.6d453ad0@windsurf>
References: <20230718112050.6d453ad0@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHzwi1yDcK742W4CZoZ2+FSAYbRZug5luBGunIYvD/ew0a0LbgdAulXP0BNi3s28Qkp6BBYlrmqZ5Ks1CORUrgGVyhNUnH7cmVqi/iKB6yf2DgFXzScS
 iCvqpu30hsiMh0gAz9B8GavhppCJxH047rKVOu0N/xSvLd8AbJkT6mYPLVohfaF4c/33yV9uE8KVCUt7X4/XLK6U+MjbZbXWz/BW7loaYn7PuYNneLXZHDHV
 ve3ExPRrIruduy0H3vOnXjXNmWZ0RoQor/SoINg+U6NBRo1VHFxo79qRDPZpod/8FYv88QhXo6E/UDh1IaRTEw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1689672978; bh=oF3byJxABQLj4ozvzsrhXy52ohkdt5yOGRi8FLtEXks=;
 h=From:To:Subject:Date:MIME-Version;
 b=Tcadxlnlpf3WlhiiLnvHDsbuNC7Vnyjh8Rch2z6Vfqk4VqXZBgsFdWfHDZyqV8vTH
 9StfRZuRItkWk75Lu4uBtu5fx4NzBm2+EbiJt8Akzpr5u+HoS8E9jbDuAxlO66Ix5n
 gPBmpIa3ML+/7NIWJ6zPpPfeF0oJ02UGvtvLkXd/YcBk4L/JXh4uB/T1MgouPRH0ZO
 y1jCLB1iDBMmnn4PNBJfXU/2R/zHt8h2AbDIkyT1kn5KkXaHyhhFoRj3OaKotbGmDq
 ua0xyabyUz0f11EZvA3TBBmsv89cTg8QV0MxO2+SWzVkhiqgvCjJO+Ia+cpbxgbmsK
 dCSx9PdAcdjxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Tcadxlnl
Subject: [Buildroot] [PATCH v2] package/rtl8189fs: fix build with big endian
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

Fixes:
http://autobuild.buildroot.net/results/fe67db3884573ef750eda9d0dccd5f97b3ae698e

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 41 +++++++++++++++++++
 package/rtl8189fs/rtl8189fs.mk                |  6 ++-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch

diff --git a/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
new file mode 100644
index 0000000000..f9e2d6845d
--- /dev/null
+++ b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
@@ -0,0 +1,41 @@
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
+Upstream: https://github.com/jwrdegoede/rtl8189ES_linux/pull/101
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
