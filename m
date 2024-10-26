Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B08D10C06
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4EAF605C3;
	Sat, 26 Oct 2024 20:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZjwvA4ERFGN; Sat, 26 Oct 2024 20:44:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3677605C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3677605C5;
	Sat, 26 Oct 2024 20:44:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F4CA5C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60E17605C5
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:44:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1wDt4oS-8Uc for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:44:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FD27605C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FD27605C3
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:44:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F15284171; Sat, 26 Oct 2024 20:44:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 22:43:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02ccc0d6f17a77b93a82c7cec81aebf923947426
X-Git-Newrev: 2bcf0a963159eb6beba80dce1b901d8ad7ec5bbc
X-Patchwork-Hint: ignore
Message-Id: <20241026204418.1F15284171@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpp-httplib: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2bcf0a963159eb6beba80dce1b901d8ad7ec5bbc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  3 +++
 package/Config.in                    |  1 +
 package/cpp-httplib/Config.in        | 21 +++++++++++++++++
 package/cpp-httplib/cpp-httplib.hash |  3 +++
 package/cpp-httplib/cpp-httplib.mk   | 44 ++++++++++++++++++++++++++++++++++++
 5 files changed, 72 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7f9a60b1b9..8ad5540dc9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -81,6 +81,9 @@ F:	package/libmbim/
 F:	package/libqmi/
 F:	package/modem-manager/
 
+N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
+F:	package/cpp-httplib/
+
 N:	Alessandro Partesotti <a.partesotti@gmail.com>
 F:	package/oatpp/
 
diff --git a/package/Config.in b/package/Config.in
index 3c2e75db6c..b03bc2ffcf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1999,6 +1999,7 @@ menu "Networking"
 	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
 	source "package/cni-plugins/Config.in"
+	source "package/cpp-httplib/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/curlpp/Config.in"
 	source "package/czmq/Config.in"
diff --git a/package/cpp-httplib/Config.in b/package/cpp-httplib/Config.in
new file mode 100644
index 0000000000..9bd93ee0af
--- /dev/null
+++ b/package/cpp-httplib/Config.in
@@ -0,0 +1,21 @@
+comment "cpp-httplib needs a toolchain w/ C++, wchar, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_CPP_HTTPLIB
+	bool "cpp-httplib"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	help
+	  A C++ header-only HTTP/HTTPS server and client library.
+
+	  https://github.com/yhirose/cpp-httplib
+
+if BR2_PACKAGE_CPP_HTTPLIB
+config BR2_PACKAGE_CPP_HTTPLIB_COMPILE
+	bool "compile as a shared library"
+	select BR2_PACKAGE_HOST_PYTHON3
+	help
+	  Build as library
+
+endif # BR2_PACKAGE_CPP_HTTPLIB
diff --git a/package/cpp-httplib/cpp-httplib.hash b/package/cpp-httplib/cpp-httplib.hash
new file mode 100644
index 0000000000..45c2214105
--- /dev/null
+++ b/package/cpp-httplib/cpp-httplib.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  6ed5894bbbc4a34a0f4c5e962672d0003d2ea099bbadacc66f6dee2b213ff394  cpp-httplib-0.18.0.tar.gz
+sha256  4b45cbe16d7b71b89ae6127e26e0d90a029198ca5e958ad8e3d0b8bbed364d8b  LICENSE
diff --git a/package/cpp-httplib/cpp-httplib.mk b/package/cpp-httplib/cpp-httplib.mk
new file mode 100644
index 0000000000..5a02b562b3
--- /dev/null
+++ b/package/cpp-httplib/cpp-httplib.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# cpp-httplib
+#
+################################################################################
+
+CPP_HTTPLIB_VERSION = 0.18.0
+CPP_HTTPLIB_SITE = $(call github,yhirose,cpp-httplib,v$(CPP_HTTPLIB_VERSION))
+CPP_HTTPLIB_LICENSE = MIT
+CPP_HTTPLIB_LICENSE_FILES = LICENSE
+CPP_HTTPLIB_INSTALL_STAGING = YES
+CPP_HTTPLIB_CONF_OPTS = \
+	-Dcpp-httplib_test=false
+
+ifeq ($(BR2_PACKAGE_CPP_HTTPLIB_COMPILE),y)
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_compile=true
+CPP_HTTPLIB_DEPENDENCIES += host-python3
+else
+# Header only library
+CPP_HTTPLIB_INSTALL_TARGET = NO
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_openssl=enabled
+CPP_HTTPLIB_DEPENDENCIES += openssl
+else
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_openssl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_zlib=enabled
+CPP_HTTPLIB_DEPENDENCIES += zlib
+else
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_zlib=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_brotli=enabled
+CPP_HTTPLIB_DEPENDENCIES += brotli
+else
+CPP_HTTPLIB_CONF_OPTS += -Dcpp-httplib_brotli=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
