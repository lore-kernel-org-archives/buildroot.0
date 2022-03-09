Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAA0C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 13:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F965415AE;
	Wed,  9 Mar 2022 13:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uSEFUYh18Mgn; Wed,  9 Mar 2022 13:28:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5879E411C6;
	Wed,  9 Mar 2022 13:28:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C05581BF869
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF9C2411C6
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:28:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tznPuBwDJCrI for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 13:28:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27E7940323
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 13:28:50 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 765B3C193D;
 Wed,  9 Mar 2022 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1646832529; bh=fBkhnNTdJJI1EiNd9fjKjPq9GdWCB0xBgkXxJXIb5p0=;
 h=From:To:Cc:Subject:Date:From;
 b=Nevmx4+UXIB7kEO4sB3nXKuZOItXvHyLzfRjwO5kV6AtDtzmMQKy/COfCpQh6EwI4
 w8sRL8ph8PyyaSWEGHlAWiC5HcMEgT/9KdlZOxGzILLAOe0M2roDHfaBJR6faHvFVa
 sg9x8Xg38xYACScAAMbVmRIRkZmAAH2kupjiCbntz6/sjGk+2COscNetms8MhD6Syg
 p6AhM3NdjcN6Q85VwACsAiyu/YcunnYpm6ahooBAYAoavncJUWtp8K14cbk30S5hjQ
 R1UpSYxbrwM1HdcLRYleWsibBhCWZ0kWSWhVF9XFrVM+ZptV/y+i0znSMfZd3nsfAH
 zdM2KqaxMrkPg==
Received: from abrodkin-5550.internal.synopsys.com
 (abrodkin-e7480.internal.synopsys.com [10.121.15.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id CF5FDA005E;
 Wed,  9 Mar 2022 13:28:45 +0000 (UTC)
X-SNPS-Relay: synopsys.com
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 16:28:35 +0300
Message-Id: <20220309132835.7251-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] qt5: enable JS and WebKit for ARC
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
From: Alexey Brodkin via buildroot <buildroot@buildroot.org>
Reply-To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Peter Seiderer <ps.report@gmx.net>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds support of ARC architecture in Qt's JS core and Webkit.
The change itself is quite straight-forward:

 1. Enable JS core for ARC
 2. Make sure so-called "large memory model" is used,
    i.e. relocations with long jumps are being generated for global
    symbols, as otherwise insanely huge libqt5webkit.so fails to link
    because some symbols might be more than 32 MiB away from each other.
 3. Make the original WebKit build system aware of yet another CPU
    architecture with explicitly disabled JIT in JS core for ARC.

Obviously, this one depends on [1].

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20220221140628.2295-1-abrodkin@synopsys.com/

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/Config.in                         |  2 +-
 package/qt5/qt5base/qt5base.mk                | 13 +++
 .../0005-Add-support-for-ARC-processors.patch | 93 +++++++++++++++++++
 3 files changed, 107 insertions(+), 1 deletion(-)
 create mode 100644 package/qt5/qt5webkit/0005-Add-support-for-ARC-processors.patch

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index f2b1ff4a19..cbb2e06a21 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	bool
 	default y
 	# Javascript engine is only available on certain architectures
-	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel
+	depends on BR2_arm || BR2_aarch64 || BR2_i386 || BR2_x86_64 || BR2_mipsel || BR2_arc
 	# ARM needs BLX, so v5t+
 	depends on !BR2_ARM_CPU_ARMV4
 
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ef38d03253..b25e0f44b6 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -201,6 +201,19 @@ endif
 QT5BASE_DEFAULT_QPA = $(call qstrip,$(BR2_PACKAGE_QT5BASE_DEFAULT_QPA))
 QT5BASE_CONFIGURE_OPTS += $(if $(QT5BASE_DEFAULT_QPA),-qpa $(QT5BASE_DEFAULT_QPA))
 
+ifeq ($(BR2_arc),y)
+# In case of -Os (which is default in BR) gcc will use millicode implementation
+# from libgcc. That along with performance degradation may lead to issues during
+# linkage stage. In case of QtWebkit exactly that happens - millicode functions
+# get put way too far from caller functions and so linker fails.
+# To solve that problem we explicitly disable millicode call generation for Qt.
+# Also due to some Qt5 libs being really huge (the best example is QtWebKit)
+# it's good to firce compiler to not assume short or even medium-length calls
+# could be used. I.e. always use long jump instaructions.
+# Otherwise there's a high risk of hitting link-time failures.
+QT5BASE_CFLAGS += -mno-millicode -mlong-calls
+endif
+
 ifeq ($(BR2_PACKAGE_QT5BASE_EGLFS),y)
 QT5BASE_CONFIGURE_OPTS += -eglfs
 QT5BASE_DEPENDENCIES   += libegl
diff --git a/package/qt5/qt5webkit/0005-Add-support-for-ARC-processors.patch b/package/qt5/qt5webkit/0005-Add-support-for-ARC-processors.patch
new file mode 100644
index 0000000000..92f023eab6
--- /dev/null
+++ b/package/qt5/qt5webkit/0005-Add-support-for-ARC-processors.patch
@@ -0,0 +1,93 @@
+From 8da574cf8f30f69e47f76705aa2eb07000540aeb Mon Sep 17 00:00:00 2001
+From: Alexey Brodkin <abrodkin@synopsys.com>
+Date: Mon, 21 Feb 2022 18:28:00 +0300
+Subject: [PATCH] Add support for ARC processors
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+---
+ CMakeLists.txt                       | 4 +++-
+ Source/JavaScriptCore/CMakeLists.txt | 3 ++-
+ Source/WTF/wtf/Platform.h            | 8 ++++++++
+ Source/WTF/wtf/dtoa/utils.h          | 2 +-
+ Source/cmake/OptionsQt.cmake         | 4 ++++
+ 5 files changed, 18 insertions(+), 3 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 31a2ea1fd..f0dfbda5b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -57,7 +57,9 @@ if (MSVC_CXX_ARCHITECTURE_ID)
+ else ()
+     string(TOLOWER ${CMAKE_SYSTEM_PROCESSOR} LOWERCASE_CMAKE_SYSTEM_PROCESSOR)
+ endif ()
+-if (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
++if (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^arc")
++    set(WTF_CPU_ARC 1)
++elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^arm")
+     set(WTF_CPU_ARM 1)
+ elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^aarch64")
+     set(WTF_CPU_ARM64 1)
+diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore/CMakeLists.txt
+index 937b3ed00..205dde288 100644
+--- a/Source/JavaScriptCore/CMakeLists.txt
++++ b/Source/JavaScriptCore/CMakeLists.txt
+@@ -1275,7 +1275,8 @@ if (ENABLE_WEB_REPLAY)
+     list(APPEND JavaScriptCore_HEADERS ${DERIVED_SOURCES_JAVASCRIPTCORE_DIR}/JSReplayInputs.h)
+ endif ()
+ 
+-if (WTF_CPU_ARM)
++if (WTF_CPU_ARC)
++elseif (WTF_CPU_ARM)
+ elseif (WTF_CPU_ARM64)
+ elseif (WTF_CPU_ALPHA)
+ elseif (WTF_CPU_HPPA)
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 5717f3ea1..b327ed693 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -349,6 +349,14 @@
+ 
+ #endif /* ARM */
+ 
++/* CPU(ARC) - ARC */
++#if defined(__arc__)
++#define WTF_CPU_ARC 1
++#if defined(__BIG_ENDIAN__)
++#define WTF_CPU_BIG_ENDIAN 1
++#endif
++#endif
++
+ #if CPU(ARM) || CPU(MIPS) || CPU(SH4) || CPU(ALPHA) || CPU(HPPA)
+ #define WTF_CPU_NEEDS_ALIGNED_ACCESS 1
+ #endif
+diff --git a/Source/WTF/wtf/dtoa/utils.h b/Source/WTF/wtf/dtoa/utils.h
+index 889642cee..8f1e9933e 100644
+--- a/Source/WTF/wtf/dtoa/utils.h
++++ b/Source/WTF/wtf/dtoa/utils.h
+@@ -49,7 +49,7 @@
+ defined(__ARMEL__) || \
+ defined(_MIPS_ARCH_MIPS32R2)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+-#elif CPU(MIPS) || CPU(MIPS64) || CPU(PPC) || CPU(PPC64) || CPU(PPC64LE) || CPU(SH4) || CPU(S390) || CPU(S390X) || CPU(IA64) || CPU(ALPHA) || CPU(ARM64) || CPU(HPPA)
++#elif CPU(MIPS) || CPU(MIPS64) || CPU(PPC) || CPU(PPC64) || CPU(PPC64LE) || CPU(SH4) || CPU(S390) || CPU(S390X) || CPU(IA64) || CPU(ALPHA) || CPU(ARM64) || CPU(HPPA) || CPU(ARC)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(_M_IX86) || defined(__i386__)
+ #if defined(_WIN32)
+diff --git a/Source/cmake/OptionsQt.cmake b/Source/cmake/OptionsQt.cmake
+index ec6081de0..e1a5efc1e 100644
+--- a/Source/cmake/OptionsQt.cmake
++++ b/Source/cmake/OptionsQt.cmake
+@@ -365,6 +365,10 @@ if (MINGW AND CMAKE_SIZEOF_VOID_P EQUAL 8)
+     WEBKIT_OPTION_DEFAULT_PORT_VALUE(ENABLE_JIT PRIVATE OFF)
+ endif ()
+ 
++if (WTF_CPU_ARC)
++    WEBKIT_OPTION_DEFAULT_PORT_VALUE(ENABLE_JIT PRIVATE OFF)
++endif ()
++
+ WEBKIT_OPTION_CONFLICT(USE_GSTREAMER USE_QT_MULTIMEDIA)
+ WEBKIT_OPTION_CONFLICT(USE_GSTREAMER USE_MEDIA_FOUNDATION)
+ WEBKIT_OPTION_CONFLICT(USE_QT_MULTIMEDIA USE_MEDIA_FOUNDATION)
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
