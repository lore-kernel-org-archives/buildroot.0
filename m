Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437E5C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 20:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C403340168;
	Sat,  8 Jan 2022 20:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cAhISqSyEwOe; Sat,  8 Jan 2022 20:59:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6358400C1;
	Sat,  8 Jan 2022 20:59:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40D0B1BF20D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C89C607A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:59:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NM9j4Yrtsvkh for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 20:59:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4522F6076C
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 20:59:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3C5E883456; Sat,  8 Jan 2022 20:52:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 21:58:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 220716ab67736311209e3b7a4c7d1c12f569dc95
X-Git-Newrev: 1025766c8a2c9d0a5956ca0d720bb07b9a47076d
X-Patchwork-Hint: ignore
Message-Id: <20220108205250.3C5E883456@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdbus-cpp: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1025766c8a2c9d0a5956ca0d720bb07b9a47076d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sdbus-c++ is a high-level C++ D-Bus library for Linux.

Signed-off-by: Sergey Bobrenok <bobrofon@gmail.com>
[Peter: add host-pkgconf, drop host package]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/sdbus-cpp/Config.in      | 16 ++++++++++++++++
 package/sdbus-cpp/sdbus-cpp.hash |  3 +++
 package/sdbus-cpp/sdbus-cpp.mk   | 15 +++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c0ea5777f2..b80d886809 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2502,6 +2502,9 @@ F:	package/libbson/
 F:	package/lua-resty-http/
 F:	package/mpir/
 
+N:	Sergey Bobrenok <bobrofon@gmail.com>
+F:	package/sdbus-cpp/
+
 N:	Sergey Matyukevich <geomatsi@gmail.com>
 F:	boot/arm-trusted-firmware/
 F:	board/linksprite/pcduino
diff --git a/package/Config.in b/package/Config.in
index c933f51d10..15a831c1bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2576,6 +2576,7 @@ menu "System tools"
 	source "package/s6-rc/Config.in"
 	source "package/scrub/Config.in"
 	source "package/scrypt/Config.in"
+	source "package/sdbus-cpp/Config.in"
 	source "package/sdbusplus/Config.in"
 	source "package/seatd/Config.in"
 	source "package/smack/Config.in"
diff --git a/package/sdbus-cpp/Config.in b/package/sdbus-cpp/Config.in
new file mode 100644
index 0000000000..85f149eaa1
--- /dev/null
+++ b/package/sdbus-cpp/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_SDBUS_CPP
+	bool "sdbus-c++"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_SYSTEMD
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	help
+	  sdbus-c++ is a high-level C++ D-Bus library for Linux
+	  designed to provide expressive, easy-to-use API in modern C++.
+
+	  This will build the target library.
+
+	  https://github.com/Kistler-Group/sdbus-cpp
+
+comment "sdbus-c++ needs systemd and a toolchain w/ C++, gcc >= 7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_SYSTEMD || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
new file mode 100644
index 0000000000..8b87653dfd
--- /dev/null
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  0fd575ae0f463773dd9141242d1133731e2b780fd6526650ce992ba711d88628  v0.8.3.tar.gz
+sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
new file mode 100644
index 0000000000..24904ee26f
--- /dev/null
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# sdbus-c++
+#
+################################################################################
+
+SDBUS_CPP_VERSION = 0.8.3
+SDBUS_CPP_SOURCE = v$(SDBUS_CPP_VERSION).tar.gz
+SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
+SDBUS_CPP_INSTALL_STAGING = YES
+SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
+SDBUS_CPP_LICENSE = LGPL-2.1+
+SDBUS_CPP_LICENSE_FILES = COPYING
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
