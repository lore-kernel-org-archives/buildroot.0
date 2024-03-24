Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D94C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 17:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4BED40B4E;
	Sun, 24 Mar 2024 17:11:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkEsHaJ0QSzH; Sun, 24 Mar 2024 17:11:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 983CC40B73
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 983CC40B73;
	Sun, 24 Mar 2024 17:11:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 066671BF40A
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19801403A2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 17:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZtUsTpJyJ_kO for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 17:11:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0956E4056A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0956E4056A
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 17:11:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03EA383C57; Sun, 24 Mar 2024 17:11:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 17:33:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9b40901d1bd27aef9de13391956c959899581c6
X-Git-Newrev: d8a729d1731339da141612be33c5e59bc9928748
X-Patchwork-Hint: ignore
Message-Id: <20240324171117.03EA383C57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igt-gpu-tools: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1545079442624640094=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1545079442624640094==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d8a729d1731339da141612be33c5e59bc9928748
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

IGT GPU Tools is a collection of tools for development and testing of
the DRM drivers

Signed-off-by: Gaël PORTAY <gael.portay@rtone.fr>
Signed-off-by: Andy Yan <andyshrk@163.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Bernd: v4
 - add myself to DEVELOPERS
 - add dependencies to locales, mmu, wchar and headers >= 4.11
 - rework libunwind dependency
 - remove duplicate libglib2 dependency
 v5
 - added optional dependency to json_c
 - remove broken igt_stats binary
 v6
 - updated patch series after upstream review
 v8
 - bumped to current git HEAD to fix musl build errors
 - removed all patches which are included in upstream repo
 - added fix for segfaults with hardened toolchains on x86/x86_64]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
[Francois: v7
 - depend on !BR2_RELRO_FULL
 - remove specific workaround for igt_stats binary]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/igt-gpu-tools/Config.in          | 32 ++++++++++++++++++++
 package/igt-gpu-tools/igt-gpu-tools.hash |  5 +++
 package/igt-gpu-tools/igt-gpu-tools.mk   | 52 ++++++++++++++++++++++++++++++++
 5 files changed, 91 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 328c654fae..c045a8cd7c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -372,6 +372,7 @@ F:	package/gpsd/
 F:	package/gptfdisk/
 F:	package/hddtemp/
 F:	package/hdparm/
+F:	package/igt-gpu-tools/
 F:	package/intel-gmmlib/
 F:	package/intel-mediadriver/
 F:	package/intel-mediasdk/
diff --git a/package/Config.in b/package/Config.in
index c677c3ff4a..1a62bfb1be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -323,6 +323,7 @@ comment "Graphic applications"
 	source "package/glmark2/Config.in"
 	source "package/glslsandbox-player/Config.in"
 	source "package/gnuplot/Config.in"
+	source "package/igt-gpu-tools/Config.in"
 	source "package/ivi-homescreen/Config.in"
 	source "package/jhead/Config.in"
 	source "package/kmscube/Config.in"
diff --git a/package/igt-gpu-tools/Config.in b/package/igt-gpu-tools/Config.in
new file mode 100644
index 0000000000..809c8e28ac
--- /dev/null
+++ b/package/igt-gpu-tools/Config.in
@@ -0,0 +1,32 @@
+config BR2_PACKAGE_IGT_GPU_TOOLS
+	bool "igt-gpu-tools"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_ENABLE_LOCALE
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_USE_WCHAR # elfutils
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11 # linux/dma-buf.h
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps-ng
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_KMOD
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBPCIACCESS
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_PROCPS_NG
+	select BR2_PACKAGE_ZLIB
+	help
+	  IGT GPU Tools is a collection of tools for development and
+	  testing of the DRM drivers.
+
+	  https://gitlab.freedesktop.org/drm/igt-gpu-tools
+
+comment "igt-gpu-tools needs udev /dev management and toolchain w/ threads, wchar, dynamic library, locale, headers >= 4.11"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
+		!BR2_ENABLE_LOCALE || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
diff --git a/package/igt-gpu-tools/igt-gpu-tools.hash b/package/igt-gpu-tools/igt-gpu-tools.hash
new file mode 100644
index 0000000000..bf760b91d7
--- /dev/null
+++ b/package/igt-gpu-tools/igt-gpu-tools.hash
@@ -0,0 +1,5 @@
+# Locally calculated from download
+sha256  de6e9443d569e76333ec6c8ffc53937b6831224161fe69bf2f07efad3bd0e04a  igt-gpu-tools-0ee4074685c1e184f2d3612ea6eb4d126f9a2e23.tar.bz2
+
+# Hash for license file:
+sha256  1b7e266857b05808660f42369a4a797459d7b7bec7245e378aa28a8db2f213da  COPYING
diff --git a/package/igt-gpu-tools/igt-gpu-tools.mk b/package/igt-gpu-tools/igt-gpu-tools.mk
new file mode 100644
index 0000000000..927a1225a5
--- /dev/null
+++ b/package/igt-gpu-tools/igt-gpu-tools.mk
@@ -0,0 +1,52 @@
+################################################################################
+#
+# igt-gpu-tools
+#
+################################################################################
+
+IGT_GPU_TOOLS_VERSION = 0ee4074685c1e184f2d3612ea6eb4d126f9a2e23
+IGT_GPU_TOOLS_SOURCE = igt-gpu-tools-$(IGT_GPU_TOOLS_VERSION).tar.bz2
+IGT_GPU_TOOLS_SITE = https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/archive/$(IGT_GPU_TOOLS_VERSION)
+IGT_GPU_TOOLS_LICENSE = MIT
+IGT_GPU_TOOLS_LICENSE_FILES = COPYING
+IGT_GPU_TOOLS_INSTALL_STAGING = YES
+IGT_GPU_TOOLS_DEPENDENCIES = \
+	host-pkgconf \
+	cairo \
+	elfutils \
+	kmod \
+	libdrm \
+	libglib2 \
+	libpciaccess \
+	pixman \
+	procps-ng \
+	udev \
+	zlib
+
+# On x86 systems, libigt resolves igt_half_to_float and igt_float_to_half as
+# indirect functions at runtime by checking CPU features with igt_x86_features.
+# The igt_x86_features function is implemented is a different object and the
+# call uses the PLT itself. If lazy binding is disabled, this causes a segfault
+# while resolving the symbols for libigt on x64 systems. Disable BINDNOW on X86
+# systems to prevent the segfaults.
+# https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/102
+# https://bugs.gentoo.org/788625#c13
+ifeq ($(BR2_i386)$(BR2_x86_64)x$(BR2_RELRO_NONE),yx)
+IGT_GPU_TOOLS_LDFLAGS = $(TARGET_LDFLAGS) -Wl,-z,lazy
+endif
+
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+IGT_GPU_TOOLS_CONF_OPTS += -Drunner=enabled
+IGT_GPU_TOOLS_DEPENDENCIES += json-c
+else
+IGT_GPU_TOOLS_CONF_OPTS += -Drunner=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+IGT_GPU_TOOLS_CONF_OPTS += -Dlibunwind=enabled
+IGT_GPU_TOOLS_DEPENDENCIES += libunwind
+else
+IGT_GPU_TOOLS_CONF_OPTS += -Dlibunwind=disabled
+endif
+
+$(eval $(meson-package))

--===============1545079442624640094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1545079442624640094==--
