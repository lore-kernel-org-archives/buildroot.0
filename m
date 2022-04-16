Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEE3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 21:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91530415D0;
	Sat, 16 Apr 2022 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZ3r-FvAGLpt; Sat, 16 Apr 2022 21:10:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02EB941C4F;
	Sat, 16 Apr 2022 21:10:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD3AA1BF341
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 21:10:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2F5960B86
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 21:10:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jhwzqa37nk3e for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 21:10:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48331607F9
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 21:10:01 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id p18so13570455wru.5
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 14:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6J+nbjNpRjZ9RAQ/Zr3hTDm2Udp96jgnrLxtWou9BZ0=;
 b=F18dg/91x1rVHkT+mfXwRqwYtBZrWkzlBoSBRqZWA9dBSlCix9/IdJ/yCCSxeu5SCJ
 +eKJKetQgwvoa/q6EsdwvDD3vZFJVGTjgDuvMwhjPx8RMo4DHMtsCl1WDxLtJFdgyK0L
 NAsiQ6wx4rePQX2MNIoqNnd21hhGgZWyfPFHnjotJZw4SfNkiydhaV+EIRZMS3i2UKY7
 g/CVkx1uoSCE2VJbjeiu6Hs6Cs+2gN18eCamrU4g2KiPuUEBQKnOHkGqf7hGVFJgQPVP
 XdfWgVB4r05H4sXDh3WaqGqlr4Yyv8jQKyMQ6dL2n7x4tmOpLFfqp+7cgjNc17Lkp8Mm
 taaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6J+nbjNpRjZ9RAQ/Zr3hTDm2Udp96jgnrLxtWou9BZ0=;
 b=q3kcjstBi7JG5Ca3xoLTgwMjjkYDkG7AOc3RbuamjDvfXOiZx2TGh9CsGbGNpdl04l
 +6aL9TMSdzPgO/fYwHHXwcsIwBXoHrWI8PDfI/Tfq8jKj3LVBPkkgdlcGpwmGhBH1QnV
 o82rxV5qqmOij8sYSBGCN/UExs69Txpv/frtBehcOinBPbE17www45uVpfOy8jltcg8z
 n13NbQst9/EapcMuB6mzDPxTgXzViIjDM7qJTMAm6NEg/awEicIGEz5F8vbIz7WY21Eu
 lSaKEyIr3D8WcR4oQIwmaZJLkyhFrZq4HewxusmyhvfqFYL7vb4KxPX9+czBNMmUP3KO
 Xfsw==
X-Gm-Message-State: AOAM531/J9QzsAykhcTWngYcgu/LrOOwmmVnFE6ydET9tPwIzei5fWIX
 20v+FANJ8tLt6QXwsPEeCGt5fmZqeRQ=
X-Google-Smtp-Source: ABdhPJxHCSu8EIlU9oiBmG15VfPWFOlctxKlAbtQRqDJskgJSLDaTkzpm0SXq5ZKMtIpYde7X807nQ==
X-Received: by 2002:a05:6000:1acf:b0:203:fe67:a8dc with SMTP id
 i15-20020a0560001acf00b00203fe67a8dcmr3512252wry.212.1650143398925; 
 Sat, 16 Apr 2022 14:09:58 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 2-20020a056000154200b00203ee1fd1desm7003298wry.64.2022.04.16.14.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 14:09:58 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 23:07:49 +0200
Message-Id: <20220416210750.3065016-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/tbb: bump to version 2021.5.0
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to cmake-package
- Drop DO_ITT_NOTIFY which is only used in example and test
- license file has been renamed to LICENSE.txt
- Add upstream patches to fix musl build

https://www.intel.com/content/www/us/en/developer/articles/release-notes/intel-oneapi-threading-building-blocks-release-notes.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysdig/Config.in                      |  2 +-
 ...Musl-linux-can-not-use-RTLD_DEEPBIND.patch | 33 ++++++++++++
 ...is-only-defined-on-glibc-and-android.patch | 42 ++++++++++++++++
 package/tbb/Config.in                         | 12 +++--
 package/tbb/tbb.hash                          |  4 +-
 package/tbb/tbb.mk                            | 50 +++----------------
 6 files changed, 94 insertions(+), 49 deletions(-)
 create mode 100644 package/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
 create mode 100644 package/tbb/0002-mallinfo-is-only-defined-on-glibc-and-android.patch

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index 3a4c033b2b..c124054105 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_SYSDIG
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, jq, protobuf, tbb
 	depends on !BR2_STATIC_LIBS # elfutils, protobuf, tbb
 	depends on BR2_USE_WCHAR # elfutils
-	depends on BR2_TOOLCHAIN_USES_GLIBC # elfutils, tbb
+	depends on BR2_TOOLCHAIN_USES_GLIBC # elfutils
 	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
 	select BR2_PACKAGE_C_ARES
 	select BR2_PACKAGE_ELFUTILS
diff --git a/package/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch b/package/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
new file mode 100644
index 0000000000..82182ce109
--- /dev/null
+++ b/package/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
@@ -0,0 +1,33 @@
+From 883c2e5245c39624b3b5d6d56d5b203cf09eac38 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 Dec 2021 08:08:07 -0800
+Subject: [PATCH] Musl/linux can not use RTLD_DEEPBIND (#684)
+
+Exclude non-glibc linux systems along with android
+Fixes
+src/tbb/dynamic_link.cpp:417:29: error: use
+ of undeclared identifier 'RTLD_DEEPBIND'                                                                                    |             flags = flags | RTLD_DEEPBIND;
+|                             ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+[Retrieved from:
+https://github.com/oneapi-src/oneTBB/commit/883c2e5245c39624b3b5d6d56d5b203cf09eac38]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/tbb/dynamic_link.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/tbb/dynamic_link.cpp b/src/tbb/dynamic_link.cpp
+index 3f1342503..5330d7107 100644
+--- a/src/tbb/dynamic_link.cpp
++++ b/src/tbb/dynamic_link.cpp
+@@ -413,7 +413,7 @@ namespace r1 {
+         int flags = RTLD_NOW;
+         if (local_binding) {
+             flags = flags | RTLD_LOCAL;
+-#if __linux__ && !__ANDROID__ && !__TBB_USE_SANITIZERS
++#if (__linux__ && __GLIBC__) && !__TBB_USE_SANITIZERS
+             flags = flags | RTLD_DEEPBIND;
+ #endif
+         } else {
diff --git a/package/tbb/0002-mallinfo-is-only-defined-on-glibc-and-android.patch b/package/tbb/0002-mallinfo-is-only-defined-on-glibc-and-android.patch
new file mode 100644
index 0000000000..9b397cac41
--- /dev/null
+++ b/package/tbb/0002-mallinfo-is-only-defined-on-glibc-and-android.patch
@@ -0,0 +1,42 @@
+From 3a7f96db56cc9821055cbc769d3065db86b8b4c9 Mon Sep 17 00:00:00 2001
+From: Julien Voisin <jvoisin@users.noreply.github.com>
+Date: Mon, 7 Feb 2022 07:56:15 +0100
+Subject: [PATCH] mallinfo is only defined on glibc and android (#764)
+
+It currently prevents compilation under musl:
+
+```
+[ 90%] Building CXX object src/tbbmalloc_proxy/CMakeFiles/tbbmalloc_proxy.dir/proxy.cpp.o
+/__w/mimalloc-bench/mimalloc-bench/extern/tbb/src/tbbmalloc_proxy/proxy.cpp:263:26: error: return type 'struct mallinfo' is incomplete
+  263 | struct mallinfo mallinfo() __THROW
+      |                          ^
+compilation terminated due to -Wfatal-errors.
+``
+
+[Retrieved from:
+https://github.com/oneapi-src/oneTBB/commit/3a7f96db56cc9821055cbc769d3065db86b8b4c9]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/tbbmalloc_proxy/proxy.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/tbbmalloc_proxy/proxy.cpp b/src/tbbmalloc_proxy/proxy.cpp
+index e58e55e0b..23b9c19c1 100644
+--- a/src/tbbmalloc_proxy/proxy.cpp
++++ b/src/tbbmalloc_proxy/proxy.cpp
+@@ -260,6 +260,7 @@ int mallopt(int /*param*/, int /*value*/) __THROW
+     return 1;
+ }
+ 
++#if defined(__GLIBC__) || defined(__ANDROID__)
+ struct mallinfo mallinfo() __THROW
+ {
+     struct mallinfo m;
+@@ -267,6 +268,7 @@ struct mallinfo mallinfo() __THROW
+ 
+     return m;
+ }
++#endif
+ 
+ #if __ANDROID__
+ // Android doesn't have malloc_usable_size, provide it to be compatible
diff --git a/package/tbb/Config.in b/package/tbb/Config.in
index 0f40b74d31..b2e97829b5 100644
--- a/package/tbb/Config.in
+++ b/package/tbb/Config.in
@@ -1,9 +1,11 @@
 config BR2_PACKAGE_TBB
 	bool "tbb"
-	depends on BR2_TOOLCHAIN_USES_GLIBC
+	# tbb needs fenv.h which is not provided by uclibc
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	help
 	  Intel(R) Threading Building Blocks (Intel(R) TBB) lets you
 	  easily write parallel C++ programs that take full advantage
@@ -12,5 +14,9 @@ config BR2_PACKAGE_TBB
 
 	  https://www.threadingbuildingblocks.org/
 
-comment "tbb needs a glibc toolchain w/ dynamic library, threads, C++"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+comment "tbb needs a glibc or musl toolchain w/ dynamic library, threads, C++"
+	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+
+comment "tbb needs exception_ptr"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
index 81d224b3ca..9992fb3c4f 100644
--- a/package/tbb/tbb.hash
+++ b/package/tbb/tbb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b8dbab5aea2b70cf07844f86fa413e549e099aa3205b6a04059ca92ead93a372  tbb-2018_U5.tar.gz
-sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
+sha256  e5b57537c741400cf6134b428fc1689a649d7d38d9bb9c1b6d64f092ea28178a  tbb-2021.5.0.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
index 87e83551fe..afe756a85a 100644
--- a/package/tbb/tbb.mk
+++ b/package/tbb/tbb.mk
@@ -4,52 +4,16 @@
 #
 ################################################################################
 
-TBB_VERSION = 2018_U5
-TBB_SITE = $(call github,01org,tbb,$(TBB_VERSION))
+TBB_VERSION = 2021.5.0
+TBB_SITE = $(call github,01org,tbb,v$(TBB_VERSION))
 TBB_INSTALL_STAGING = YES
 TBB_LICENSE = Apache-2.0
-TBB_LICENSE_FILES = LICENSE
+TBB_LICENSE_FILES = LICENSE.txt
 TBB_CPE_ID_VENDOR = intel
 TBB_CPE_ID_PRODUCT = threading_building_blocks
 
-TBB_SO_VERSION = 2
-TBB_LIBS = libtbb libtbbmalloc libtbbmalloc_proxy
-TBB_BIN_PATH = $(@D)/build/linux_*
+TBB_CONF_OPTS = \
+	-DTBB_STRICT=OFF \
+	-DTBB_TEST=OFF
 
-# arch is normally set based on uname -m with some conversions. However,
-# it is not really used for much:
-# - to decide between 32 or 64-bit files (based on '64' in the name)
-# - to decide on some arch-specific CFLAGS like -m32, which we don't actually want
-# - to set DO_ITT_NOTIFY if it's x86 (32 or 64 bit)
-# - to include assembler source, but it only exists for ia64
-# The only thing we actually want from the above is the 32/64-bit, and
-# DO_ITT_NOTIFY. Therefore, set arch to a fixed value which is unknown to
-# the tbb build system, and set DO_ITT_NOTIFY explicitly.
-TBB_ARCH = $(if $(BR2_ARCH_IS_64),buildroot64,buildroot32)
-TBB_ITT_NOTIFY = $(if $(BR2_i386)$(BR2_x86_64),-DDO_ITT_NOTIFY)
-TBB_CXXFLAGS = $(TARGET_CXXFLAGS) $(TBB_ITT_NOTIFY)
-
-define TBB_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) arch=$(TBB_ARCH) \
-		CPLUS="$(TARGET_CXX)" CONLY="$(TARGET_CC)" CXXFLAGS="$(TBB_CXXFLAGS)"
-endef
-
-define TBB_INSTALL_LIBS
-	$(foreach lib,$(TBB_LIBS),
-		$(INSTALL) -D -m 0755 $(TBB_BIN_PATH)/$(lib).so.$(TBB_SO_VERSION) \
-			$(1)/usr/lib/$(lib).so.$(TBB_SO_VERSION) ;
-		ln -sf $(lib).so.$(TBB_SO_VERSION) $(1)/usr/lib/$(lib).so
-	)
-endef
-
-define TBB_INSTALL_STAGING_CMDS
-	mkdir -p $(STAGING_DIR)/usr/include/
-	cp -a $(@D)/include/* $(STAGING_DIR)/usr/include/
-	$(call TBB_INSTALL_LIBS,$(STAGING_DIR))
-endef
-
-define TBB_INSTALL_TARGET_CMDS
-	$(call TBB_INSTALL_LIBS,$(TARGET_DIR))
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
