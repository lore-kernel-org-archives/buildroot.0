Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD067C3ABAE
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 21:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 460A480C78;
	Sun, 15 Sep 2024 21:37:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K7o71TXOWIdR; Sun, 15 Sep 2024 21:37:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36259810B1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36259810B1;
	Sun, 15 Sep 2024 21:37:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 334831BF28B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 573EF40A0B
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 21:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kHZWICULjlrD for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EBEE40A0C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EBEE40A0C
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05E7E83682; Sun, 15 Sep 2024 21:36:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 22:08:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 617e5f68a5960d24fba960e3667ae156b5b00615
X-Git-Newrev: bb86e3111194ef1f218a37670f9635ef2ab82f2d
X-Patchwork-Hint: ignore
Message-Id: <20240915213637.05E7E83682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libblockdev: bump to version 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb86e3111194ef1f218a37670f9635ef2ab82f2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new smart and smartmontools config options.

Add new libyaml dependency to lvm config option.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libblockdev/Config.in        | 20 ++++++++++++++++++++
 package/libblockdev/libblockdev.hash |  2 +-
 package/libblockdev/libblockdev.mk   | 20 +++++++++++++++++---
 3 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 62ecaa1ac2..08d618945b 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -48,6 +48,7 @@ config BR2_PACKAGE_LIBBLOCKDEV_LVM2
 	depends on BR2_ENABLE_LOCALE # parted
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
 	select BR2_PACKAGE_PARTED
+	select BR2_PACKAGE_LIBYAML
 	select BR2_PACKAGE_LVM2
 
 comment "lvm2 support needs a toolchain w/ locale, gcc >= 5"
@@ -72,6 +73,25 @@ config BR2_PACKAGE_LIBBLOCKDEV_PART
 comment "part plugin needs a toolchain w/ locale, gcc >= 5"
 	depends on !BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
+config BR2_PACKAGE_LIBBLOCKDEV_SMART
+	bool "smart"
+	depends on BR2_PACKAGE_HAS_UDEV # libatasmart
+	select BR2_PACKAGE_LIBATASMART
+
+comment "smart support needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+config BR2_PACKAGE_LIBBLOCKDEV_SMARTMONTOOLS
+	bool "smartmontools"
+	depends on BR2_INSTALL_LIBSTDCPP # smartmontools
+	depends on BR2_USE_MMU # smartmontools
+	select BR2_PACKAGE_JSON_GLIB
+	select BR2_PACKAGE_SMARTMONTOOLS # runtime
+
+comment "smartmontools support needs a toolchain w/ C++"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_LIBBLOCKDEV_SWAP
 	bool "swap"
 	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
diff --git a/package/libblockdev/libblockdev.hash b/package/libblockdev/libblockdev.hash
index 1438fad741..9cc3817870 100644
--- a/package/libblockdev/libblockdev.hash
+++ b/package/libblockdev/libblockdev.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a5cb33a53ff5969067982704f45399d02555fdb2313ed0c56eac9555397dc2db  libblockdev-3.1.1.tar.gz
+sha256  f2918de9ce1b54ac1aee5e5757e555947896a74674cdca9d05940a53d19e32a8  libblockdev-3.2.0.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index 9ffa15a7a9..6232f243b1 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBBLOCKDEV_VERSION = 3.1.1
-LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)-1
+LIBBLOCKDEV_VERSION = 3.2.0
+LIBBLOCKDEV_SITE = https://github.com/storaged-project/libblockdev/releases/download/$(LIBBLOCKDEV_VERSION)
 LIBBLOCKDEV_LICENSE = LGPL-2.1
 LIBBLOCKDEV_LICENSE_FILES = LICENSE
 LIBBLOCKDEV_INSTALL_STAGING = YES
@@ -47,7 +47,7 @@ LIBBLOCKDEV_CONF_OPTS += --without-loop
 endif
 
 ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_LVM2),y)
-LIBBLOCKDEV_DEPENDENCIES += lvm2 parted
+LIBBLOCKDEV_DEPENDENCIES += libyaml lvm2 parted
 LIBBLOCKDEV_CONF_OPTS += --with-lvm
 else
 LIBBLOCKDEV_CONF_OPTS += --without-lvm
@@ -67,6 +67,20 @@ else
 LIBBLOCKDEV_CONF_OPTS += --without-part
 endif
 
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_SMART),y)
+LIBBLOCKDEV_DEPENDENCIES += libatasmart
+LIBBLOCKDEV_CONF_OPTS += --with-smart
+else
+LIBBLOCKDEV_CONF_OPTS += --without-smart
+endif
+
+ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_SMARTMONTOOLS),y)
+LIBBLOCKDEV_DEPENDENCIES += json-glib
+LIBBLOCKDEV_CONF_OPTS += --with-smartmontools
+else
+LIBBLOCKDEV_CONF_OPTS += --without-smartmontools
+endif
+
 ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_SWAP),y)
 LIBBLOCKDEV_DEPENDENCIES += util-linux
 LIBBLOCKDEV_CONF_OPTS += --with-swap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
