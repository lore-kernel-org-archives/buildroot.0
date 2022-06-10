Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7B5C43334
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 20:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A2441780;
	Fri, 10 Jun 2022 20:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QceGaYaDmsNn; Fri, 10 Jun 2022 20:55:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B07EE4179D;
	Fri, 10 Jun 2022 20:55:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA5581BF395
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 20:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA3F08275C
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 20:55:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HIiyxGM1MTWu for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 20:55:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B7EF82718
 for <buildroot@buildroot.org>; Fri, 10 Jun 2022 20:55:19 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout09.t-online.de (Postfix) with SMTP id 24539233D;
 Fri, 10 Jun 2022 22:54:20 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.12.97]) by fwd77.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nzle7-2ZQn4b0; Fri, 10 Jun 2022 22:54:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:58052)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nzle7-0001cv-ET;
 Fri, 10 Jun 2022 22:54:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 10 Jun 2022 22:54:19 +0200
Message-Id: <20220610205419.1913-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220610205419.1913-1-bernd.kuhls@t-online.de>
References: <20220610205419.1913-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1654894459-014214EB-E6FB65DF/0/0 CLEAN NORMAL
X-TOI-MSGID: 5cc05c25-ed92-4325-91c6-8cb1d34d682e
Subject: [Buildroot] [PATCH 2/2] package/intel-mediadriver: bump version to
 22.4.3
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added patch to fix uClibc build.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-Fix-uClibc-build.patch               | 65 +++++++++++++++++++
 .../intel-mediadriver/intel-mediadriver.hash  |  2 +-
 .../intel-mediadriver/intel-mediadriver.mk    |  2 +-
 3 files changed, 67 insertions(+), 2 deletions(-)
 create mode 100644 package/intel-mediadriver/0001-Fix-uClibc-build.patch

diff --git a/package/intel-mediadriver/0001-Fix-uClibc-build.patch b/package/intel-mediadriver/0001-Fix-uClibc-build.patch
new file mode 100644
index 0000000000..2a14a260d0
--- /dev/null
+++ b/package/intel-mediadriver/0001-Fix-uClibc-build.patch
@@ -0,0 +1,65 @@
+From 2007edc683499d2e82772f84241b453bdf319372 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Fri, 10 Jun 2022 18:42:34 +0200
+Subject: [PATCH] Fix uClibc build
+
+uClibc does not provide execinfo.h
+
+Patch sent upstream: https://github.com/intel/media-driver/pull/1437
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt                                              | 6 ++++++
+ .../linux/common/os/osservice/mos_utilities_specific.cpp    | 4 ++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8305acfdb..6bec00f7d 100755
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -53,6 +53,12 @@ option (BUILD_CMRTLIB "Build and Install cmrtlib together with media driver" ON)
+ 
+ option (ENABLE_PRODUCTION_KMD "Enable Production KMD header files" OFF)
+ 
++include(CheckIncludeFileCXX)
++check_include_file_cxx("execinfo.h" HAVE_EXECINFO)
++if (HAVE_EXECINFO)
++    add_definitions(-DHAVE_EXECINFO)
++endif()
++
+ include(GNUInstallDirs)
+ 
+ if (BUILD_CMRTLIB AND NOT CMAKE_WDDM_LINUX)
+diff --git a/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp b/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
+index ff0b68655..8ea621f0e 100644
+--- a/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
++++ b/media_softlet/linux/common/os/osservice/mos_utilities_specific.cpp
+@@ -51,7 +51,9 @@
+ #include <signal.h>
+ #include <unistd.h>  // fork
+ #include <algorithm>
++#ifdef HAVE_EXECINFO
+ #include <execinfo.h> // backtrace
++#endif
+ 
+ const char           *MosUtilitiesSpecificNext::m_szUserFeatureFile     = USER_FEATURE_FILE;
+ MOS_PUF_KEYLIST      MosUtilitiesSpecificNext::m_ufKeyList              = nullptr;
+@@ -2492,6 +2494,7 @@ void MosUtilities::MosTraceEvent(
+                 MOS_FreeMemory(pTraceBuf);
+             }
+         }
++#ifdef HAVE_EXECINFO
+         if (m_mosTraceFilter & (1ULL << TR_KEY_CALL_STACK))
+         {
+             // reserve space for header and stack size field.
+@@ -2511,6 +2514,7 @@ void MosUtilities::MosTraceEvent(
+                 size_t ret = write(MosUtilitiesSpecificNext::m_mosTraceFd, traceBuf, nLen);
+             }
+         }
++#endif
+     }
+     return;
+ }
+-- 
+2.30.2
+
diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 92346e9dae..fadea2b18d 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e8e7faeb40e523b0daf61336853e09f59f810598093d65737cd119107cf933f8  intel-media-22.4.2.tar.gz
+sha256  c30a63414d4aaf1a3b5c09db02b6c4da23b5998620ff8c950bb8258104576568  intel-media-22.4.3.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index c5ad837243..613836ed00 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 22.4.2
+INTEL_MEDIADRIVER_VERSION = 22.4.3
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
