Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B73C7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 21:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17AD442BC5;
	Tue,  9 May 2023 21:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17AD442BC5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7Nr4S7u7qdj; Tue,  9 May 2023 21:01:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2E4C42BA2;
	Tue,  9 May 2023 21:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2E4C42BA2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1581BF20B
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45DFF42013
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 20:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45DFF42013
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KPLQXJ2O8mEv for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 20:59:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B37BA42793
 for <buildroot@buildroot.org>; Tue,  9 May 2023 20:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B37BA42793
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0691862CA; Tue,  9 May 2023 20:59:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 9 May 2023 22:13:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7dbd3cee0d71b30de63ef957f25225af6bcbc8f
X-Git-Newrev: 1db27ce253fd2ea6a71c5051f5f1ba1fc0067277
X-Patchwork-Hint: ignore
Message-Id: <20230509205911.A0691862CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libselinux: bump to version 3.5
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1051534947869885298=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1051534947869885298==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1db27ce253fd2ea6a71c5051f5f1ba1fc0067277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- libselinux now requires pip, just to perform the install of the python
  bindings; it still uses setuptools to do the actual build;
- rebase patches for version 3.5;
- backport a fix for the install of the python bindings.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998@free.fr:
  - backport upstream patch to fix installation of python bindings
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libselinux/0001-fix-musl-build.patch       |  4 +-
 ...PYCEXT-and-rely-on-the-installed-file-nam.patch |  8 ++--
 ...ibselinux-set-CFLAGS-for-pip-installation.patch | 43 ++++++++++++++++++++++
 package/libselinux/Config.in                       |  1 +
 package/libselinux/libselinux.hash                 |  2 +-
 package/libselinux/libselinux.mk                   | 16 ++++++--
 6 files changed, 64 insertions(+), 10 deletions(-)

diff --git a/package/libselinux/0001-fix-musl-build.patch b/package/libselinux/0001-fix-musl-build.patch
index 44189e6400..b8b16be26f 100644
--- a/package/libselinux/0001-fix-musl-build.patch
+++ b/package/libselinux/0001-fix-musl-build.patch
@@ -12,13 +12,13 @@ Domain, and we want to avoid license propagation, so this macro is
 completely written from scratch, and non-optimal.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-[Updated for 3.0]
+[Updated for 3.5]
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 diff --git a/src/booleans.c b/src/booleans.c
 index ffa8d26..8569002 100644
 --- a/src/booleans.c
 +++ b/src/booleans.c
-@@ -65,6 +65,14 @@ int security_get_boolean_names(char ***names, int *len)
+@@ -64,6 +64,14 @@ int security_get_boolean_names(char ***names, int *len)
  		goto bad;
  	}
  
diff --git a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch b/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
index 18c79b3b4d..c744ca4069 100644
--- a/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
+++ b/package/libselinux/0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch
@@ -18,7 +18,7 @@ was installed.
 Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
 [Refreshed for 3.1]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-[Refreshed for 3.0]
+[Refreshed for 3.5]
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 ---
  src/Makefile | 3 +--
@@ -31,14 +31,14 @@ index 190016e2af34..7ee22fd35da3 100644
 @@ -15,7 +15,6 @@ INCLUDEDIR ?= $(PREFIX)/include
  PYINC ?= $(shell $(PKG_CONFIG) --cflags $(PYPREFIX))
  PYLIBS ?= $(shell $(PKG_CONFIG) --libs $(PYPREFIX))
- PYTHONLIBDIR ?= $(shell $(PYTHON) -c "from distutils.sysconfig import *; print(get_python_lib(plat_specific=1, prefix='$(PREFIX)'))")
+ PYTHONLIBDIR ?= $(shell $(PYTHON) -c "import sysconfig; print(sysconfig.get_path('platlib', vars={'platbase': '$(PREFIX)', 'base': '$(PREFIX)'}))")
 -PYCEXT ?= $(shell $(PYTHON) -c 'import importlib.machinery;print(importlib.machinery.EXTENSION_SUFFIXES[0])')
  RUBYINC ?= $(shell $(RUBY) -e 'puts "-I" + RbConfig::CONFIG["rubyarchhdrdir"] + " -I" + RbConfig::CONFIG["rubyhdrdir"]')
  RUBYLIBS ?= $(shell $(RUBY) -e 'puts "-L" + RbConfig::CONFIG["libdir"] + " -L" + RbConfig::CONFIG["archlibdir"] + " " + RbConfig::CONFIG["LIBRUBYARG_SHARED"]')
  RUBYINSTALL ?= $(shell $(RUBY) -e 'puts RbConfig::CONFIG["vendorarchdir"]')
-@@ -184,7 +183,7 @@ install: all
+@@ -189,7 +188,7 @@ install: all
  install-pywrap: pywrap
- 	$(PYTHON) setup.py install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR)` $(PYTHON_SETUP_ARGS)
+ 	$(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
  	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
 -	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
 +	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
diff --git a/package/libselinux/0003-libselinux-set-CFLAGS-for-pip-installation.patch b/package/libselinux/0003-libselinux-set-CFLAGS-for-pip-installation.patch
new file mode 100644
index 0000000000..c08529c44f
--- /dev/null
+++ b/package/libselinux/0003-libselinux-set-CFLAGS-for-pip-installation.patch
@@ -0,0 +1,43 @@
+From c9b3cbb654ca1e834d47f52af9f170b9f38c857a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
+Date: Thu, 20 Apr 2023 18:27:00 +0200
+Subject: [PATCH] libselinux: set CFLAGS for pip installation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Explicitly set CFLAGS for the pip install command, similar to calling
+setup.py, to ignore known compiler warnings treated as errors, e.g.:
+
+    selinuxswig_python_wrap.c:3593:19: error: 'sidget' is deprecated [-Werror,-Wdeprecated-declarations]
+                result = (int)sidget(arg1);
+                              ^
+    selinuxswig_python_wrap.c:15024:1: error: no previous prototype for function 'PyInit__selinux' [-Werror,-Wmissing-prototypes]
+            SWIG_init(void) {
+            ^
+
+Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
+Acked-by: Petr Lautrbach <lautrbach@redhat.com>
+Upstream: https://github.com/SELinuxProject/selinux/commit/c9b3cbb654ca1e834d47f52af9f170b9f38c857a
+[yann.morin.1998@free.fr: backport from upstream]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ libselinux/src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libselinux/src/Makefile b/libselinux/src/Makefile
+index 36d57122..f9a1e5f5 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -187,7 +187,7 @@ install: all
+ 	ln -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
+ 
+ install-pywrap: pywrap
+-	$(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
++	CFLAGS="$(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
+ 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
+ 	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux$(PYCEXT) $(DESTDIR)$(PYTHONLIBDIR)/_selinux$(PYCEXT)
+ 
+-- 
+2.25.1
+
diff --git a/package/libselinux/Config.in b/package/libselinux/Config.in
index 3098fe3ea4..bc40e32a46 100644
--- a/package/libselinux/Config.in
+++ b/package/libselinux/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_LIBSEPOL
 	select BR2_PACKAGE_PCRE2
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS if BR2_PACKAGE_PYTHON3
 	help
 	  libselinux is the runtime SELinux library that provides
 	  interfaces (e.g. library functions for the SELinux kernel
diff --git a/package/libselinux/libselinux.hash b/package/libselinux/libselinux.hash
index a2e0083f7b..14bc627a80 100644
--- a/package/libselinux/libselinux.hash
+++ b/package/libselinux/libselinux.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  acfdee27633d2496508c28727c3d41d3748076f66d42fccde2e6b9f3463a7057  libselinux-3.3.tar.gz
+sha256  9a3a3705ac13a2ccca2de6d652b6356fead10f36fb33115c185c5ccdf29eec19  libselinux-3.5.tar.gz
 
 # Hash for license file
 sha256  86657b4c0fe868d7cbd977cb04c63b6c667e08fa51595a7bc846ad4bed8fc364  LICENSE
diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index db35da130f..b8de21edaa 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSELINUX_VERSION = 3.3
+LIBSELINUX_VERSION = 3.5
 LIBSELINUX_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSELINUX_VERSION)
 LIBSELINUX_LICENSE = Public Domain
 LIBSELINUX_LICENSE_FILES = LICENSE
@@ -31,7 +31,11 @@ LIBSELINUX_MAKE_OPTS += FTS_LDLIBS=-lfts
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-LIBSELINUX_DEPENDENCIES += python3 host-swig
+LIBSELINUX_DEPENDENCIES += \
+	python3 \
+	python-setuptools \
+	host-python-pip \
+	host-swig
 
 LIBSELINUX_MAKE_OPTS += \
 	$(PKG_PYTHON_DISTUTILS_ENV) \
@@ -77,7 +81,13 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
 endef
 
 HOST_LIBSELINUX_DEPENDENCIES = \
-	host-pkgconf host-libsepol host-pcre2 host-swig host-python3
+	host-pkgconf \
+	host-libsepol \
+	host-pcre2 \
+	host-swig \
+	host-python3 \
+	host-python-pip \
+	host-python-setuptools
 
 HOST_LIBSELINUX_MAKE_OPTS = \
 	$(HOST_CONFIGURE_OPTS) \

--===============1051534947869885298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1051534947869885298==--
