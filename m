Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844C3D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EA86408A5;
	Wed,  7 Jan 2026 17:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqDfL7k9TyIP; Wed,  7 Jan 2026 17:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E64E74093E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808019;
	bh=+aUa7LIEpsoyFoELq053TpA8ZmL4WGqoAuXFXS//L98=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n5Q4rmVGEj9VHK1B7GuJUZfm9pMEjvinM1eQUNh/TqC7ZBeJkMVg6VBm5feF1dgJE
	 CvPEZ4dZj9xxBIBJw1KnsjsBAVt3UeyUN99pZfBhGWovvc6Yxvd538u/fQq1PuFufY
	 su22LhRgdvp2BkfdCr8rY5Pok37gCeqrSAinP4/3EHsajashqezwwnOBrzvUA8h/dC
	 B71TF6L0S4C6KGgt5xXJSeCbGtmN0uYgd1leQtG4xU7UN6+Iyfdr1Pwh4OOVxORLAs
	 hOqBCw4AlQHat8+JqiUoRm9Duys0PVjDZqNG1uP7p0StUPcyZWTMSETxVK1jRGAzRC
	 OE3iF7b7xo0qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E64E74093E;
	Wed,  7 Jan 2026 17:46:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10FF19ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B2EA60895
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dph9upDtDLbf for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB1446085F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB1446085F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAA2188354; Wed,  7 Jan 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:00 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ba25e8c32de2dac4e018d94ea9679a9f4fc823bd
X-Git-Newrev: d84ae3b0862be9243b4c27d838d6e7072d79c5ec
X-Patchwork-Hint: ignore
Message-Id: <20260107174640.DAA2188354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libxml2: fix
 build of packages detecting libxml2 using libxml2-config.cmake
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d84ae3b0862be9243b4c27d838d6e7072d79c5ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes build error seen with libiio:

mips64el-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used
 in cross-compilation: '-I/usr/include/libxml2'

caused by bump of libxml2 to 2.15.0 with buildroot commit
d81922c1ef8825f10b802984d9721412a1a1a377.

Upstream acknowledged the problem and waits for a fix
https://gitlab.gnome.org/GNOME/libxml2/-/issues/898#note_2453923
so we revert the offending commit for now.

Fixes:
https://autobuild.buildroot.net/results/fde/fde40a3d6ac58f568e49419e5176db5a62a0a4d9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 42790e76e534c68d156040c6f58b2eb3d9f029e2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...e-Fix-installation-directories-in-libxml2.patch | 85 ++++++++++++++++++++++
 package/libxml2/libxml2.mk                         |  2 +
 2 files changed, 87 insertions(+)

diff --git a/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
new file mode 100644
index 0000000000..75232b6f00
--- /dev/null
+++ b/package/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -0,0 +1,85 @@
+From 81992efb40b37cc893c55575a83cdd1cec1fde2a Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 29 Oct 2025 21:45:09 +0100
+Subject: [PATCH] Revert "cmake: Fix installation directories in
+ libxml2-config.cmake"
+
+This reverts commit 75dde50b20215a2a3a445b62f36a67c8ed337cab.
+
+Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/issues/898#note_2452864
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.ac            | 11 -----------
+ libxml2-config.cmake.in | 11 +++++++----
+ meson.build             |  3 ---
+ 3 files changed, 7 insertions(+), 18 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4eb629bb..150e06eb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1006,17 +1006,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
+ AC_SUBST(XML_PRIVATE_CFLAGS)
+ AC_SUBST(XML_INCLUDEDIR)
+ 
+-# for libxml2-config.cmake.in
+-AX_RECURSIVE_EVAL(["$bindir"], [INSTALL_BINDIR])
+-AX_RECURSIVE_EVAL(["$includedir"], [INSTALL_INCLUDEDIR])
+-AX_RECURSIVE_EVAL(["$libdir"], [INSTALL_LIBDIR])
+-AC_SUBST(INSTALL_BINDIR)
+-AC_SUBST(INSTALL_INCLUDEDIR)
+-AC_SUBST(INSTALL_LIBDIR)
+-AM_SUBST_NOTMAKE(INSTALL_BINDIR)
+-AM_SUBST_NOTMAKE(INSTALL_INCLUDEDIR)
+-AM_SUBST_NOTMAKE(INSTALL_LIBDIR)
+-
+ AX_RECURSIVE_EVAL(["$sysconfdir"], [XML_SYSCONFDIR])
+ AC_DEFINE_UNQUOTED([XML_SYSCONFDIR], ["$XML_SYSCONFDIR"],
+                    [System configuration directory (/etc)])
+diff --git a/libxml2-config.cmake.in b/libxml2-config.cmake.in
+index ff6433fa..b775cfee 100644
+--- a/libxml2-config.cmake.in
++++ b/libxml2-config.cmake.in
+@@ -24,17 +24,20 @@
+ #   LibXml2::LibXml2          - the LibXml2 library
+ #   LibXml2::xmllint          - the xmllint command-line executable
+ 
++get_filename_component(_libxml2_rootdir ${CMAKE_CURRENT_LIST_DIR}/../../../ ABSOLUTE)
++
+ set(LIBXML2_VERSION_MAJOR  @LIBXML_MAJOR_VERSION@)
+ set(LIBXML2_VERSION_MINOR  @LIBXML_MINOR_VERSION@)
+ set(LIBXML2_VERSION_MICRO  @LIBXML_MICRO_VERSION@)
+ set(LIBXML2_VERSION_STRING "@VERSION@")
+ set(LIBXML2_DEFINITIONS    "@XML_CFLAGS@")
+-set(LIBXML2_INCLUDE_DIR    @INSTALL_INCLUDEDIR@/libxml2)
+-set(LIBXML2_LIBRARY_DIR    @INSTALL_LIBDIR@)
++set(LIBXML2_INSTALL_PREFIX ${_libxml2_rootdir})
++set(LIBXML2_INCLUDE_DIR    ${_libxml2_rootdir}/include/libxml2)
++set(LIBXML2_LIBRARY_DIR    ${_libxml2_rootdir}/lib)
+ 
+ find_library(LIBXML2_LIBRARY NAMES xml2 HINTS ${LIBXML2_LIBRARY_DIR} NO_DEFAULT_PATH)
+-find_program(LIBXML2_XMLCATALOG_EXECUTABLE NAMES xmlcatalog HINTS @INSTALL_BINDIR@ NO_DEFAULT_PATH)
+-find_program(LIBXML2_XMLLINT_EXECUTABLE NAMES xmllint HINTS @INSTALL_BINDIR@ NO_DEFAULT_PATH)
++find_program(LIBXML2_XMLCATALOG_EXECUTABLE NAMES xmlcatalog HINTS ${_libxml2_rootdir}/bin NO_DEFAULT_PATH)
++find_program(LIBXML2_XMLLINT_EXECUTABLE NAMES xmllint HINTS ${_libxml2_rootdir}/bin NO_DEFAULT_PATH)
+ 
+ set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
+ set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR})
+diff --git a/meson.build b/meson.build
+index 31c73b62..8728852c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -577,9 +577,6 @@ config_cmake = configuration_data()
+ config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
+ config_cmake.set('LIBXML_MINOR_VERSION', v_min)
+ config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
+-config_cmake.set('INSTALL_BINDIR', dir_bin)
+-config_cmake.set('INSTALL_INCLUDEDIR', dir_include)
+-config_cmake.set('INSTALL_LIBDIR', dir_lib)
+ config_cmake.set('VERSION', meson.project_version())
+ config_cmake.set10('BUILD_SHARED_LIBS',
+                    get_option('default_library') != 'static')
+-- 
+2.47.3
+
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index bf83ec2041..de0ec42eca 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -14,6 +14,8 @@ LIBXML2_LICENSE = MIT
 LIBXML2_LICENSE_FILES = Copyright
 LIBXML2_CPE_ID_VENDOR = xmlsoft
 LIBXML2_CONFIG_SCRIPTS = xml2-config
+# 0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+LIBXML2_AUTORECONF = YES
 
 # relocation truncated to fit: R_68K_GOT16O
 ifeq ($(BR2_m68k_cf),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
