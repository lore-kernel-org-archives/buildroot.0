Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951C6C47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 08:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5394584FCA;
	Fri, 26 Jan 2024 08:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5394584FCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NU8U3ytGLYFA; Fri, 26 Jan 2024 08:49:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D07184FC4;
	Fri, 26 Jan 2024 08:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D07184FC4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23D701BF420
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33F6684000
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33F6684000
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H8_Y8Hz2dLJy for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C07383FEA
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C07383FEA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29C4F86531; Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 09:45:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ceab1f2cd105f683b80e485422c8e10d2048b01
X-Git-Newrev: bbea0e71398e19f0a8d360b7e16a5baa8d2f5c50
X-Patchwork-Hint: ignore
Message-Id: <20240126084846.29C4F86531@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kismet: bump to version 2023-07-R1
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbea0e71398e19f0a8d360b7e16a5baa8d2f5c50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- openssl is a mandatory dependency of BR2_PACKAGE_KISMET_SERVER since
  https://github.com/kismetwireless/kismet/commit/d916acf8c0fa36d8d794ce3d0fb87fc180592b6c
- pcre2 is an optional dependency since
  https://github.com/kismetwireless/kismet/commit/bb1ecb1c5688cafb1914847c2d068f820b847f2b
- disable wifi-coconut (enabled by default and depends on libusb:
  https://github.com/kismetwireless/kismet/commit/e221b8d45c1598aac64dd4403be1bf7d7df3d0a6)

https://kismetwireless.net/posts/kismet-2023-07-r1/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kismet/Config.in   |  1 +
 package/kismet/kismet.hash |  2 +-
 package/kismet/kismet.mk   | 12 ++++++++----
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 7bde6c92af..80e68743a5 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -63,6 +63,7 @@ config BR2_PACKAGE_KISMET_SERVER
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_USE_WCHAR
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PROTOBUF
 
 comment "server needs a toolchain w/ dynamic library, wchar"
diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index 725d24e551..543515858e 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2149cceac5526508653f4d02dcf7a694e3da3dc000a2372a1ee4bf9988279781  kismet-2022-08-R1.tar.xz
+sha256  f08548e26ca65fa1e567b1debbea1ca4d0e7206bddb96a4f639c90171873e8f7  kismet-2023-07-R1.tar.xz
 sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 8def78ad2a..c448233d60 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2022-08-R1
+KISMET_VERSION = 2023-07-R1
 KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = \
 	host-pkgconf \
 	libpcap \
 	$(if $(BR2_PACKAGE_LIBNL),libnl) \
+	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_PROTOBUF),protobuf) \
 	protobuf-c \
 	sqlite \
@@ -19,7 +20,7 @@ KISMET_LICENSE = GPL-2.0+
 KISMET_LICENSE_FILES = LICENSE
 KISMET_SELINUX_MODULES = kismet
 
-KISMET_CONF_OPTS = --disable-debuglibs
+KISMET_CONF_OPTS = --disable-debuglibs --disable-wifi-coconut
 
 KISMET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
@@ -57,9 +58,12 @@ else
 KISMET_CONF_OPTS += --disable-lmsensors
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+KISMET_DEPENDENCIES += pcre2
+KISMET_CONF_OPTS += --enable-pcre --enable-require-pcre2
+else ifeq ($(BR2_PACKAGE_PCRE),y)
 KISMET_DEPENDENCIES += pcre
-KISMET_CONF_OPTS += --enable-pcre
+KISMET_CONF_OPTS += --enable-pcre --disable-require-pcre2
 else
 KISMET_CONF_OPTS += --disable-pcre
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
