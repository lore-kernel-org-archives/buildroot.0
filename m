Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6FFCD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 375DD85DB7;
	Tue,  9 Jun 2026 13:05:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WImGi5iz8Bek; Tue,  9 Jun 2026 13:05:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D6485DBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010321;
	bh=ob5PTTRcnUUXGMiosU/VgILMgDhvItGldxP6fE3EpMA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MwQj0m0Y+1sy2wZya+UlArvp6HxHEtl//bgUUFxlqI9JMLrbioTHwoi8wOu8ZI9hZ
	 Yunt4inVmou9+tZDjjNwTCOxU2PqR+finNO4s4fh1VYGWpKOqlK3YiMmbDdg1wC5sW
	 UhysuUX04bh91B4BnlOWvffd4qJHzCaWq78WkY0MUJYXRSPBotPO3dJ008W94/dN98
	 iRQurJ7rsCy63GR7JhVyN3a2uiLBwjVjG8c+jqPnrEWBp5zWqVXRNf+s82nA6inKmR
	 R9OMOue92lVDKw3nGmN3Gew+zTy7P9NpJ4iTXWhBTX3akiZ0ujuuCSGixXiqV36IJB
	 /bEGxRueV0U2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47D6485DBA;
	Tue,  9 Jun 2026 13:05:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C92A190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29D6C42561
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btsp0Yr9lYSQ for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 830F04271D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 830F04271D
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD55087E7E; Tue,  9 Jun 2026 13:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:27:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a26e08b3609e3d7114c17db7751d5bc356f3dd8
X-Git-Newrev: 9a43bf6593aa981040e5ab91e69946af4fe0cee2
X-Patchwork-Hint: ignore
Message-Id: <20260609130124.BD55087E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: bump to v0.7.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a43bf6593aa981040e5ab91e69946af4fe0cee2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://git.linuxtv.org/libcamera.git/tag/?h=v0.7.1

libcamera is now using C++20. This minimal gcc version is increased
to gcc-10. This commit also removes the gcc >= 5 requirement for
the lc-compliance sub-option and the CXXFLAGS condition in the .mk
file. Those are no longer needed. The Config.in comments about the
required gcc version are also updated.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcamera/Config.in      | 11 +++++------
 package/libcamera/libcamera.hash |  2 +-
 package/libcamera/libcamera.mk   |  6 ++----
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 15812a0e2f..74b861b4c1 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -9,7 +9,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3 # clone3()
@@ -97,22 +97,21 @@ config BR2_PACKAGE_LIBCAMERA_COMPLIANCE
 	depends on BR2_USE_WCHAR # gtest
 	depends on BR2_TOOLCHAIN_HAS_THREADS # gtest
 	depends on BR2_INSTALL_LIBSTDCPP # gtest
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # gtest
 	depends on BR2_USE_MMU # gtest
 	select BR2_PACKAGE_GTEST
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  lc-compliance test application
 
-comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads, gcc >= 5"
+comment "lc-compliance test application needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_INSTALL_LIBSTDCPP
 
 endif # BR2_PACKAGE_LIBCAMERA
 
-comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 8, headers >= 5.3"
+comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 10, headers >= 5.3"
 	depends on BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index e00e1257ad..d1d7576533 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9e684bfcb8679e5e7ec7fb0da9dec68e71f0b75a6b0c8edcd892b26a92726a92  libcamera-v0.7.0-git4.tar.gz
+sha256  7c5728f6a51d717542cfdd2ff368ac78fa2e50e8a7360a38bb37952e9293e008  libcamera-v0.7.1-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index e8f502b253..945207888b 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.7.0
+LIBCAMERA_VERSION = v0.7.1
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
@@ -41,9 +41,7 @@ LIBCAMERA_LICENSE_FILES = \
 	LICENSES/Linux-syscall-note.txt \
 	LICENSES/MIT.txt
 
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_7),y)
-LIBCAMERA_CXXFLAGS = -faligned-new
-endif
+LIBCAMERA_CXXFLAGS = $(TARGET_CXXFLAGS) -faligned-new
 
 ifeq ($(BR2_PACKAGE_LIBCAMERA_PYTHON),y)
 LIBCAMERA_DEPENDENCIES += python3 python-pybind
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
