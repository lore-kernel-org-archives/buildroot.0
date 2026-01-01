Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7B6EED60F
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 16:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FEE78114E;
	Thu,  1 Jan 2026 16:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKc364Pc1dBM; Thu,  1 Jan 2026 16:30:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E98598115A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767285004;
	bh=4P3HF1iTZieMzJzPUthA76P7FmdqSr0+nQMhGEAtM8I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cIEPrvl1q67Hywn30x3rokGaX9JVc/AIIgX/GOjnGBFrBMq1ikO+4E11qiMm+LRru
	 /Wj6eKrJWaEJ0kl13S25YwrSuNN4b4NapEXUcTceKkSsvlAADIJJ/OY/arBy9GHZ9J
	 gkHz+mrD3cYNTWBItDAoNmfI7l4zSvKuvLPWYAGc8kmjdLQTjoOymIioVbml95tfZA
	 sWV2/yK3UxVvXDTJq7f0X2rkZR3aYGALy06/tAQSuslEI/YmmSkjFo/6L6fYwVSUwT
	 eE9H2/7f+pY/nRDSlV/WQQbS2vJ5ZdW+zXscllL6C0HqD1UkrQrj0d7K5dZofYhB3k
	 YFVtKSwuESNOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E98598115A;
	Thu,  1 Jan 2026 16:30:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A7DCA19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 994C14020B
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9aOIipN3gIe for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 16:30:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AE98400F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AE98400F9
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 16:30:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55D0187E1F; Thu,  1 Jan 2026 16:30:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 17:16:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7a1b73f1758855e47c188c38617dd309b2c2428
X-Git-Newrev: 006aab8d64d2179d77df9a696b3fd8636f541640
X-Patchwork-Hint: ignore
Message-Id: <20260101163000.55D0187E1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libplacebo: add libplacebo package
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

commit: https://git.buildroot.net/buildroot/commit/?id=006aab8d64d2179d77df9a696b3fd8636f541640
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds libplacebo package that is used
by mpv player.
libplacebo is the core rendering algorithms and
ideas of mpv rewritten as an independent library
and contains a large assortment of video processing
shaders, focusing on both quality and performance.

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Tested-by: Sen Hastings <sen@hastings.org>
[Bernd:
- bumped to v7.351.0
- moved Kconfig option to Multimedia (Sen)
- rebased patch 0001 after version bump
- added project URL to Config.in helptext
- removed redundancy in Config.in comment
- added comment to hash file
- switched _SITE to official repo
- added patch to fix build error with latest python3]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 ...on.build-fix-linker-error-in-uclibc-sparc.patch | 45 ++++++++++++++++++++++
 ...sert.h-add-static_assert-define-for-ulibc.patch | 36 +++++++++++++++++
 ...0003-vulkan-utils_gen-fix-for-python-3.14.patch | 31 +++++++++++++++
 package/libplacebo/Config.in                       | 21 ++++++++++
 package/libplacebo/libplacebo.hash                 |  3 ++
 package/libplacebo/libplacebo.mk                   | 15 ++++++++
 8 files changed, 153 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8009686556..75ade2965f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -435,6 +435,7 @@ F:	package/libnpth/
 F:	package/libogg/
 F:	package/libopenh264/
 F:	package/libpciaccess/
+F:	package/libplacebo/
 F:	package/libplatform/
 F:	package/libpng/
 F:	package/libsidplay2/
diff --git a/package/Config.in b/package/Config.in
index e30d769b48..b88ae859fb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1981,6 +1981,7 @@ menu "Multimedia"
 	source "package/libopenaptx/Config.in"
 	source "package/libopenh264/Config.in"
 	source "package/libopusenc/Config.in"
+	source "package/libplacebo/Config.in"
 	source "package/libtheora/Config.in"
 	source "package/libudfread/Config.in"
 	source "package/libvpx/Config.in"
diff --git a/package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch b/package/libplacebo/0001-meson.build-fix-linker-error-in-uclibc-sparc.patch
new file mode 100644
index 0000000000..795a1ae3e5
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
+@@ -450,6 +450,7 @@ add_project_link_arguments(link_args, language: ['c', 'cpp'])
+ # Global dependencies
+ fs = import('fs')
+ libm = cc.find_library('m', required: false)
++atomic = cc.find_library('atomic', required: false)
+ thirdparty = meson.project_source_root()/'3rdparty'
+ python = import('python').find_installation()
+ python_env = environment()
+@@ -475,7 +476,7 @@ else
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
diff --git a/package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch b/package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch
new file mode 100644
index 0000000000..86f7c00856
--- /dev/null
+++ b/package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch
@@ -0,0 +1,31 @@
+From a22f0dff5fe89385155743a1735b146babfdb131 Mon Sep 17 00:00:00 2001
+From: Nicolas Chauvet <kwizart@gmail.com>
+Date: Tue, 29 Jul 2025 11:42:35 +0200
+Subject: [PATCH] vulkan/utils_gen: fix for python 3.14
+
+Python 3.14+ has added more type checking. This patch fixes usage
+
+Fixes: https://github.com/haasn/libplacebo/issues/335
+
+Upstream: https://code.videolan.org/videolan/libplacebo/-/commit/12509c0f1ee8c22ae163017f0a5e7b8a9d983a17
+
+Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/vulkan/utils_gen.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/vulkan/utils_gen.py b/src/vulkan/utils_gen.py
+index 9a97d35f..9b803d82 100644
+--- a/src/vulkan/utils_gen.py
++++ b/src/vulkan/utils_gen.py
+@@ -202,7 +202,8 @@ def find_registry_xml(datadir):
+     if not xmlfile or xmlfile == '':
+         xmlfile = find_registry_xml(datadir)
+ 
+-    registry = VkXML(ET.parse(xmlfile))
++    tree = ET.parse(xmlfile)
++    registry = VkXML(tree.getroot())
+     with open(outfile, 'w') as f:
+         f.write(TEMPLATE.render(
+             vkresults = get_vkenum(registry, 'VkResult'),
diff --git a/package/libplacebo/Config.in b/package/libplacebo/Config.in
new file mode 100644
index 0000000000..fe31ad8347
--- /dev/null
+++ b/package/libplacebo/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_LIBPLACEBO
+	bool "libplacebo"
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_STATIC_LIBS # needs <dlfcn.h>
+	help
+	  libplacebo is, in a nutshell, the core rendering algorithms
+	  and ideas of mpv rewritten as an independent library. As of
+	  today, libplacebo contains a large assortment of video
+	  processing shaders, focusing on both quality and
+	  performance.
+
+	  https://libplacebo.org
+
+comment "libplacebo needs a toolchain w/ C++, dynamic library, NPTL threads, gcc >= 10"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/libplacebo/libplacebo.hash b/package/libplacebo/libplacebo.hash
new file mode 100644
index 0000000000..302afcca16
--- /dev/null
+++ b/package/libplacebo/libplacebo.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  46b501842e5b18867c6b7dd5c901e65ad6396608ad76309c366d8ace8be0d0d7  libplacebo-v7.351.0-git4.tar.gz
+sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  LICENSE
diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
new file mode 100644
index 0000000000..67bf0f00fb
--- /dev/null
+++ b/package/libplacebo/libplacebo.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libplacebo
+#
+################################################################################
+
+LIBPLACEBO_VERSION = v7.351.0
+LIBPLACEBO_SITE = https://code.videolan.org/videolan/libplacebo.git
+LIBPLACEBO_SITE_METHOD = git
+LIBPLACEBO_GIT_SUBMODULES = YES
+LIBPLACEBO_LICENSE = LGPL-2.1
+LIBPLACEBO_LICENSE_FILES = LICENSE
+LIBPLACEBO_INSTALL_STAGING = YES
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
