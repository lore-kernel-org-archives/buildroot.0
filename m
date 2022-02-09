Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C47C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5989E81CDC;
	Wed,  9 Feb 2022 17:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VHr-ABCt_OgA; Wed,  9 Feb 2022 17:05:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99C6382423;
	Wed,  9 Feb 2022 17:05:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CD5D1BF9BA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 722C260B98
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DlE1aXhFAnVU for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5567060D7F
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:09 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 42D8DE0008;
 Wed,  9 Feb 2022 16:53:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDI-0001PD-Rj; Wed, 09 Feb 2022 17:53:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:51:50 +0100
Message-Id: <20220209165213.4498-85-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 084/107] package/python: drop host package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-do-not-add-invalid-header-locations.patch |  42 ---
 ...get_python_inc-for-cross-compilation.patch |  48 ---
 ...nstall-location-of-_sysconfigdata.py.patch |  88 -----
 ...ilation-of-.pyc-and-.pyo-conditional.patch |  78 -----
 ...taddrinfo-test-for-cross-compilation.patch |  31 --
 ...astructure-to-be-able-to-disable-ext.patch |  81 -----
 ...y-header-paths-for-cross-compilation.patch |  64 ----
 ...ook-in-usr-lib-termcap-for-libraries.patch |  31 --
 ...9-Fix-python-config-for-cross-builds.patch | 229 -------------
 ...ove-the-python-symlink-install-rules.patch |  43 ---
 .../0011-Don-t-add-multiarch-paths.patch      |  36 ---
 .../0012-Abort-on-failed-module-build.patch   |  30 --
 ...d-when-threads-are-not-used-availabl.patch |  58 ----
 .../python/0014-Serial-ioctl-workaround.patch |  33 --
 ...e-shebang-of-Python-scripts-for-cros.patch |  35 --
 ...-disable-installation-of-test-module.patch | 105 ------
 .../0017-Add-an-option-to-disable-pydoc.patch |  89 ------
 ...018-Add-an-option-to-disable-lib2to3.patch |  92 ------
 ...option-to-disable-the-sqlite3-module.patch |  69 ----
 ...d-an-option-to-disable-the-tk-module.patch |  73 -----
 ...-option-to-disable-the-curses-module.patch |  61 ----
 .../0022-Add-an-option-to-disable-expat.patch |  92 ------
 ...-Add-an-option-to-disable-CJK-codecs.patch |  32 --
 .../0024-Add-an-option-to-disable-NIS.patch   |  35 --
 ...Add-an-option-to-disable-unicodedata.patch |  32 --
 .../0026-Add-an-option-to-disable-bsddb.patch |  87 -----
 ...-an-option-to-disable-the-ssl-module.patch |  32 --
 ...-an-option-to-disable-the-bz2-module.patch |  32 --
 ...an-option-to-disable-the-zlib-module.patch |  32 --
 .../0030-Do-not-install-the-idle-editor.patch |  55 ----
 ...on-to-disable-the-ossaudiodev-module.patch |  32 --
 ...option-to-disable-the-hashlib-module.patch |  32 --
 ...an-option-to-disable-readline-module.patch |  32 --
 ...locale-and-set-to-default-when-addin.patch |  37 ---
 package/python/Config.in.host                 |  16 -
 package/python/python.hash                    |   5 -
 package/python/python.mk                      | 302 ------------------
 37 files changed, 2301 deletions(-)
 delete mode 100644 package/python/0001-setup.py-do-not-add-invalid-header-locations.patch
 delete mode 100644 package/python/0002-Fix-get_python_inc-for-cross-compilation.patch
 delete mode 100644 package/python/0003-Change-the-install-location-of-_sysconfigdata.py.patch
 delete mode 100644 package/python/0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch
 delete mode 100644 package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch
 delete mode 100644 package/python/0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch
 delete mode 100644 package/python/0007-Adjust-library-header-paths-for-cross-compilation.patch
 delete mode 100644 package/python/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
 delete mode 100644 package/python/0009-Fix-python-config-for-cross-builds.patch
 delete mode 100644 package/python/0010-Remove-the-python-symlink-install-rules.patch
 delete mode 100644 package/python/0011-Don-t-add-multiarch-paths.patch
 delete mode 100644 package/python/0012-Abort-on-failed-module-build.patch
 delete mode 100644 package/python/0013-sqlite3-fix-build-when-threads-are-not-used-availabl.patch
 delete mode 100644 package/python/0014-Serial-ioctl-workaround.patch
 delete mode 100644 package/python/0015-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
 delete mode 100644 package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch
 delete mode 100644 package/python/0017-Add-an-option-to-disable-pydoc.patch
 delete mode 100644 package/python/0018-Add-an-option-to-disable-lib2to3.patch
 delete mode 100644 package/python/0019-Add-option-to-disable-the-sqlite3-module.patch
 delete mode 100644 package/python/0020-Add-an-option-to-disable-the-tk-module.patch
 delete mode 100644 package/python/0021-Add-an-option-to-disable-the-curses-module.patch
 delete mode 100644 package/python/0022-Add-an-option-to-disable-expat.patch
 delete mode 100644 package/python/0023-Add-an-option-to-disable-CJK-codecs.patch
 delete mode 100644 package/python/0024-Add-an-option-to-disable-NIS.patch
 delete mode 100644 package/python/0025-Add-an-option-to-disable-unicodedata.patch
 delete mode 100644 package/python/0026-Add-an-option-to-disable-bsddb.patch
 delete mode 100644 package/python/0027-Add-an-option-to-disable-the-ssl-module.patch
 delete mode 100644 package/python/0028-Add-an-option-to-disable-the-bz2-module.patch
 delete mode 100644 package/python/0029-Add-an-option-to-disable-the-zlib-module.patch
 delete mode 100644 package/python/0030-Do-not-install-the-idle-editor.patch
 delete mode 100644 package/python/0031-Add-an-option-to-disable-the-ossaudiodev-module.patch
 delete mode 100644 package/python/0032-Add-option-to-disable-the-hashlib-module.patch
 delete mode 100644 package/python/0033-Add-an-option-to-disable-readline-module.patch
 delete mode 100644 package/python/0034-Override-system-locale-and-set-to-default-when-addin.patch
 delete mode 100644 package/python/Config.in.host
 delete mode 100644 package/python/python.hash
 delete mode 100644 package/python/python.mk

diff --git a/package/python/0001-setup.py-do-not-add-invalid-header-locations.patch b/package/python/0001-setup.py-do-not-add-invalid-header-locations.patch
deleted file mode 100644
index 3b2c9833e8..0000000000
--- a/package/python/0001-setup.py-do-not-add-invalid-header-locations.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3dc31a435b67de2ba3dd3457f0c939e20b58e8de Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:17:06 +0100
-Subject: [PATCH] setup.py: do not add invalid header locations
-
-This piece of code incorrectly adds /usr/include to
-self.compiler.include_dirs, and results in the following invalid
-compilation line:
-
-/home/thomas/projets/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc -fPIC \
-  -fno-strict-aliasing -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 \
-  -pipe -Os -DNDEBUG -g -O3 -Wall -Wstrict-prototypes \
-  -I/usr/include -I. -IInclude -I./Include \
-  -I/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include \
-  -I/home/thomas/projets/buildroot/output/build/python-2.7.6/Include \
-  -I/home/thomas/projets/buildroot/output/build/python-2.7.6 \
-  -c /home/thomas/projets/buildroot/output/build/python-2.7.6/Modules/mathmodule.c \
-  -o build/temp.linux2-arm-2.7/home/thomas/projets/buildroot/output/build/python-2.7.6/Modules/mathmodule.o
-cc1: warning: include location "/usr/include" is unsafe for cross-compilation [-Wpoison-system-directories]
-[...]
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 54054c2..64001e2 100644
---- a/setup.py
-+++ b/setup.py
-@@ -496,7 +496,7 @@ class PyBuildExt(build_ext):
-                     for directory in reversed(options.dirs):
-                         add_dir_to_list(dir_list, directory)
- 
--        if os.path.normpath(sys.prefix) != '/usr' \
-+        if False and os.path.normpath(sys.prefix) != '/usr' \
-                 and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
-             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
-             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
--- 
-2.7.4
-
diff --git a/package/python/0002-Fix-get_python_inc-for-cross-compilation.patch b/package/python/0002-Fix-get_python_inc-for-cross-compilation.patch
deleted file mode 100644
index 1fa4e92788..0000000000
--- a/package/python/0002-Fix-get_python_inc-for-cross-compilation.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 367ee7d103cf9f670c3925d555edf6f6a5b9d8d5 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:17:25 +0100
-Subject: [PATCH] Fix get_python_inc() for cross-compilation
-
-When we are cross compiling, doing os.path.dirname(sys.executable) to
-get the build directory is incorrect, because we're executing the host
-Python to build things for the target. Instead, we should use the
-project_base variable.
-
-This fixes cross-compilation, which was adding incorrect header paths
-pointing to the location where the host Python was built:
-
-/home/thomas/projets/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc -fPIC -fno-strict-aliasing \
-  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe -Os -DNDEBUG -g -O3 -Wall -Wstrict-prototypes \
-  -I/usr/include -I. -IInclude -I./Include -I/home/thomas/projets/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/usr/include \
-  -I/home/thomas/projets/buildroot/output/host/usr/bin/Include -I/home/thomas/projets/buildroot/output/host/usr/bin \
-  -c /home/thomas/projets/buildroot/output/build/python-2.7.6/Modules/_struct.c \
-  -o build/temp.linux2-arm-2.7/home/thomas/projets/buildroot/output/build/python-2.7.6/Modules/_struct.o
-
-This patch allows to fix the
-/home/thomas/projets/buildroot/output/host/usr/bin/Include and
-/home/thomas/projets/buildroot/output/host/usr/bin paths that are
-incorrectly added to the header paths.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Asaf: update for 2.7.17]
-Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
----
- Lib/distutils/sysconfig.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 1a4b792644..14c7d81c48 100644
---- a/Lib/distutils/sysconfig.py
-+++ b/Lib/distutils/sysconfig.py
-@@ -85,7 +85,7 @@ def get_python_inc(plat_specific=0, prefix=None):
-     if os.name == "posix":
-         if python_build:
-             if sys.executable:
--                buildir = os.path.dirname(sys.executable)
-+                buildir = project_base
-             else:
-                 # sys.executable can be empty if argv[0] has been changed
-                 # and Python is unable to retrieve the real program name
--- 
-2.20.1
-
diff --git a/package/python/0003-Change-the-install-location-of-_sysconfigdata.py.patch b/package/python/0003-Change-the-install-location-of-_sysconfigdata.py.patch
deleted file mode 100644
index 9e05af2e31..0000000000
--- a/package/python/0003-Change-the-install-location-of-_sysconfigdata.py.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From e3f3c454ec4992a2283640cef0a35da5a05fb399 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:17:59 +0100
-Subject: [PATCH] Change the install location of _sysconfigdata.py
-
-The _sysconfigdata.py module contains definitions that are needed when
-building Python modules. In cross-compilation mode, when building
-Python extensions for the target, we need to use the _sysconfigdata.py
-of the target Python while executing the host Python.
-
-However until now, the _sysconfigdata.py module was installed in
-build/lib.<arch>-<version> directory, together with a number of
-architecture-specific shared objects, which cannot be used with the
-host Python.
-
-To solve this problem, this patch moves _sysconfigdata.py to a
-separate location, build/sysconfigdata.<arch>-<version>/, and only
-this directory gets added to the PYTHONPATH of the host Python
-interpreter when building Python modules for the target.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in | 12 ++++++++++--
- configure.ac    |  2 +-
- 2 files changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 9297e7fc89..49d3c0926f 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -509,6 +509,9 @@ pybuilddir.txt: $(BUILDPYTHON)
- 		rm -f ./pybuilddir.txt ; \
- 		exit 1 ; \
- 	fi
-+	echo `cat pybuilddir.txt`/sysconfigdata > pysysconfigdatadir.txt
-+	mkdir -p `cat pysysconfigdatadir.txt`
-+	cp `cat pybuilddir.txt`/_sysconfigdata.py `cat pysysconfigdatadir.txt`
- 
- # This is shared by the math and cmath modules
- Modules/_math.o: Modules/_math.c Modules/_math.h
-@@ -1091,7 +1094,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 		else	true; \
- 		fi; \
- 	done
--	@for i in $(srcdir)/Lib/*.py `cat pybuilddir.txt`/_sysconfigdata.py $(srcdir)/Lib/*.doc $(srcdir)/Lib/*.egg-info ; \
-+	@for i in $(srcdir)/Lib/*.py $(srcdir)/Lib/*.doc $(srcdir)/Lib/*.egg-info ; \
- 	do \
- 		if test -x $$i; then \
- 			$(INSTALL_SCRIPT) $$i $(DESTDIR)$(LIBDEST); \
-@@ -1101,6 +1104,11 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 			echo $(INSTALL_DATA) $$i $(LIBDEST); \
- 		fi; \
- 	done
-+	$(INSTALL_DATA) `cat pysysconfigdatadir.txt`/_sysconfigdata.py \
-+		$(DESTDIR)$(LIBDEST)
-+	mkdir -p $(DESTDIR)$(LIBDEST)/sysconfigdata
-+	$(INSTALL_DATA) `cat pysysconfigdatadir.txt`/_sysconfigdata.py \
-+		$(DESTDIR)$(LIBDEST)/sysconfigdata
- 	@for d in $(LIBSUBDIRS); \
- 	do \
- 		a=$(srcdir)/Lib/$$d; \
-@@ -1426,7 +1434,7 @@ distclean: clobber
- 		Modules/Setup Modules/Setup.local Modules/Setup.config \
- 		Modules/ld_so_aix Modules/python.exp Misc/python.pc
- 	-rm -f python*-gdb.py
--	-rm -f pybuilddir.txt
-+	-rm -f pybuilddir.txt pysysconfigdatadir.txt
- 	# Issue #28258: set LC_ALL to avoid issues with Estonian locale.
- 	# Expansion is performed here by shell (spawned by make) itself before
- 	# arguments are passed to find. So LC_ALL=C must be set as a separate
-diff --git a/configure.ac b/configure.ac
-index aecf6066e8..7143172b98 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -36,7 +36,7 @@ if test "$cross_compiling" = yes; then
- 	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
- 	fi
-         AC_MSG_RESULT($interp)
--	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
-+	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pysysconfigdatadir.txt && echo $(abs_builddir)/`cat pysysconfigdatadir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
-     fi
- elif test "$cross_compiling" = maybe; then
-     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
--- 
-2.11.0
-
diff --git a/package/python/0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch b/package/python/0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch
deleted file mode 100644
index ef1eb04046..0000000000
--- a/package/python/0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 57ab41fa019d3ce276decd488938e5a00049cb9d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:18:57 +0100
-Subject: [PATCH] Make the compilation of .pyc and .pyo conditional
-
-This commit adds --{enable,disable}-{pyc,pyo} options to enable/disable
-the compilation of pyc/pyo files.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in |  8 ++++++++
- configure.ac    | 11 +++++++++++
- 2 files changed, 19 insertions(+)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 49d3c0926f..247d3c2902 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1139,24 +1139,32 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
- 			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
- 	fi
-+ifeq (@PYC_BUILD@,yes)
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
-+endif
-+ifeq (@PYO_BUILD@,yes)
- 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST) -f \
- 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
- 		$(DESTDIR)$(LIBDEST)
-+endif
-+ifeq (@PYC_BUILD@,yes)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
-+endif
-+ifeq (@PYO_BUILD@,yes)
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
- 		-d $(LIBDEST)/site-packages -f \
- 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
-+endif
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
- 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
- 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
-diff --git a/configure.ac b/configure.ac
-index 7143172b98..6bd8369105 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -773,6 +773,17 @@ SunOS*)
-     ;;
- esac
- 
-+AC_SUBST(PYC_BUILD)
-+
-+AC_ARG_ENABLE(pyc-build,
-+	AS_HELP_STRING([--disable-pyc-build], [disable build of pyc files]),
-+	[ PYC_BUILD="${enableval}" ], [ PYC_BUILD=yes ])
-+
-+AC_SUBST(PYO_BUILD)
-+
-+AC_ARG_ENABLE(pyo-build,
-+	AS_HELP_STRING([--disable-pyo-build], [disable build of pyo files]),
-+	[ PYO_BUILD="${enableval}" ], [ PYO_BUILD=yes ])
- 
- AC_SUBST(LIBRARY)
- AC_MSG_CHECKING(LIBRARY)
--- 
-2.11.0
-
diff --git a/package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch b/package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch
deleted file mode 100644
index c910ae7181..0000000000
--- a/package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e674e29ceba34e55c9149ce99489e543aa4ebb01 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:19:47 +0100
-Subject: [PATCH] Adjust getaddrinfo() test for cross-compilation
-
-The getaddrinfo() test in configure.ac uses AC_RUN_IFELSE(), which isn't
-cross-compilation friendly.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6bd8369105..77ca6d86ca 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3563,7 +3563,7 @@ fi
- 
- AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
- 
--if test $have_getaddrinfo = no -o "$ac_cv_buggy_getaddrinfo" = yes
-+if test $have_getaddrinfo = no || test "$cross_compiling" != "yes" -a "$ac_cv_buggy_getaddrinfo" = yes
- then
- 	if test $ipv6 = yes
- 	then
--- 
-2.11.0
-
diff --git a/package/python/0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch b/package/python/0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch
deleted file mode 100644
index b1a20eb04e..0000000000
--- a/package/python/0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 94ec96dd8827adfb5e272d28a4d76510e28657b3 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:21:28 +0100
-Subject: [PATCH] Add minimal infrastructure to be able to disable extensions
-
-This commit adds some logic to the Python build system to be able to
-disable Python extensions. Follow-up commits actually add options to
-disable specific extensions.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in | 6 +++++-
- configure.ac    | 2 ++
- setup.py        | 5 ++++-
- 3 files changed, 11 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 247d3c2902..c1c98ecc5a 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -160,6 +160,8 @@ FILEMODE=	644
- # configure script arguments
- CONFIG_ARGS=	@CONFIG_ARGS@
- 
-+# disabled extensions
-+DISABLED_EXTENSIONS=	@DISABLED_EXTENSIONS@
- 
- # Subdirectories with code
- SRCDIRS= 	@SRCDIRS@
-@@ -528,6 +530,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
- 	esac; \
- 	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
- 		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
-+		DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
- 		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
- 
- # Build static library
-@@ -1280,7 +1283,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
- # Install the dynamically loadable modules
- # This goes into $(exec_prefix)
- sharedinstall: sharedmods
--	$(RUNSHARED) $(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
-+	$(RUNSHARED) DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
-+		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py install \
- 	   	--prefix=$(prefix) \
- 		--install-scripts=$(BINDIR) \
- 		--install-platlib=$(DESTSHARED) \
-diff --git a/configure.ac b/configure.ac
-index 77ca6d86ca..13f90b3ddd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2491,6 +2491,8 @@ LIBS="$withval $LIBS"
- 
- PKG_PROG_PKG_CONFIG
- 
-+AC_SUBST(DISABLED_EXTENSIONS)
-+
- # Check for use of the system expat library
- AC_MSG_CHECKING(for --with-system-expat)
- AC_ARG_WITH(system_expat,
-diff --git a/setup.py b/setup.py
-index 812d53d560..d426dd02ea 100644
---- a/setup.py
-+++ b/setup.py
-@@ -33,7 +33,10 @@ host_platform = get_platform()
- COMPILED_WITH_PYDEBUG = ('--with-pydebug' in sysconfig.get_config_var("CONFIG_ARGS"))
- 
- # This global variable is used to hold the list of modules to be disabled.
--disabled_module_list = []
-+try:
-+    disabled_module_list = sysconfig.get_config_var("DISABLED_EXTENSIONS").split(" ")
-+except KeyError:
-+    disabled_module_list = list()
- 
- def add_dir_to_list(dirlist, dir):
-     """Add the directory 'dir' to the list 'dirlist' (at the front) if
--- 
-2.11.0
-
diff --git a/package/python/0007-Adjust-library-header-paths-for-cross-compilation.patch b/package/python/0007-Adjust-library-header-paths-for-cross-compilation.patch
deleted file mode 100644
index c68f1bf7f2..0000000000
--- a/package/python/0007-Adjust-library-header-paths-for-cross-compilation.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From f3e0a677c4736f95338825a022a884f8dc7a5c14 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:22:19 +0100
-Subject: [PATCH] Adjust library/header paths for cross-compilation
-
-When cross-compiling third-party extensions, the get_python_inc() or
-get_python_lib() can be called, to return the path to headers or
-libraries. However, they use the sys.prefix of the host Python, which
-returns incorrect paths when cross-compiling (paths pointing to host
-headers and libraries).
-
-In order to fix this, we introduce the _python_sysroot, _python_prefix
-and _python_exec_prefix variables, that allow to override these
-values, and get correct header/library paths when cross-compiling
-third-party Python modules.
-
-The _python_sysroot variable is also used to prefix the LIBDIR value
-taken from the sysconfigdata module.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Lib/distutils/command/build_ext.py | 5 ++++-
- Lib/distutils/sysconfig.py         | 9 +++++++--
- 2 files changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
-index 2c68be3..375b08c 100644
---- a/Lib/distutils/command/build_ext.py
-+++ b/Lib/distutils/command/build_ext.py
-@@ -240,7 +240,10 @@ class build_ext (Command):
-         if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
-             if not sysconfig.python_build:
-                 # building third party extensions
--                self.library_dirs.append(sysconfig.get_config_var('LIBDIR'))
-+                libdir = sysconfig.get_config_var('LIBDIR')
-+                if "_python_sysroot" in os.environ:
-+                    libdir = os.environ.get("_python_sysroot") + libdir
-+                self.library_dirs.append(libdir)
-             else:
-                 # building python standard extensions
-                 self.library_dirs.append('.')
-diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index d72b6e5..72151df 100644
---- a/Lib/distutils/sysconfig.py
-+++ b/Lib/distutils/sysconfig.py
-@@ -19,8 +19,13 @@ import sys
- from distutils.errors import DistutilsPlatformError
- 
- # These are needed in a couple of spots, so just compute them once.
--PREFIX = os.path.normpath(sys.prefix)
--EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
-+if "_python_sysroot" in os.environ:
-+    _sysroot=os.environ.get('_python_sysroot')
-+    PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_prefix'))
-+    EXEC_PREFIX = os.path.normpath(_sysroot + os.environ.get('_python_exec_prefix'))
-+else:
-+    PREFIX = os.path.normpath(sys.prefix)
-+    EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
- 
- # Path to the base directory of the project. On Windows the binary may
- # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
--- 
-2.7.4
-
diff --git a/package/python/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
deleted file mode 100644
index d523b74638..0000000000
--- a/package/python/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 87b627d8845e67fd798449b414bece04f18bd450 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:22:40 +0100
-Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 3b51c0a..fa32532 100644
---- a/setup.py
-+++ b/setup.py
-@@ -784,12 +784,9 @@ class PyBuildExt(build_ext):
-                 pass # Issue 7384: Already linked against curses or tinfo.
-             elif curses_library:
-                 readline_libs.append(curses_library)
--            elif self.compiler.find_library_file(lib_dirs +
--                                                     ['/usr/lib/termcap'],
--                                                     'termcap'):
-+            elif self.compiler.find_library_file(lib_dirs, 'termcap'):
-                 readline_libs.append('termcap')
-             exts.append( Extension('readline', ['readline.c'],
--                                   library_dirs=['/usr/lib/termcap'],
-                                    extra_link_args=readline_extra_link_args,
-                                    libraries=readline_libs) )
-         else:
--- 
-2.7.4
-
diff --git a/package/python/0009-Fix-python-config-for-cross-builds.patch b/package/python/0009-Fix-python-config-for-cross-builds.patch
deleted file mode 100644
index 3cf8797c03..0000000000
--- a/package/python/0009-Fix-python-config-for-cross-builds.patch
+++ /dev/null
@@ -1,229 +0,0 @@
-From 1522c6c00ee88eb1148d3b2021d32d819b416375 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 7 Mar 2017 22:23:14 +0100
-Subject: [PATCH] Fix python-config for cross-builds
-
-Add a backport of http://bugs.python.org/issue16235 so we can use
-python-config for cross builds.
-
-This basically replaces the python version of python-config with a
-pure-shell version that's already preprocessed when installed and
-doesn't depend on the sysconfig import that usually leads to bad
-data/results.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Bernd: rebased for Python 2.7.15]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in          |  13 +++---
- Misc/python-config.sh.in | 102 +++++++++++++++++++++++++++++++++++++++++++++++
- configure.ac             |   7 +++-
- 3 files changed, 116 insertions(+), 6 deletions(-)
- create mode 100644 Misc/python-config.sh.in
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index c1c98ecc5a..727a92af42 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -170,7 +170,7 @@ SRCDIRS= 	@SRCDIRS@
- SUBDIRSTOO=	Include Lib Misc Demo
- 
- # Files and directories to be distributed
--CONFIGFILES=	configure configure.ac acconfig.h pyconfig.h.in Makefile.pre.in
-+CONFIGFILES=	configure configure.ac acconfig.h pyconfig.h.in Makefile.pre.in Misc/python-config.sh
- DISTFILES=	README ChangeLog $(CONFIGFILES)
- DISTDIRS=	$(SUBDIRS) $(SUBDIRSTOO) Ext-dummy
- DIST=		$(DISTFILES) $(DISTDIRS)
-@@ -403,7 +403,7 @@ LIBRARY_OBJS=	\
- 
- # Default target
- all:		@DEF_MAKE_ALL_RULE@
--build_all:	check-clean-src $(BUILDPYTHON) oldsharedmods sharedmods gdbhooks
-+build_all:	check-clean-src $(BUILDPYTHON) oldsharedmods sharedmods gdbhooks python-config
- 
- # Check that the source is clean when building out of source.
- check-clean-src:
-@@ -1190,10 +1190,12 @@ $(srcdir)/Lib/$(PLATDIR):
- 	fi; \
- 	cd $(srcdir)/Lib/$(PLATDIR); $(RUNSHARED) ./regen
- 
--python-config: $(srcdir)/Misc/python-config.in
-+python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
- 	# Substitution happens here, as the completely-expanded BINDIR
- 	# is not available in configure
--	sed -e "s,@EXENAME@,$(BINDIR)/python$(VERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config
-+	sed -e "s,@EXENAME@,$(BINDIR)/python$(VERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
-+	# Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
-+	sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' Misc/python-config.sh >python-config
- 
- # Install the include files
- INCLDIRSTOMAKE=$(INCLUDEDIR) $(CONFINCLUDEDIR) $(INCLUDEPY) $(CONFINCLUDEPY)
-@@ -1252,7 +1254,7 @@ libainstall:	@DEF_MAKE_RULE@ python-config
- 	$(INSTALL_SCRIPT) $(srcdir)/Modules/makesetup $(DESTDIR)$(LIBPL)/makesetup
- 	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
- 	$(INSTALL_SCRIPT) python-config $(DESTDIR)$(BINDIR)/python$(VERSION)-config
--	rm python-config
-+	$(INSTALL_SCRIPT) python-config.py $(DESTDIR)$(LIBPL)/python-config.py
- 	@if [ -s Modules/python.exp -a \
- 		"`echo $(MACHDEP) | sed 's/^\(...\).*/\1/'`" = "aix" ]; then \
- 		echo; echo "Installing support files for building shared extension modules on AIX:"; \
-@@ -1434,6 +1436,7 @@ clobber: clean profile-removal
- 		config.cache config.log pyconfig.h Modules/config.c
- 	-rm -rf build platform
- 	-rm -rf $(PYTHONFRAMEWORKDIR)
-+	-rm -f python-config.py python-config
- 
- # Make things extra clean, before making a distribution:
- # remove all generated files, even Makefile[.pre]
-diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
-new file mode 100644
-index 0000000000..10db4c12eb
---- /dev/null
-+++ b/Misc/python-config.sh.in
-@@ -0,0 +1,102 @@
-+#!/bin/sh
-+
-+exit_with_usage ()
-+{
-+	echo "Usage: $0 --prefix|--exec-prefix|--includes|--libs|--cflags|--ldflags|--extension-suffix|--help|--configdir"
-+	exit $1
-+}
-+
-+if [ "$1" = "" ] ; then
-+	exit_with_usage 1
-+fi
-+
-+# Returns the actual prefix where this script was installed to.
-+installed_prefix ()
-+{
-+	RESULT=$(dirname $(cd $(dirname "$1") && pwd -P))
-+	if which readlink >/dev/null 2>&1 ; then
-+	RESULT=$(readlink -f "$RESULT")
-+	fi
-+	echo $RESULT
-+}
-+
-+prefix_build="@prefix@"
-+prefix_real=$(installed_prefix "$0")
-+
-+# Use sed to fix paths from their built to locations to their installed to locations.
-+prefix=$(echo "$prefix_build" | sed "s#$prefix_build#$prefix_real#")
-+exec_prefix_build="@exec_prefix@"
-+exec_prefix=$(echo "$exec_prefix_build" | sed "s#$exec_prefix_build#$prefix_real#")
-+includedir=$(echo "@includedir@")
-+libdir=$(echo "@libdir@" | sed "s#$prefix_build#$prefix_real#")
-+CFLAGS=$(echo "@CFLAGS@" | sed "s#$prefix_build#$prefix_real#")
-+VERSION="@VERSION@"
-+LIBM="@LIBM@"
-+LIBC="@LIBC@"
-+SYSLIBS="$LIBM $LIBC"
-+LIBS="@LIBS@ $SYSLIBS -lpython${VERSION}"
-+BASECFLAGS="@BASECFLAGS@"
-+LDLIBRARY="@LDLIBRARY@"
-+LINKFORSHARED="@LINKFORSHARED@"
-+OPT="@OPT@"
-+PY_ENABLE_SHARED="@PY_ENABLE_SHARED@"
-+LDVERSION="@LDVERSION@"
-+LIBDEST=${prefix}/lib/python${VERSION}
-+LIBPL=$(echo "@LIBPL@" | sed "s#$prefix_build#$prefix_real#")
-+SO="@SO@"
-+PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
-+INCDIR="-I$includedir/python${VERSION}"
-+PLATINCDIR="-I$includedir/python${VERSION}"
-+
-+# Scan for --help or unknown argument.
-+for ARG in $*
-+do
-+	case $ARG in
-+	--help)
-+		exit_with_usage 0
-+	;;
-+	--prefix|--exec-prefix|--includes|--libs|--cflags|--ldflags|--extension-suffix|--abiflags|--configdir)
-+	;;
-+	*)
-+		exit_with_usage 1
-+	;;
-+esac
-+done
-+
-+for ARG in "$@"
-+do
-+	case "$ARG" in
-+	--prefix)
-+		echo "$prefix"
-+	;;
-+	--exec-prefix)
-+		echo "$exec_prefix"
-+	;;
-+	--includes)
-+		 echo "$INCDIR $PLATINCDIR"
-+	;;
-+	--cflags)
-+		echo "$INCDIR $PLATINCDIR $BASECFLAGS $CFLAGS $OPT"
-+	;;
-+	--libs)
-+		echo "$LIBS"
-+	;;
-+	--ldflags)
-+		LINKFORSHAREDUSED=
-+		if [ -z "$PYTHONFRAMEWORK" ] ; then
-+			LINKFORSHAREDUSED=$LINKFORSHARED
-+		fi
-+		LIBPLUSED=
-+		if [ "$PY_ENABLE_SHARED" = "0" ] ; then
-+			LIBPLUSED="-L$LIBPL"
-+		fi
-+		echo "$LIBPLUSED -L$libdir $LIBS $LINKFORSHAREDUSED"
-+	;;
-+	--extension-suffix)
-+		echo "$SO"
-+	;;
-+	--configdir)
-+		echo "$LIBPL"
-+	;;
-+esac
-+done
-diff --git a/configure.ac b/configure.ac
-index 13f90b3ddd..3f28ef1371 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -919,6 +919,7 @@ fi
- 
- # Other platforms follow
- if test $enable_shared = "yes"; then
-+  PY_ENABLE_SHARED=1
-   AC_DEFINE(Py_ENABLE_SHARED, 1, [Defined if Python is built as a shared library.])
-   case $ac_sys_system in
-     BeOS*)
-@@ -979,6 +980,7 @@ if test $enable_shared = "yes"; then
- 
-   esac
- else # shared is disabled
-+  PY_ENABLE_SHARED=0
-   case $ac_sys_system in
-     CYGWIN*)
-           BLDLIBRARY='$(LIBRARY)'
-@@ -2128,6 +2130,9 @@ AC_SUBST(LDCXXSHARED)
- AC_SUBST(BLDSHARED)
- AC_SUBST(CCSHARED)
- AC_SUBST(LINKFORSHARED)
-+AC_SUBST(PY_ENABLE_SHARED)
-+LIBPL="${prefix}/lib/python${VERSION}/config"
-+AC_SUBST(LIBPL)
- # SO is the extension of shared libraries `(including the dot!)
- # -- usually .so, .sl on HP-UX, .dll on Cygwin
- AC_MSG_CHECKING(SO)
-@@ -4944,7 +4949,7 @@ AC_MSG_RESULT($ENSUREPIP)
- AC_SUBST(ENSUREPIP)
- 
- # generate output files
--AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc)
-+AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc Misc/python-config.sh)
- AC_CONFIG_FILES([Modules/ld_so_aix], [chmod +x Modules/ld_so_aix])
- AC_OUTPUT
- 
--- 
-2.11.0
-
diff --git a/package/python/0010-Remove-the-python-symlink-install-rules.patch b/package/python/0010-Remove-the-python-symlink-install-rules.patch
deleted file mode 100644
index 4a2116b1b0..0000000000
--- a/package/python/0010-Remove-the-python-symlink-install-rules.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 706d62599fb3c3cb9b9941364aaf4a1ef4ebd276 Mon Sep 17 00:00:00 2001
-From: Samuel Martin <s.martin49@gmail.com>
-Date: Tue, 7 Mar 2017 22:23:58 +0100
-Subject: [PATCH] Remove the python symlink install rules
-
-The python symlink installation will be handled by Buildroot itself,
-because Buildroot needs to control to what python interpreter (python2
-or python3) the python symlink points to.
-
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[Bernd: rebased against version 2.7.12.]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 727a92af42..37b2ff3a5f 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -978,17 +978,10 @@ bininstall:	altbininstall
- 		echo "Creating directory $(LIBPC)"; \
- 		$(INSTALL) -d -m $(DIRMODE) $(DESTDIR)$(LIBPC); \
- 	fi
--	-if test -f $(DESTDIR)$(BINDIR)/$(PYTHON) -o -h $(DESTDIR)$(BINDIR)/$(PYTHON); \
--	then rm -f $(DESTDIR)$(BINDIR)/$(PYTHON); \
--	else true; \
--	fi
--	(cd $(DESTDIR)$(BINDIR); $(LN) -s python2$(EXE) $(PYTHON))
- 	-rm -f $(DESTDIR)$(BINDIR)/python2$(EXE)
- 	(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)$(EXE) python2$(EXE))
- 	-rm -f $(DESTDIR)$(BINDIR)/python2-config
- 	(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-config python2-config)
--	-rm -f $(DESTDIR)$(BINDIR)/python-config
--	(cd $(DESTDIR)$(BINDIR); $(LN) -s python2-config python-config)
- 	-test -d $(DESTDIR)$(LIBPC) || $(INSTALL) -d -m $(DIRMODE) $(DESTDIR)$(LIBPC)
- 	-rm -f $(DESTDIR)$(LIBPC)/python2.pc
- 	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python2.pc)
--- 
-2.11.0
-
diff --git a/package/python/0011-Don-t-add-multiarch-paths.patch b/package/python/0011-Don-t-add-multiarch-paths.patch
deleted file mode 100644
index b84c9077c9..0000000000
--- a/package/python/0011-Don-t-add-multiarch-paths.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 50a243a9c90f95e9248ac720e42e802b5922ab90 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:24:28 +0100
-Subject: [PATCH] Don't add multiarch paths
-
-The add_multiarch_paths() function leads, in certain build
-environments, to the addition of host header paths to the CFLAGS,
-which is not appropriate for cross-compilation. This patch fixes that
-by simply removing the call to add_multiarch_paths() when we're
-cross-compiling.
-
-Investigation done by David <buildroot-2014@inbox.com>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index fa32532..0b9ea57 100644
---- a/setup.py
-+++ b/setup.py
-@@ -461,9 +461,9 @@ class PyBuildExt(build_ext):
-         if not cross_compiling:
-             add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
-             add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
-+            self.add_multiarch_paths()
-         if cross_compiling:
-             self.add_gcc_paths()
--        self.add_multiarch_paths()
- 
-         # Add paths specified in the environment variables LDFLAGS and
-         # CPPFLAGS for header and library files.
--- 
-2.7.4
-
diff --git a/package/python/0012-Abort-on-failed-module-build.patch b/package/python/0012-Abort-on-failed-module-build.patch
deleted file mode 100644
index 7d952ca5c2..0000000000
--- a/package/python/0012-Abort-on-failed-module-build.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a131e2ff219872d97eef6585117bd2f8ff9e310d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:24:48 +0100
-Subject: [PATCH] Abort on failed module build
-
-When building a Python module fails, the setup.py script currently
-doesn't exit with an error, and simply continues. This is not a really
-nice behavior, so this patch changes setup.py to abort with an error,
-so that the build issue is clearly noticeable.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/setup.py b/setup.py
-index 0b9ea57..9a5c2b8 100644
---- a/setup.py
-+++ b/setup.py
-@@ -299,6 +299,7 @@ class PyBuildExt(build_ext):
-             print "Failed to build these modules:"
-             print_three_column(failed)
-             print
-+            sys.exit(1)
- 
-     def build_extension(self, ext):
- 
--- 
-2.7.4
-
diff --git a/package/python/0013-sqlite3-fix-build-when-threads-are-not-used-availabl.patch b/package/python/0013-sqlite3-fix-build-when-threads-are-not-used-availabl.patch
deleted file mode 100644
index dfc11efc7e..0000000000
--- a/package/python/0013-sqlite3-fix-build-when-threads-are-not-used-availabl.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 0f0be88526ece7d2f6ee21c1f59b1546ec6dc7c0 Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Tue, 7 Mar 2017 22:25:14 +0100
-Subject: [PATCH] sqlite3: fix build when threads are not used/available
-
-When threads are not used/available, a function in the sqlite3 extension
-ends up with a label at the end:
-
-    void _pysqlite_final_callback(sqlite3_context* context)
-    {
-        PyObject* function_result;
-        PyObject** aggregate_instance;
-        int ok;
-
-    #ifdef WITH_THREAD
-        PyGILState_STATE threadstate;
-
-        threadstate = PyGILState_Ensure();
-    #endif
-
-        aggregate_instance = (PyObject**)sqlite3_aggregate_context(context, sizeof(PyObject*));
-        if (!*aggregate_instance) {
-            goto error;
-        }
-
-        [......]
-
-    error:
-    #ifdef WITH_THREAD
-        PyGILState_Release(threadstate);
-    #endif
-    }
-
-This is not valid, and gcc complains.
-
-Fix that by adding a dummy statement after the label, so that the label
-is never the last statement of the function.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- Modules/_sqlite/connection.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Modules/_sqlite/connection.c b/Modules/_sqlite/connection.c
-index 237d6e4..cdf69ab 100644
---- a/Modules/_sqlite/connection.c
-+++ b/Modules/_sqlite/connection.c
-@@ -794,6 +794,7 @@ error:
- #ifdef WITH_THREAD
-     PyGILState_Release(threadstate);
- #endif
-+    ;   /* Make gcc happy: a label can't be at the end of a function */
- }
- 
- static void _pysqlite_drop_unused_statement_references(pysqlite_Connection* self)
--- 
-2.7.4
-
diff --git a/package/python/0014-Serial-ioctl-workaround.patch b/package/python/0014-Serial-ioctl-workaround.patch
deleted file mode 100644
index 468d535ac3..0000000000
--- a/package/python/0014-Serial-ioctl-workaround.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 22e5a4c5d29ddf0856d7f68f5a613aec00e26168 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 7 Mar 2017 22:25:36 +0100
-Subject: [PATCH] Serial ioctl() workaround
-
-The ioctls.h of some architectures (notably xtensa) references structs from
-linux/serial.h. Make sure to include this header as well.
-
-Also, undef TIOCTTYGSTRUCT that require reference to internal kernel tty_struct,
-but isn't actually referenced in modern kernels.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- Modules/termios.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/Modules/termios.c b/Modules/termios.c
-index 57f30dc..a8c9855 100644
---- a/Modules/termios.c
-+++ b/Modules/termios.c
-@@ -16,7 +16,9 @@
-  * so this needs to be included first on that platform. */
- #include <termio.h>
- #endif
-+#include <linux/serial.h>
- #include <sys/ioctl.h>
-+#undef TIOCTTYGSTRUCT
- 
- /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
-  * MDTR, MRI, and MRTS (appearantly used internally by some things
--- 
-2.7.4
-
diff --git a/package/python/0015-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python/0015-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
deleted file mode 100644
index fecf29f4d6..0000000000
--- a/package/python/0015-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 70049366ddf1fc9084bb02cf4459380976cdf8f7 Mon Sep 17 00:00:00 2001
-From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
-Date: Tue, 7 Mar 2017 22:26:09 +0100
-Subject: [PATCH] Do not adjust the shebang of Python scripts for
- cross-compilation
-
-The copy_scripts() method in distutils copies the scripts listed in
-the setup file and adjusts the first line to refer to the current
-Python interpreter. When cross-compiling, this means that the adjusted
-shebang refers to the host Python interpreter.
-
-This patch modifies copy_scripts() to preserve the shebang when
-cross-compilation is detected.
-
-Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
----
- Lib/distutils/command/build_scripts.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Lib/distutils/command/build_scripts.py b/Lib/distutils/command/build_scripts.py
-index 567df65..4922d50 100644
---- a/Lib/distutils/command/build_scripts.py
-+++ b/Lib/distutils/command/build_scripts.py
-@@ -89,7 +89,7 @@ class build_scripts (Command):
-                     adjust = 1
-                     post_interp = match.group(1) or ''
- 
--            if adjust:
-+            if adjust and not '_python_sysroot' in os.environ:
-                 log.info("copying and adjusting %s -> %s", script,
-                          self.build_dir)
-                 if not self.dry_run:
--- 
-2.7.4
-
diff --git a/package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch b/package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch
deleted file mode 100644
index 600fc40b69..0000000000
--- a/package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 2c1810fb002128a6d33cc3a391a157e316479d15 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:27:16 +0100
-Subject: [PATCH] Add an option to disable installation of test modules
-
-The Python standard distribution comes with many test modules, that
-are not necessarly useful on embedded targets.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[Bernd: rebased against version 2.7.14]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in | 50 +++++++++++++++++++++++++++++++++-----------------
- configure.ac    |  6 ++++++
- 2 files changed, 39 insertions(+), 17 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 37b2ff3a5f..2a5e8adc61 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1048,28 +1048,44 @@ PLATMACDIRS= plat-mac plat-mac/Carbon plat-mac/lib-scriptpackages \
- 	plat-mac/lib-scriptpackages/SystemEvents \
- 	plat-mac/lib-scriptpackages/Terminal
- PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
--LIBSUBDIRS=	lib-tk lib-tk/test lib-tk/test/test_tkinter \
--		lib-tk/test/test_ttk site-packages test test/audiodata test/capath \
--		test/data test/cjkencodings test/decimaltestdata test/xmltestdata \
--		test/imghdrdata \
--		test/subprocessdata \
--		test/support \
--		test/tracedmodules \
-+LIBSUBDIRS=	lib-tk site-packages \
- 		encodings compiler hotshot \
--		email email/mime email/test email/test/data \
-+		email email/mime \
- 		ensurepip ensurepip/_bundled \
--		json json/tests \
--		sqlite3 sqlite3/test \
--		logging bsddb bsddb/test csv importlib wsgiref \
--		lib2to3 lib2to3/fixes lib2to3/pgen2 lib2to3/tests \
--		lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
--		ctypes ctypes/test ctypes/macholib \
--		idlelib idlelib/Icons idlelib/idle_test \
--		distutils distutils/command distutils/tests $(XMLLIBSUBDIRS) \
-+		json \
-+		sqlite3  \
-+		logging bsddb csv importlib wsgiref \
-+		lib2to3 lib2to3/fixes lib2to3/pgen2 \
-+		ctypes ctypes/macholib \
-+		idlelib idlelib/Icons \
-+		distutils distutils/command $(XMLLIBSUBDIRS) \
- 		multiprocessing multiprocessing/dummy \
--		unittest unittest/test \
-+		unittest \
- 		lib-old \
- 		curses pydoc_data $(MACHDEPS)
-+
-+TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
-+	lib-tk/test/test_ttk test test/audiodata test/capath test/data \
-+	test/cjkencodings test/decimaltestdata test/xmltestdata \
-+	test/imghdrdata \
-+	test/subprocessdata \
-+	test/support \
-+	test/tracedmodules \
-+	email/test email/test/data \
-+	json/tests \
-+	sqlite3/test \
-+	bsddb/test \
-+	lib2to3/tests \
-+ 	lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
-+	ctypes/test \
-+	idlelib/idle_test \
-+	distutils/tests \
-+	unittest/test
-+
-+ifeq (@TEST_MODULES@,yes)
-+LIBSUBDIRS += $(TESTSUBDIRS)
-+endif
-+
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
- 	do \
-diff --git a/configure.ac b/configure.ac
-index 3f28ef1371..f257a25620 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2835,6 +2835,12 @@ if test "$posix_threads" = "yes"; then
- fi
- 
- 
-+AC_SUBST(TEST_MODULES)
-+
-+AC_ARG_ENABLE(test-modules,
-+	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
-+	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
-+
- # Check for enable-ipv6
- AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
- AC_MSG_CHECKING([if --enable-ipv6 is specified])
--- 
-2.11.0
-
diff --git a/package/python/0017-Add-an-option-to-disable-pydoc.patch b/package/python/0017-Add-an-option-to-disable-pydoc.patch
deleted file mode 100644
index 48c1b570df..0000000000
--- a/package/python/0017-Add-an-option-to-disable-pydoc.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From f98c3f981643411449aba6f93178b2ca14f9a68c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:27:34 +0100
-Subject: [PATCH] Add an option to disable pydoc
-
-It removes 0.5 MB of data from the target plus the pydoc script
-itself.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in |  6 +++++-
- configure.ac    |  5 +++++
- setup.py        | 10 +++++++---
- 3 files changed, 17 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2a5e8adc61..d3ba1aeb4e 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1062,7 +1062,7 @@ LIBSUBDIRS=	lib-tk site-packages \
- 		multiprocessing multiprocessing/dummy \
- 		unittest \
- 		lib-old \
--		curses pydoc_data $(MACHDEPS)
-+		curses $(MACHDEPS)
- 
- TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
- 	lib-tk/test/test_ttk test test/audiodata test/capath test/data \
-@@ -1086,6 +1086,10 @@ ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
- 
-+ifeq (@PYDOC@,yes)
-+LIBSUBDIRS += pydoc_data
-+endif
-+
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
- 	do \
-diff --git a/configure.ac b/configure.ac
-index f257a25620..2ed4119478 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2834,6 +2834,11 @@ if test "$posix_threads" = "yes"; then
-       AC_CHECK_FUNCS(pthread_atfork)
- fi
- 
-+AC_SUBST(PYDOC)
-+
-+AC_ARG_ENABLE(pydoc,
-+	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
-+	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
- 
- AC_SUBST(TEST_MODULES)
- 
-diff --git a/setup.py b/setup.py
-index 2ef5b07189..49f810f72e 100644
---- a/setup.py
-+++ b/setup.py
-@@ -2277,6 +2277,12 @@ def main():
-     # turn off warnings when deprecated modules are imported
-     import warnings
-     warnings.filterwarnings("ignore",category=DeprecationWarning)
-+
-+    scripts = ['Tools/scripts/idle', 'Tools/scripts/2to3',
-+               'Lib/smtpd.py']
-+    if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
-+        scripts += [ 'Tools/scripts/pydoc' ]
-+
-     setup(# PyPI Metadata (PEP 301)
-           name = "Python",
-           version = sys.version.split()[0],
-@@ -2297,9 +2303,7 @@ def main():
-           ext_modules=[Extension('_struct', ['_struct.c'])],
- 
-           # Scripts to install
--          scripts = ['Tools/scripts/pydoc', 'Tools/scripts/idle',
--                     'Tools/scripts/2to3',
--                     'Lib/smtpd.py']
-+          scripts = scripts,
-         )
- 
- # --install-platlib
--- 
-2.11.0
-
diff --git a/package/python/0018-Add-an-option-to-disable-lib2to3.patch b/package/python/0018-Add-an-option-to-disable-lib2to3.patch
deleted file mode 100644
index 2c539fac35..0000000000
--- a/package/python/0018-Add-an-option-to-disable-lib2to3.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From d7f419246681e12f05e2eefc79286959c6aa18ab Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:27:49 +0100
-Subject: [PATCH] Add an option to disable lib2to3
-
-lib2to3 is a library to convert Python 2.x code to Python 3.x. As
-such, it is probably not very useful on embedded system targets.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in | 11 ++++++++---
- configure.ac    |  6 ++++++
- setup.py        |  5 +++--
- 3 files changed, 17 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index d3ba1aeb4e..0e15b6d6f4 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1055,7 +1055,6 @@ LIBSUBDIRS=	lib-tk site-packages \
- 		json \
- 		sqlite3  \
- 		logging bsddb csv importlib wsgiref \
--		lib2to3 lib2to3/fixes lib2to3/pgen2 \
- 		ctypes ctypes/macholib \
- 		idlelib idlelib/Icons \
- 		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1075,8 +1074,6 @@ TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
- 	json/tests \
- 	sqlite3/test \
- 	bsddb/test \
--	lib2to3/tests \
-- 	lib2to3/tests/data lib2to3/tests/data/fixers lib2to3/tests/data/fixers/myfixes \
- 	ctypes/test \
- 	idlelib/idle_test \
- 	distutils/tests \
-@@ -1090,6 +1087,14 @@ ifeq (@PYDOC@,yes)
- LIBSUBDIRS += pydoc_data
- endif
- 
-+ifeq (@LIB2TO3@,yes)
-+LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
-+TESTSUBDIRS += 	lib2to3/tests				\
-+		lib2to3/tests/data			\
-+		lib2to3/tests/data/fixers		\
-+		lib2to3/tests/data/fixers/myfixes
-+endif
-+
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
- 	do \
-diff --git a/configure.ac b/configure.ac
-index 2ed4119478..a2810ab8ed 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2846,6 +2846,12 @@ AC_ARG_ENABLE(test-modules,
- 	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
- 	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
- 
-+AC_SUBST(LIB2TO3)
-+
-+AC_ARG_ENABLE(lib2to3,
-+	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
-+	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
-+
- # Check for enable-ipv6
- AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
- AC_MSG_CHECKING([if --enable-ipv6 is specified])
-diff --git a/setup.py b/setup.py
-index 49f810f72e..9130819454 100644
---- a/setup.py
-+++ b/setup.py
-@@ -2278,10 +2278,11 @@ def main():
-     import warnings
-     warnings.filterwarnings("ignore",category=DeprecationWarning)
- 
--    scripts = ['Tools/scripts/idle', 'Tools/scripts/2to3',
--               'Lib/smtpd.py']
-+    scripts = ['Tools/scripts/idle', 'Lib/smtpd.py']
-     if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
-         scripts += [ 'Tools/scripts/pydoc' ]
-+    if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
-+        scripts += [ 'Tools/scripts/2to3' ]
- 
-     setup(# PyPI Metadata (PEP 301)
-           name = "Python",
--- 
-2.11.0
-
diff --git a/package/python/0019-Add-option-to-disable-the-sqlite3-module.patch b/package/python/0019-Add-option-to-disable-the-sqlite3-module.patch
deleted file mode 100644
index 433bb2973e..0000000000
--- a/package/python/0019-Add-option-to-disable-the-sqlite3-module.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 123ecc50932e3ad3f7a2d90d430b74822c9695d4 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:28:06 +0100
-Subject: [PATCH] Add option to disable the sqlite3 module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in | 7 +++++--
- configure.ac    | 9 +++++++++
- 2 files changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 0e15b6d6f4..a2e5ac6d41 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1053,7 +1053,6 @@ LIBSUBDIRS=	lib-tk site-packages \
- 		email email/mime \
- 		ensurepip ensurepip/_bundled \
- 		json \
--		sqlite3  \
- 		logging bsddb csv importlib wsgiref \
- 		ctypes ctypes/macholib \
- 		idlelib idlelib/Icons \
-@@ -1072,7 +1071,6 @@ TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
- 	test/tracedmodules \
- 	email/test email/test/data \
- 	json/tests \
--	sqlite3/test \
- 	bsddb/test \
- 	ctypes/test \
- 	idlelib/idle_test \
-@@ -1095,6 +1093,11 @@ TESTSUBDIRS += 	lib2to3/tests				\
- 		lib2to3/tests/data/fixers/myfixes
- endif
- 
-+ifeq (@SQLITE3@,yes)
-+LIBSUBDIRS += sqlite3
-+TESTSUBDIRS += sqlite3/test
-+endif
-+
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
- 	do \
-diff --git a/configure.ac b/configure.ac
-index a2810ab8ed..4ee3c60501 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2834,6 +2834,15 @@ if test "$posix_threads" = "yes"; then
-       AC_CHECK_FUNCS(pthread_atfork)
- fi
- 
-+AC_SUBST(SQLITE3)
-+AC_ARG_ENABLE(sqlite3,
-+	AS_HELP_STRING([--disable-sqlite3], [disable sqlite3]),
-+	[ SQLITE3="${enableval}" ], [ SQLITE3=yes ])
-+
-+if test "$SQLITE3" = "no" ; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.11.0
-
diff --git a/package/python/0020-Add-an-option-to-disable-the-tk-module.patch b/package/python/0020-Add-an-option-to-disable-the-tk-module.patch
deleted file mode 100644
index 26ae1799f8..0000000000
--- a/package/python/0020-Add-an-option-to-disable-the-tk-module.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From f0dc1198360c6875ed846a961e85dc41e239aa29 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:28:57 +0100
-Subject: [PATCH] Add an option to disable the tk module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in | 11 ++++++++---
- configure.ac    |  9 +++++++++
- 2 files changed, 17 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a2e5ac6d41..37ed70ab1d 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1048,7 +1048,7 @@ PLATMACDIRS= plat-mac plat-mac/Carbon plat-mac/lib-scriptpackages \
- 	plat-mac/lib-scriptpackages/SystemEvents \
- 	plat-mac/lib-scriptpackages/Terminal
- PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
--LIBSUBDIRS=	lib-tk site-packages \
-+LIBSUBDIRS=	site-packages \
- 		encodings compiler hotshot \
- 		email email/mime \
- 		ensurepip ensurepip/_bundled \
-@@ -1062,8 +1062,7 @@ LIBSUBDIRS=	lib-tk site-packages \
- 		lib-old \
- 		curses $(MACHDEPS)
- 
--TESTSUBDIRS = lib-tk/test lib-tk/test/test_tkinter \
--	lib-tk/test/test_ttk test test/audiodata test/capath test/data \
-+TESTSUBDIRS = test test/audiodata test/capath test/data \
- 	test/cjkencodings test/decimaltestdata test/xmltestdata \
- 	test/imghdrdata \
- 	test/subprocessdata \
-@@ -1098,6 +1097,12 @@ LIBSUBDIRS += sqlite3
- TESTSUBDIRS += sqlite3/test
- endif
- 
-+ifeq (@TK@,yes)
-+LIBSUBDIRS += lib-tk
-+TESTSUBDIRS += lib-tk/test lib-tk/test/test_tkinter	\
-+	      lib-tk/test/test_ttk
-+endif
-+
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
- 	do \
-diff --git a/configure.ac b/configure.ac
-index 4ee3c60501..2c20f826c5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2843,6 +2843,15 @@ if test "$SQLITE3" = "no" ; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
- fi
- 
-+AC_SUBST(TK)
-+AC_ARG_ENABLE(tk,
-+	AS_HELP_STRING([--disable-tk], [disable tk]),
-+	[ TK="${enableval}" ], [ TK=yes ])
-+
-+if test "$TK" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.11.0
-
diff --git a/package/python/0021-Add-an-option-to-disable-the-curses-module.patch b/package/python/0021-Add-an-option-to-disable-the-curses-module.patch
deleted file mode 100644
index 3b1ab7fb4c..0000000000
--- a/package/python/0021-Add-an-option-to-disable-the-curses-module.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 3e51eef24c51b986c37b354f3de98218eb76909c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:29:06 +0100
-Subject: [PATCH] Add an option to disable the curses module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in | 6 +++++-
- configure.ac    | 9 +++++++++
- 2 files changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 37ed70ab1d..458f4ad55b 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1060,7 +1060,7 @@ LIBSUBDIRS=	site-packages \
- 		multiprocessing multiprocessing/dummy \
- 		unittest \
- 		lib-old \
--		curses $(MACHDEPS)
-+		$(MACHDEPS)
- 
- TESTSUBDIRS = test test/audiodata test/capath test/data \
- 	test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1103,6 +1103,10 @@ TESTSUBDIRS += lib-tk/test lib-tk/test/test_tkinter	\
- 	      lib-tk/test/test_ttk
- endif
- 
-+ifeq (@CURSES@,yes)
-+LIBSUBDIRS += curses
-+endif
-+
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
- 	do \
-diff --git a/configure.ac b/configure.ac
-index 2c20f826c5..a7ebcd091e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2852,6 +2852,15 @@ if test "$TK" = "no"; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
- fi
- 
-+AC_SUBST(CURSES)
-+AC_ARG_ENABLE(curses,
-+	AS_HELP_STRING([--disable-curses], [disable curses]),
-+	[ CURSES="${enableval}" ], [ CURSES=yes ])
-+
-+if test "$CURSES" = "no"; then
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
-+fi
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.11.0
-
diff --git a/package/python/0022-Add-an-option-to-disable-expat.patch b/package/python/0022-Add-an-option-to-disable-expat.patch
deleted file mode 100644
index 2ebe7eabda..0000000000
--- a/package/python/0022-Add-an-option-to-disable-expat.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 548413a659cc5320560d6b794fe8edd06dd1d22e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:29:20 +0100
-Subject: [PATCH] Add an option to disable expat
-
-This patch replaces the existing --with-system-expat option with a
---with-expat={system,builtin,none} option, which allows to tell Python
-whether we want to use the system expat (already installed), the expat
-builtin the Python sources, or no expat at all (which disables the
-installation of XML modules).
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in |  6 +++++-
- configure.ac    | 18 +++++++++++++-----
- setup.py        |  2 +-
- 3 files changed, 19 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 458f4ad55b..8dee345539 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1056,7 +1056,7 @@ LIBSUBDIRS=	site-packages \
- 		logging bsddb csv importlib wsgiref \
- 		ctypes ctypes/macholib \
- 		idlelib idlelib/Icons \
--		distutils distutils/command $(XMLLIBSUBDIRS) \
-+		distutils distutils/command \
- 		multiprocessing multiprocessing/dummy \
- 		unittest \
- 		lib-old \
-@@ -1107,6 +1107,10 @@ ifeq (@CURSES@,yes)
- LIBSUBDIRS += curses
- endif
- 
-+ifeq (@EXPAT@,yes)
-+LIBSUBDIRS += $(XMLLIBSUBDIRS)
-+endif
-+
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
- 	do \
-diff --git a/configure.ac b/configure.ac
-index a7ebcd091e..2f5759a890 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2499,13 +2499,21 @@ PKG_PROG_PKG_CONFIG
- AC_SUBST(DISABLED_EXTENSIONS)
- 
- # Check for use of the system expat library
--AC_MSG_CHECKING(for --with-system-expat)
--AC_ARG_WITH(system_expat,
--            AS_HELP_STRING([--with-system-expat], [build pyexpat module using an installed expat library]),
-+AC_MSG_CHECKING(for --with-expat)
-+AC_ARG_WITH(expat,
-+            AS_HELP_STRING([--with-expat], [select which expat version to use: system, builtin, none]),
-             [],
--            [with_system_expat="no"])
-+            [with_expat="builtin"])
- 
--AC_MSG_RESULT($with_system_expat)
-+AC_MSG_RESULT($with_expat)
-+
-+if test "$with_expat" != "none"; then
-+   EXPAT=yes
-+else
-+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} pyexpat"
-+   EXPAT=no
-+fi
-+AC_SUBST(EXPAT)
- 
- # Check for use of the system libffi library
- AC_MSG_CHECKING(for --with-system-ffi)
-diff --git a/setup.py b/setup.py
-index 9130819454..f439cbadc2 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1475,7 +1475,7 @@ class PyBuildExt(build_ext):
-         #
-         # More information on Expat can be found at www.libexpat.org.
-         #
--        if '--with-system-expat' in sysconfig.get_config_var("CONFIG_ARGS"):
-+        if '--with-expat=system' in sysconfig.get_config_var("CONFIG_ARGS"):
-             expat_inc = []
-             define_macros = []
-             expat_lib = ['expat']
--- 
-2.11.0
-
diff --git a/package/python/0023-Add-an-option-to-disable-CJK-codecs.patch b/package/python/0023-Add-an-option-to-disable-CJK-codecs.patch
deleted file mode 100644
index 3ee77fec36..0000000000
--- a/package/python/0023-Add-an-option-to-disable-CJK-codecs.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6761066addfb6028e183d7fe4322b283af18117f Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:29:31 +0100
-Subject: [PATCH] Add an option to disable CJK codecs
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 2f5759a890..862c8ae516 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2851,6 +2851,12 @@ if test "$SQLITE3" = "no" ; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
- fi
- 
-+AC_ARG_ENABLE(codecs-cjk,
-+	AS_HELP_STRING([--disable-codecs-cjk], [disable CJK codecs]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk"
-+  	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.11.0
-
diff --git a/package/python/0024-Add-an-option-to-disable-NIS.patch b/package/python/0024-Add-an-option-to-disable-NIS.patch
deleted file mode 100644
index bad4ba68dc..0000000000
--- a/package/python/0024-Add-an-option-to-disable-NIS.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ecd8e926bd364d866f492df87d7c46d029445480 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:29:41 +0100
-Subject: [PATCH] Add an option to disable NIS
-
-NIS is not necessarily available in uClibc, so we need an option to
-not compile support for it.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 862c8ae516..354212fb16 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2857,6 +2857,12 @@ AC_ARG_ENABLE(codecs-cjk,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk"
-   	  fi])
- 
-+AC_ARG_ENABLE(nis,
-+	AS_HELP_STRING([--disable-nis], [disable NIS]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-+  	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.11.0
-
diff --git a/package/python/0025-Add-an-option-to-disable-unicodedata.patch b/package/python/0025-Add-an-option-to-disable-unicodedata.patch
deleted file mode 100644
index 687ea5027e..0000000000
--- a/package/python/0025-Add-an-option-to-disable-unicodedata.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From dc99b7a0331fe75d70ccb87dc0877ac5bbba51ca Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:29:52 +0100
-Subject: [PATCH] Add an option to disable unicodedata
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 354212fb16..4e430d82b8 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2863,6 +2863,12 @@ AC_ARG_ENABLE(nis,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-   	  fi])
- 
-+AC_ARG_ENABLE(unicodedata,
-+	AS_HELP_STRING([--disable-unicodedata], [disable unicodedata]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
-+  	  fi])
-+
- AC_SUBST(TK)
- AC_ARG_ENABLE(tk,
- 	AS_HELP_STRING([--disable-tk], [disable tk]),
--- 
-2.11.0
-
diff --git a/package/python/0026-Add-an-option-to-disable-bsddb.patch b/package/python/0026-Add-an-option-to-disable-bsddb.patch
deleted file mode 100644
index f216e8bb57..0000000000
--- a/package/python/0026-Add-an-option-to-disable-bsddb.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From a4bbbf0c5f1f68298d5f4e2c2cd80de7e758763c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:30:06 +0100
-Subject: [PATCH] Add an option to disable bsddb
-
-bsddb has an external dependency on Berkeley DB. Since we want to be
-able to build Python without it, this patch adds an option to disable
-the build/installation of this Python module.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in |  8 ++++++--
- configure.ac    | 22 ++++++++++++++++++++++
- 2 files changed, 28 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 8dee345539..a0473096c1 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1053,7 +1053,7 @@ LIBSUBDIRS=	site-packages \
- 		email email/mime \
- 		ensurepip ensurepip/_bundled \
- 		json \
--		logging bsddb csv importlib wsgiref \
-+		logging csv importlib wsgiref \
- 		ctypes ctypes/macholib \
- 		idlelib idlelib/Icons \
- 		distutils distutils/command \
-@@ -1070,7 +1070,6 @@ TESTSUBDIRS = test test/audiodata test/capath test/data \
- 	test/tracedmodules \
- 	email/test email/test/data \
- 	json/tests \
--	bsddb/test \
- 	ctypes/test \
- 	idlelib/idle_test \
- 	distutils/tests \
-@@ -1111,6 +1110,11 @@ ifeq (@EXPAT@,yes)
- LIBSUBDIRS += $(XMLLIBSUBDIRS)
- endif
- 
-+ifeq (@BSDDB@,yes)
-+LIBSUBDIRS += bsddb
-+TESTSUBDIRS += bsddb/test
-+endif
-+
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 	@for i in $(SCRIPTDIR) $(LIBDEST); \
- 	do \
-diff --git a/configure.ac b/configure.ac
-index 4e430d82b8..361e8c120e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2863,6 +2863,28 @@ AC_ARG_ENABLE(nis,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-   	  fi])
- 
-+AC_ARG_ENABLE(dbm,
-+	AS_HELP_STRING([--disable-dbm], [disable DBM]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} dbm"
-+  	  fi])
-+
-+AC_ARG_ENABLE(gdbm,
-+	AS_HELP_STRING([--disable-gdbm], [disable GDBM]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} gdbm"
-+  	  fi])
-+
-+AC_SUBST(BSDDB)
-+AC_ARG_ENABLE(bsddb,
-+	AS_HELP_STRING([--disable-bsddb], [disable BerkeyleyDB]),
-+	[ if test "$enableval" = "no"; then
-+    	     BSDDB=no
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _bsddb"
-+  	  else
-+	     BSDDB=yes
-+  	  fi], [ BSDDB=yes ])
-+
- AC_ARG_ENABLE(unicodedata,
- 	AS_HELP_STRING([--disable-unicodedata], [disable unicodedata]),
- 	[ if test "$enableval" = "no"; then
--- 
-2.11.0
-
diff --git a/package/python/0027-Add-an-option-to-disable-the-ssl-module.patch b/package/python/0027-Add-an-option-to-disable-the-ssl-module.patch
deleted file mode 100644
index d62408e4e9..0000000000
--- a/package/python/0027-Add-an-option-to-disable-the-ssl-module.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a0e56b96c3bfb04a5c8ecc0987cdd294d8ce116b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:30:22 +0100
-Subject: [PATCH] Add an option to disable the ssl module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 361e8c120e..8fe47d8c37 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2863,6 +2863,12 @@ AC_ARG_ENABLE(nis,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
-   	  fi])
- 
-+AC_ARG_ENABLE(ssl,
-+	AS_HELP_STRING([--disable-ssl], [disable SSL]),
-+	[ if test "$enableval" = "no"; then
-+    	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _ssl"
-+  	  fi])
-+
- AC_ARG_ENABLE(dbm,
- 	AS_HELP_STRING([--disable-dbm], [disable DBM]),
- 	[ if test "$enableval" = "no"; then
--- 
-2.11.0
-
diff --git a/package/python/0028-Add-an-option-to-disable-the-bz2-module.patch b/package/python/0028-Add-an-option-to-disable-the-bz2-module.patch
deleted file mode 100644
index 5b89e8ef87..0000000000
--- a/package/python/0028-Add-an-option-to-disable-the-bz2-module.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d1236c6f4d8d893709fa36f751af47b8ad9055c1 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:30:33 +0100
-Subject: [PATCH] Add an option to disable the bz2 module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 8fe47d8c37..85df7b1478 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2869,6 +2869,12 @@ AC_ARG_ENABLE(ssl,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _ssl"
-   	  fi])
- 
-+AC_ARG_ENABLE(bz2,
-+       AS_HELP_STRING([--disable-bz2], [disable BZIP2]),
-+       [ if test "$enableval" = "no"; then
-+            DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bz2"
-+         fi])
-+
- AC_ARG_ENABLE(dbm,
- 	AS_HELP_STRING([--disable-dbm], [disable DBM]),
- 	[ if test "$enableval" = "no"; then
--- 
-2.11.0
-
diff --git a/package/python/0029-Add-an-option-to-disable-the-zlib-module.patch b/package/python/0029-Add-an-option-to-disable-the-zlib-module.patch
deleted file mode 100644
index 95da586e46..0000000000
--- a/package/python/0029-Add-an-option-to-disable-the-zlib-module.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a9c7314e069036f74b503dfaef261e5f45477b7e Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:30:45 +0100
-Subject: [PATCH] Add an option to disable the zlib module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 85df7b1478..3848b16b9f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2875,6 +2875,12 @@ AC_ARG_ENABLE(bz2,
-             DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bz2"
-          fi])
- 
-+AC_ARG_ENABLE(zlib,
-+       AS_HELP_STRING([--disable-zlib], [disable ZLIB]),
-+       [ if test "$enableval" = "no"; then
-+            DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} zlib"
-+         fi])
-+
- AC_ARG_ENABLE(dbm,
- 	AS_HELP_STRING([--disable-dbm], [disable DBM]),
- 	[ if test "$enableval" = "no"; then
--- 
-2.11.0
-
diff --git a/package/python/0030-Do-not-install-the-idle-editor.patch b/package/python/0030-Do-not-install-the-idle-editor.patch
deleted file mode 100644
index e101e6a12c..0000000000
--- a/package/python/0030-Do-not-install-the-idle-editor.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From e789487c783f75c17a8951bd5324c86ceefde407 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:30:56 +0100
-Subject: [PATCH] Do not install the idle editor
-
-IDLE is the Python IDE built with the tkinter GUI toolkit. Since it's
-highly unlikely to ever be useful in an embedded Linux system
-generated by Buildroot, this patch simply disables the installation of
-idle and the related Python modules. It saves 800 KB-900 KB of
-installed .pyc files.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- Makefile.pre.in | 2 --
- setup.py        | 2 +-
- 2 files changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a0473096c1..750057fb96 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1055,7 +1055,6 @@ LIBSUBDIRS=	site-packages \
- 		json \
- 		logging csv importlib wsgiref \
- 		ctypes ctypes/macholib \
--		idlelib idlelib/Icons \
- 		distutils distutils/command \
- 		multiprocessing multiprocessing/dummy \
- 		unittest \
-@@ -1071,7 +1070,6 @@ TESTSUBDIRS = test test/audiodata test/capath test/data \
- 	email/test email/test/data \
- 	json/tests \
- 	ctypes/test \
--	idlelib/idle_test \
- 	distutils/tests \
- 	unittest/test
- 
-diff --git a/setup.py b/setup.py
-index f439cbadc2..227187681e 100644
---- a/setup.py
-+++ b/setup.py
-@@ -2278,7 +2278,7 @@ def main():
-     import warnings
-     warnings.filterwarnings("ignore",category=DeprecationWarning)
- 
--    scripts = ['Tools/scripts/idle', 'Lib/smtpd.py']
-+    scripts = ['Lib/smtpd.py']
-     if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
-         scripts += [ 'Tools/scripts/pydoc' ]
-     if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
--- 
-2.11.0
-
diff --git a/package/python/0031-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python/0031-Add-an-option-to-disable-the-ossaudiodev-module.patch
deleted file mode 100644
index 9768faf676..0000000000
--- a/package/python/0031-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 4ab280b8a7626de2565cf4ef6cf08a5c7326574b Mon Sep 17 00:00:00 2001
-From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
-Date: Tue, 7 Mar 2017 22:31:22 +0100
-Subject: [PATCH] Add an option to disable the ossaudiodev module
-
-Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 3848b16b9f..6d19cdee95 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2927,6 +2927,12 @@ if test "$CURSES" = "no"; then
-    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
- fi
- 
-+AC_ARG_ENABLE(ossaudiodev,
-+       AS_HELP_STRING([--disable-ossaudiodev], [disable OSSAUDIODEV]),
-+       [ if test "$enableval" = "no"; then
-+            DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ossaudiodev"
-+         fi])
-+
- AC_SUBST(PYDOC)
- 
- AC_ARG_ENABLE(pydoc,
--- 
-2.11.0
-
diff --git a/package/python/0032-Add-option-to-disable-the-hashlib-module.patch b/package/python/0032-Add-option-to-disable-the-hashlib-module.patch
deleted file mode 100644
index 82ef3a13f7..0000000000
--- a/package/python/0032-Add-option-to-disable-the-hashlib-module.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 479bef8182c4f6b678a86820ccc06760ca60c286 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:33:02 +0100
-Subject: [PATCH] Add option to disable the hashlib module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 6d19cdee95..ddccc79c2c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2869,6 +2869,12 @@ AC_ARG_ENABLE(ssl,
-     	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _ssl"
-   	  fi])
- 
-+AC_ARG_ENABLE(hashlib,
-+	AS_HELP_STRING([--disable-hashlib], [disable hashlib]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _hashlib"
-+	  fi])
-+
- AC_ARG_ENABLE(bz2,
-        AS_HELP_STRING([--disable-bz2], [disable BZIP2]),
-        [ if test "$enableval" = "no"; then
--- 
-2.11.0
-
diff --git a/package/python/0033-Add-an-option-to-disable-readline-module.patch b/package/python/0033-Add-an-option-to-disable-readline-module.patch
deleted file mode 100644
index 02b1315179..0000000000
--- a/package/python/0033-Add-an-option-to-disable-readline-module.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From abea92958b073dfbf0c78bcb31ce9cfc709c20ca Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Tue, 7 Mar 2017 22:33:55 +0100
-Subject: [PATCH] Add an option to disable readline module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Peter: update for 2.7.16]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- configure.ac | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index ddccc79c2c..dae266326e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2875,6 +2875,12 @@ AC_ARG_ENABLE(hashlib,
- 	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _hashlib"
- 	  fi])
- 
-+AC_ARG_ENABLE(readline,
-+	AS_HELP_STRING([--disable-readline], [disable readline]),
-+	[ if test "$enableval" = "no"; then
-+	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
-+	  fi])
-+
- AC_ARG_ENABLE(bz2,
-        AS_HELP_STRING([--disable-bz2], [disable BZIP2]),
-        [ if test "$enableval" = "no"; then
--- 
-2.11.0
-
diff --git a/package/python/0034-Override-system-locale-and-set-to-default-when-addin.patch b/package/python/0034-Override-system-locale-and-set-to-default-when-addin.patch
deleted file mode 100644
index 8fe722bc6c..0000000000
--- a/package/python/0034-Override-system-locale-and-set-to-default-when-addin.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d2bfa8805206db8c57c182094396d20a9d94bd8f Mon Sep 17 00:00:00 2001
-From: Samuel Cabrero <samuelcabrero@gmail.com>
-Date: Sat, 1 Apr 2017 09:31:52 +0200
-Subject: [PATCH] Override system locale and set to default when adding gcc
- paths
-
-Forces the use of the default locale in the function
-add_gcc_paths, which is called when cross compiling to add the
-include and library paths. This is necessary because otherwise
-the gcc output is localized and the output parsing fails, which
-results in no paths added and detect_modules not able to find
-any system library (eg. libz, libssl, etc.)
-
-[Thomas: patch taken from https://bugs.python.org/issue23767.]
-
-Signed-off-by: Samuel Cabrero <samuelcabrero@gmail.com>
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 8045a9b..c14f4ab 100644
---- a/setup.py
-+++ b/setup.py
-@@ -430,7 +430,7 @@ class PyBuildExt(build_ext):
-         tmpfile = os.path.join(self.build_temp, 'gccpaths')
-         if not os.path.exists(self.build_temp):
-             os.makedirs(self.build_temp)
--        ret = os.system('%s -E -v - </dev/null 2>%s 1>/dev/null' % (gcc, tmpfile))
-+        ret = os.system('LC_ALL=C %s -E -v - </dev/null 2>%s 1>/dev/null' % (gcc, tmpfile))
-         is_gcc = False
-         in_incdirs = False
-         inc_dirs = []
--- 
-2.7.4
-
diff --git a/package/python/Config.in.host b/package/python/Config.in.host
deleted file mode 100644
index 724e5e223a..0000000000
--- a/package/python/Config.in.host
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_HOST_PYTHON
-	bool "host python"
-	help
-	  The python language interpreter. Host package.
-
-	  http://www.python.org/
-
-if BR2_PACKAGE_HOST_PYTHON
-
-config BR2_PACKAGE_HOST_PYTHON_SSL
-	bool "ssl"
-	select BR2_PACKAGE_HOST_OPENSSL
-	help
-	  _ssl module for host Python.
-
-endif
diff --git a/package/python/python.hash b/package/python/python.hash
deleted file mode 100644
index f5e51d9638..0000000000
--- a/package/python/python.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From https://www.python.org/downloads/release/python-2718/
-md5  fd6cc8ec0a78c44036f825e739f36e5a Python-2.7.18.tar.xz
-# Locally calculated
-sha256  b62c0e7937551d0cc02b8fd5cb0f544f9405bafc9a54d3808ed4594812edef43  Python-2.7.18.tar.xz
-sha256  de4d1f2d2ad5ad0cfd1657a106476b31cb5db5ef9d1ff842b237c0c81f0c8a23  LICENSE
diff --git a/package/python/python.mk b/package/python/python.mk
deleted file mode 100644
index ae99f382f9..0000000000
--- a/package/python/python.mk
+++ /dev/null
@@ -1,302 +0,0 @@
-################################################################################
-#
-# python
-#
-################################################################################
-
-PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).18
-PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
-PYTHON_SITE = https://python.org/ftp/python/$(PYTHON_VERSION)
-PYTHON_LICENSE = Python-2.0, others
-PYTHON_LICENSE_FILES = LICENSE
-PYTHON_CPE_ID_VENDOR = python
-PYTHON_LIBTOOL_PATCH = NO
-
-# Python needs itself to be built, so in order to cross-compile
-# Python, we need to build a host Python first. This host Python is
-# also installed in $(HOST_DIR), as it is needed when cross-compiling
-# third-party Python modules.
-
-HOST_PYTHON_CONF_OPTS += \
-	--enable-static \
-	--without-cxx-main \
-	--disable-sqlite3 \
-	--disable-tk \
-	--with-expat=system \
-	--with-system-ffi \
-	--disable-curses \
-	--disable-codecs-cjk \
-	--disable-nis \
-	--enable-unicodedata \
-	--disable-dbm \
-	--disable-gdbm \
-	--disable-bsddb \
-	--disable-test-modules \
-	--disable-bz2 \
-	--disable-ossaudiodev \
-	--disable-pyo-build
-
-# Make sure that LD_LIBRARY_PATH overrides -rpath.
-# This is needed because libpython may be installed at the same time that
-# python is called.
-# Make python believe we don't have 'hg' and 'svn', so that it doesn't
-# try to communicate over the network during the build.
-HOST_PYTHON_CONF_ENV += \
-	LDFLAGS="$(HOST_LDFLAGS) -Wl,--enable-new-dtags" \
-	ac_cv_prog_HAS_HG=/bin/false \
-	ac_cv_prog_SVNVERSION=/bin/false
-
-# Building host python in parallel sometimes triggers a "Bus error"
-# during the execution of "./python setup.py build" in the
-# installation step. It is probably due to the installation of a
-# shared library taking place in parallel to the execution of
-# ./python, causing spurious Bus error. Building host-python with
-# MAKE1 has shown to workaround the problem.
-HOST_PYTHON_MAKE = $(MAKE1)
-
-PYTHON_DEPENDENCIES = host-python libffi $(TARGET_NLS_DEPENDENCIES)
-
-HOST_PYTHON_DEPENDENCIES = host-expat host-libffi host-zlib
-
-ifeq ($(BR2_PACKAGE_HOST_PYTHON_SSL),y)
-HOST_PYTHON_DEPENDENCIES += host-openssl
-else
-HOST_PYTHON_CONF_OPTS += --disable-ssl
-endif
-
-PYTHON_INSTALL_STAGING = YES
-
-ifeq ($(BR2_PACKAGE_PYTHON_READLINE),y)
-PYTHON_DEPENDENCIES += readline
-else
-PYTHON_CONF_OPTS += --disable-readline
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_CURSES),y)
-PYTHON_DEPENDENCIES += ncurses
-else
-PYTHON_CONF_OPTS += --disable-curses
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_PYEXPAT),y)
-PYTHON_DEPENDENCIES += expat
-PYTHON_CONF_OPTS += --with-expat=system
-else
-PYTHON_CONF_OPTS += --with-expat=none
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_BSDDB),y)
-PYTHON_DEPENDENCIES += berkeleydb
-else
-PYTHON_CONF_OPTS += --disable-bsddb
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_SQLITE),y)
-PYTHON_DEPENDENCIES += sqlite
-else
-PYTHON_CONF_OPTS += --disable-sqlite3
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_SSL),y)
-PYTHON_DEPENDENCIES += openssl
-else
-PYTHON_CONF_OPTS += --disable-ssl
-endif
-
-ifneq ($(BR2_PACKAGE_PYTHON_CODECSCJK),y)
-PYTHON_CONF_OPTS += --disable-codecs-cjk
-endif
-
-ifneq ($(BR2_PACKAGE_PYTHON_UNICODEDATA),y)
-PYTHON_CONF_OPTS += --disable-unicodedata
-endif
-
-# Default is UCS2 w/o a conf opt
-ifeq ($(BR2_PACKAGE_PYTHON_UCS4),y)
-# host-python must have the same UCS2/4 configuration as the target
-# python
-HOST_PYTHON_CONF_OPTS += --enable-unicode=ucs4
-PYTHON_CONF_OPTS += --enable-unicode=ucs4
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_2TO3),y)
-PYTHON_CONF_OPTS += --enable-lib2to3
-else
-PYTHON_CONF_OPTS += --disable-lib2to3
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_BZIP2),y)
-PYTHON_DEPENDENCIES += bzip2
-else
-PYTHON_CONF_OPTS += --disable-bz2
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_ZLIB),y)
-PYTHON_DEPENDENCIES += zlib
-else
-PYTHON_CONF_OPTS += --disable-zlib
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_HASHLIB),y)
-PYTHON_DEPENDENCIES += openssl
-else
-PYTHON_CONF_OPTS += --disable-hashlib
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_OSSAUDIODEV),y)
-PYTHON_CONF_OPTS += --enable-ossaudiodev
-else
-PYTHON_CONF_OPTS += --disable-ossaudiodev
-endif
-
-# Make python believe we don't have 'hg' and 'svn', so that it doesn't
-# try to communicate over the network during the build.
-PYTHON_CONF_ENV += \
-	ac_cv_have_long_long_format=yes \
-	ac_cv_file__dev_ptmx=yes \
-	ac_cv_file__dev_ptc=yes \
-	ac_cv_working_tzset=yes \
-	ac_cv_prog_HAS_HG=/bin/false \
-	ac_cv_prog_SVNVERSION=/bin/false
-
-# GCC is always compliant with IEEE754
-ifeq ($(BR2_ENDIAN),"LITTLE")
-PYTHON_CONF_ENV += ac_cv_little_endian_double=yes
-else
-PYTHON_CONF_ENV += ac_cv_big_endian_double=yes
-endif
-
-PYTHON_CONF_OPTS += \
-	--without-cxx-main \
-	--without-doc-strings \
-	--with-system-ffi \
-	--disable-pydoc \
-	--disable-test-modules \
-	--disable-gdbm \
-	--disable-tk \
-	--disable-nis \
-	--disable-dbm \
-	--disable-pyo-build \
-	--disable-pyc-build
-
-# This is needed to make sure the Python build process doesn't try to
-# regenerate those files with the pgen program. Otherwise, it builds
-# pgen for the target, and tries to run it on the host.
-
-define PYTHON_TOUCH_GRAMMAR_FILES
-	touch $(@D)/Include/graminit.h $(@D)/Python/graminit.c
-endef
-
-PYTHON_POST_PATCH_HOOKS += PYTHON_TOUCH_GRAMMAR_FILES
-
-#
-# Remove useless files. In the config/ directory, only the Makefile
-# and the pyconfig.h files are needed at runtime.
-#
-# idle & smtpd.py have bad shebangs and are mostly samples
-#
-define PYTHON_REMOVE_USELESS_FILES
-	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)-config
-	rm -f $(TARGET_DIR)/usr/bin/python2-config
-	rm -f $(TARGET_DIR)/usr/bin/python-config
-	rm -f $(TARGET_DIR)/usr/bin/smtpd.py
-	rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/distutils/command/wininst*.exe
-	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config/ \
-		-type f -not -name pyconfig.h -a -not -name Makefile` ; do \
-		rm -f $$i ; \
-	done
-endef
-
-PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_USELESS_FILES
-
-#
-# Make sure libpython gets stripped out on target
-#
-define PYTHON_ENSURE_LIBPYTHON_STRIPPED
-	chmod u+w $(TARGET_DIR)/usr/lib/libpython$(PYTHON_VERSION_MAJOR)*.so
-endef
-
-PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_ENSURE_LIBPYTHON_STRIPPED
-
-# Always install the python symlink in the target tree
-define PYTHON_INSTALL_TARGET_PYTHON_SYMLINK
-	ln -sf python2 $(TARGET_DIR)/usr/bin/python
-endef
-
-PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_INSTALL_TARGET_PYTHON_SYMLINK
-
-# Always install the python-config symlink in the staging tree
-define PYTHON_INSTALL_STAGING_PYTHON_CONFIG_SYMLINK
-	ln -sf python2-config $(STAGING_DIR)/usr/bin/python-config
-endef
-
-PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_INSTALL_STAGING_PYTHON_CONFIG_SYMLINK
-
-PYTHON_AUTORECONF = YES
-
-# Some packages may have build scripts requiring python2.
-# Only install the python symlink in the host tree if python3 is not enabled
-# for the target, otherwise the default python program may be missing.
-ifneq ($(BR2_PACKAGE_PYTHON3),y)
-define HOST_PYTHON_INSTALL_PYTHON_SYMLINK
-	ln -sf python2 $(HOST_DIR)/bin/python
-	ln -sf python2-config $(HOST_DIR)/bin/python-config
-endef
-
-HOST_PYTHON_POST_INSTALL_HOOKS += HOST_PYTHON_INSTALL_PYTHON_SYMLINK
-endif
-
-# Provided to other packages
-PYTHON_PATH = $(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/sysconfigdata/
-
-$(eval $(autotools-package))
-$(eval $(host-autotools-package))
-
-ifeq ($(BR2_REPRODUCIBLE),y)
-define PYTHON_FIX_TIME
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' -print0 | \
-		xargs -0 --no-run-if-empty touch -d @$(SOURCE_DATE_EPOCH)
-endef
-endif
-
-define PYTHON_CREATE_PYC_FILES
-	$(PYTHON_FIX_TIME)
-	PYTHONPATH="$(PYTHON_PATH)" \
-	$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR) \
-		$(TOPDIR)/support/scripts/pycompile.py \
-		$(if $(VERBOSE),--verbose) \
-		--strip-root $(TARGET_DIR) \
-		$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)
-endef
-
-ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY)$(BR2_PACKAGE_PYTHON_PY_PYC),y)
-PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_CREATE_PYC_FILES
-endif
-
-ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
-define PYTHON_REMOVE_PY_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.py' \
-		$(if $(strip $(KEEP_PYTHON_PY_FILES)),-not \( $(call finddirclauses,$(TARGET_DIR),$(KEEP_PYTHON_PY_FILES)) \) ) \
-		-print0 | \
-		xargs -0 --no-run-if-empty rm -f
-endef
-PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PY_FILES
-endif
-
-# Normally, *.pyc files should not have been compiled, but just in
-# case, we make sure we remove all of them.
-ifeq ($(BR2_PACKAGE_PYTHON_PY_ONLY),y)
-define PYTHON_REMOVE_PYC_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyc' -print0 | \
-		xargs -0 --no-run-if-empty rm -f
-endef
-PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYC_FILES
-endif
-
-# In all cases, we don't want to keep the optimized .pyo files
-define PYTHON_REMOVE_PYO_FILES
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) -name '*.pyo' -print0 | \
-		xargs -0 --no-run-if-empty rm -f
-endef
-PYTHON_TARGET_FINALIZE_HOOKS += PYTHON_REMOVE_PYO_FILES
-- 
2.20.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

