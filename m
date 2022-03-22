Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12912C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 23:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0BAF8299E;
	Tue, 22 Mar 2022 23:23:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ep3wJu8qB0kL; Tue, 22 Mar 2022 23:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FD2181397;
	Tue, 22 Mar 2022 23:23:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D34121BF427
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4BDB40C7D
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dcpS307KDJso for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 23:22:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B731E40AFA
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 23:22:37 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id z7so22085963iom.1
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6FH7vUa3HWOyhLQ3pUZ7XIw5ze/Nz2yhxfQYH+acYqs=;
 b=dMfACAsUYfTQAeRwFj1khsMcR4nyUMsHx1StD0P2xIUg2r6P46APhPi/sEJhs95CNa
 5e6J2HwVDMcblkYX5PSrrmqWs13GpHtnvootqK7kZ9iX9RPj/03LXW26GV4E1Q77GWRz
 4dZ8kKXBuK2uH55VctXYQKTiWOrXxhiOz0rXE4QQrtBf3hiMEZ960JtfiU2Qhl6tM1cd
 1Qr6HiY1VO2Zr9V//0uOtQs1VYb+tVqCiwUqF1JVzJBOdzdm76fpz3dNo87AJ8p9QEu+
 MC2bUSGZ9JKItG2oT9hGpMAmgud37sEgn3UjgUSy1LnCE5pmNBA6FM35z/UP7FIYroZU
 K+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6FH7vUa3HWOyhLQ3pUZ7XIw5ze/Nz2yhxfQYH+acYqs=;
 b=3gLXHcBSQqcy3S1VagnfSLvnZdMrssvh5Ubbn0elgpLu/pIW3iERVSCVL+DyiftfdV
 UHHMIWYnrWeyfKIvMFMAg9znLOj3xi2t1+n/Ld7S3wBb1UM0Y5gl91FHrCd75XOh/S2J
 hmoWn34amMGvbqcW1IkkduYL5CpDEnTu8ikEH+MpMJHwIn5L5aNvr7JSdMd80J8lpp99
 ELvF72ZbAiZOzo+LqU96o70qorSzlyE+KNyfvG9g5gsDDohpykrUL5ZXTMmtGmHj4BDw
 KMHf/zMDHApcQcT4rxvli0lESpf89ID4QGPy0l+Ttx5pJqc+jZpSkIX1DXyCb6HU2/Vv
 XxJg==
X-Gm-Message-State: AOAM533RVCFLQPExtxATphj8UpRnW3GTVVZvRdD3mByGdLJzmmyovJJC
 b9q32tgk9j5ANFmH14y4qqJ5WN5kRT+DvYLg
X-Google-Smtp-Source: ABdhPJzVSpaltymu1ZDbefUgOBtxCKl75qKSIppwgeRPFIXmPC2gE1HakK2CsyfmupSMYegDJkprWg==
X-Received: by 2002:a05:6638:f95:b0:314:58f9:5896 with SMTP id
 h21-20020a0566380f9500b0031458f95896mr14260898jal.228.1647991356571; 
 Tue, 22 Mar 2022 16:22:36 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 i81-20020a6bb854000000b00649c1b67a6csm2006324iof.28.2022.03.22.16.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 16:22:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 17:22:18 -0600
Message-Id: <20220322232224.2842266-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322232224.2842266-1-james.hilliard1@gmail.com>
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v12 05/11] support/misc/toolchainfile.cmake.in:
 allow variables to be overridden
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, Samuel Martin <s.martin49@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some packages such as libclc need to override cmake toolchain
variables, to avoid errors caused by trying to set overriden
variables ensure that they are not defined before being set.

This prevents difficult to debug silent dropping of overriden
variables.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 support/misc/toolchainfile.cmake.in | 108 +++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 27 deletions(-)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index be575566a4..30c0e63bf2 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -14,9 +14,15 @@ string(REPLACE "/share/buildroot" "" RELOCATED_HOST_DIR ${CMAKE_CURRENT_LIST_DIR
 # so that it can find our custom platform description.
 list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})
 
-set(CMAKE_SYSTEM_NAME Buildroot)
-set(CMAKE_SYSTEM_VERSION 1)
-set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
+if(NOT DEFINED CMAKE_SYSTEM_NAME)
+  set(CMAKE_SYSTEM_NAME Buildroot)
+endif()
+if(NOT DEFINED CMAKE_SYSTEM_VERSION)
+  set(CMAKE_SYSTEM_VERSION 1)
+endif()
+if(NOT DEFINED CMAKE_SYSTEM_PROCESSOR)
+  set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
+endif()
 
 # Set the {C,CXX}FLAGS appended by CMake depending on the build type
 # defined by Buildroot. CMake defaults these variables with -g and/or
@@ -28,11 +34,17 @@ set(CMAKE_SYSTEM_PROCESSOR @@CMAKE_SYSTEM_PROCESSOR@@)
 # Note:
 #   if the project forces some of these flag variables, Buildroot is
 #   screwed up and there is nothing Buildroot can do about that :(
-set(CMAKE_C_FLAGS_DEBUG "" CACHE STRING "Debug CFLAGS")
-set(CMAKE_C_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release CFLAGS")
+if(NOT DEFINED CMAKE_C_FLAGS_DEBUG)
+  set(CMAKE_C_FLAGS_DEBUG "" CACHE STRING "Debug CFLAGS")
+endif()
+if(NOT DEFINED CMAKE_C_FLAGS_RELEASE)
+  set(CMAKE_C_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release CFLAGS")
+endif()
 
 # Build type from the Buildroot configuration
-set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configuration")
+if(NOT DEFINED CMAKE_BUILD_TYPE)
+  set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configuration")
+endif()
 
 # Buildroot defaults flags.
 # If you are using this toolchainfile.cmake file outside of Buildroot and
@@ -41,33 +53,75 @@ set(CMAKE_BUILD_TYPE @@CMAKE_BUILD_TYPE@@ CACHE STRING "Buildroot build configur
 #     cmake -DCMAKE_C_FLAGS="@@TARGET_CFLAGS@@ -Dsome_custom_flag" ...
 # * and make sure the project's CMake code extends them like this if needed:
 #     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Dsome_definitions")
-set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@" CACHE STRING "Buildroot CFLAGS")
-set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for executables")
-set(CMAKE_SHARED_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for shared libraries")
-set(CMAKE_MODULE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for module libraries")
+if(NOT DEFINED CMAKE_C_FLAGS)
+  set(CMAKE_C_FLAGS "@@TARGET_CFLAGS@@" CACHE STRING "Buildroot CFLAGS")
+endif()
+if(NOT DEFINED CMAKE_EXE_LINKER_FLAGS)
+  set(CMAKE_EXE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for executables")
+endif()
+if(NOT DEFINED CMAKE_SHARED_LINKER_FLAGS)
+  set(CMAKE_SHARED_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for shared libraries")
+endif()
+if(NOT DEFINED CMAKE_MODULE_LINKER_FLAGS)
+  set(CMAKE_MODULE_LINKER_FLAGS "@@TARGET_LDFLAGS@@" CACHE STRING "Buildroot LDFLAGS for module libraries")
+endif()
 
-set(CMAKE_INSTALL_SO_NO_EXE 0)
+if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
+  set(CMAKE_INSTALL_SO_NO_EXE 0)
+endif()
 
-set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/bin")
-set(CMAKE_SYSROOT "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
-set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
-set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
-set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
-set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
-set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
+if(NOT DEFINED CMAKE_PROGRAM_PATH)
+  set(CMAKE_PROGRAM_PATH "${RELOCATED_HOST_DIR}/bin")
+endif()
+if(NOT DEFINED CMAKE_SYSROOT)
+  set(CMAKE_SYSROOT "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
+endif()
+if(NOT DEFINED CMAKE_FIND_ROOT_PATH)
+  set(CMAKE_FIND_ROOT_PATH "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
+endif()
+if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_PROGRAM)
+  set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
+endif()
+if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_PACKAGE)
+  set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
+endif()
+if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_LIBRARY)
+  set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
+endif()
+if(NOT DEFINED CMAKE_FIND_ROOT_PATH_MODE_INCLUDE)
+  set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
+endif()
 set(ENV{PKG_CONFIG_SYSROOT_DIR} "${RELOCATED_HOST_DIR}/@@STAGING_SUBDIR@@")
 
 # This toolchain file can be used both inside and outside Buildroot.
-set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
+if(NOT DEFINED CMAKE_C_COMPILER)
+  set(CMAKE_C_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CC@@")
+endif()
 if(@@TOOLCHAIN_HAS_CXX@@)
-  set(CMAKE_CXX_FLAGS_DEBUG "" CACHE STRING "Debug CXXFLAGS")
-  set(CMAKE_CXX_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release CXXFLAGS")
-  set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@" CACHE STRING "Buildroot CXXFLAGS")
-  set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
+  if(NOT DEFINED CMAKE_CXX_FLAGS_DEBUG)
+    set(CMAKE_CXX_FLAGS_DEBUG "" CACHE STRING "Debug CXXFLAGS")
+  endif()
+  if(NOT DEFINED CMAKE_CXX_FLAGS_RELEASE)
+    set(CMAKE_CXX_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release CXXFLAGS")
+  endif()
+  if(NOT DEFINED CMAKE_CXX_FLAGS)
+    set(CMAKE_CXX_FLAGS "@@TARGET_CXXFLAGS@@" CACHE STRING "Buildroot CXXFLAGS")
+  endif()
+  if(NOT DEFINED CMAKE_CXX_COMPILER)
+    set(CMAKE_CXX_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_CXX@@")
+  endif()
 endif()
 if(@@TOOLCHAIN_HAS_FORTRAN@@)
-  set(CMAKE_Fortran_FLAGS_DEBUG "" CACHE STRING "Debug Fortran FLAGS")
-  set(CMAKE_Fortran_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release Fortran FLAGS")
-  set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@" CACHE STRING "Buildroot FCFLAGS")
-  set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
+  if(NOT DEFINED CMAKE_Fortran_FLAGS_DEBUG)
+    set(CMAKE_Fortran_FLAGS_DEBUG "" CACHE STRING "Debug Fortran FLAGS")
+  endif()
+  if(NOT DEFINED CMAKE_Fortran_FLAGS_RELEASE)
+    set(CMAKE_Fortran_FLAGS_RELEASE " -DNDEBUG" CACHE STRING "Release Fortran FLAGS")
+  endif()
+  if(NOT DEFINED CMAKE_Fortran_FLAGS)
+    set(CMAKE_Fortran_FLAGS "@@TARGET_FCFLAGS@@" CACHE STRING "Buildroot FCFLAGS")
+  endif()
+  if(NOT DEFINED CMAKE_Fortran_COMPILER)
+    set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
+  endif()
 endif()
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
