Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD866C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 11:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8236680C28;
	Wed,  7 Feb 2024 11:44:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WcNAgLIH0mZT; Wed,  7 Feb 2024 11:44:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8505380C36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8505380C36;
	Wed,  7 Feb 2024 11:44:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3B11BF2C4
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 319E741FC5
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 11:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nAWBVG04ybo3 for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 11:44:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C80941FBF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C80941FBF
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 11:44:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E163F8756E; Wed,  7 Feb 2024 11:44:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 12:44:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a232ee101d70c8e1f72e9e9eaac3144543dd5cd
X-Git-Newrev: 4f7f0565699b5f396b918954c3c7a91a7ede16b0
X-Patchwork-Hint: ignore
Message-Id: <20240207114414.E163F8756E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/re2: propagate libabseil-cpp
 dependencies
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f7f0565699b5f396b918954c3c7a91a7ede16b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit fc7606010e4edde7a34c545fac0fe7f82d4a5e18 forgot to propagate
libabseil-cpp dependencies to re2

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/grpc/Config.in             | 2 +-
 package/qt5/qt5webengine/Config.in | 6 ++++--
 package/re2/Config.in              | 7 +++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/grpc/Config.in b/package/grpc/Config.in
index ef3e1c86cb..7664948b40 100644
--- a/package/grpc/Config.in
+++ b/package/grpc/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_GRPC
 	depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf, re2
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # libabseil-cpp, re2
-	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp
+	depends on !BR2_STATIC_LIBS # protobuf, libabseil-cpp, re2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	select BR2_PACKAGE_C_ARES
diff --git a/package/qt5/qt5webengine/Config.in b/package/qt5/qt5webengine/Config.in
index cfa5893f41..99a2980a25 100644
--- a/package/qt5/qt5webengine/Config.in
+++ b/package/qt5/qt5webengine/Config.in
@@ -9,12 +9,13 @@ config BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
 	depends on !BR2_BINFMT_FLAT # qt5base-icu
 	depends on BR2_USE_MMU # libglib2, qt5base-dbus
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS # re2
 
-comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 8, host gcc >= 4.9, threads, wchar"
+comment "qt5webengine needs udev /dev management and a glibc toolchain w/ gcc >= 8, host gcc >= 4.9, dynamic library, threads, wchar"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
-		!BR2_HOST_GCC_AT_LEAST_4_9 || \
+		!BR2_HOST_GCC_AT_LEAST_4_9 || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 
 comment "qt5webengine needs an OpenGL and EGL-capable backend"
@@ -24,6 +25,7 @@ comment "qt5webengine needs an OpenGL and EGL-capable backend"
 config BR2_PACKAGE_QT5WEBENGINE
 	bool "qt5webengine"
 	depends on BR2_PACKAGE_QT5WEBENGINE_ARCH_SUPPORTS
+	depends on !BR2_STATIC_LIBS # re2
 	depends on BR2_TOOLCHAIN_USES_GLIBC # execinfo.h, mallinfo
 	depends on BR2_HOST_GCC_AT_LEAST_4_9 # qt5base-icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # re2
diff --git a/package/re2/Config.in b/package/re2/Config.in
index 0ac0041f6d..b79e711ad3 100644
--- a/package/re2/Config.in
+++ b/package/re2/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_RE2
 	bool "re2"
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS # libabseil-cpp
 	select BR2_PACKAGE_LIBABSEIL_CPP
 	help
 	  RE2 is a fast, safe, thread-friendly alternative
@@ -12,7 +14,8 @@ config BR2_PACKAGE_RE2
 
 	  https://github.com/google/re2
 
-comment "re2 needs a toolchain w/ C++, threads, gcc >= 8"
+comment "re2 needs a toolchain w/ C++, threads, dynamic library, gcc >= 8"
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
