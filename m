Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7123CC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:10:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CDBB40480;
	Sun, 30 Oct 2022 14:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CDBB40480
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id toN-Q_yrTIFu; Sun, 30 Oct 2022 14:10:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 539A240423;
	Sun, 30 Oct 2022 14:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 539A240423
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2241BF487
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE40A80F2C
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE40A80F2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvYfl1rIT-KK for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:09:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFF0C80BB2
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFF0C80BB2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDC7B87515; Sun, 30 Oct 2022 14:09:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 15:09:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f50d96114ba5c039292653b3b519bcc3ab48fe2
X-Git-Newrev: abf2593ead935d07d7d2eaad2a74a4f31f59012a
X-Patchwork-Hint: ignore
Message-Id: <20221030140917.DDC7B87515@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8189fs: bump to latest version
 to fix build failure with linux >= 6.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=abf2593ead935d07d7d2eaad2a74a4f31f59012a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let's also drop local patch in favor of the upstream pending patch we
already use for package rtl8189es to deal with endianness.

Fixes:
http://autobuild.buildroot.net/results/841cf9da4b07ae4bdc14d049f2585b09a95a92f5/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ve-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 40 ++++++++++++++++++++++
 .../0001-Makefile-remove-default-endianness.patch  | 30 ----------------
 package/rtl8189fs/rtl8189fs.hash                   |  2 +-
 package/rtl8189fs/rtl8189fs.mk                     |  9 +++--
 4 files changed, 48 insertions(+), 33 deletions(-)

diff --git a/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
new file mode 100644
index 0000000000..dc4deff9f1
--- /dev/null
+++ b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
@@ -0,0 +1,40 @@
+From 4a555ffb77a5947814b6c7f330968318e265c496 Mon Sep 17 00:00:00 2001
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
+[Upstream status: https://github.com/jwrdegoede/rtl8189ES_linux/pull/83]
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 8fcb7bd..e4664e9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,3 @@
+-EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
+ EXTRA_CFLAGS += -O1
+ #EXTRA_CFLAGS += -O3
+ #EXTRA_CFLAGS += -Wall
+@@ -2239,6 +2238,8 @@ ifneq ($(USER_MODULE_NAME),)
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
diff --git a/package/rtl8189fs/0001-Makefile-remove-default-endianness.patch b/package/rtl8189fs/0001-Makefile-remove-default-endianness.patch
deleted file mode 100644
index 47e42415eb..0000000000
--- a/package/rtl8189fs/0001-Makefile-remove-default-endianness.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 480d9da302885d9e8b3d1f9c68def569e3c8a8c0 Mon Sep 17 00:00:00 2001
-From: Sergey Matyukevich <geomatsi@gmail.com>
-Date: Mon, 9 May 2022 00:17:21 +0300
-Subject: [PATCH] Makefile: remove default endianness
-
-There is no way to remove configuration options from EXTRA_CFLAGS
-without editing Makefile. So default LE configuration can not be
-conveniently replaced by BE. Remove default endianness from the
-Makefile to enable its configuration via USER_EXTRA_CFLAGS.
-
-Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index dfca305..fde4e6b 100644
---- a/Makefile
-+++ b/Makefile
-@@ -22,7 +22,6 @@ endif
- 
- EXTRA_CFLAGS += -I$(src)/include
- 
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
- EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- 
- EXTRA_LDFLAGS += --strip-debug
--- 
-2.35.1
-
diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index d5d18a8ba8..1ab41db553 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  41eee18d8a4289c2eac07af3224c62214a9b694a717bf497cd34a95b955f3d49  rtl8189fs-94a61cbf46ce87b7c9b8aa53123aeb142133a3c9.tar.gz
+sha256  7cc80cb85ed6e7f7d5480e6094c377d3dbcd18a57b58cfba43a7e42ea59fc8d3  rtl8189fs-c93cfd712a3acd2ecdeda19a66d269c20f8803f1.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 1c398919ba..8b7618fcc8 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,15 +4,20 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 94a61cbf46ce87b7c9b8aa53123aeb142133a3c9
+RTL8189FS_VERSION = c93cfd712a3acd2ecdeda19a66d269c20f8803f1
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
+# Undefine the hardcoded CONFIG_LITTLE_ENDIAN
+RTL8189FS_USER_EXTRA_CLAGS = -UCONFIG_LITTLE_ENDIAN
+# Set endianness
+RTL8189FS_USER_EXTRA_CLAGS += -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+
 RTL8189FS_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8189FS=m \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR) \
-	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN"
+	USER_EXTRA_CFLAGS="$(RTL8189FS_USER_EXTRA_CLAGS)"
 
 define RTL8189FS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
