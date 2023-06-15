Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B55EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 06:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0FC4541905;
	Thu, 15 Jun 2023 06:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FC4541905
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxbidYxSX4UY; Thu, 15 Jun 2023 06:56:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D15641907;
	Thu, 15 Jun 2023 06:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D15641907
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CAB91BF48C
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8950B61315
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8950B61315
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SoDE79ODM0FH for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A299D61259
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A299D61259
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92843837BE; Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 08:51:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81cb8b7e104019c892333907afbdd6cdf35e57ff
X-Git-Newrev: 7988be7eb4d9c77821a059f3193263e4d47cafba
X-Patchwork-Hint: ignore
Message-Id: <20230615065520.92843837BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dfu-programmer: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7988be7eb4d9c77821a059f3193263e4d47cafba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/dfu-programmer/Config.in           | 17 +++++++++++++++++
 package/dfu-programmer/dfu-programmer.hash |  3 +++
 package/dfu-programmer/dfu-programmer.mk   | 21 +++++++++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7aa5980df7..56316201af 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2308,6 +2308,7 @@ F:	configs/roseapplepi_defconfig
 F:	configs/sheevaplug_defconfig
 F:	configs/visionfive_defconfig
 F:	package/bats-core/
+F:	package/dfu-programmer/
 F:	package/docker-compose/
 F:	package/dump1090/
 F:	package/fatcat/
diff --git a/package/Config.in b/package/Config.in
index ad438667d2..bff090a661 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -482,6 +482,7 @@ endmenu
 	source "package/dbus-glib/Config.in"
 	source "package/dbus-python/Config.in"
 	source "package/dbus-triggerd/Config.in"
+	source "package/dfu-programmer/Config.in"
 	source "package/dfu-util/Config.in"
 	source "package/dmidecode/Config.in"
 	source "package/dmraid/Config.in"
diff --git a/package/dfu-programmer/Config.in b/package/dfu-programmer/Config.in
new file mode 100644
index 0000000000..6e0743e9d8
--- /dev/null
+++ b/package/dfu-programmer/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_DFU_PROGRAMMER
+	bool "dfu-programmer"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Dfu-programmer is a multi-platform command-line programmer
+	  for Atmel (8051, AVR, XMEGA & AVR32) chips with a USB
+	  bootloader supporting ISP. Most Atmel devices having a USB
+	  port come pre-programmed with the bootloader, and this is a
+	  lightweight alternative to Atmel's own FLIP/BatchISP program.
+
+	  http://dfu-programmer.github.io/
+
+comment "dfu-programmer needs a toolchain w/ threads, gcc >= 4.9"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/dfu-programmer/dfu-programmer.hash b/package/dfu-programmer/dfu-programmer.hash
new file mode 100644
index 0000000000..afa1d97aed
--- /dev/null
+++ b/package/dfu-programmer/dfu-programmer.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  867eaf0a8cd10123715491807ab99cecb54dc6f09dddade4b2a42b0b0ef9e6b0  dfu-programmer-1.0.0.tar.gz
+sha256  d8fb44c26fecbb2b8a368a6c0ed4f5478a401fab03744325407736a80383af76  COPYING
diff --git a/package/dfu-programmer/dfu-programmer.mk b/package/dfu-programmer/dfu-programmer.mk
new file mode 100644
index 0000000000..3b1589125c
--- /dev/null
+++ b/package/dfu-programmer/dfu-programmer.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# dfu-programmer
+#
+################################################################################
+
+DFU_PROGRAMMER_VERSION = 1.0.0
+DFU_PROGRAMMER_SITE = https://github.com/dfu-programmer/dfu-programmer/releases/download/v$(DFU_PROGRAMMER_VERSION)
+DFU_PROGRAMMER_LICENSE = GPL-2.0+
+DFU_PROGRAMMER_LICENSE_FILES = COPYING
+DFU_PROGRAMMER_DEPENDENCIES = libusb
+
+# No update-bash-completion.sh in tarball. Fix sent upstream:
+# https://github.com/dfu-programmer/dfu-programmer/pull/91
+define DFU_PROGRAMMER_ADD_MISSING_FILE
+	ln -s /bin/true $(@D)/update-bash-completion.sh
+endef
+
+DFU_PROGRAMMER_POST_PATCH_HOOKS == DFU_PROGRAMMER_ADD_MISSING_FILE
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
