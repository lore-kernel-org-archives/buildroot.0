Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EF4C25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 11:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C54942AB2;
	Fri, 10 May 2024 11:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Fp71MU_sAnQ; Fri, 10 May 2024 11:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66E7442AF3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66E7442AF3;
	Fri, 10 May 2024 11:56:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F5D81BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17BFE84574
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5-zoFSwPH5j for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 11:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAB1484579
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAB1484579
 for <buildroot@buildroot.org>; Fri, 10 May 2024 11:55:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D785186E88; Fri, 10 May 2024 11:55:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 13:47:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1bcda5be8a9637c947ffb3e6945986ce1a695ee2
X-Git-Newrev: 5f7275787ab1520c3d3f7eb9d2bd1b9f5ff41443
X-Patchwork-Hint: ignore
Message-Id: <20240510115553.D785186E88@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: bump version to 3.6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0760581267188059178=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0760581267188059178==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5f7275787ab1520c3d3f7eb9d2bd1b9f5ff41443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
 - Remove 0001-fix-musl-build.patch
   Fixed with commit d88597798fdb1a2b344ca47e48f2f80ad433fd95 differently.
   """
   libselinux: drop usage of _D_ALLOC_NAMLEN

   _D_ALLOC_NAMLEN is not very portable. Currently, the code
   mallocs based on _D_ALLOC_NAMLEN() and then strcpy's dirent
   d_name into the buffer. Instead, just use strdup.

   Change-Id: I5c8ca47da2c593ea2726caba5781f5e9d9d910ae
   Signed-off-by: William Roberts <william.c.roberts@intel.com>
   """

 - Remove 0003-libselinux-set-CFLAGS-for-pip-installation.patch
   Fixed with commit 89dd980c1e9a800f104c1db2b4c9e77be532ca35.
   """
   Add CPPFLAGS to Makefiles

   This patch adds CPPFLAGS to all of the Makefiles as suggested.

   Signed-off-by: Cameron Williams <ckwilliams.work@gmail.com>
   Acked-by: James Carter <jwcart2@gmail.com>
   """

 - Rename 0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch to
   0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch

 - Remove "package/libselinux/0001-fix-musl-build.patch Upstream" from
   .checkpackageignore

 - Rename "0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch" to
   "0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch" in the
   .checkpackageignore

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  3 +-
 ...YCEXT-and-rely-on-the-installed-file-nam.patch} |  4 +-
 package/libselinux/0001-fix-musl-build.patch       | 38 -------------------
 ...ibselinux-set-CFLAGS-for-pip-installation.patch | 43 ----------------------
 package/libselinux/libselinux.hash                 |  2 +-
 package/libselinux/libselinux.mk                   |  2 +-
 6 files changed, 5 insertions(+), 87 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d3e0fbc471..418f820533 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -943,8 +943,7 @@ package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch lib_patch.Upstream
 package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch lib_patch.Upstream
 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch lib_patch.Upstream
 package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch lib_patch.Upstream
-package/libselinux/0001-fix-musl-build.patch lib_patch.Upstream
-package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch lib_patch.Upstream
+package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch lib_patch.Upstream
 package/libsepol/0001-support-static-only.patch lib_patch.Upstream
 package/libserial/0001-SerialPort.cpp-fix-build-when-size_t-is-an-unsigned-.patch lib_patch.Upstream
 package/libserial/0002-SerialPort.cpp-don-t-use-high-baudrates-when-not-ava.patch lib_patch.Upstream
diff --git a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
similarity index 91%
rename from package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
rename to package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
index c744ca4069..3bdb1d0f46 100644
--- a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
+++ b/package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
@@ -36,9 +36,9 @@ index 190016e2af34..7ee22fd35da3 100644
  RUBYINC ?= $(shell $(RUBY) -e 'puts "-I" + RbConfig::CONFIG["rubyarchhdrdir"] + " -I" + RbConfig::CONFIG["rubyhdrdir"]')
  RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
  RUBYINSTALL ?= $(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
-@@ -189,7 +188,7 @@ install: all
+@@ -193,7 +192,7 @@ install: all
  install-pywrap: pywrap
- 	$(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
+ 	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
  	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
 -	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
 +	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
diff --git a/package/libselinux/0001-fix-musl-build.patch b/package/libselinux/0001-fix-musl-build.patch
deleted file mode 100644
index b8b16be26f..0000000000
--- a/package/libselinux/0001-fix-musl-build.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 78f7f09028fdd6a5e8e4e4b584749621eaef412f Mon Sep 17 00:00:00 2001
-From: Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sat, 7 Dec 2019 17:24:50 -0800
-Subject: [PATCH] fix undefined macros in musl
-
-musl does not define glibc-specific macros, so use a simple version of
-the macro when it is not defined.
-
-This is very inefficient, however, but copying the code from glibc is
-not really possible because it is LGPL while libselinux in Public
-Domain, and we want to avoid license propagation, so this macro is
-completely written from scratch, and non-optimal.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-[Updated for 3.5]
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
-diff --git a/src/booleans.c b/src/booleans.c
-index ffa8d26..8569002 100644
---- a/src/booleans.c
-+++ b/src/booleans.c
-@@ -64,6 +64,14 @@ int security_get_boolean_names(char ***names, int *len)
- 		goto bad;
- 	}
- 
-+/* Simple (but inefficient) version of _D_ALLOC_NAMLEN when
-+ * building with a C library that misses it (e.g. musl).
-+ * Note: glibc does a strlen on (d)->d_name, so assume it is safe.
-+ */
-+#ifndef _D_ALLOC_NAMLEN
-+#define _D_ALLOC_NAMLEN(d) (strlen((d)->d_name)+1)
-+#endif
-+
- 	for (i = 0; i < *len; i++) {
- 		n[i] = strdup(namelist[i]->d_name);
- 		if (!n[i]) {
--- 
-2.23.0
-
diff --git a/package/libselinux/0003-libselinux-set-CFLAGS-for-pip-installation.patch b/package/libselinux/0003-libselinux-set-CFLAGS-for-pip-installation.patch
deleted file mode 100644
index c08529c44f..0000000000
--- a/package/libselinux/0003-libselinux-set-CFLAGS-for-pip-installation.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c9b3cbb654ca1e834d47f52af9f170b9f38c857a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
-Date: Thu, 20 Apr 2023 18:27:00 +0200
-Subject: [PATCH] libselinux: set CFLAGS for pip installation
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Explicitly set CFLAGS for the pip install command, similar to calling
-setup.py, to ignore known compiler warnings treated as errors, e.g.:
-
-    selinuxswig_python_wrap.c:3593:19: error: 'sidget' is deprecated [-Werror,-Wdeprecated-declarations]
-                result = (int)sidget(arg1);
-                              ^
-    selinuxswig_python_wrap.c:15024:1: error: no previous prototype for function 'PyInit__selinux' [-Werror,-Wmissing-prototypes]
-            SWIG_init(void) {
-            ^
-
-Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
-Acked-by: Petr Lautrbach <lautrbach@redhat.com>
-Upstream: https://github.com/SELinuxProject/selinux/commit/c9b3cbb654ca1e834d47f52af9f170b9f38c857a
-[yann.morin.1998@free.fr: backport from upstream]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- libselinux/src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
-index 36d57122..f9a1e5f5 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -187,7 +187,7 @@ install: all
- 	ln -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
- 
- install-pywrap: pywrap
--	$(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
-+	CFLAGS="$(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
- 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
- 	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
- 
--- 
-2.25.1
-
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index 14bc627a80..4e0a2ca317 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  9a3a3705ac13a2ccca2de6d652b6356fead10f36fb33115c185c5ccdf29eec19  libselinux-3.5.tar.gz
+sha256  ba4e0ef34b270e7672a5e5f1b523fe2beab3a40bb33d9389f4ad3a8728f21b52  libselinux-3.6.tar.gz
 
 # Hash for license file
 sha256  86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364  LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index 734084ba50..f07498d739 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 3.5
+LIBSELINUX_VERSION = 3.6
 LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSELINUX_VERSION)
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE

--===============0760581267188059178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0760581267188059178==--
