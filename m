Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527DDCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17304853E6;
	Sat, 30 May 2026 21:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TsAxKbsGVWRK; Sat, 30 May 2026 21:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36D7F8544A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176476;
	bh=PDzRiXzoedcyaPmTQyyzmZuFEcS1pJh9dnc/mTAgDv8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i+zb/p5hh4Aa3sg2R/fS+X9h1N6YN224pDCWjSiPjZBTHMY5ezA8wLkyvv4x8Mnjr
	 lOJUFAYzym4e92bsWSuAvPdlA5BYunVNjWEKRF80bK0rPdUkxU7cI7pY+eAeEzuqTJ
	 vg7ic8YZ/cSVB/EuGL5rC1p2JNW8NFxgqOqpYUS7yOnL30VsbW1tPA8lAe37fsCYQ3
	 Fr6Vw+jX9U2hkaRgQRT4BRKQn50v+1whOJtRwabPKpaSNs4SC7832iOH2UU/w7Qsnj
	 zNEGtfFBKx+dC79E3+c6rpueqmqpCf4k5j/Lxfadd31BmnWFGpjDlEf9+Ee2WgUmpb
	 8CgnqkDM9rSbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36D7F8544A;
	Sat, 30 May 2026 21:27:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B6CB9F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A82BC42F50
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:27:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMbDxcPCcD9h for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:27:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB5B42F33
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBB5B42F33
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:27:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6BD3875F1; Sat, 30 May 2026 21:27:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:27:33 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8a26e08b3609e3d7114c17db7751d5bc356f3dd8
X-Git-Newrev: 9a43bf6593aa981040e5ab91e69946af4fe0cee2
X-Patchwork-Hint: ignore
Message-Id: <20260530212740.A6BD3875F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcamera: bump to
 v0.7.1
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
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

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
