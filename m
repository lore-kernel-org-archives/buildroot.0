Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A9FC4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 20:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F12C381350;
	Mon, 17 Oct 2022 20:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F12C381350
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2BMpRdMzyMq; Mon, 17 Oct 2022 20:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1622781304;
	Mon, 17 Oct 2022 20:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1622781304
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19E021BF313
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 20:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E960E6060A
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 20:38:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E960E6060A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hziNXxParzOd for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 20:38:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88B896059C
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88B896059C
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 20:38:30 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kWsWoEN3bJpY4kWsXoLbYI; Mon, 17 Oct 2022 22:38:29 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 22:38:28 +0200
Message-Id: <20221017203828.1327130-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfNpgT0knUu/WSL5xsmurOV+z0Dwd+svioaKyr3M4kQoXHDMBg0BJLzJK2RCji1jEU9dNKBJSQn/1P0hrolB0pbirWBbkZYB4VMS/TkZmfiZiXtzEAPj8
 +b4kHjU9mQKKfC2WVCwKQ5lTKyUQsTNmlx2rfAMPVCsqDRc0Ao/Q1BLXw2zGSUcbrk/zNHgvhm46+rl7JT846ES/q7HnOli4VdzN+9c3tSv21s9kIwa6fynD
 KC0HkWhuoHs18coSzVF0yvAcNCStBydEEilPKfgpjcifZx9SzKTpeaa/UP3YbNQXdqVwOqmm0fCYQPD6x2f4ww==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666039109; bh=aZrilVSp0cPov0JDEzlxyE3oSH5V+t/7okWMbOO+EuI=;
 h=From:To:Subject:Date:MIME-Version;
 b=PZnstwdSkKctuXk/1IET1GFkOYd6+A3hCi4UJT95m7Zk8kBC776M5urNaYA8ok9Ok
 DBN/xBDw+HHhgjQFv7pHFWDB5hvwHPpYHCHa919rDEsoUSqbGBZL5G2MxWXP3aN+Mw
 P3wVC5PqdlZ+OFmKrOn03pLileaaXuVsSZaqdntkBBk/D8jmBJJapFFfkmbQBxkMN1
 PsI2FPPJ3p/nku0eAn/vbAmVQZ+NNSU8+4HMy9YRig47F8KflABg4y7wIuk8QcUUrs
 pB/QPM7sLB7+ew/ILnRQ+se3+jMe3T8LufsyCAIabkx+H1KloPKivY7CKKXnrf30ut
 7UZ5S4ygnuyQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=PZnstwdS
Subject: [Buildroot] [PATCH] package/rtl8189fs: bump to latest version to
 fix build failure with linux >= 6.0.0
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

Let's also drop local patch in favor of the upstream pending patch we
already use for package rtl8189es to deal with endianness.

Fixes:
http://autobuild.buildroot.net/results/841cf9da4b07ae4bdc14d049f2585b09a95a92f5/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 40 +++++++++++++++++++
 ...1-Makefile-remove-default-endianness.patch | 30 --------------
 package/rtl8189fs/rtl8189fs.hash              |  2 +-
 package/rtl8189fs/rtl8189fs.mk                |  9 ++++-
 4 files changed, 48 insertions(+), 33 deletions(-)
 create mode 100644 package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
 delete mode 100644 package/rtl8189fs/0001-Makefile-remove-default-endianness.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
