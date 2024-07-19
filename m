Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404DAC3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 16:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 463B680E8E;
	Fri, 19 Jul 2024 16:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gtnsrnhXQGj2; Fri, 19 Jul 2024 16:16:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC81D80E5D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC81D80E5D;
	Fri, 19 Jul 2024 16:16:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0F2B1BF313
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 16:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EF9C6064B
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 16:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hB9TLRhObXFp for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 16:16:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1828D60659
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1828D60659
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1828D60659
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 16:16:04 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a77dc08db60so241900566b.1
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 09:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721405762; x=1722010562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eryvT2xifRNjRUagltCs34d6QNA2rqdx5djDoA4azY4=;
 b=Rp/DLuWyfMNPxpGGkeHMeFkpMTR4UFgdcn4QMaOvax1ygjJTt41ypg0LX0Cd39YBWI
 sY7vVva/LuzGtBGydlzoPLHJC9P2w5oaZA/Xn/I7Fk616J15fio1HVVo8jnkRozUmUJG
 n4bHKPUp2lkzqz1jgz613aY4aM7zdfPc33DgcLxqqT4JoKjnVjpH/I3sDhI4c3Paupcr
 KxoqRajH7FqyCvrqXnuSKv9fwX85UWBZoeI9E53lRMKAW5lTPxTygOEO8ldSyg5aBDMo
 xSJ9ui6saBxhCvYEg/E2j+I13pL5ZL8FZmJGDPOmuXJ4PCNEx5V4KtPEpioEZBEvJMIR
 k1NQ==
X-Gm-Message-State: AOJu0Yy6JLsU70dGrL1NSEJzLhlpTG+VriAKAtAS7jyiUe6vDejWeBwK
 RYWUKKiqnNnI1U7iEkiQxtsmJt9ppVCgq2pR6tcrcpll3P5NORfK2g6w+ydv0s+x4Kxy2fu3pVN
 I
X-Google-Smtp-Source: AGHT+IG3R2wnfTe5qBXebOc29HiBz0G8QhTzFDIs1/ieHYlxhAKlYJwslslsMcTREgGq1ElmpM22DQ==
X-Received: by 2002:a17:906:c00f:b0:a72:4402:9344 with SMTP id
 a640c23a62f3a-a7a011e47c0mr582602466b.20.1721405762396; 
 Fri, 19 Jul 2024 09:16:02 -0700 (PDT)
Received: from mind.home ([2a02:a03f:8b19:d600:77b0:81c2:554:9d13])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7be69bsm50192066b.80.2024.07.19.09.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 09:16:02 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Date: Fri, 19 Jul 2024 18:15:56 +0200
Message-ID: <20240719161557.8832-1-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1721405762; x=1722010562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eryvT2xifRNjRUagltCs34d6QNA2rqdx5djDoA4azY4=;
 b=LxFo9ehymXzIE3QiQIeRUBg5BayX03Z3Ra3TWQySpJm0dK8D+FxNqqiKbvnnWXG83T
 /l9kNJIiFeMTCdRzWHJ6BqI0DUpPvaz+/IjTQxt5nJ2aTiv+duc6OUegayv1hw/6UWIK
 fcaRETKT9IzETSrRTGyzfYBAvw88QAVtIKw08TV17oia+yM3ia6hkKzfJ9XdkmXKxWbf
 Il8Ojvc7GOKLk+fmnA5agGyPavdtZEKIQdBRYbYH9vWxyhq+Nc+XlUD3NdnaP3VSZ983
 2pKWTDlP9vDXU9COjN4wcKz8ItmPPMwXQHNvOhgm6dxTFKCzfgqSd3+wxWRIqRvUOh4f
 G9Cw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=LxFo9ehy
Subject: [Buildroot] [PATCH 1/2] package/libplacebo: add libplacebo package
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
From: Javad Rahimipetroudi via buildroot <buildroot@buildroot.org>
Reply-To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Cc: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds libplacebo package that is used
by mpv player.
libplacebo is the core rendering algorithms and
ideas of mpv rewritten as an independent library
and contains a large assortment of video processing
shaders, focusing on both quality and performance.

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
---
 package/Config.in                             |  1 +
 ...ild-fix-linker-error-in-uclibc-sparc.patch | 45 +++++++++++++++++++
 ...h-add-static_assert-define-for-ulibc.patch | 36 +++++++++++++++
 package/libplacebo/Config.in                  | 18 ++++++++
 package/libplacebo/libplacebo.hash            |  2 +
 package/libplacebo/libplacebo.mk              | 15 +++++++
 6 files changed, 117 insertions(+)
 create mode 100644 package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch
 create mode 100644 package/libplacebo/0002-src-pl_assert.h-add-static_assert-define-for-ulibc.patch
 create mode 100644 package/libplacebo/Config.in
 create mode 100644 package/libplacebo/libplacebo.hash
 create mode 100644 package/libplacebo/libplacebo.mk

diff --git a/package/Config.in b/package/Config.in
index f2e10b2b5e..1207001640 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1509,6 +1509,7 @@ menu "Audio/Sound"
 	source "package/libmodplug/Config.in"
 	source "package/libmpdclient/Config.in"
 	source "package/libopenmpt/Config.in"
+	source "package/libplacebo/Config.in"
 	source "package/libreplaygain/Config.in"
 	source "package/libsamplerate/Config.in"
 	source "package/libsidplay2/Config.in"
diff --git a/package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch b/package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch
new file mode 100644
index 0000000000..3056d28651
--- /dev/null
+++ b/package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch
@@ -0,0 +1,45 @@
+From 4386f3e3b3d02c55776e3f674d8447fd24388c2c Mon Sep 17 00:00:00 2001
+From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
+Date: Fri, 19 Jul 2024 07:02:48 +0200
+Subject: [PATCH] meson.build: add libatomic dependency if needed  
+
+This PR fixes the problem related to not finding the libatomic during the
+build. Some combinations or architecture and libc (e.g. uClibc on SPARC)
+operations in a separate library and don't link with it automatically.
+An optional find_library to meson.build has been added to 
+discover this.
+
+
+Fixes:
+ - https://github.com/haasn/libplacebo/issues/278
+
+Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
+Upstream: https://github.com/haasn/libplacebo/commit/4386f3e3b3d02c55776e3f674d8447fd24388c2c
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index a73e49ff..f8cbf9f1 100644
+--- a/meson.build
++++ b/meson.build
+@@ -448,6 +448,7 @@ add_project_link_arguments(link_args, language: ['c', 'cpp'])
+ # Global dependencies
+ fs = import('fs')
+ libm = cc.find_library('m', required: false)
++atomic = cc.find_library('atomic', required: false)
+ thirdparty = meson.project_source_root()/'3rdparty'
+ python = import('python').find_installation()
+ python_env = environment()
+@@ -473,7 +474,7 @@ else
+     )
+ endif
+ 
+-build_deps = [ libm, threads ]
++build_deps = [ libm, threads, atomic]
+ 
+ subdir('tools')
+ subdir('src')
+-- 
+2.45.2
+
diff --git a/package/libplacebo/0002-src-pl_assert.h-add-static_assert-define-for-ulibc.patch b/package/libplacebo/0002-src-pl_assert.h-add-static_assert-define-for-ulibc.patch
new file mode 100644
index 0000000000..6960c2f219
--- /dev/null
+++ b/package/libplacebo/0002-src-pl_assert.h-add-static_assert-define-for-ulibc.patch
@@ -0,0 +1,36 @@
+From 0182e2b94bbc6bb964f96527d18e93c9b4709a3a Mon Sep 17 00:00:00 2001
+From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
+Date: Fri, 19 Jul 2024 07:57:45 +0200
+Subject: [PATCH] src/pl_assert.h:add static_assert define for ulibc
+
+This PR adds the static_assert macro defination for uClibc that is
+missed in some platforms. However, it is limited to C versions lower
+than C23. From C23, static_assert is not defined as macro anymore:
+https://en.cppreference.com/w/c/language/_Static_assert
+
+Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
+Upstream: https://github.com/haasn/libplacebo/commit/0182e2b94bbc6bb964f96527d18e93c9b4709a3a
+---
+ src/pl_assert.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/pl_assert.h b/src/pl_assert.h
+index b4c6656c..de9d3547 100644
+--- a/src/pl_assert.h
++++ b/src/pl_assert.h
+@@ -20,6 +20,12 @@
+ #include <stdio.h>
+ #include <assert.h>
+ 
++#if !defined (__cplusplus)
++#if (__STDC_VERSION__ < 202301L)
++#define static_assert _Static_assert
++#endif
++#endif
++
+ #ifndef NDEBUG
+ # define pl_assert assert
+ #else
+-- 
+2.45.2
+
diff --git a/package/libplacebo/Config.in b/package/libplacebo/Config.in
new file mode 100644
index 0000000000..e2fc434248
--- /dev/null
+++ b/package/libplacebo/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBPLACEBO
+	bool "libplacebo"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 #C++20
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_STATIC_LIBS # needs <dlfcn.h>
+
+	help
+	  libplacebo is, in a nutshell, the core rendering
+	  algorithms and ideas of mpv rewritten as an
+	  independent library. As of today, libplacebo
+	  contains a large assortment of video processing
+	  shaders, focusing on both quality and performance.
+
+comment "libplacebo needs a toolchain w/ dynamic library, threads, and dynamic loading"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libplacebo/libplacebo.hash b/package/libplacebo/libplacebo.hash
new file mode 100644
index 0000000000..d1588a608b
--- /dev/null
+++ b/package/libplacebo/libplacebo.hash
@@ -0,0 +1,2 @@
+sha256  afaaf16668a1dfaa5f5bf7329713d0dd89cf2ca0dbe7c68aeea894d333e2503e  libplacebo-v7.349.0-git4.tar.gz
+sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  LICENSE
diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
new file mode 100644
index 0000000000..ae3cb68022
--- /dev/null
+++ b/package/libplacebo/libplacebo.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libplacebo
+#
+################################################################################
+
+LIBPLACEBO_VERSION = v7.349.0
+LIBPLACEBO_SITE = https://github.com/haasn/libplacebo
+LIBPLACEBO_SITE_METHOD = git
+LIBPLACEBO_GIT_SUBMODULES = YES
+LIBPLACEBO_LICENSE = LGPL-2.1
+LIBPLACEBO_LICENSE_FILES = LICENSE
+LIBPLACEBO_INSTALL_STAGING = YES
+
+$(eval $(meson-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
