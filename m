Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FA1C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1502240292;
	Tue,  4 Jan 2022 17:50:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qk566mfSwRi7; Tue,  4 Jan 2022 17:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21BB540937;
	Tue,  4 Jan 2022 17:50:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F2231BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C73D60AB0
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:49:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lYBGZ_ElXB77 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:49:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 90A97607F0
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:49:56 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id j6so151377071edw.12
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ssmt77+rz5rkxuzDIF/JkzlUBF6AVaCafZkMXpwH/n4=;
 b=UW7/FBzMo8axrlLTFi95OG2WyaxlquvKJVRxn01xsEjuhgJVAK9ey0aG3uzZmOfIIF
 52dK8JKABj3vJr80MAK0JGtyXzdbj3soNsmDS8zwBxrtjmkntkzZvDiGqcImdcwlRCcI
 cQq7FnmgiBMbCNz8OyZDJvf77Ts5swHHkNCxGfQ87fo1WwGA2wPMVfXNn2n1EvzC7yF7
 dQ2R3aTNFZID/JskNctzDcie0XiDjj36W66dAfYRxTS0eCJXnA6hRJIIzOto6PIPysFO
 rqqJYPTCkPD2bE/vm0dSKCEONIDOP35b9hMFOddDe5jtsfkSxUVdat2yGiR9Ub4R220W
 aj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ssmt77+rz5rkxuzDIF/JkzlUBF6AVaCafZkMXpwH/n4=;
 b=dr2M2FCIU2RjOGrd3RmBUd/eyZfsHNH+q7B0dnBIaLcTCA5y9w+ei/wSCiiI9u3yvo
 JUzvpFM1m4532dapj7may3CWcoDzcH34d7UqEnZl3jlLAPeDx7uZNAdeQtWyaAQR6oBF
 Hy0gBpAtCmnht2PDrqgkXULLcWypW+OyVvkhXJr1qx+xu1zIrvxS5wPDiowkR2xblLxM
 sbCtvBNvLo/o9y9XVXB9Tg3OsZkRDydmMU/h5RSyhyvNIWs1y22y9bQYARSmWrlQkwqZ
 m9aFfj4Ua5PV2LGmeB9R/p2YoKFLxSaxjPs9S10zj0fbvSgmy8dmEOGOEr7sXpIzVMoQ
 OQ4w==
X-Gm-Message-State: AOAM531yfG0bob/DI9/nAkifsiKRRSCRXwe+8mSXQ/56NwzEXGZQdN5g
 hVGm6PBRYvirRlDofkzxaGH2FYaqibMQXQ==
X-Google-Smtp-Source: ABdhPJyKf7xwS99LDeRqG/XuEypaeuGJcm+cCwL19t7rLuLhLDPoc1tI6TVE0KmWH8sMaHE85PNHYQ==
X-Received: by 2002:a17:906:6a0c:: with SMTP id
 qw12mr38379860ejc.87.1641318594656; 
 Tue, 04 Jan 2022 09:49:54 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id qk6sm500325ejc.127.2022.01.04.09.49.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:49:54 -0800 (PST)
Message-ID: <de4b0fb6-38bc-b744-b7bd-0a31788db058@mind.be>
Date: Tue, 4 Jan 2022 18:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220101215622.2013558-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101215622.2013558-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mraa: bump to version 2.2.0
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
Cc: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 22:56, Fabrice Fontaine wrote:
> - Refresh upstream status of first patch
> - Drop second patch (already in version)
> 
> https://github.com/eclipse/mraa/blob/v2.2.0/docs/changelog.md
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...de-Declare-gVERSION-global-as-extern.patch |   7 +-
>   ...2-CMakeLists.txt-add-BUILDCPP-option.patch | 193 ------------------
>   package/mraa/mraa.hash                        |   2 +-
>   package/mraa/mraa.mk                          |   2 +-
>   4 files changed, 6 insertions(+), 198 deletions(-)
>   delete mode 100644 package/mraa/0002-CMakeLists.txt-add-BUILDCPP-option.patch
> 
> diff --git a/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch b/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
> index b3a1f5a03a..110c020a62 100644
> --- a/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
> +++ b/package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch
> @@ -1,13 +1,14 @@
> -From dbb5961f106ec42cd70689d933674c9c37aedfe1 Mon Sep 17 00:00:00 2001
> +From aaa0a5cd4e401bde4fb3691dd4e6c70a5c61e031 Mon Sep 17 00:00:00 2001
>   From: =?UTF-8?q?Bj=C3=B6rn=20Esser?= <besser82@fedoraproject.org>
>   Date: Mon, 13 Apr 2020 20:12:11 +0200
>   Subject: [PATCH] include: Declare gVERSION global as 'extern'.
>   
>   Fixes build with '-fno-common'.
>   
> +Signed-off-by: Thomas Ingleby <thomas.ingleby@intel.com>
>   [Retrieved from:
> -https://github.com/eclipse/mraa/pull/1012/commits/dbb5961f106ec42cd70689d933674c9c37aedfe1]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmaail.com>
> +https://github.com/eclipse/mraa/commit/aaa0a5cd4e401bde4fb3691dd4e6c70a5c61e031]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   ---
>    include/version.h | 4 ++--
>    1 file changed, 2 insertions(+), 2 deletions(-)
> diff --git a/package/mraa/0002-CMakeLists.txt-add-BUILDCPP-option.patch b/package/mraa/0002-CMakeLists.txt-add-BUILDCPP-option.patch
> deleted file mode 100644
> index fbadfe79ef..0000000000
> --- a/package/mraa/0002-CMakeLists.txt-add-BUILDCPP-option.patch
> +++ /dev/null
> @@ -1,193 +0,0 @@
> -From cb88e4dd1fbbb9d24e625dba2768b88ed99da309 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 13 Jun 2020 22:51:37 +0200
> -Subject: [PATCH] CMakeLists.txt: add BUILDCPP option
> -
> -C++ is a mandatory dependency since version 1.4.0 and
> -https://github.com/eclipse/mraa/commit/122cab1f1e53b7c9c7cd82905b962071f9bad9dc
> -
> -As a result, build on embedded toolchains that do not support C++ fails
> -on:
> -
> -CMake Error at CMakeLists.txt:2 (project):
> -  The CMAKE_CXX_COMPILER:
> -
> -    /home/naourr/work/instance-1/output-1/per-package/mraa/host/bin/arm-linux-g++
> -
> -  is not a full path to an existing compiler tool.
> -
> -Fixes:
> - - http://autobuild.buildroot.org/results/31086422e03611c16ab59c4418e3669b580bc0c0
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/eclipse/mraa/commit/cb88e4dd1fbbb9d24e625dba2768b88ed99da309]
> ----
> - CMakeLists.txt                | 69 +++++++++++++++++++----------------
> - src/java/CMakeLists.txt       |  4 +-
> - src/javascript/CMakeLists.txt | 34 +++++++++--------
> - 3 files changed, 59 insertions(+), 48 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 250d9106e..90c0dc920 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -1,5 +1,5 @@
> - cmake_minimum_required (VERSION 2.8.11)
> --project (mraa C CXX)
> -+project (mraa C)
> -
> - FIND_PACKAGE (Threads REQUIRED)
> -
> -@@ -11,6 +11,8 @@ else ()
> -   set (CMAKE_C_STANDARD 99)
> - endif ()
> -
> -+option (BUILDCPP "Enable C++ (needed by FTDI4222 and tests)" ON)
> -+
> - ###############################################################################
> - # Detect supported warning flags
> - # Modified from work By Dan Liew (fpbench - MIT)
> -@@ -33,15 +35,18 @@ set (MRAA_C_WARNING_FLAGS
> -   -Werror=missing-parameter-type
> - )
> -
> --# Warning flags for the C++ compiler only
> --set (MRAA_CXX_WARNING_FLAGS
> --  -Wnon-virtual-dtor
> --  -Woverloaded-virtual
> --  -Wreorder
> --)
> --
> - include (CheckCCompilerFlag)
> --include (CheckCXXCompilerFlag)
> -+if (BUILDCPP)
> -+  # Warning flags for the C++ compiler only
> -+  set (MRAA_CXX_WARNING_FLAGS
> -+    -Wnon-virtual-dtor
> -+    -Woverloaded-virtual
> -+    -Wreorder
> -+  )
> -+
> -+  enable_language (CXX)
> -+  include (CheckCXXCompilerFlag)
> -+endif ()
> - function (MRAA_SANITIZE_FLAG_NAME OUTPUT_VAR FLAG)
> -   string (REPLACE "-" "_" SANITIZED_FLAG_NAME "${FLAG}")
> -   string (REPLACE "/" "_" SANITIZED_FLAG_NAME "${SANITIZED_FLAG_NAME}")
> -@@ -62,28 +67,30 @@ foreach (flag ${MRAA_BOTH_WARNING_FLAGS} ${MRAA_C_WARNING_FLAGS})
> -   endif ()
> - endforeach ()
> -
> --# Globally set C++ compiler warning flags that are supported and emit
> --# a warning about unsupported flags
> --foreach (flag ${MRAA_BOTH_WARNING_FLAGS} ${MRAA_CXX_WARNING_FLAGS})
> --  MRAA_SANITIZE_FLAG_NAME (SANITIZED_FLAG_NAME "${flag}")
> --  CHECK_CXX_COMPILER_FLAG ("${flag}" HAS_CXX_${SANITIZED_FLAG_NAME})
> --  if (HAS_CXX_${SANITIZED_FLAG_NAME})
> --    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${flag}")
> --  else ()
> --    message (WARNING "C++ compiler does not support flag \"${flag}\"")
> --  endif ()
> --endforeach ()
> --
> --# This function adds the c++11 flag to a c++ target (if supported)
> --function(use_cxx_11 targetname)
> --  include(CheckCXXCompilerFlag)
> --  CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
> --  if (COMPILER_SUPPORTS_CXX11)
> --    set_target_properties(${targetname} PROPERTIES COMPILE_FLAGS "-std=c++11")
> --  else()
> --    message(FATAL_ERROR "Target '${targetname}' requires c++11 which is not supported by this compiler")
> --  endif()
> --endfunction()
> -+if (BUILDCPP)
> -+  # Globally set C++ compiler warning flags that are supported and emit
> -+  # a warning about unsupported flags
> -+  foreach (flag ${MRAA_BOTH_WARNING_FLAGS} ${MRAA_CXX_WARNING_FLAGS})
> -+    MRAA_SANITIZE_FLAG_NAME (SANITIZED_FLAG_NAME "${flag}")
> -+    CHECK_CXX_COMPILER_FLAG ("${flag}" HAS_CXX_${SANITIZED_FLAG_NAME})
> -+    if (HAS_CXX_${SANITIZED_FLAG_NAME})
> -+      set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${flag}")
> -+    else ()
> -+      message (WARNING "C++ compiler does not support flag \"${flag}\"")
> -+    endif ()
> -+  endforeach ()
> -+
> -+  # This function adds the c++11 flag to a c++ target (if supported)
> -+  function(use_cxx_11 targetname)
> -+    include(CheckCXXCompilerFlag)
> -+    CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
> -+    if (COMPILER_SUPPORTS_CXX11)
> -+      set_target_properties(${targetname} PROPERTIES COMPILE_FLAGS "-std=c++11")
> -+    else()
> -+      message(FATAL_ERROR "Target '${targetname}' requires c++11 which is not supported by this compiler")
> -+    endif()
> -+  endfunction()
> -+endif()
> -
> - # Set CMAKE_INSTALL_LIBDIR if not defined
> - include(GNUInstallDirs)
> -diff --git a/src/java/CMakeLists.txt b/src/java/CMakeLists.txt
> -index 231c755fa..cfa72a0df 100644
> ---- a/src/java/CMakeLists.txt
> -+++ b/src/java/CMakeLists.txt
> -@@ -16,7 +16,9 @@ include_directories (
> - set_source_files_properties (mraajava.i PROPERTIES SWIG_FLAGS ";-package;mraa;-I${CMAKE_BINARY_DIR}/src")
> - set_source_files_properties (mraajava.i PROPERTIES CPLUSPLUS ON)
> -
> --set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive -DJAVACALLBACK")
> -+if (BUILDCPP)
> -+  set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fpermissive -DJAVACALLBACK")
> -+endif()
> - set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DJAVACALLBACK")
> -
> - if (NOT DEFINED ENV{JAVA_HOME_NATIVE})
> -diff --git a/src/javascript/CMakeLists.txt b/src/javascript/CMakeLists.txt
> -index 25fd36275..99a96b49d 100644
> ---- a/src/javascript/CMakeLists.txt
> -+++ b/src/javascript/CMakeLists.txt
> -@@ -36,25 +36,27 @@ set_target_properties (mraajs PROPERTIES
> - )
> -
> - message (STATUS "INFO - swig Version ${SWIG_VERSION}")
> --message (STATUS "INFO - CXX compiler Version ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")
> -+if (BUILDCPP)
> -+  message (STATUS "INFO - CXX compiler Version ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")
> -
> --if (${V8_VERSION_MAJOR} GREATER 3)
> --  message (STATUS "INFO - Using V8 version > 3 so requiring C++11 compiler")
> --  # Node 0.12.x V8 engine major version is '3'.
> --  # Node 2.1.0  V8 engine major version is '4'.
> --  set_property (TARGET mraajs PROPERTY CXX_STANDARD 11)
> --  set_property (TARGET mraajs PROPERTY CXX_STANDARD_REQUIRED ON)
> --  if (CMAKE_VERSION VERSION_LESS "3.1")
> --    message (WARNING "Need to use CMAKE version 3.1+, but it is ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION}, using a workaround.")
> --    if (CMAKE_COMPILER_IS_GNUCXX)
> --      if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.7")
> --        message (FATAL_ERROR "GNU gcc compiler is also too old (need 4.7+, but ${CMAKE_CXX_COMPILER_VERSION}) and does not support C++11 standard.")
> -+  if (${V8_VERSION_MAJOR} GREATER 3)
> -+    message (STATUS "INFO - Using V8 version > 3 so requiring C++11 compiler")
> -+    # Node 0.12.x V8 engine major version is '3'.
> -+    # Node 2.1.0  V8 engine major version is '4'.
> -+    set_property (TARGET mraajs PROPERTY CXX_STANDARD 11)
> -+    set_property (TARGET mraajs PROPERTY CXX_STANDARD_REQUIRED ON)
> -+    if (CMAKE_VERSION VERSION_LESS "3.1")
> -+      message (WARNING "Need to use CMAKE version 3.1+, but it is ${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}.${CMAKE_PATCH_VERSION}, using a workaround.")
> -+      if (CMAKE_COMPILER_IS_GNUCXX)
> -+        if (CMAKE_CXX_COMPILER_VERSION VERSION_LESS "4.7")
> -+          message (FATAL_ERROR "GNU gcc compiler is also too old (need 4.7+, but ${CMAKE_CXX_COMPILER_VERSION}) and does not support C++11 standard.")
> -+        endif ()
> -+        set (MRAA_CXX11_WORKAROUND_OPTION "-std=gnu++11")
> -+      else ()
> -+        set (MRAA_CXX11_WORKAROUND_OPTION "-std=c++11")
> -       endif ()
> --      set (MRAA_CXX11_WORKAROUND_OPTION "-std=gnu++11")
> --    else ()
> --      set (MRAA_CXX11_WORKAROUND_OPTION "-std=c++11")
> -+      set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${MRAA_CXX11_WORKAROUND_OPTION} ")
> -     endif ()
> --    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${MRAA_CXX11_WORKAROUND_OPTION} ")
> -   endif ()
> - endif ()
> -
> diff --git a/package/mraa/mraa.hash b/package/mraa/mraa.hash
> index f29a5ce838..321b6409ed 100644
> --- a/package/mraa/mraa.hash
> +++ b/package/mraa/mraa.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  5351ce9eb654014d8ea7f43bdb2d17e6d1955536938a2ea0d467f4008e614345  mraa-2.1.0.tar.gz
> +sha256  076669bee8423ffef3065735b293a329020be86630fea457174dbfcc67a0554a  mraa-2.2.0.tar.gz
>   sha256  fac52622ed3badd86b34857b21777ab90296d6ccbc2ac0fd457c09fdeefa9ef1  COPYING
> diff --git a/package/mraa/mraa.mk b/package/mraa/mraa.mk
> index 910339b386..47178a423b 100644
> --- a/package/mraa/mraa.mk
> +++ b/package/mraa/mraa.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -MRAA_VERSION = 2.1.0
> +MRAA_VERSION = 2.2.0
>   MRAA_SITE = $(call github,eclipse,mraa,v$(MRAA_VERSION))
>   MRAA_LICENSE = MIT
>   MRAA_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
