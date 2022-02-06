Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AEEC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BB8860B6A;
	Sun,  6 Feb 2022 10:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMyhgjQhrVON; Sun,  6 Feb 2022 10:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C1C660BE4;
	Sun,  6 Feb 2022 10:16:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF6AC1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC94D60BE4
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qCj3wG-RmVb for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:16:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F36560B6A
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:16:47 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m5so2410271wrb.2
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 02:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zNlYwbcl3g1TGogT8jNkv+B47pr9EmN070l9s6/Kzm8=;
 b=J+M2xPl7hOYxkKEvbzyTVXIJg9voGb02hRcH0boC+rJPeHzmWzuTDQA0CgHA+2kxLp
 1FQmAeoQXQ4HoYA8LkxORXjrvzEM3XrqS4zhxoxcUXuY/wI8zJjsvuXb6FdFwsBW8yPc
 SzhOZKVRVor7z5wc2aMrp3sREzhmQnm+TPRdzoGP2q11pq4Je91NquBl5oGFp9GuUoKz
 yuSpUjJErbYCtR1oQ0Sa7cZqGHuYME+QSM3icVnMqzonuxMgdFv5NoO1I9d7dNTth178
 5KM3WV7k8rLZBdhYV1P0cAwMFpEVMaWVQdxnrTDC+gmaNEb8rbYoC9QJ8773g4MgQvHp
 T6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zNlYwbcl3g1TGogT8jNkv+B47pr9EmN070l9s6/Kzm8=;
 b=ZPSy0HV7xQeRHUh1kBSCNa3lqX8VHZILKv7ieN3peb1Z2cE9VjoeKfOkoN4My8lJWC
 b81Dx+enm5ml2GZara0Tq8juNKCerSQ/brfCnh3+gOunN+7ZHIzG3/58WSKZpNz4aoWL
 PYs8hskDapq8mnnukTpd6N+8bzOr8ZG2EiYMfNwi+qEt/sbk1KFfW1NFor0BfTXZ928h
 6R0BcEug7N+tZx7htpxi+WF+kU5tdD7DOVwIq5odVb4MGfj18w+S2QCQyWkq9FJW4KHm
 SWqYBY74D3d28rLY3aDjILa4U3VDjcnA22Sa0v/o52s6TyZWWLhIwnVW21IYID3uDU16
 NlKA==
X-Gm-Message-State: AOAM533y8Ub6NmyZiIFDBEjFnSqd0u8mBtQz/5Lvf6UYnbRbjKXhzvbt
 zf1OTKmoszA07U21qCPuy+FBoT0Y1Z8=
X-Google-Smtp-Source: ABdhPJzzPdTo0Mzu7qTZoP/3tN/jAuheDLFcj/CznnpUkz9IolAbmFE5yISWYYtHnsNm5TlTn+0plg==
X-Received: by 2002:a05:6000:18a4:: with SMTP id
 b4mr5995989wri.228.1644142605078; 
 Sun, 06 Feb 2022 02:16:45 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n11sm10271450wms.3.2022.02.06.02.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 02:16:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 11:14:33 +0100
Message-Id: <20220206101433.862930-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libopenh264: bump to version 2.2.0
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patches (already in version)

https://github.com/cisco/openh264/releases/tag/v2.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Add-USE_STACK_PROTECTOR-option.patch | 100 ------------------
 package/libopenh264/0002-fix-mips-build.patch |  73 -------------
 ...n-inc-asmdefs_mmi.h-fix-mips32-build.patch |  89 ----------------
 package/libopenh264/libopenh264.hash          |   2 +-
 package/libopenh264/libopenh264.mk            |   2 +-
 5 files changed, 2 insertions(+), 264 deletions(-)
 delete mode 100644 package/libopenh264/0001-Add-USE_STACK_PROTECTOR-option.patch
 delete mode 100644 package/libopenh264/0002-fix-mips-build.patch
 delete mode 100644 package/libopenh264/0003-codec-common-inc-asmdefs_mmi.h-fix-mips32-build.patch

diff --git a/package/libopenh264/0001-Add-USE_STACK_PROTECTOR-option.patch b/package/libopenh264/0001-Add-USE_STACK_PROTECTOR-option.patch
deleted file mode 100644
index 3758cd668b..0000000000
--- a/package/libopenh264/0001-Add-USE_STACK_PROTECTOR-option.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 1e7435751c055723b7103dd1d5bb68530e1a2678 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 8 Oct 2019 20:18:18 +0200
-Subject: [PATCH] Add USE_STACK_PROTECTOR option
-
--fstack-protector-all is not supported on all linux toolchains so add an
-option to disable it (and enable it by default to keep current behavior)
-
-Fixes:
- - http://autobuild.buildroot.org/results/377818cf8c1f2632cabdccb32bf4e7f06c0fdbbd
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/cisco/openh264/pull/3175]
----
- Makefile                  | 1 +
- build/platform-android.mk | 5 ++++-
- build/platform-bsd.mk     | 5 ++++-
- build/platform-darwin.mk  | 5 ++++-
- build/platform-linux.mk   | 5 ++++-
- 5 files changed, 17 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 74ff029d..c2061f6a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -34,6 +34,7 @@ GTEST_VER=release-1.8.1
- CCASFLAGS=$(CFLAGS)
- STATIC_LDFLAGS=-lstdc++
- STRIP ?= strip
-+USE_STACK_PROTECTOR = Yes
- 
- SHAREDLIB_MAJORVERSION=5
- FULL_VERSION := 2.0.0
-diff --git a/build/platform-android.mk b/build/platform-android.mk
-index 6f6ce347..06534301 100644
---- a/build/platform-android.mk
-+++ b/build/platform-android.mk
-@@ -44,7 +44,10 @@ SYSROOT = $(NDKROOT)/platforms/android-$(NDKLEVEL)/arch-$(ARCH)
- CXX = $(TOOLCHAINPREFIX)g++
- CC = $(TOOLCHAINPREFIX)gcc
- AR = $(TOOLCHAINPREFIX)ar
--CFLAGS += -DANDROID_NDK -fpic --sysroot=$(SYSROOT) -MMD -MP -fstack-protector-all
-+CFLAGS += -DANDROID_NDK -fpic --sysroot=$(SYSROOT) -MMD -MP
-+ifeq ($(USE_STACK_PROTECTOR), Yes)
-+CFLAGS +=-fstack-protector-all
-+endif
- CFLAGS += -isystem $(NDKROOT)/sysroot/usr/include -isystem $(NDKROOT)/sysroot/usr/include/$(TOOLCHAIN_NAME) -D__ANDROID_API__=$(NDKLEVEL)
- CXXFLAGS += -fno-rtti -fno-exceptions
- LDFLAGS += --sysroot=$(SYSROOT)
-diff --git a/build/platform-bsd.mk b/build/platform-bsd.mk
-index e60d2cc0..2e0bf2cc 100644
---- a/build/platform-bsd.mk
-+++ b/build/platform-bsd.mk
-@@ -3,7 +3,10 @@ SHAREDLIBSUFFIX = so
- SHAREDLIBSUFFIXFULLVER=$(SHAREDLIBSUFFIX).$(FULL_VERSION)
- SHAREDLIBSUFFIXMAJORVER=$(SHAREDLIBSUFFIX).$(SHAREDLIB_MAJORVERSION)
- SHLDFLAGS = -Wl,-soname,$(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER)
--CFLAGS += -fPIC -fstack-protector-all
-+CFLAGS += -fPIC
-+ifeq ($(USE_STACK_PROTECTOR), Yes)
-+CFLAGS += -fstack-protector-all
-+endif
- LDFLAGS += -lpthread
- STATIC_LDFLAGS += -lpthread -lm
- ifeq ($(ASM_ARCH), x86)
-diff --git a/build/platform-darwin.mk b/build/platform-darwin.mk
-index 6c7b2443..718c8e2f 100644
---- a/build/platform-darwin.mk
-+++ b/build/platform-darwin.mk
-@@ -10,7 +10,10 @@ SHLDFLAGS = -dynamiclib -twolevel_namespace -undefined dynamic_lookup \
- 	$(SHAREDLIB_DIR)/$(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER)
- SHARED = -dynamiclib
- SHARED += -current_version $(CURRENT_VERSION) -compatibility_version $(COMPATIBILITY_VERSION)
--CFLAGS += -Wall -fPIC -MMD -MP -fstack-protector-all
-+CFLAGS += -Wall -fPIC -MMD -MP
-+ifeq ($(USE_STACK_PROTECTOR), Yes)
-+CFLAGS += -fstack-protector-all
-+endif
- ifeq ($(ASM_ARCH), x86)
- ASMFLAGS += -DPREFIX
- ifeq ($(ARCH), x86_64)
-diff --git a/build/platform-linux.mk b/build/platform-linux.mk
-index 44fe2424..b5c006b2 100644
---- a/build/platform-linux.mk
-+++ b/build/platform-linux.mk
-@@ -3,7 +3,10 @@ SHAREDLIBSUFFIX = so
- SHAREDLIBSUFFIXFULLVER=$(SHAREDLIBSUFFIX).$(FULL_VERSION)
- SHAREDLIBSUFFIXMAJORVER=$(SHAREDLIBSUFFIX).$(SHAREDLIB_MAJORVERSION)
- SHLDFLAGS = -Wl,-soname,$(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER)
--CFLAGS += -Wall -fno-strict-aliasing -fPIC -MMD -MP -fstack-protector-all
-+CFLAGS += -Wall -fno-strict-aliasing -fPIC -MMD -MP
-+ifeq ($(USE_STACK_PROTECTOR), Yes)
-+CFLAGS += -fstack-protector-all
-+endif
- LDFLAGS += -lpthread
- STATIC_LDFLAGS += -lpthread -lm
- AR_OPTS = crD $@
--- 
-2.23.0
-
diff --git a/package/libopenh264/0002-fix-mips-build.patch b/package/libopenh264/0002-fix-mips-build.patch
deleted file mode 100644
index c4927d567b..0000000000
--- a/package/libopenh264/0002-fix-mips-build.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 9d5981eecde2133b9d6099eb99f96b1c29c3e520 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 13 Apr 2020 12:03:01 +0200
-Subject: [PATCH] fix mips build
-
-In total three PR were sent upstream to fix mips builds:
-https://github.com/cisco/openh264/pull/3185
-https://github.com/cisco/openh264/pull/3217
-https://github.com/cisco/openh264/pull/3225
-
-Buildroot used the first version
-https://git.buildroot.net/buildroot/commit/package/libopenh264?id=e8d0df569e1844f7ba28918a53ee38027b325b8f
-downloaded from https://github.com/cisco/openh264/pull/3185
-
-During discussion the gcc option '-march=loongson3a' was changed to
-'-Wa,-mloongson-mmi,-mloongson-ext':
-https://github.com/cisco/openh264/pull/3185#discussion_r337818960
-
-This causes build errors with gcc version 8.3.0 (Buildroot 2020.02)
-
-tmp/cctgEQaw.s:662: Error: opcode not supported on this processor: loongson3a (mips64r2) `bc .L22'
-/tmp/cctgEQaw.s:1679: Error: opcode not supported on this processor: loongson3a (mips64r2) `bc .L27'
-/tmp/cctgEQaw.s:2218: Error: opcode not supported on this processor: loongson3a (mips64r2) `jrc $31'
-
-This patch partly reverts the change to fix mips build.
-
-$ /home/bernd/buildroot/br5/output/host/bin/mips64el-linux-gcc -v
-
-Using built-in specs.
-COLLECT_GCC=/home/bernd/buildroot/br5/output/host/opt/ext-toolchain/bin/mips64el-linux-gcc.br_real
-COLLECT_LTO_WRAPPER=/home/bernd/buildroot/br5/output/host/opt/ext-toolchain/bin/../libexec/gcc/mips64el-buildroot-linux-gnu/8.3.0/lto-wrapper
-Target: mips64el-buildroot-linux-gnu
-Configured with: ./configure --prefix=/opt/br-mips64r6-n64-el-hf-2020.02 --sysconfdir=/opt/br-mips64r6-n64-el-hf-2020.02/etc --enable-static --target=mips64el-buildroot-linux-gnu --with-sysroot=/opt/br-mips64r6-n64-el-hf-2020.02/mips64el-buildroot-linux-gnu/sysroot --enable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --disable-decimal-float --with-gmp=/opt/br-mips64r6-n64-el-hf-2020.02 --with-mpc=/opt/br-mips64r6-n64-el-hf-2020.02 --with-mpfr=/opt/br-mips64r6-n64-el-hf-2020.02 --with-pkgversion='Buildroot 2020.02' --with-bugurl=http://bugs.buildroot.net/ --disable-libquadmath --enable-tls --enable-threads --without-isl --without-cloog --with-arch=mips64r6 --with-abi=64 --with-nan=2008 --enable-languages=c,c++ --with-build-time-tools=/opt/br-mips64r6-n64-el-hf-2020.02/mips64el-buildroot-linux-gnu/bin --enable-shared --disable-libgomp
-Thread model: posix
-gcc version 8.3.0 (Buildroot 2020.02)
-
-Patch sent upstream: https://github.com/cisco/openh264/pull/3267
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- build/arch.mk            | 2 +-
- build/mips-simd-check.sh | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/build/arch.mk b/build/arch.mk
-index 1bf318ab..c6570ed4 100644
---- a/build/arch.mk
-+++ b/build/arch.mk
-@@ -41,7 +41,7 @@ ASMFLAGS += -I$(SRC_PATH)codec/common/mips/
- ifeq ($(ENABLE_MMI), Yes)
- ENABLE_MMI = $(shell $(SRC_PATH)build/mips-simd-check.sh $(CC) mmi)
- ifeq ($(ENABLE_MMI), Yes)
--CFLAGS += -DHAVE_MMI -Wa,-mloongson-mmi,-mloongson-ext
-+CFLAGS += -DHAVE_MMI -march=loongson3a
- endif
- endif
- #msa
-diff --git a/build/mips-simd-check.sh b/build/mips-simd-check.sh
-index 5efffbef..d0d72f9e 100755
---- a/build/mips-simd-check.sh
-+++ b/build/mips-simd-check.sh
-@@ -15,7 +15,7 @@ TMPO=$(mktemp tmp.XXXXXX.o)
- if [ $2 == "mmi" ]
- then
-    echo "void main(void){ __asm__ volatile(\"punpcklhw \$f0, \$f0, \$f0\"); }" > $TMPC
--   $1 -Wa,-mloongson-mmi $TMPC -o $TMPO &> /dev/null
-+   $1 -march=loongson3a $TMPC -o $TMPO &> /dev/null
-    if test -s $TMPO
-    then
-       echo "Yes"
--- 
-2.25.0
-
diff --git a/package/libopenh264/0003-codec-common-inc-asmdefs_mmi.h-fix-mips32-build.patch b/package/libopenh264/0003-codec-common-inc-asmdefs_mmi.h-fix-mips32-build.patch
deleted file mode 100644
index e11b1d13ef..0000000000
--- a/package/libopenh264/0003-codec-common-inc-asmdefs_mmi.h-fix-mips32-build.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From c505f81e336088b6729a5407a03459f488353288 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 24 May 2021 22:54:01 +0200
-Subject: [PATCH] codec/common/inc/asmdefs_mmi.h: fix mips32 build
-
-Fix the following build failure on mips32 which is raised since version
-2.0.0 and
-https://github.com/cisco/openh264/commit/b13e5bceb18ebb93d0313b46aab4af6f480ca933:
-
-codec/common/mips/copy_mb_mmi.c: In function 'WelsCopy16x16_mmi':
-./codec/common/inc/asmdefs_mmi.h:293:21: error: '_ABI64' undeclared (first use in this function)
-  293 |    if (_MIPS_SIM == _ABI64)                                    \
-      |                     ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/cba3e9d0fd061cc3a92cb732bcdc2c7b66dbf6cb
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/cisco/openh264/pull/3384]
----
- codec/common/inc/asmdefs_mmi.h | 17 +++++++++++------
- 1 file changed, 11 insertions(+), 6 deletions(-)
-
-diff --git a/codec/common/inc/asmdefs_mmi.h b/codec/common/inc/asmdefs_mmi.h
-index 69a7ae39..5d1aed93 100644
---- a/codec/common/inc/asmdefs_mmi.h
-+++ b/codec/common/inc/asmdefs_mmi.h
-@@ -288,9 +288,9 @@
- /**
-  * backup register
-  */
-+#if defined(_ABI64) && _MIPS_SIM == _ABI64
- #define BACKUP_REG \
-    double __attribute__((aligned(16))) __back_temp[8];         \
--   if (_MIPS_SIM == _ABI64)                                    \
-    __asm__ volatile (                                          \
-      "gssqc1       $f25,      $f24,       0x00(%[temp])  \n\t" \
-      "gssqc1       $f27,      $f26,       0x10(%[temp])  \n\t" \
-@@ -299,8 +299,10 @@
-      :                                                         \
-      : [temp]"r"(__back_temp)                                  \
-      : "memory"                                                \
--   );                                                          \
--  else                                                         \
-+   );
-+#else
-+#define BACKUP_REG \
-+   double __attribute__((aligned(16))) __back_temp[8];         \
-    __asm__ volatile (                                          \
-      "gssqc1       $f22,      $f20,       0x00(%[temp])  \n\t" \
-      "gssqc1       $f26,      $f24,       0x10(%[temp])  \n\t" \
-@@ -309,12 +311,13 @@
-      : [temp]"r"(__back_temp)                                  \
-      : "memory"                                                \
-    );
-+#endif
- 
- /**
-  * recover register
-  */
-+#if defined(_ABI64) && _MIPS_SIM == _ABI64
- #define RECOVER_REG \
--   if (_MIPS_SIM == _ABI64)                                    \
-    __asm__ volatile (                                          \
-      "gslqc1       $f25,      $f24,       0x00(%[temp])  \n\t" \
-      "gslqc1       $f27,      $f26,       0x10(%[temp])  \n\t" \
-@@ -323,8 +326,9 @@
-      :                                                         \
-      : [temp]"r"(__back_temp)                                  \
-      : "memory"                                                \
--   );                                                          \
--   else                                                        \
-+   );
-+#else
-+#define RECOVER_REG \
-    __asm__ volatile (                                          \
-      "gslqc1       $f22,      $f20,       0x00(%[temp])  \n\t" \
-      "gslqc1       $f26,      $f24,       0x10(%[temp])  \n\t" \
-@@ -333,6 +337,7 @@
-      : [temp]"r"(__back_temp)                                  \
-      : "memory"                                                \
-    );
-+#endif
- 
- # define OK             1
- # define NOTOK          0
--- 
-2.30.2
-
diff --git a/package/libopenh264/libopenh264.hash b/package/libopenh264/libopenh264.hash
index 0689ab961f..712425a024 100644
--- a/package/libopenh264/libopenh264.hash
+++ b/package/libopenh264/libopenh264.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  af173e90fce65f80722fa894e1af0d6b07572292e76de7b65273df4c0a8be678  libopenh264-2.1.1.tar.gz
+sha256  e4e5c8ba48e64ba6ce61e8b6e2b76b2d870c74c270147649082feabb40f25905  libopenh264-2.2.0.tar.gz
 sha256  dd5c1c9668512530fa5a96e4c29ac4033d70a7eeb0eed7a42fddb6dd794ebdbb  LICENSE
diff --git a/package/libopenh264/libopenh264.mk b/package/libopenh264/libopenh264.mk
index 0c17579979..ea41f72661 100644
--- a/package/libopenh264/libopenh264.mk
+++ b/package/libopenh264/libopenh264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENH264_VERSION = 2.1.1
+LIBOPENH264_VERSION = 2.2.0
 LIBOPENH264_SITE = $(call github,cisco,openh264,v$(LIBOPENH264_VERSION))
 LIBOPENH264_LICENSE = BSD-2-Clause
 LIBOPENH264_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
