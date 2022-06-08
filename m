Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E940C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 19:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DA5140BB8;
	Wed,  8 Jun 2022 19:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zFQEfu_MGAtF; Wed,  8 Jun 2022 19:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11F0E40BB5;
	Wed,  8 Jun 2022 19:14:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A1D551BF35B
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 19:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 916D383ED1
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 19:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvmV74BAqn4N for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 19:14:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E14F283E2D
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 19:14:37 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id e5so4564593wma.0
 for <buildroot@buildroot.org>; Wed, 08 Jun 2022 12:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mdZFW7rr9vBxjZJLWb2Lm77U88bryNgqt0INCjBc2Bc=;
 b=BP/k9JDO8oNUDw/8ILR5CMIhA67x/Qhubz/hvnHwE1Ayu1tPXuGPIUnN2ta4ee18LR
 F066q+i8LtVloHM+fqMGbfpyokRy/3Omy+3wxN5etl6usIeOCW/CM6XPAS8m1Xxv4MEW
 8LOUTL4GqrTTELmCd6+rM12g68N01OoJoxCho/zqP9XRa3Re6h6TqAgRNIdvzjYyUyN1
 ZoCE/1JygQKUwZtVS44vxXHniYOcit16bm3cEjcSrmVAQ2DU3rNRRGonysj+xzQ9Q0tQ
 DkzVNoHMALEzA7aRBjM2Xt1pvYMIfsATW2Z2x5cKel0MDKLrHkUPguA5z9P5hv5rdH3Q
 lhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mdZFW7rr9vBxjZJLWb2Lm77U88bryNgqt0INCjBc2Bc=;
 b=IXZQjUiWxv5d1m4/3urjt0DT9C/qJAqSUCyB95C3AtKRVcbzO50KfR+0xz3B4YdNLW
 wgrqH7buCCfHNV/Cs0KCf6VdEDhHeuKVO5ssaux5/MbZgt80Ny0dp0n24N0levq1348f
 +FDkqwGdSr4TpLWclyc7N/Z+n/DKHcG8taFxDbjDk5YIuwZAL5alC5wuoxfdLQzqV0vZ
 7kGdB7dSMyrT7fjX4LXX2Br/CtKPjke4L0Mosp3e40zvUzUj75mKb54EC4KYDe2llXIF
 5gD3CpewAIbRLQaHrA0nb3Su6N1OsmKR1JsbJX79sShE8I5U3yNG0oUwjHHmhLGDgunK
 RXlQ==
X-Gm-Message-State: AOAM532mk168b+WLnPresMiLHp4h8C9LM3SVdnuvGHD7OtUzeMxfs9wI
 BVHewkJcsn3HIzdOL11+iY/BBn3I3vM=
X-Google-Smtp-Source: ABdhPJwPFyHc3JydpyOiDVVgD523XgF5xQ0HK4oqU1S8LqHBt7rXYhOeorXG2vPtJGHW3aYPBDg+AQ==
X-Received: by 2002:a1c:5444:0:b0:39c:3761:ac37 with SMTP id
 p4-20020a1c5444000000b0039c3761ac37mr724130wmi.144.1654715675764; 
 Wed, 08 Jun 2022 12:14:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c425500b0039c41686421sm17050446wmm.17.2022.06.08.12.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 12:14:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Jun 2022 21:11:37 +0200
Message-Id: <20220608191137.2065197-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rpi-userland: fix libexecinfo
 workaround
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix libexecinfo workaround to avoid the following ffmpeg build failure
with BR2_PACKAGE_RPI_USERLAND raised on uclibc and musl since commit
bc4cc27705de50356d7e9945e41bd989fdc56fe8:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/arm-linux-gcc --sysroot=/home/giuliobenetti/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot -mcpu=arm926ej-s -Wl,--as-needed -Wl,-z,noexecstack -o /tmp/ffconf.5K0cMIh3/test /tmp/ffconf.5K0cMIh3/test.o -lmmal_core -lmmal_util -lmmal_vc_client -lbcm_host -latomic
/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libvcos.so: undefined reference to `backtrace_symbols'

[...]

ERROR: mmal not found

Fixes:
 - http://autobuild.buildroot.org/results/64d21872d25fef35b72106133ed2aed300f52f2f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...on-t-override-CMAKE_EXE_LINKER_FLAGS.patch | 58 -------------------
 ...threads-CMakeLists.txt-fix-build-wit.patch | 45 ++++++++++++++
 package/rpi-userland/rpi-userland.mk          |  1 -
 3 files changed, 45 insertions(+), 59 deletions(-)
 delete mode 100644 package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch
 create mode 100644 package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch

diff --git a/package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch b/package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch
deleted file mode 100644
index bf2a9eb6ea..0000000000
--- a/package/rpi-userland/0006-don-t-override-CMAKE_EXE_LINKER_FLAGS.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 87febf8b7b1c0a6d0ea1d26770d3665008d66fd2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 25 Feb 2022 19:21:06 +0100
-Subject: [PATCH] don't override CMAKE_EXE_LINKER_FLAGS
-
-Don't override CMAKE_EXE_LINKER_FLAGS as it could be used by the user to
-pass additional flags such as -lexecinfo on musl and uclibc-ng
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/raspberrypi/userland/pull/719]
----
- host_applications/android/apps/vidtex/CMakeLists.txt | 2 +-
- host_applications/linux/apps/raspicam/CMakeLists.txt | 2 +-
- makefiles/cmake/arm-linux.cmake                      | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/host_applications/android/apps/vidtex/CMakeLists.txt b/host_applications/android/apps/vidtex/CMakeLists.txt
-index e7206cc..16c64db 100644
---- a/host_applications/android/apps/vidtex/CMakeLists.txt
-+++ b/host_applications/android/apps/vidtex/CMakeLists.txt
-@@ -5,7 +5,7 @@ SET(COMPILE_DEFINITIONS -Werror -Wall)
- # Set --no-as-needed to stop the linker discarding mmal_vc_client
- # as it can't see that the constructor registers a load of functionality
- # with the MMAL core.
--SET( CMAKE_EXE_LINKER_FLAGS "-Wl,--no-as-needed" )
-+SET( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--no-as-needed" )
- 
- include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
- 
-diff --git a/host_applications/linux/apps/raspicam/CMakeLists.txt b/host_applications/linux/apps/raspicam/CMakeLists.txt
-index e6bd373..2f72eb2 100644
---- a/host_applications/linux/apps/raspicam/CMakeLists.txt
-+++ b/host_applications/linux/apps/raspicam/CMakeLists.txt
-@@ -6,7 +6,7 @@ SET(COMPILE_DEFINITIONS -Werror)
- # Set --no-as-needed to stop the linker discarding mmal_vc_client
- # as it can't see that the constructor registers a load of functionality
- # with the MMAL core.
--SET( CMAKE_EXE_LINKER_FLAGS "-Wl,--no-as-needed" )
-+SET( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,--no-as-needed" )
- 
- include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/libs/bcm_host/include)
- include_directories(${PROJECT_SOURCE_DIR}/host_applications/linux/apps/raspicam/)
-diff --git a/makefiles/cmake/arm-linux.cmake b/makefiles/cmake/arm-linux.cmake
-index 957846a..e172282 100644
---- a/makefiles/cmake/arm-linux.cmake
-+++ b/makefiles/cmake/arm-linux.cmake
-@@ -93,7 +93,7 @@ if(ANDROID)
-     set(CMAKE_SHARED_LINKER_FLAGS "-nostdlib ${ANDROID_CRTBEGIN} -Wl,-Bdynamic -Wl,-T${ANDROID_LDSCRIPTS}/armelf.x")
- 
-     link_directories(${ANDROID_LIBS})
--    set(CMAKE_EXE_LINKER_FLAGS "-nostdlib ${ANDROID_CRTBEGIN} -nostdlib -Wl,-z,noexecstack") 
-+    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -nostdlib ${ANDROID_CRTBEGIN} -nostdlib -Wl,-z,noexecstack") 
-     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-dynamic-linker,/system/bin/linker -Wl,-rpath,${CMAKE_INSTALL_PREFIX}/lib")
-     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-T${ANDROID_LDSCRIPTS}/armelf.x -Wl,--gc-sections")
-     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-z,nocopyreloc -Wl,-z,noexecstack -Wl,--fix-cortex-a8 -Wl,--no-undefined")
--- 
-2.34.1
-
diff --git a/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch b/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
new file mode 100644
index 0000000000..e799c82418
--- /dev/null
+++ b/package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch
@@ -0,0 +1,45 @@
+From 220c37b496f5c883bbfa955ee7fee471e41c34d4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 25 Feb 2022 19:21:06 +0100
+Subject: [PATCH] interface/vcos/pthreads/CMakeLists.txt: fix build with
+ libexecinfo
+
+interface/vcos/glibc/vcos_backtrace.c uses execinfo.h which can be
+provided by libexecinfo on uclibc or musl so link with it if needed to
+avoid the following build failure:
+
+/home/peko/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/10.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: ../../build/lib/libvcos.so: undefined reference to `backtrace_symbols'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/93d3b8cc2ac5dfa9d4b44946c0b4d8171e8f52a1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/raspberrypi/userland/pull/719]
+---
+ interface/vcos/pthreads/CMakeLists.txt | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/interface/vcos/pthreads/CMakeLists.txt b/interface/vcos/pthreads/CMakeLists.txt
+index 1d81ca3..43aca03 100644
+--- a/interface/vcos/pthreads/CMakeLists.txt
++++ b/interface/vcos/pthreads/CMakeLists.txt
+@@ -33,12 +33,14 @@ set (SOURCES
+    ../generic/vcos_generic_blockpool.c
+ )
+ 
++find_library (EXECINFO_LIBRARY execinfo)
++
+ if (VCOS_PTHREADS_BUILD_SHARED)
+    add_library (vcos SHARED ${SOURCES})
+-   target_link_libraries (vcos pthread dl rt)
++   target_link_libraries (vcos pthread dl rt ${EXECINFO_LIBRARY})
+ else ()
+    add_library (vcos ${SOURCES})
+-   target_link_libraries (vcos pthread rt)
++   target_link_libraries (vcos pthread rt ${EXECINFO_LIBRARY})
+ endif ()
+ 
+ 
+-- 
+2.35.1
+
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 3564ec0703..1204196e19 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -15,7 +15,6 @@ RPI_USERLAND_PROVIDES = libegl libgles libopenmax libopenvg
 
 ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
 RPI_USERLAND_DEPENDENCIES += libexecinfo
-RPI_USERLAND_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-lexecinfo
 endif
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND_HELLO),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
