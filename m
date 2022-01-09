Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A716C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 17:17:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E7281521;
	Sun,  9 Jan 2022 17:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qI6HsdZ7bws1; Sun,  9 Jan 2022 17:17:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA5781493;
	Sun,  9 Jan 2022 17:17:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8CC881BF475
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 17:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AD0581493
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 17:17:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tgT4W8psdLnR for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 17:17:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 115808148F
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 17:17:29 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id e9so20875311wra.2
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 09:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ztnZTVqjbndkIEYL87ZmhcjOSRg70s2e+VzasTKB5JI=;
 b=Jp2BnTTcVJxfyUX9VGiPKyxrRlQlHIBwZAPfvcksgrlAexbB+2+rAnlXcQzE3NN2P+
 vAVQ+BJs1IcTcsTBiGRsmOH/VnJc+Mkswo2KAcUnMdpeGHHJJp9szv2uLUTYOjB318en
 uzi4Bj3TRv/gUYU0RvQ+NTg1xrIAuMqPnc43zuy1BhPiV9Lmxn/c3t0sbKjssd6rT1/q
 2qN0Q8dahJGOQ/5LeG3lW9gd2ySzutrDW23Iop/9ydi58KrSPBf4mO9Q4cPqv3iAnXJs
 HCJkQG+YB3ItWOoI1iVxEv3p5D0wIaEUobxXFxdc1pMJ61uHKpe6qI1b9PlBJgFuWo5H
 JiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ztnZTVqjbndkIEYL87ZmhcjOSRg70s2e+VzasTKB5JI=;
 b=iQsBPsM8dndtLUYUI0m+41iOy26NlZrE1G/bQW485cTg4PEeJ9/7/O1vNv8HLx8JBd
 H1mj7EtuVDLQDbPk0iBcJTloIFwqo4Hj+6s+A5sMD7SsBOTSHsygprKuN3EbsgMSo1IF
 1Y35An8nkPkdmHOxWDKrPXxUi4RlK82lRNHiRuowQRkpbXil8ZRaVjVv+FFO7DpQ0pOl
 Gijs7zbTpNuPB+fJrQFf4xK+MgkGxMyvgM+0R3Ccg0TPRqXJApHPjbMCeJ5Hj8zLbT/+
 m5t9bZ8S6vWPIh0YeAJADL3xt7d3nJFS7mgibxpfNmYg1WxbsOd1+gTWK5T7KglzeEv0
 mrXQ==
X-Gm-Message-State: AOAM5308I0sZQjoQmZjJK/8gT+f3x73aV6/U2c1j9FVKl47z+qU57mMk
 tMve5ixShAPUPQcPiSvzkr+UewtNq2U=
X-Google-Smtp-Source: ABdhPJzDqj7/6sxYr/JsLSl86g6GYNOmDFA1eyWkP0QxB6GtUv/y6gjz3eZw3Yn0KIRK9JvFJ3sUtA==
X-Received: by 2002:a5d:5982:: with SMTP id n2mr63024567wri.582.1641748647520; 
 Sun, 09 Jan 2022 09:17:27 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id bg19sm4853075wmb.47.2022.01.09.09.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 09:17:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 18:16:09 +0100
Message-Id: <20220109171609.2527192-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vte: bump to version 0.66.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Switch to meson-package and so replace host-intltool dependency by
  TARGET_NLS_DEPENDENCIES:
  https://gitlab.gnome.org/GNOME/vte/-/issues/87
- Retrieve upstream hash
- Switch license file to LGPL-3.0+:
  https://gitlab.gnome.org/GNOME/vte/-/commit/5e14529d4219f3792690566ef7ec70febd87e070
- Drop libxml2 dependency (not needed with meson)
- Add uclibc or glibc dependency, upstream doesn't want to support musl:
  https://gitlab.gnome.org/GNOME/vte/-/issues/72
  https://gitlab.gnome.org/GNOME/vte/-/issues/247
- Add optional icu dependency:
  https://gitlab.gnome.org/GNOME/vte/-/commit/9e4fbae2cabcd937ac4d1a984ba844d24b44b83f
- Add optional libfribidi dependency:
  https://gitlab.gnome.org/GNOME/vte/-/commit/7d3704f1c54e58443624355835f675ec22c6b9d3
- Add optional systemd dependency:
  https://gitlab.gnome.org/GNOME/vte/-/commit/81bd158c24ef1d716d3cbf801e72fda2e11b81b4
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-with-kernel-headers-from-linux-4-13.patch | 54 +++++++++++++++++++
 ...or-fstack-protector-compiler-support.patch | 43 +++++++++++++++
 package/vte/Config.in                         |  7 +--
 package/vte/vte.hash                          |  8 +--
 package/vte/vte.mk                            | 45 +++++++++++-----
 5 files changed, 139 insertions(+), 18 deletions(-)
 create mode 100644 package/vte/0001-build-Fix-build-with-kernel-headers-from-linux-4-13.patch
 create mode 100644 package/vte/0002-build-Fix-check-for-fstack-protector-compiler-support.patch

diff --git a/package/vte/0001-build-Fix-build-with-kernel-headers-from-linux-4-13.patch b/package/vte/0001-build-Fix-build-with-kernel-headers-from-linux-4-13.patch
new file mode 100644
index 0000000000..7c3a5ab05e
--- /dev/null
+++ b/package/vte/0001-build-Fix-build-with-kernel-headers-from-linux-4-13.patch
@@ -0,0 +1,54 @@
+From 91123bb5201156e3d3adbe24305488f5eea2c8d7 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@src.gnome.org>
+Date: Mon, 27 Sep 2021 22:46:47 +0200
+Subject: [PATCH] build: Fix build with kernel headers from linux < 4.13
+
+We already support running with a kernel that doesn't support this
+ioctl, so let's also support building with one. Add the missing
+ioctl definition to missing.hh.
+
+Fixes: https://gitlab.gnome.org/GNOME/vte/-/issues/2514
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/vte/-/commit/91123bb5201156e3d3adbe24305488f5eea2c8d7]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/missing.hh | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/missing.hh b/src/missing.hh
+index e5a58727..7902e41e 100644
+--- a/src/missing.hh
++++ b/src/missing.hh
+@@ -23,11 +23,14 @@
+ #include <fcntl.h>
+ 
+ #ifdef __linux__
++
++#include <sys/ioctl.h>
+ #include <sys/syscall.h>
+ 
+ #if defined(__mips__) || defined(__mips64__)
+ #include <asm/sgidefs.h>
+ #endif
++
+ #endif
+ 
+ /* NSIG isn't in POSIX, so if it doesn't exist use this here. See bug #759196 */
+@@ -128,4 +131,13 @@ char* strchrnul(char const* s,
+ #define CLOSE_RANGE_CLOEXEC (1u << 2)
+ #endif
+ 
++#if !defined(TIOCGPTPEER)
++/* See linux commit 54ebbfb1603415d9953c150535850d30609ef077 */
++#if defined(__sparc__)
++#define TIOCGPTPEER _IOR('t', 137, int)
++#else
++#define TIOCGPTPEER _IOR('T', 0x41, int)
++#endif
++#endif /* !TIOCGPTPEER */
++
+ #endif /* __linux__ */
+-- 
+GitLab
+
diff --git a/package/vte/0002-build-Fix-check-for-fstack-protector-compiler-support.patch b/package/vte/0002-build-Fix-check-for-fstack-protector-compiler-support.patch
new file mode 100644
index 0000000000..67b6c47482
--- /dev/null
+++ b/package/vte/0002-build-Fix-check-for-fstack-protector-compiler-support.patch
@@ -0,0 +1,43 @@
+From e32dba1d5cf884959af5b2c0691db00c263ea048 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@src.gnome.org>
+Date: Mon, 27 Dec 2021 19:24:46 +0100
+Subject: [PATCH] build: Fix check for -fstack-protector* compiler support
+
+Need to use has_link_argument() on some platforms.
+
+Fixes: https://gitlab.gnome.org/GNOME/vte/-/issues/2535
+
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/vte/-/commit/e32dba1d5cf884959af5b2c0691db00c263ea048]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 93b7f376..381d5d58 100644
+--- a/meson.build
++++ b/meson.build
+@@ -461,8 +461,6 @@ compiler_flags_common = [
+   '-fdiagnostics-show-option',
+   '-fno-common',
+   '-fno-semantic-interposition',
+-  '-fstack-protector',
+-  '-fstack-protector-strong',
+ ]
+ 
+ if enable_debug
+@@ -550,6 +548,10 @@ add_project_arguments(global_cxxflags, language: 'cpp')
+ linker_flags = [
+   ['-Wl,-Bsymbolic', false,],
+   ['-Wl,-Bsymbolic-functions', get_option('_b_symbolic_functions'),],
++
++  # See issue vte#2535.
++  ['-fstack-protector', false],
++  ['-fstack-protector-strong', false],
+ ]
+ 
+ foreach flag: linker_flags
+-- 
+GitLab
+
diff --git a/package/vte/Config.in b/package/vte/Config.in
index 96de3d38cc..2635a6007c 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -7,11 +7,11 @@ config BR2_PACKAGE_VTE
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBGTK3
-	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PCRE2
 	help
 	  VTE is a library (libvte) implementing a terminal emulator
@@ -22,13 +22,14 @@ config BR2_PACKAGE_VTE
 
 	  http://github.com/GNOME/vte
 
-comment "vte needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >= 4.8"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		BR2_TOOLCHAIN_USES_MUSL
 
 comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
diff --git a/package/vte/vte.hash b/package/vte/vte.hash
index 3fbc5acab0..90818d31f3 100644
--- a/package/vte/vte.hash
+++ b/package/vte/vte.hash
@@ -1,3 +1,5 @@
-# Locally calculated
-sha256	a3a9fb182740b392a45cd3f46fa61a985f68bb6b1817b52daec22034c46158c3  vte-0.48.3.tar.xz
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/vte/0.66/vte-0.66.2.sha256sum
+sha256  e89974673a72a0a06edac6d17830b82bb124decf0cb3b52cebc92ec3ff04d976  vte-0.66.2.tar.xz
+
+# Hash for license file:
+sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  COPYING.LGPL3
diff --git a/package/vte/vte.mk b/package/vte/vte.mk
index 6c8d1433f5..07e813685e 100644
--- a/package/vte/vte.mk
+++ b/package/vte/vte.mk
@@ -4,26 +4,47 @@
 #
 ################################################################################
 
-VTE_VERSION = 0.48.3
+VTE_VERSION_MAJOR = 0.66
+VTE_VERSION = $(VTE_VERSION_MAJOR).2
 VTE_SOURCE = vte-$(VTE_VERSION).tar.xz
-VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/0.48
-VTE_DEPENDENCIES = host-intltool host-pkgconf libgtk3 libxml2 pcre2
-VTE_LICENSE = LGPL-2.1+
-VTE_LICENSE_FILES = COPYING
-VTE_CONF_OPTS += --disable-vala
+VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/$(VTE_VERSION_MAJOR)
+VTE_DEPENDENCIES = host-pkgconf libgtk3 pcre2 $(TARGET_NLS_DEPENDENCIES)
+VTE_LICENSE = LGPL-3.0+
+VTE_LICENSE_FILES = COPYING.LGPL3
+
+ifeq ($(BR2_PACKAGE_ICU),y)
+VTE_CONF_OPTS += -Dicu=true
+VTE_DEPENDENCIES += icu
+else
+VTE_CONF_OPTS += -Dicu=false
+endif
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-VTE_CONF_OPTS += --enable-introspection
-VTE_DEPENDENCIES += gobject-introspection
+VTE_CONF_OPTS += -Dgir=true -Dvapi=true
+VTE_DEPENDENCIES += host-vala gobject-introspection
 else
-VTE_CONF_OPTS += --disable-introspection
+VTE_CONF_OPTS += -Dgir=false -Dvapi=false
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-VTE_CONF_OPTS += --with-gnutls
+VTE_CONF_OPTS += -Dgnutls=true
 VTE_DEPENDENCIES += gnutls
 else
-VTE_CONF_OPTS += --without-gnutls
+VTE_CONF_OPTS += -Dgnutls=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFRIBIDI),y)
+VTE_CONF_OPTS += -Dfribidi=true
+VTE_DEPENDENCIES += libfribidi
+else
+VTE_CONF_OPTS += -Dfribidi=false
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+VTE_CONF_OPTS += -D_systemd=true
+VTE_DEPENDENCIES += systemd
+else
+VTE_CONF_OPTS += -D_systemd=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
