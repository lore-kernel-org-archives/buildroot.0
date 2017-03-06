From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon,  6 Mar 2017 14:48:52 -0800
Subject: [Buildroot] [PATCH 2/2] python3: Bump version to 3.6.0
In-Reply-To: <20170306224852.30968-1-andrew.smirnov@gmail.com>
References: <20170306224852.30968-1-andrew.smirnov@gmail.com>
Message-ID: <20170306224852.30968-2-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update all appropriate version numbers as well as SHAs and MD5s as well
as repbasing BR's patches on top of 3.6.0 codebase (new github repo
tree, v3.6.0 tag was used). Note that patches:

[PATCH] Change the install location of _sysconfigdata.py
[PATCH] distutils/sysconfig: use sysconfigdata

were dropped from the patchset since 3.6.0 codebase doesn't seem like it
has the problem that aforementioned patches were solving.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 package/pkg-python.mk                              |  5 ++
 ...up.py-do-not-add-invalid-header-locations.patch | 10 +--
 ...the-install-location-of-_sysconfigdata.py.patch | 86 ----------------------
 ...-Make-the-build-of-pyc-files-conditional.patch} | 22 +++---
 ...y_getaddrinfo-configure-test-when-cross-.patch} | 12 +--
 ...ucture-to-disable-the-build-of-certain-e.patch} | 36 +++++----
 ...brary-header-paths-for-cross-compilation.patch} | 12 +--
 ...-t-look-in-usr-lib-termcap-for-libraries.patch} | 10 +--
 ...006-distutils-sysconfig-use-sysconfigdata.patch | 65 ----------------
 ....patch => 0007-Don-t-add-multiarch-paths.patch} | 10 +--
 ...tch => 0008-Abort-on-failed-module-build.patch} | 10 +--
 ...nd.patch => 0009-Serial-ioctl-workaround.patch} |  6 +-
 ...t-the-shebang-of-Python-scripts-for-cros.patch} |  8 +-
 ...config.sh.in-ensure-sed-invocations-only.patch} |  8 +-
 ...harcode-invalid-path-to-ncursesw-headers.patch} | 10 +--
 ...tem-locale-and-set-to-default-when-addin.patch} | 12 +--
 ...014-Add-importlib-fix-for-PEP-3147-issue.patch} | 27 ++++---
 ...n-to-disable-installation-of-test-module.patch} | 58 ++++++++-------
 ...h => 0016-Add-an-option-to-disable-pydoc.patch} | 57 +++++++-------
 ...=> 0017-Add-an-option-to-disable-lib2to3.patch} | 44 +++++------
 ...Add-option-to-disable-the-sqlite3-module.patch} | 30 ++++----
 ...19-Add-an-option-to-disable-the-tk-module.patch | 73 ++++++++++++++++++
 ...dd-an-option-to-disable-the-curses-module.patch | 62 ++++++++++++++++
 ...h => 0021-Add-an-option-to-disable-expat.patch} | 32 ++++----
 ...21-Add-an-option-to-disable-the-tk-module.patch | 71 ------------------
 ...0022-Add-an-option-to-disable-CJK-codecs.patch} | 10 +--
 ...dd-an-option-to-disable-the-curses-module.patch | 59 ---------------
 ...tch => 0023-Add-an-option-to-disable-NIS.patch} | 10 +--
 ...024-Add-an-option-to-disable-unicodedata.patch} | 10 +--
 ...ch => 0025-Add-an-option-to-disable-IDLE.patch} | 36 ++++-----
 ...=> 0026-Add-an-option-to-disable-decimal.patch} | 14 ++--
 ...option-to-disable-the-ossaudiodev-module.patch} | 10 +--
 ..._FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch} | 30 ++++----
 ...Add-an-option-to-disable-openssl-support.patch} | 11 ++-
 package/python3/python3.hash                       |  4 +-
 package/python3/python3.mk                         |  6 +-
 36 files changed, 433 insertions(+), 543 deletions(-)
 delete mode 100644 package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
 rename package/python3/{0003-Make-the-build-of-pyc-files-conditional.patch => 0002-Make-the-build-of-pyc-files-conditional.patch} (72%)
 rename package/python3/{0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch => 0003-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch} (70%)
 rename package/python3/{0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch => 0004-Add-infrastructure-to-disable-the-build-of-certain-e.patch} (80%)
 rename package/python3/{0007-Adjust-library-header-paths-for-cross-compilation.patch => 0005-Adjust-library-header-paths-for-cross-compilation.patch} (91%)
 rename package/python3/{0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch => 0006-Don-t-look-in-usr-lib-termcap-for-libraries.patch} (83%)
 delete mode 100644 package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
 rename package/python3/{0009-Don-t-add-multiarch-paths.patch => 0007-Don-t-add-multiarch-paths.patch} (85%)
 rename package/python3/{0010-Abort-on-failed-module-build.patch => 0008-Abort-on-failed-module-build.patch} (79%)
 rename package/python3/{0011-Serial-ioctl-workaround.patch => 0009-Serial-ioctl-workaround.patch} (87%)
 rename package/python3/{0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch => 0010-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch} (87%)
 rename package/python3/{0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch => 0011-Misc-python-config.sh.in-ensure-sed-invocations-only.patch} (93%)
 rename package/python3/{0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch => 0012-Do-not-harcode-invalid-path-to-ncursesw-headers.patch} (79%)
 rename package/python3/{0015-Override-system-locale-and-set-to-default-when-addin.patch => 0013-Override-system-locale-and-set-to-default-when-addin.patch} (83%)
 rename package/python3/{0016-Add-importlib-fix-for-PEP-3147-issue.patch => 0014-Add-importlib-fix-for-PEP-3147-issue.patch} (84%)
 rename package/python3/{0017-Add-an-option-to-disable-installation-of-test-module.patch => 0015-Add-an-option-to-disable-installation-of-test-module.patch} (73%)
 rename package/python3/{0018-Add-an-option-to-disable-pydoc.patch => 0016-Add-an-option-to-disable-pydoc.patch} (67%)
 rename package/python3/{0019-Add-an-option-to-disable-lib2to3.patch => 0017-Add-an-option-to-disable-lib2to3.patch} (73%)
 rename package/python3/{0020-Add-option-to-disable-the-sqlite3-module.patch => 0018-Add-option-to-disable-the-sqlite3-module.patch} (60%)
 create mode 100644 package/python3/0019-Add-an-option-to-disable-the-tk-module.patch
 create mode 100644 package/python3/0020-Add-an-option-to-disable-the-curses-module.patch
 rename package/python3/{0023-Add-an-option-to-disable-expat.patch => 0021-Add-an-option-to-disable-expat.patch} (76%)
 delete mode 100644 package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
 rename package/python3/{0024-Add-an-option-to-disable-CJK-codecs.patch => 0022-Add-an-option-to-disable-CJK-codecs.patch} (77%)
 delete mode 100644 package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
 rename package/python3/{0025-Add-an-option-to-disable-NIS.patch => 0023-Add-an-option-to-disable-NIS.patch} (80%)
 rename package/python3/{0026-Add-an-option-to-disable-unicodedata.patch => 0024-Add-an-option-to-disable-unicodedata.patch} (77%)
 rename package/python3/{0027-Add-an-option-to-disable-IDLE.patch => 0025-Add-an-option-to-disable-IDLE.patch} (73%)
 rename package/python3/{0028-Add-an-option-to-disable-decimal.patch => 0026-Add-an-option-to-disable-decimal.patch} (87%)
 rename package/python3/{0029-Add-an-option-to-disable-the-ossaudiodev-module.patch => 0027-Add-an-option-to-disable-the-ossaudiodev-module.patch} (77%)
 rename package/python3/{0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch => 0028-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch} (64%)
 rename package/python3/{0031-Add-an-option-to-disable-openssl.patch => 0029-Add-an-option-to-disable-openssl-support.patch} (66%)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 38bc45f..b07560b 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -48,8 +48,13 @@ HOST_PKG_PYTHON_DISTUTILS_ENV = \
 HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
 	--prefix=$(HOST_DIR)/usr
 
+define PKG_PYTHON_SYSCONFIGDATA_NAME
+$(shell basename $(shell find $(TARGET_DIR)/ -name "_sysconfigdata_m_linux_*.pyc" | head -n 1) .pyc)
+endef
+
 # Target setuptools-based packages
 PKG_PYTHON_SETUPTOOLS_ENV = \
+	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
 	PATH=$(BR_PATH) \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	_python_sysroot=$(STAGING_DIR) \
diff --git a/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch b/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
index defaad9..d2ea7e4 100644
--- a/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
+++ b/package/python3/0001-setup.py-do-not-add-invalid-header-locations.patch
@@ -1,7 +1,7 @@
-From d6093bad6c700312ff7ff4a7bb15c815dda6f46b Mon Sep 17 00:00:00 2001
+From 64c247b35f7b3353ce92e49bac877d05db7e8df5 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:28:34 +0100
-Subject: [PATCH] setup.py: do not add invalid header locations
+Subject: [PATCH 01/29] setup.py: do not add invalid header locations
 
 This piece of code incorrectly adds /usr/include to
 self.compiler.include_dirs, and results in the following invalid
@@ -28,10 +28,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index da67731..dbd2a3c 100644
+index af9a414..a6487de 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -511,7 +511,8 @@ class PyBuildExt(build_ext):
+@@ -533,7 +533,8 @@ class PyBuildExt(build_ext):
                          add_dir_to_list(dir_list, directory)
  
          if os.path.normpath(sys.base_prefix) != '/usr' \
@@ -42,5 +42,5 @@ index da67731..dbd2a3c 100644
              # (PYTHONFRAMEWORK is set) to avoid # linking problems when
              # building a framework with different architectures than
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch b/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
deleted file mode 100644
index 8e930ab..0000000
--- a/package/python3/0002-Change-the-install-location-of-_sysconfigdata.py.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 4ac038d30ec71b3f223ac7c91613856dd82b6347 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:29:04 +0100
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
----
- Makefile.pre.in | 12 ++++++++++--
- configure.ac    |  2 +-
- 2 files changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 823def3..4d2a061 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -585,6 +585,9 @@ pybuilddir.txt: $(BUILDPYTHON)
- 		rm -f ./pybuilddir.txt ; \
- 		exit 1 ; \
- 	fi
-+	echo `cat pybuilddir.txt`/sysconfigdata > pysysconfigdatadir.txt
-+	mkdir -p `cat pysysconfigdatadir.txt`
-+	cp `cat pybuilddir.txt`/_sysconfigdata.py `cat pysysconfigdatadir.txt`
- 
- # Build the shared modules
- # Under GNU make, MAKEFLAGS are sorted and normalized; the 's' for
-@@ -1235,7 +1238,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
- 		else	true; \
- 		fi; \
- 	done
--	@for i in $(srcdir)/Lib/*.py `cat pybuilddir.txt`/_sysconfigdata.py; \
-+	@for i in $(srcdir)/Lib/*.py ; \
- 	do \
- 		if test -x $$i; then \
- 			$(INSTALL_SCRIPT) $$i $(DESTDIR)$(LIBDEST); \
-@@ -1245,6 +1248,11 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
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
-@@ -1580,7 +1588,7 @@ clean: pycremoval
- 	find build -name 'fficonfig.h' -exec rm -f {} ';' || true
- 	find build -name '*.py' -exec rm -f {} ';' || true
- 	find build -name '*.py[co]' -exec rm -f {} ';' || true
--	-rm -f pybuilddir.txt
-+	-rm -f pybuilddir.txt pysysconfigdatadir.txt
- 	-rm -f Lib/lib2to3/*Grammar*.pickle
- 	-rm -f Programs/_testembed Programs/_freeze_importlib
- 	-rm -rf build
-diff --git a/configure.ac b/configure.ac
-index 694293e..76b70a0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -70,7 +70,7 @@ if test "$cross_compiling" = yes; then
- 	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
- 	fi
-         AC_MSG_RESULT($interp)
--	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
-+	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pysysconfigdatadir.txt && echo $(abs_builddir)/`cat pysysconfigdatadir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
-     fi
- elif test "$cross_compiling" = maybe; then
-     AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
--- 
-2.6.4
-
diff --git a/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0002-Make-the-build-of-pyc-files-conditional.patch
similarity index 72%
rename from package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
rename to package/python3/0002-Make-the-build-of-pyc-files-conditional.patch
index 3251da5..8afae08 100644
--- a/package/python3/0003-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0002-Make-the-build-of-pyc-files-conditional.patch
@@ -1,22 +1,24 @@
-From 28f81597314ea3ed03935b519453a55cf6c3c20d Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:29:35 +0100
-Subject: [PATCH] Make the build of pyc files conditional
+From a3aedafc04a81c5a6406c60e82d072377fee0cd1 Mon Sep 17 00:00:00 2001
+From: Andrey Smirnov <andrew.smirnov@gmail.com>
+Date: Wed, 22 Feb 2017 16:21:31 -0800
+Subject: [PATCH 02/29] Make the build of pyc files conditional
 
 This commit adds a new configure option --disable-pyc-build to disable
 the compilation of pyc.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[ Andrey Smrinov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 2 ++
  configure.ac    | 6 ++++++
  2 files changed, 8 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 4d2a061..272f312 100644
+index cd7d33d..2b70ae4 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1283,6 +1283,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+@@ -1308,6 +1308,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -24,7 +26,7 @@ index 4d2a061..272f312 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST) -f \
-@@ -1310,6 +1311,7 @@ libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+@@ -1335,6 +1336,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -33,10 +35,10 @@ index 4d2a061..272f312 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index 76b70a0..66d4642 100644
+index 1d63813..e126a85 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1056,6 +1056,12 @@ fi
+@@ -1132,6 +1132,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
@@ -50,5 +52,5 @@ index 76b70a0..66d4642 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0003-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
similarity index 70%
rename from package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
rename to package/python3/0003-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 183d6b3..26b4aca 100644
--- a/package/python3/0004-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0003-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -1,8 +1,8 @@
-From 093caf46b7a742ee2f7bcf617a915ac1653aa8ac Mon Sep 17 00:00:00 2001
+From 54f63732336384c8f7856e803a43b874ec7740e1 Mon Sep 17 00:00:00 2001
 From: Vanya Sergeev <vsergeev@gmail.com>
 Date: Wed, 23 Dec 2015 11:30:33 +0100
-Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
- with IPv6 support
+Subject: [PATCH 03/29] Disable buggy_getaddrinfo configure test when
+ cross-compiling with IPv6 support
 
 Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
 ---
@@ -10,10 +10,10 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 66d4642..c492594 100644
+index e126a85..f281044 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3662,7 +3662,7 @@ fi
+@@ -3883,7 +3883,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
@@ -23,5 +23,5 @@ index 66d4642..c492594 100644
  	if test $ipv6 = yes
  	then
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0004-Add-infrastructure-to-disable-the-build-of-certain-e.patch
similarity index 80%
rename from package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
rename to package/python3/0004-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 76a553b..7a4b893 100644
--- a/package/python3/0005-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0004-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -1,7 +1,8 @@
-From 3a9f4aa255909ed152883eee787313efd20dbc58 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:31:08 +0100
-Subject: [PATCH] Add infrastructure to disable the build of certain extensions
+From fce5fbe3385791dfb40ed4b0e6542b5f774e6635 Mon Sep 17 00:00:00 2001
+From: Andrey Smirnov <andrew.smirnov@gmail.com>
+Date: Wed, 22 Feb 2017 16:33:22 -0800
+Subject: [PATCH 04/29] Add infrastructure to disable the build of certain
+ extensions
 
 Some of the extensions part of the Python core have dependencies on
 external libraries (sqlite, tk, etc.) or are relatively big and not
@@ -35,17 +36,19 @@ then extended by Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 6 +++++-
  configure.ac    | 2 ++
- setup.py        | 5 ++++-
- 3 files changed, 11 insertions(+), 2 deletions(-)
+ setup.py        | 6 +++++-
+ 3 files changed, 12 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 272f312..9420860 100644
+index 2b70ae4..0708acd 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -182,6 +182,8 @@ FILEMODE=	644
+@@ -188,6 +188,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -54,15 +57,15 @@ index 272f312..9420860 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -600,6 +602,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt
+@@ -606,6 +608,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
  	esac; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
 +		DISABLED_EXTENSIONS="$(DISABLED_EXTENSIONS)" \
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build
  
- # Build static library
-@@ -1425,7 +1428,8 @@ libainstall:	all python-config
+ 
+@@ -1433,7 +1436,8 @@ libainstall:	all python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -73,10 +76,10 @@ index 272f312..9420860 100644
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
 diff --git a/configure.ac b/configure.ac
-index c492594..bfb599e 100644
+index f281044..12a07f9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2588,6 +2588,8 @@ LIBS="$withval $LIBS"
+@@ -2787,6 +2787,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
@@ -86,10 +89,10 @@ index c492594..bfb599e 100644
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
 diff --git a/setup.py b/setup.py
-index dbd2a3c..1ebfa50 100644
+index a6487de..6d0553a 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -44,7 +44,10 @@ host_platform = get_platform()
+@@ -43,7 +43,11 @@ host_platform = get_platform()
  COMPILED_WITH_PYDEBUG = ('--with-pydebug' in sysconfig.get_config_var("CONFIG_ARGS"))
  
  # This global variable is used to hold the list of modules to be disabled.
@@ -98,9 +101,10 @@ index dbd2a3c..1ebfa50 100644
 +    disabled_module_list = sysconfig.get_config_var("DISABLED_EXTENSIONS").split(" ")
 +except KeyError:
 +    disabled_module_list = list()
++
  
  def add_dir_to_list(dirlist, dir):
      """Add the directory 'dir' to the list 'dirlist' (after any relative
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0005-Adjust-library-header-paths-for-cross-compilation.patch
similarity index 91%
rename from package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch
rename to package/python3/0005-Adjust-library-header-paths-for-cross-compilation.patch
index 9ac65ba..f00d143 100644
--- a/package/python3/0007-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0005-Adjust-library-header-paths-for-cross-compilation.patch
@@ -1,7 +1,7 @@
-From e634929f76a45f5b683dc19bc01efed2ab83e19e Mon Sep 17 00:00:00 2001
+From 59ff30ea0616a71780ffb074042e596beb3b002d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:33:14 +0100
-Subject: [PATCH] Adjust library/header paths for cross-compilation
+Subject: [PATCH 05/29] Adjust library/header paths for cross-compilation
 
 When cross-compiling third-party extensions, the get_python_inc() or
 get_python_lib() can be called, to return the path to headers or
@@ -21,10 +21,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  2 files changed, 15 insertions(+), 5 deletions(-)
 
 diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
-index d4cb11e..e7a0ba9 100644
+index 74de782..d0c847b 100644
 --- a/Lib/distutils/command/build_ext.py
 +++ b/Lib/distutils/command/build_ext.py
-@@ -232,7 +232,10 @@ class build_ext(Command):
+@@ -233,7 +233,10 @@ class build_ext(Command):
          if (sysconfig.get_config_var('Py_ENABLE_SHARED')):
              if not sysconfig.python_build:
                  # building third party extensions
@@ -37,7 +37,7 @@ index d4cb11e..e7a0ba9 100644
                  # building python standard extensions
                  self.library_dirs.append('.')
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 721edec..d20e2d8 100644
+index 8bf1a70..5a02145 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
 @@ -17,10 +17,17 @@ import sys
@@ -63,5 +63,5 @@ index 721edec..d20e2d8 100644
  # Path to the base directory of the project. On Windows the binary may
  # live in project/PCBuild/win32 or project/PCBuild/amd64.
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0006-Don-t-look-in-usr-lib-termcap-for-libraries.patch
similarity index 83%
rename from package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
rename to package/python3/0006-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index 47a0b83..07d6066 100644
--- a/package/python3/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0006-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -1,7 +1,7 @@
-From d7c568632f7cb83346096ea114a06f89a0b488d6 Mon Sep 17 00:00:00 2001
+From fa286b3757636c0efbae21c9ef1facb2a3abfd54 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:00 +0100
-Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
+Subject: [PATCH 06/29] Don't look in /usr/lib/termcap for libraries
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 1ebfa50..24a7153 100644
+index 6d0553a..87a308b 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -753,12 +753,9 @@ class PyBuildExt(build_ext):
+@@ -786,12 +786,9 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
@@ -27,5 +27,5 @@ index 1ebfa50..24a7153 100644
                                     libraries=readline_libs) )
          else:
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch b/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
deleted file mode 100644
index b3e41b1..0000000
--- a/package/python3/0006-distutils-sysconfig-use-sysconfigdata.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 7c560d917ee0e536c76fac275d1cb0b6136269ab Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:32:23 +0100
-Subject: [PATCH] distutils/sysconfig: use sysconfigdata
-
-In order to make the use of sysconfig cross-compilation compatible,
-use _sysconfigdata.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Lib/distutils/sysconfig.py | 37 ++++---------------------------------
- 1 file changed, 4 insertions(+), 33 deletions(-)
-
-diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 573724d..721edec 100644
---- a/Lib/distutils/sysconfig.py
-+++ b/Lib/distutils/sysconfig.py
-@@ -414,40 +414,11 @@ def expand_makefile_vars(s, vars):
- _config_vars = None
- 
- def _init_posix():
--    """Initialize the module as appropriate for POSIX systems."""
--    g = {}
--    # load the installed Makefile:
--    try:
--        filename = get_makefile_filename()
--        parse_makefile(filename, g)
--    except OSError as msg:
--        my_msg = "invalid Python installation: unable to open %s" % filename
--        if hasattr(msg, "strerror"):
--            my_msg = my_msg + " (%s)" % msg.strerror
--
--        raise DistutilsPlatformError(my_msg)
--
--    # load the installed pyconfig.h:
--    try:
--        filename = get_config_h_filename()
--        with open(filename) as file:
--            parse_config_h(file, g)
--    except OSError as msg:
--        my_msg = "invalid Python installation: unable to open %s" % filename
--        if hasattr(msg, "strerror"):
--            my_msg = my_msg + " (%s)" % msg.strerror
--
--        raise DistutilsPlatformError(my_msg)
--
--    # On AIX, there are wrong paths to the linker scripts in the Makefile
--    # -- these paths are relative to the Python source, but when installed
--    # the scripts are in another directory.
--    if python_build:
--        g['LDSHARED'] = g['BLDSHARED']
--
-+    # _sysconfigdata is generated at build time, see the sysconfig module
-+    from _sysconfigdata import build_time_vars
-     global _config_vars
--    _config_vars = g
--
-+    _config_vars = {}
-+    _config_vars.update(build_time_vars)
- 
- def _init_nt():
-     """Initialize the module as appropriate for NT"""
--- 
-2.6.4
-
diff --git a/package/python3/0009-Don-t-add-multiarch-paths.patch b/package/python3/0007-Don-t-add-multiarch-paths.patch
similarity index 85%
rename from package/python3/0009-Don-t-add-multiarch-paths.patch
rename to package/python3/0007-Don-t-add-multiarch-paths.patch
index 921e25c..840b131 100644
--- a/package/python3/0009-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0007-Don-t-add-multiarch-paths.patch
@@ -1,7 +1,7 @@
-From bac5ac529cc0902a340a5cd03308433c6e80d1f6 Mon Sep 17 00:00:00 2001
+From 517ded61c2b40da901952e2d5fe24e395a1e6973 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:27 +0100
-Subject: [PATCH] Don't add multiarch paths
+Subject: [PATCH 07/29] Don't add multiarch paths
 
 The add_multiarch_paths() function leads, in certain build
 environments, to the addition of host header paths to the CFLAGS,
@@ -17,10 +17,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 24a7153..8380a64 100644
+index 87a308b..a1af2ea 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -474,10 +474,10 @@ class PyBuildExt(build_ext):
+@@ -497,10 +497,10 @@ class PyBuildExt(build_ext):
          if not cross_compiling:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
@@ -33,5 +33,5 @@ index 24a7153..8380a64 100644
          # Add paths specified in the environment variables LDFLAGS and
          # CPPFLAGS for header and library files.
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0010-Abort-on-failed-module-build.patch b/package/python3/0008-Abort-on-failed-module-build.patch
similarity index 79%
rename from package/python3/0010-Abort-on-failed-module-build.patch
rename to package/python3/0008-Abort-on-failed-module-build.patch
index 131354b..4a45486 100644
--- a/package/python3/0010-Abort-on-failed-module-build.patch
+++ b/package/python3/0008-Abort-on-failed-module-build.patch
@@ -1,7 +1,7 @@
-From 86ef08e36597e14cac06aef176f12375a27fdef5 Mon Sep 17 00:00:00 2001
+From 3b47dfc951a7d48e9b6e34f4cf5210ab4520723e Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:43:24 +0100
-Subject: [PATCH] Abort on failed module build
+Subject: [PATCH 08/29] Abort on failed module build
 
 When building a Python module fails, the setup.py script currently
 doesn't exit with an error, and simply continues. This is not a really
@@ -14,10 +14,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/setup.py b/setup.py
-index 8380a64..15b39f5 100644
+index a1af2ea..daff28c 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -296,6 +296,7 @@ class PyBuildExt(build_ext):
+@@ -312,6 +312,7 @@ class PyBuildExt(build_ext):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
@@ -26,5 +26,5 @@ index 8380a64..15b39f5 100644
          if self.failed_on_import:
              failed = self.failed_on_import[:]
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0011-Serial-ioctl-workaround.patch b/package/python3/0009-Serial-ioctl-workaround.patch
similarity index 87%
rename from package/python3/0011-Serial-ioctl-workaround.patch
rename to package/python3/0009-Serial-ioctl-workaround.patch
index 9e7d79c..e381633 100644
--- a/package/python3/0011-Serial-ioctl-workaround.patch
+++ b/package/python3/0009-Serial-ioctl-workaround.patch
@@ -1,7 +1,7 @@
-From ace3ebd517ea0ac42208b6a06c7e8f82da3b9c1b Mon Sep 17 00:00:00 2001
+From 88213c4a7bd7ecc5fcc91d0ce1350d6c7ec1464c Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Wed, 23 Dec 2015 11:44:02 +0100
-Subject: [PATCH] Serial ioctl() workaround
+Subject: [PATCH 09/29] Serial ioctl() workaround
 
 The ioctls.h of some architectures (notably xtensa) references structs from
 linux/serial.h. Make sure to include this header as well.
@@ -29,5 +29,5 @@ index b78d33e..58b0444 100644
  /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
   * MDTR, MRI, and MRTS (appearantly used internally by some things
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0010-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
similarity index 87%
rename from package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
rename to package/python3/0010-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
index 2e50c1b..03df373 100644
--- a/package/python3/0012-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
+++ b/package/python3/0010-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
@@ -1,7 +1,7 @@
-From 45f482813de828415906e6a416c9c35450c38da7 Mon Sep 17 00:00:00 2001
+From dc1d218f41dc38b92af2c739bb15fdd3b8d0bce1 Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 23 Dec 2015 11:44:30 +0100
-Subject: [PATCH] Do not adjust the shebang of Python scripts for
+Subject: [PATCH 10/29] Do not adjust the shebang of Python scripts for
  cross-compilation
 
 The copy_scripts() method in distutils copies the scripts listed in
@@ -18,7 +18,7 @@ Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Lib/distutils/command/build_scripts.py b/Lib/distutils/command/build_scripts.py
-index 90a8380..bdf4cf1 100644
+index ccc70e6..d6d5419 100644
 --- a/Lib/distutils/command/build_scripts.py
 +++ b/Lib/distutils/command/build_scripts.py
 @@ -91,7 +91,7 @@ class build_scripts(Command):
@@ -31,5 +31,5 @@ index 90a8380..bdf4cf1 100644
                           self.build_dir)
                  updated_files.append(outfile)
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0011-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
similarity index 93%
rename from package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
rename to package/python3/0011-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index 872f040..0735f0b 100644
--- a/package/python3/0013-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ b/package/python3/0011-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -1,8 +1,8 @@
-From 5858abdc25acd522869103d64b60a0c9687e2ec1 Mon Sep 17 00:00:00 2001
+From a18f697a259602907a749ca2488ada6a5c8b5a8d Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Thu, 20 Nov 2014 13:24:59 +0100
-Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only match
- beginning of strings
+Subject: [PATCH 11/29] Misc/python-config.sh.in: ensure sed invocations only
+ match beginning of strings
 
 The build/real prefix handling using sed breaks if build != real and the
 standard include / lib directories are used ($prefix/include and $prefix/lib).
@@ -56,5 +56,5 @@ index 30c6927..f905a71 100644
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
  INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch b/package/python3/0012-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
similarity index 79%
rename from package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
rename to package/python3/0012-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
index f11d946..991d4f3 100644
--- a/package/python3/0014-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
+++ b/package/python3/0012-Do-not-harcode-invalid-path-to-ncursesw-headers.patch
@@ -1,7 +1,7 @@
-From be44636b36086ca1b6de24265b7c3cc0c2bae913 Mon Sep 17 00:00:00 2001
+From 8220b895c662c89a8d336380982b95a477162821 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:45:13 +0100
-Subject: [PATCH] Do not harcode invalid path to ncursesw headers
+Subject: [PATCH 12/29] Do not harcode invalid path to ncursesw headers
 
 Adding /usr/include/ncursesw is obviously invalid when
 cross-compiling. Since the ncursesw headers are no longer installed in
@@ -14,10 +14,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 15b39f5..9e08e7e 100644
+index daff28c..9d790b1 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1296,7 +1296,6 @@ class PyBuildExt(build_ext):
+@@ -1352,7 +1352,6 @@ class PyBuildExt(build_ext):
          panel_library = 'panel'
          if curses_library == 'ncursesw':
              curses_defines.append(('HAVE_NCURSESW', '1'))
@@ -26,5 +26,5 @@ index 15b39f5..9e08e7e 100644
              # _curses_panel.so must link with panelw.
              panel_library = 'panelw'
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0013-Override-system-locale-and-set-to-default-when-addin.patch
similarity index 83%
rename from package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch
rename to package/python3/0013-Override-system-locale-and-set-to-default-when-addin.patch
index 22af71d..3a5a55a 100644
--- a/package/python3/0015-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0013-Override-system-locale-and-set-to-default-when-addin.patch
@@ -1,8 +1,8 @@
-From 46fda6fc83500bf5663397f9d28b618e6b6b20c1 Mon Sep 17 00:00:00 2001
+From 98db7c98c4554e85ecfadf3983c80f6e97ca0b41 Mon Sep 17 00:00:00 2001
 From: Samuel Cabrero <samuelcabrero@gmail.com>
 Date: Wed, 23 Dec 2015 11:45:48 +0100
-Subject: [PATCH] Override system locale and set to default when adding gcc
- paths
+Subject: [PATCH 13/29] Override system locale and set to default when adding
+ gcc paths
 
 Forces the use of the default locale in the function
 add_gcc_paths, which is called when cross compiling to add the
@@ -20,10 +20,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 9e08e7e..3feca04 100644
+index 9d790b1..1caa707 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -441,7 +441,7 @@ class PyBuildExt(build_ext):
+@@ -457,7 +457,7 @@ class PyBuildExt(build_ext):
          tmpfile = os.path.join(self.build_temp, 'gccpaths')
          if not os.path.exists(self.build_temp):
              os.makedirs(self.build_temp)
@@ -33,5 +33,5 @@ index 9e08e7e..3feca04 100644
          in_incdirs = False
          inc_dirs = []
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0014-Add-importlib-fix-for-PEP-3147-issue.patch
similarity index 84%
rename from package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch
rename to package/python3/0014-Add-importlib-fix-for-PEP-3147-issue.patch
index 54a0b87..1dcc34e 100644
--- a/package/python3/0016-Add-importlib-fix-for-PEP-3147-issue.patch
+++ b/package/python3/0014-Add-importlib-fix-for-PEP-3147-issue.patch
@@ -1,7 +1,7 @@
-From d2b5be9a0627e38d2280ef865dab3e74b7d2bde4 Mon Sep 17 00:00:00 2001
-From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
-Date: Wed, 23 Dec 2015 11:46:14 +0100
-Subject: [PATCH] Add importlib fix for PEP 3147 issue
+From 8c13f0ff6980361a0c743d236c1c9361bb102949 Mon Sep 17 00:00:00 2001
+From: Andrey Smirnov <andrew.smirnov@gmail.com>
+Date: Wed, 22 Feb 2017 16:48:49 -0800
+Subject: [PATCH 14/29] Add importlib fix for PEP 3147 issue
 
 Python 3 has a new standard for installing .pyc file, called PEP
 3147. Unfortunately, this standard requires both the .py and .pyc
@@ -18,15 +18,17 @@ This effectively disables PEP 3147 for:
 * Packages built with automake that use the `py-compile` helper
 
 Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
- Lib/importlib/_bootstrap_external.py | 37 +++++-------------------------------
- 1 file changed, 5 insertions(+), 32 deletions(-)
+ Lib/importlib/_bootstrap_external.py | 38 +++++-------------------------------
+ 1 file changed, 5 insertions(+), 33 deletions(-)
 
 diff --git a/Lib/importlib/_bootstrap_external.py b/Lib/importlib/_bootstrap_external.py
-index 616b17f..e30129c 100644
+index ab43446..24c1043 100644
 --- a/Lib/importlib/_bootstrap_external.py
 +++ b/Lib/importlib/_bootstrap_external.py
-@@ -255,8 +255,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -275,8 +275,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
      a True value is the same as setting 'optimization' to the empty string
      while a False value is equivalent to setting 'optimization' to '1'.
  
@@ -35,8 +37,8 @@ index 616b17f..e30129c 100644
      """
      if debug_override is not None:
          _warnings.warn('the debug_override parameter is deprecated; use '
-@@ -267,10 +265,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
-         optimization = '' if debug_override else 1
+@@ -288,10 +286,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+     path = _os.fspath(path)
      head, tail = _path_split(path)
      base, sep, rest = tail.rpartition('.')
 -    tag = sys.implementation.cache_tag
@@ -47,7 +49,7 @@ index 616b17f..e30129c 100644
      if optimization is None:
          if sys.flags.optimize == 0:
              optimization = ''
-@@ -281,39 +276,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -302,40 +297,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
          if not optimization.isalnum():
              raise ValueError('{!r} is not alphanumeric'.format(optimization))
          almost_filename = '{}.{}{}'.format(almost_filename, _OPT, optimization)
@@ -67,6 +69,7 @@ index 616b17f..e30129c 100644
      """
 -    if sys.implementation.cache_tag is None:
 -        raise NotImplementedError('sys.implementation.cache_tag is None')
+-    path = _os.fspath(path)
 -    head, pycache_filename = _path_split(path)
 -    head, pycache = _path_split(head)
 -    if pycache != _PYCACHE:
@@ -92,5 +95,5 @@ index 616b17f..e30129c 100644
  
  
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0015-Add-an-option-to-disable-installation-of-test-module.patch
similarity index 73%
rename from package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch
rename to package/python3/0015-Add-an-option-to-disable-installation-of-test-module.patch
index ee0134a..b46a90e 100644
--- a/package/python3/0017-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python3/0015-Add-an-option-to-disable-installation-of-test-module.patch
@@ -1,30 +1,32 @@
-From 1d2891204c6bf05d5e2eb0e5fa2ee78f6a2b755b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:47:00 +0100
-Subject: [PATCH] Add an option to disable installation of test modules
+From cd1594e21ca73a8cfa35fb91d01cc554474b2155 Mon Sep 17 00:00:00 2001
+From: Andrey Smirnov <andrew.smirnov@gmail.com>
+Date: Wed, 22 Feb 2017 17:01:18 -0800
+Subject: [PATCH 15/29] Add an option to disable installation of test modules
 
 The Python standard distribution comes with many test modules, that
 are not necessarly useful on embedded targets.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
- Makefile.pre.in | 56 ++++++++++++++++++++++++++++++++++++--------------------
- configure.ac    |  6 ++++++
- 2 files changed, 42 insertions(+), 20 deletions(-)
+ Makefile.pre.in | 55 ++++++++++++++++++++++++++++++++++++-------------------
+ configure.ac    |  5 +++++
+ 2 files changed, 41 insertions(+), 19 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 9420860..d4c771a 100644
+index 0708acd..cb48601 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1166,8 +1166,30 @@ maninstall:	altmaninstall
- PLATDIR=	@PLATDIR@
- MACHDEPS=	$(PLATDIR)
+@@ -1191,8 +1191,28 @@ maninstall:	altmaninstall
+ 
+ # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
 -LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
 -		tkinter/test/test_ttk site-packages test \
-+LIBSUBDIRS=	tkinter \
-+		site-packages \
++
++LIBSUBDIRS=	tkinter site-packages \
 +		asyncio \
 +		collections concurrent concurrent/futures encodings \
 +		email email/mime \
@@ -41,21 +43,19 @@ index 9420860..d4c771a 100644
 +		multiprocessing multiprocessing/dummy \
 +		unittest \
 +		venv venv/scripts venv/scripts/posix \
-+		curses pydoc_data $(MACHDEPS)
++		curses pydoc_data
 +
-+TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
-+		test test/test_asyncio \
-+		test/test_email test/test_email/data \
-+		test/test_json \
++TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
++		tkinter/test/test_ttk test \
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1199,28 +1221,22 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
+@@ -1226,29 +1246,26 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
  		test/test_importlib/namespace_pkgs/project3/parent/child \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package \
                  test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
 -		asyncio \
--		test/test_asyncio \
+ 		test/test_asyncio \
 -		collections concurrent concurrent/futures encodings \
 -		email email/mime test/test_email test/test_email/data \
 -		ensurepip ensurepip/_bundled \
@@ -63,6 +63,8 @@ index 9420860..d4c771a 100644
 -		sqlite3 sqlite3/test \
 -		logging csv wsgiref urllib \
 -		lib2to3 lib2to3/fixes lib2to3/pgen2 lib2to3/tests \
++		test/test_email test/test_email/data \
++		test/test_json \
 +		sqlite3/test \
 +		lib2to3/tests \
  		lib2to3/tests/data lib2to3/tests/data/fixers \
@@ -77,37 +79,37 @@ index 9420860..d4c771a 100644
 +		test/test_importlib test/test_importlib/builtin \
  		test/test_importlib/extension test/test_importlib/frozen \
  		test/test_importlib/import_ test/test_importlib/source \
+ 		test/test_tools test/test_warnings test/test_warnings/data \
 -		turtledemo \
 -		multiprocessing multiprocessing/dummy \
 -		unittest unittest/test unittest/test/testmock \
 -		venv venv/scripts venv/scripts/posix \
--		curses pydoc_data $(MACHDEPS)
+-		curses pydoc_data
 +		unittest/test unittest/test/testmock
 +
 +ifeq (@TEST_MODULES@,yes)
 +LIBSUBDIRS += $(TESTSUBDIRS)
 +endif
 +
- libinstall:	build_all $(srcdir)/Lib/$(PLATDIR) $(srcdir)/Modules/xxmodule.c
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  	@for i in $(SCRIPTDIR) $(LIBDEST); \
  	do \
 diff --git a/configure.ac b/configure.ac
-index bfb599e..9f3d226 100644
+index 12a07f9..23b6baf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2895,6 +2895,12 @@ if test "$posix_threads" = "yes"; then
+@@ -3089,6 +3089,11 @@ if test "$posix_threads" = "yes"; then
+       AC_CHECK_FUNCS(pthread_atfork)
  fi
  
- 
 +AC_SUBST(TEST_MODULES)
 +
 +AC_ARG_ENABLE(test-modules,
 +	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
 +	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
-+
+ 
  # Check for enable-ipv6
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
- AC_MSG_CHECKING([if --enable-ipv6 is specified])
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0018-Add-an-option-to-disable-pydoc.patch b/package/python3/0016-Add-an-option-to-disable-pydoc.patch
similarity index 67%
rename from package/python3/0018-Add-an-option-to-disable-pydoc.patch
rename to package/python3/0016-Add-an-option-to-disable-pydoc.patch
index 670ad40..63ee3ec 100644
--- a/package/python3/0018-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0016-Add-an-option-to-disable-pydoc.patch
@@ -1,24 +1,26 @@
-From a83b79b964700604de386800f86e5a55f53a0e17 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:47:11 +0100
-Subject: [PATCH] Add an option to disable pydoc
+From fd12b5924b0b183222b0526d96ee2a9185e62500 Mon Sep 17 00:00:00 2001
+From: Andrey Smirnov <andrew.smirnov@gmail.com>
+Date: Wed, 22 Feb 2017 17:07:56 -0800
+Subject: [PATCH 16/29] Add an option to disable pydoc
 
 It removes 0.5 MB of data from the target plus the pydoc script
 itself.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 8 +++++++-
- configure.ac    | 5 +++++
+ configure.ac    | 6 ++++++
  setup.py        | 9 +++++++--
- 3 files changed, 19 insertions(+), 3 deletions(-)
+ 3 files changed, 20 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index d4c771a..a98ad65 100644
+index cb48601..9ea0509 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1134,7 +1134,9 @@ bininstall: altbininstall
+@@ -1161,7 +1161,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -28,31 +30,31 @@ index d4c771a..a98ad65 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
-@@ -1184,7 +1186,7 @@ LIBSUBDIRS=	tkinter \
+@@ -1209,7 +1211,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/posix \
--		curses pydoc_data $(MACHDEPS)
-+		curses $(MACHDEPS)
+-		curses pydoc_data
++		curses
  
- TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
- 		test test/test_asyncio \
-@@ -1233,6 +1235,10 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
- 		test/test_importlib/import_ test/test_importlib/source \
- 		unittest/test unittest/test/testmock
+ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+ 		tkinter/test/test_ttk test \
+@@ -1266,6 +1268,10 @@ ifeq (@TEST_MODULES@,yes)
+ LIBSUBDIRS += $(TESTSUBDIRS)
+ endif
  
 +ifeq (@PYDOC@,yes)
 +LIBSUBDIRS += pydoc_data
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
+ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+ 	@for i in $(SCRIPTDIR) $(LIBDEST); \
+ 	do \
 diff --git a/configure.ac b/configure.ac
-index 9f3d226..e9b6d6f 100644
+index 23b6baf..9fe989d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2894,6 +2894,11 @@ if test "$posix_threads" = "yes"; then
+@@ -3089,6 +3089,12 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -61,14 +63,15 @@ index 9f3d226..e9b6d6f 100644
 +AC_ARG_ENABLE(pydoc,
 +	AS_HELP_STRING([--disable-pydoc], [disable pydoc]),
 +	[ PYDOC="${enableval}" ], [ PYDOC=yes ])
- 
++
  AC_SUBST(TEST_MODULES)
  
+ AC_ARG_ENABLE(test-modules,
 diff --git a/setup.py b/setup.py
-index 3feca04..137911d 100644
+index 1caa707..5d3e888 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2220,6 +2220,12 @@ def main():
+@@ -2276,6 +2276,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -81,16 +84,16 @@ index 3feca04..137911d 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2244,8 +2250,7 @@ def main():
+@@ -2300,8 +2306,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
 -          scripts = ["Tools/scripts/pydoc3", "Tools/scripts/idle3",
 -                     "Tools/scripts/2to3", "Tools/scripts/pyvenv"]
-+          scripts = scripts,
++          scripts = scripts
          )
  
  # --install-platlib
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0019-Add-an-option-to-disable-lib2to3.patch b/package/python3/0017-Add-an-option-to-disable-lib2to3.patch
similarity index 73%
rename from package/python3/0019-Add-an-option-to-disable-lib2to3.patch
rename to package/python3/0017-Add-an-option-to-disable-lib2to3.patch
index f0d4770..70428e2 100644
--- a/package/python3/0019-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0017-Add-an-option-to-disable-lib2to3.patch
@@ -1,13 +1,15 @@
-From 3c877ea9f09913586f87064b7a2b9d2b49cb05aa Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:48:44 +0100
-Subject: [PATCH] Add an option to disable lib2to3
+From 523075d42f7ce2ab452e37609859c15e0116d1ba Mon Sep 17 00:00:00 2001
+From: Andrey Smirnov <andrew.smirnov@gmail.com>
+Date: Wed, 22 Feb 2017 17:15:31 -0800
+Subject: [PATCH 17/29] Add an option to disable lib2to3
 
 lib2to3 is a library to convert Python 2.x code to Python 3.x. As
 such, it is probably not very useful on embedded system targets.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 16 ++++++++++++----
  configure.ac    |  6 ++++++
@@ -15,10 +17,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  3 files changed, 21 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index a98ad65..3823940 100644
+index 9ea0509..7479779 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1138,7 +1138,9 @@ ifeq (@PYDOC@,yes)
+@@ -1165,7 +1165,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -28,7 +30,7 @@ index a98ad65..3823940 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pyvenv
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pyvenv-$(VERSION) pyvenv)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1177,7 +1179,6 @@ LIBSUBDIRS=	tkinter \
+@@ -1202,7 +1204,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -36,9 +38,9 @@ index a98ad65..3823940 100644
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1224,9 +1225,6 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
-                 test/test_importlib/namespace_pkgs/module_and_namespace_package \
-                 test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
+@@ -1252,9 +1253,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+ 		test/test_email test/test_email/data \
+ 		test/test_json \
  		sqlite3/test \
 -		lib2to3/tests \
 -		lib2to3/tests/data lib2to3/tests/data/fixers \
@@ -46,9 +48,9 @@ index a98ad65..3823940 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1239,6 +1237,14 @@ ifeq (@PYDOC@,yes)
- LIBSUBDIRS += pydoc_data
- endif
+@@ -1264,6 +1262,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+ 		test/test_tools test/test_warnings test/test_warnings/data \
+ 		unittest/test unittest/test/testmock
  
 +ifeq (@LIB2TO3@,yes)
 +LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
@@ -61,7 +63,7 @@ index a98ad65..3823940 100644
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1337,10 +1343,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -1363,10 +1369,12 @@ ifeq (@PYC_BUILD@,yes)
  		-d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -72,13 +74,13 @@ index a98ad65..3823940 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/PatternGrammar.txt
 +endif
  
- # Create the PLATDIR source directory, if one wasn't distributed..
- $(srcdir)/Lib/$(PLATDIR):
+ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+ 	# Substitution happens here, as the completely-expanded BINDIR
 diff --git a/configure.ac b/configure.ac
-index e9b6d6f..652ad88 100644
+index 9fe989d..ee29edf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2906,6 +2906,12 @@ AC_ARG_ENABLE(test-modules,
+@@ -3101,6 +3101,12 @@ AC_ARG_ENABLE(test-modules,
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -92,10 +94,10 @@ index e9b6d6f..652ad88 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 137911d..722308b 100644
+index 5d3e888..6919a0c 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2221,10 +2221,11 @@ def main():
+@@ -2277,10 +2277,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -110,5 +112,5 @@ index 137911d..722308b 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0018-Add-option-to-disable-the-sqlite3-module.patch
similarity index 60%
rename from package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch
rename to package/python3/0018-Add-option-to-disable-the-sqlite3-module.patch
index 2093684..3e550a9 100644
--- a/package/python3/0020-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0018-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,20 +1,22 @@
-From 9ae1dce0a2fa01fc3dbc83d8b8c1b56e4b1b162b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:49:01 +0100
-Subject: [PATCH] Add option to disable the sqlite3 module
+From b4140f677b794004c74b6dbd10480595d0875731 Mon Sep 17 00:00:00 2001
+From: Andrey Smirnov <andrew.smirnov@gmail.com>
+Date: Wed, 22 Feb 2017 17:20:45 -0800
+Subject: [PATCH 18/29] Add option to disable the sqlite3 module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 7 +++++--
  configure.ac    | 9 +++++++++
  2 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 3823940..c822dbd 100644
+index 7479779..cfdf92e 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1177,7 +1177,6 @@ LIBSUBDIRS=	tkinter \
+@@ -1202,7 +1202,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -22,15 +24,15 @@ index 3823940..c822dbd 100644
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1224,7 +1223,6 @@ TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
- 		test/test_importlib/namespace_pkgs/project3/parent/child \
-                 test/test_importlib/namespace_pkgs/module_and_namespace_package \
-                 test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
+@@ -1252,7 +1251,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+ 		test/test_asyncio \
+ 		test/test_email test/test_email/data \
+ 		test/test_json \
 -		sqlite3/test \
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1245,6 +1243,11 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -1270,6 +1268,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -43,10 +45,10 @@ index 3823940..c822dbd 100644
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
 diff --git a/configure.ac b/configure.ac
-index 652ad88..cae12ad 100644
+index ee29edf..07734b7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2894,6 +2894,15 @@ if test "$posix_threads" = "yes"; then
+@@ -3089,6 +3089,15 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -63,5 +65,5 @@ index 652ad88..cae12ad 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0019-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0019-Add-an-option-to-disable-the-tk-module.patch
new file mode 100644
index 0000000..4f5964c
--- /dev/null
+++ b/package/python3/0019-Add-an-option-to-disable-the-tk-module.patch
@@ -0,0 +1,73 @@
+From ea5734e41ee011e4119b8a4bebc828df7eec308e Mon Sep 17 00:00:00 2001
+From: Andrey Smirnov <andrew.smirnov@gmail.com>
+Date: Wed, 22 Feb 2017 17:23:42 -0800
+Subject: [PATCH 19/29] Add an option to disable the tk module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+---
+ Makefile.pre.in | 11 ++++++++---
+ configure.ac    |  9 +++++++++
+ 2 files changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index cfdf92e..c95686c 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1196,7 +1196,7 @@ maninstall:	altmaninstall
+ # Install the library
+ XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
+ 
+-LIBSUBDIRS=	tkinter site-packages \
++LIBSUBDIRS=	site-packages \
+ 		asyncio \
+ 		collections concurrent concurrent/futures encodings \
+ 		email email/mime \
+@@ -1213,8 +1213,7 @@ LIBSUBDIRS=	tkinter site-packages \
+ 		venv venv/scripts venv/scripts/posix \
+ 		curses
+ 
+-TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+-		tkinter/test/test_ttk test \
++TESTSUBDIRS=	test \
+ 		test/audiodata \
+ 		test/capath test/data \
+ 		test/cjkencodings test/decimaltestdata test/xmltestdata \
+@@ -1260,6 +1259,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+ 		test/test_tools test/test_warnings test/test_warnings/data \
+ 		unittest/test unittest/test/testmock
+ 
++ifeq (@TK@,yes)
++LIBSUBDIRS += tkinter
++TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
++	tkinter/test/test_ttk
++endif
++
+ ifeq (@LIB2TO3@,yes)
+ LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
+ TESTSUBDIRS += lib2to3/tests			\
+diff --git a/configure.ac b/configure.ac
+index 07734b7..a26347a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3098,6 +3098,15 @@ if test "$SQLITE3" = "no" ; then
+    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
+ fi
+ 
++AC_SUBST(TK)
++AC_ARG_ENABLE(tk,
++	AS_HELP_STRING([--disable-tk], [disable tk]),
++	[ TK="${enableval}" ], [ TK=yes ])
++
++if test "$TK" = "no"; then
++   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
++fi
++
+ AC_SUBST(PYDOC)
+ 
+ AC_ARG_ENABLE(pydoc,
+-- 
+2.9.3
+
diff --git a/package/python3/0020-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0020-Add-an-option-to-disable-the-curses-module.patch
new file mode 100644
index 0000000..17ea596
--- /dev/null
+++ b/package/python3/0020-Add-an-option-to-disable-the-curses-module.patch
@@ -0,0 +1,62 @@
+From b83d087d15b4abaed1243bbabc0aba2b75d46a7d Mon Sep 17 00:00:00 2001
+From: Andrey Smirnov <andrew.smirnov@gmail.com>
+Date: Wed, 22 Feb 2017 17:31:51 -0800
+Subject: [PATCH 20/29] Add an option to disable the curses module
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
+---
+ Makefile.pre.in | 7 +++++--
+ configure.ac    | 9 +++++++++
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index c95686c..e1e3fde 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1210,8 +1210,7 @@ LIBSUBDIRS=	site-packages \
+ 		turtledemo \
+ 		multiprocessing multiprocessing/dummy \
+ 		unittest \
+-		venv venv/scripts venv/scripts/posix \
+-		curses
++		venv venv/scripts venv/scripts/posix
+ 
+ TESTSUBDIRS=	test \
+ 		test/audiodata \
+@@ -1265,6 +1264,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+ 	tkinter/test/test_ttk
+ endif
+ 
++ifeq (@CURSES@,yes)
++LIBSUBDIRS += curses
++endif
++
+ ifeq (@LIB2TO3@,yes)
+ LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
+ TESTSUBDIRS += lib2to3/tests			\
+diff --git a/configure.ac b/configure.ac
+index a26347a..224d40f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3107,6 +3107,15 @@ if test "$TK" = "no"; then
+    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
+ fi
+ 
++AC_SUBST(CURSES)
++AC_ARG_ENABLE(curses,
++	AS_HELP_STRING([--disable-curses], [disable curses]),
++	[ CURSES="${enableval}" ], [ CURSES=yes ])
++
++if test "$CURSES" = "no"; then
++   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
++fi
++
+ AC_SUBST(PYDOC)
+ 
+ AC_ARG_ENABLE(pydoc,
+-- 
+2.9.3
+
diff --git a/package/python3/0023-Add-an-option-to-disable-expat.patch b/package/python3/0021-Add-an-option-to-disable-expat.patch
similarity index 76%
rename from package/python3/0023-Add-an-option-to-disable-expat.patch
rename to package/python3/0021-Add-an-option-to-disable-expat.patch
index 73f9b36..8c54d19 100644
--- a/package/python3/0023-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0021-Add-an-option-to-disable-expat.patch
@@ -1,7 +1,7 @@
-From 6281850ee8c3fb6d93b4997833af0cca4a48947b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:49:42 +0100
-Subject: [PATCH] Add an option to disable expat
+From 229b761325db93e73a1031a757faef56492150e1 Mon Sep 17 00:00:00 2001
+From: Andrey Smirnov <andrew.smirnov@gmail.com>
+Date: Wed, 22 Feb 2017 17:40:45 -0800
+Subject: [PATCH 21/29] Add an option to disable expat
 
 This patch replaces the existing --with-system-expat option with a
 --with-expat={system,builtin,none} option, which allows to tell Python
@@ -11,6 +11,8 @@ installation of XML modules).
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in |  6 +++++-
  configure.ac    | 18 +++++++++++++-----
@@ -18,10 +20,10 @@ Signed-off-by: Samuel Martin <s.martin49@gmail.com>
  3 files changed, 19 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index b97c21e..bdfee19 100644
+index e1e3fde..8abaf46 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1180,7 +1180,7 @@ LIBSUBDIRS=	\
+@@ -1205,7 +1205,7 @@ LIBSUBDIRS=	site-packages \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -30,7 +32,7 @@ index b97c21e..bdfee19 100644
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1257,6 +1257,10 @@ ifeq (@CURSES@,yes)
+@@ -1268,6 +1268,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -38,14 +40,14 @@ index b97c21e..bdfee19 100644
 +LIBSUBDIRS += $(XMLLIBSUBDIRS)
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
+ ifeq (@LIB2TO3@,yes)
+ LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
+ TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index 0be47b2..e6bcacc 100644
+index 224d40f..f1f6917 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2591,13 +2591,21 @@ PKG_PROG_PKG_CONFIG
+@@ -2790,13 +2790,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -73,10 +75,10 @@ index 0be47b2..e6bcacc 100644
  # Check for use of the system libffi library
  AC_MSG_CHECKING(for --with-system-ffi)
 diff --git a/setup.py b/setup.py
-index 722308b..ecddb6a 100644
+index 6919a0c..dc25fda 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1434,7 +1434,7 @@ class PyBuildExt(build_ext):
+@@ -1490,7 +1490,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
@@ -86,5 +88,5 @@ index 722308b..ecddb6a 100644
              define_macros = []
              expat_lib = ['expat']
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
deleted file mode 100644
index 7dfb339..0000000
--- a/package/python3/0021-Add-an-option-to-disable-the-tk-module.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From d0d42570e5a23c3bf559e0413ec97729fd2f9e24 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:49:14 +0100
-Subject: [PATCH] Add an option to disable the tk module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- Makefile.pre.in | 11 ++++++++---
- configure.ac    |  9 +++++++++
- 2 files changed, 17 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index c822dbd..0a93c27 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1170,7 +1170,7 @@ maninstall:	altmaninstall
- PLATDIR=	@PLATDIR@
- MACHDEPS=	$(PLATDIR)
- XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
--LIBSUBDIRS=	tkinter \
-+LIBSUBDIRS=	\
- 		site-packages \
- 		asyncio \
- 		collections concurrent concurrent/futures encodings \
-@@ -1188,8 +1188,7 @@ LIBSUBDIRS=	tkinter \
- 		venv venv/scripts venv/scripts/posix \
- 		curses $(MACHDEPS)
- 
--TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
--		test test/test_asyncio \
-+TESTSUBDIRS = 	test test/test_asyncio \
- 		test/test_email test/test_email/data \
- 		test/test_json \
- 		test/audiodata \
-@@ -1248,6 +1247,12 @@ LIBSUBDIRS += sqlite3
- TESTSUBDIRS += sqlite3/test
- endif
- 
-+ifeq (@TK@,yes)
-+LIBSUBDIRS += tkinter
-+TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
-+	tkinter/test/test_ttk
-+endif
-+
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
-diff --git a/configure.ac b/configure.ac
-index cae12ad..787b185 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2903,6 +2903,15 @@ if test "$SQLITE3" = "no" ; then
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
-2.6.4
-
diff --git a/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0022-Add-an-option-to-disable-CJK-codecs.patch
similarity index 77%
rename from package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch
rename to package/python3/0022-Add-an-option-to-disable-CJK-codecs.patch
index d3af94f..b5132ca 100644
--- a/package/python3/0024-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0022-Add-an-option-to-disable-CJK-codecs.patch
@@ -1,7 +1,7 @@
-From 18265d05ee97ad0c43995acdadce2458b57d7d64 Mon Sep 17 00:00:00 2001
+From ccb39c10078432a2768157451a4bec10e8218200 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:55 +0100
-Subject: [PATCH] Add an option to disable CJK codecs
+Subject: [PATCH 22/29] Add an option to disable CJK codecs
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index e6bcacc..38b7515 100644
+index f1f6917..30579ad 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2911,6 +2911,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -3106,6 +3106,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -26,5 +26,5 @@ index e6bcacc..38b7515 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
deleted file mode 100644
index 22f7a24..0000000
--- a/package/python3/0022-Add-an-option-to-disable-the-curses-module.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From d04ec780bf7c0825ab260bd1d6b7292141b2dcde Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:49:30 +0100
-Subject: [PATCH] Add an option to disable the curses module
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Samuel Martin <s.martin49@gmail.com>
----
- Makefile.pre.in | 6 +++++-
- configure.ac    | 9 +++++++++
- 2 files changed, 14 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 0a93c27..b97c21e 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1186,7 +1186,7 @@ LIBSUBDIRS=	\
- 		multiprocessing multiprocessing/dummy \
- 		unittest \
- 		venv venv/scripts venv/scripts/posix \
--		curses $(MACHDEPS)
-+		$(MACHDEPS)
- 
- TESTSUBDIRS = 	test test/test_asyncio \
- 		test/test_email test/test_email/data \
-@@ -1253,6 +1253,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
- 	tkinter/test/test_ttk
- endif
- 
-+ifeq (@CURSES@,yes)
-+LIBSUBDIRS += curses
-+endif
-+
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
-diff --git a/configure.ac b/configure.ac
-index 787b185..0be47b2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2912,6 +2912,15 @@ if test "$TK" = "no"; then
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
-2.6.4
-
diff --git a/package/python3/0025-Add-an-option-to-disable-NIS.patch b/package/python3/0023-Add-an-option-to-disable-NIS.patch
similarity index 80%
rename from package/python3/0025-Add-an-option-to-disable-NIS.patch
rename to package/python3/0023-Add-an-option-to-disable-NIS.patch
index ef9ff42..f35c031 100644
--- a/package/python3/0025-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0023-Add-an-option-to-disable-NIS.patch
@@ -1,7 +1,7 @@
-From 733ee65f308ec48be427463c06f372ca116ccada Mon Sep 17 00:00:00 2001
+From 83bb3d329d1aa0944d59553eafcb1d1f08661ae4 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:11 +0100
-Subject: [PATCH] Add an option to disable NIS
+Subject: [PATCH 23/29] Add an option to disable NIS
 
 NIS is not necessarily available in uClibc, so we need an option to
 not compile support for it.
@@ -12,10 +12,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 38b7515..f25733a 100644
+index 30579ad..73c584e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2917,6 +2917,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -3112,6 +3112,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
@@ -29,5 +29,5 @@ index 38b7515..f25733a 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0026-Add-an-option-to-disable-unicodedata.patch b/package/python3/0024-Add-an-option-to-disable-unicodedata.patch
similarity index 77%
rename from package/python3/0026-Add-an-option-to-disable-unicodedata.patch
rename to package/python3/0024-Add-an-option-to-disable-unicodedata.patch
index 56a5178..2682667 100644
--- a/package/python3/0026-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0024-Add-an-option-to-disable-unicodedata.patch
@@ -1,7 +1,7 @@
-From 64fa1fc3a9aea7ffba7b96d08a14df91051f2b6f Mon Sep 17 00:00:00 2001
+From 176198c7d0c9204ab4262774dcb215012f5cf262 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:27 +0100
-Subject: [PATCH] Add an option to disable unicodedata
+Subject: [PATCH 24/29] Add an option to disable unicodedata
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index f25733a..a7ddb2b 100644
+index 73c584e..a04d7c4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2923,6 +2923,12 @@ AC_ARG_ENABLE(nis,
+@@ -3118,6 +3118,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
@@ -26,5 +26,5 @@ index f25733a..a7ddb2b 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0027-Add-an-option-to-disable-IDLE.patch b/package/python3/0025-Add-an-option-to-disable-IDLE.patch
similarity index 73%
rename from package/python3/0027-Add-an-option-to-disable-IDLE.patch
rename to package/python3/0025-Add-an-option-to-disable-IDLE.patch
index 73fc395..22670bb 100644
--- a/package/python3/0027-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0025-Add-an-option-to-disable-IDLE.patch
@@ -1,12 +1,14 @@
-From 2766bcdd8f9b7395ce32a6d8480ef0a2186f2098 Mon Sep 17 00:00:00 2001
-From: Maxime Ripard <maxime.ripard@free-electrons.com>
-Date: Wed, 23 Dec 2015 11:50:42 +0100
-Subject: [PATCH] Add an option to disable IDLE
+From 26918d7274b7dad1cc90938be9e5ffd7f9cbe3ad Mon Sep 17 00:00:00 2001
+From: Andrey Smirnov <andrew.smirnov@gmail.com>
+Date: Wed, 22 Feb 2017 17:45:14 -0800
+Subject: [PATCH 25/29] Add an option to disable IDLE
 
 IDLE is an IDE embedded into python, written using Tk, so it doesn't make
 much sense to have it into our build.
 
 Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 7 ++++++-
  configure.ac    | 6 ++++++
@@ -14,10 +16,10 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
  3 files changed, 15 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index bdfee19..2466615 100644
+index 8abaf46..2e2bd1a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1132,7 +1132,9 @@ bininstall: altbininstall
+@@ -1159,7 +1159,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python3.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -27,7 +29,7 @@ index bdfee19..2466615 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1179,7 +1181,6 @@ LIBSUBDIRS=	\
+@@ -1204,7 +1206,6 @@ LIBSUBDIRS=	site-packages \
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -35,7 +37,7 @@ index bdfee19..2466615 100644
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1261,6 +1262,10 @@ ifeq (@EXPAT@,yes)
+@@ -1272,6 +1273,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -43,14 +45,14 @@ index bdfee19..2466615 100644
 +LIBSUBDIRS += idlelib idlelib/Icons
 +endif
 +
- ifeq (@TEST_MODULES@,yes)
- LIBSUBDIRS += $(TESTSUBDIRS)
- endif
+ ifeq (@LIB2TO3@,yes)
+ LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
+ TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index a7ddb2b..6b59792 100644
+index a04d7c4..f087c11 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2965,6 +2965,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -3160,6 +3160,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -64,15 +66,15 @@ index a7ddb2b..6b59792 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index ecddb6a..7fe68e8 100644
+index dc25fda..079340b 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2221,11 +2221,13 @@ def main():
+@@ -2277,11 +2277,13 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
 -    scripts = ['Tools/scripts/idle3', 'Lib/smtpd.py']
-+    scripts = ['Lib/smtpd.py']
++    scripts = [ 'Lib/smtpd.py']
      if not '--disable-pydoc' in sysconfig.get_config_var("CONFIG_ARGS"):
          scripts += [ 'Tools/scripts/pydoc3' ]
      if not '--disable-lib2to3' in sysconfig.get_config_var("CONFIG_ARGS"):
@@ -83,5 +85,5 @@ index ecddb6a..7fe68e8 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0028-Add-an-option-to-disable-decimal.patch b/package/python3/0026-Add-an-option-to-disable-decimal.patch
similarity index 87%
rename from package/python3/0028-Add-an-option-to-disable-decimal.patch
rename to package/python3/0026-Add-an-option-to-disable-decimal.patch
index 1ac91dd..32d5e2a 100644
--- a/package/python3/0028-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0026-Add-an-option-to-disable-decimal.patch
@@ -1,7 +1,7 @@
-From ff77defc777a57d4caee5183796fd44dd265e78b Mon Sep 17 00:00:00 2001
+From a8b505fd880d9a35b07b8e77d9010f8420f88dff Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:31 +0100
-Subject: [PATCH] Add an option to disable decimal
+Subject: [PATCH 26/29] Add an option to disable decimal
 
 This patch replaces the existing --with-system-libmpdec option with a
 --with-libmpdec={system,builtin,none} option, which allows to tell
@@ -15,10 +15,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  2 files changed, 13 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6b59792..51e1760 100644
+index f087c11..a6efc6d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2624,13 +2624,20 @@ AC_SUBST(LIBFFI_INCLUDEDIR)
+@@ -2839,13 +2839,20 @@ AC_SUBST(LIBFFI_INCLUDEDIR)
  AC_MSG_RESULT($with_system_ffi)
  
  # Check for use of the system libmpdec library
@@ -45,10 +45,10 @@ index 6b59792..51e1760 100644
  # Check for support for loadable sqlite extensions
  AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
 diff --git a/setup.py b/setup.py
-index 7fe68e8..364b350 100644
+index 079340b..4f8d61b 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1988,7 +1988,7 @@ class PyBuildExt(build_ext):
+@@ -2053,7 +2053,7 @@ class PyBuildExt(build_ext):
      def _decimal_ext(self):
          extra_compile_args = []
          undef_macros = []
@@ -58,5 +58,5 @@ index 7fe68e8..364b350 100644
              libraries = [':libmpdec.so.2']
              sources = ['_decimal/_decimal.c']
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0027-Add-an-option-to-disable-the-ossaudiodev-module.patch
similarity index 77%
rename from package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch
rename to package/python3/0027-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 9ac9173..85ef566 100644
--- a/package/python3/0029-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0027-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -1,7 +1,7 @@
-From 789b0f99d7c1d25bfa9c05fd12f4d55bb70f377b Mon Sep 17 00:00:00 2001
+From a43d9cce74a6634d7cbd9d3fb05d27d44122df18 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:58 +0100
-Subject: [PATCH] Add an option to disable the ossaudiodev module
+Subject: [PATCH 27/29] Add an option to disable the ossaudiodev module
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 51e1760..c4c2353 100644
+index a6efc6d..0cdd068 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2639,6 +2639,12 @@ else
+@@ -2854,6 +2854,12 @@ else
  fi
  AC_SUBST(MPDEC)
  
@@ -26,5 +26,5 @@ index 51e1760..c4c2353 100644
  AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
  AC_ARG_ENABLE(loadable-sqlite-extensions,
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch b/package/python3/0028-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
similarity index 64%
rename from package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
rename to package/python3/0028-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
index 156eb29..9fb51dc 100644
--- a/package/python3/0030-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
+++ b/package/python3/0028-Support-PGEN_FOR_BUILD-and-FREEZE_IMPORTLIB_FOR_BUIL.patch
@@ -1,19 +1,21 @@
-From 4f851142b8f3149d23654117621285df34ec768b Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Wed, 23 Dec 2015 13:58:00 +0100
-Subject: [PATCH] Support PGEN_FOR_BUILD and FREEZE_IMPORTLIB_FOR_BUILD
+From cd67487cb11a1191be38c6279b4290d6ab8d5e6a Mon Sep 17 00:00:00 2001
+From: Andrey Smirnov <andrew.smirnov@gmail.com>
+Date: Wed, 22 Feb 2017 17:53:40 -0800
+Subject: [PATCH 28/29] Support PGEN_FOR_BUILD and FREEZE_IMPORTLIB_FOR_BUILD
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+[ Andrey Smirnov: ported to Python 3.6 ]
+Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
 ---
  Makefile.pre.in | 10 ++++++++++
  configure.ac    |  3 +++
  2 files changed, 13 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 2466615..fdf622d 100644
+index 2e2bd1a..ccd3f04 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -712,10 +712,15 @@ Programs/_testembed: Programs/_testembed.o $(LIBRARY) $(LDLIBRARY) $(PY3LIBRARY)
+@@ -719,10 +719,15 @@ Programs/_testembed: Programs/_testembed.o $(LIBRARY) $(LDLIBRARY) $(PY3LIBRARY)
  ############################################################################
  # Importlib
  
@@ -27,11 +29,11 @@ index 2466615..fdf622d 100644
 +	cp $^ $@
 +endif
  
- Python/importlib_external.h: $(srcdir)/Lib/importlib/_bootstrap_external.py Programs/_freeze_importlib
+ Python/importlib_external.h: @GENERATED_COMMENT@ $(srcdir)/Lib/importlib/_bootstrap_external.py Programs/_freeze_importlib Python/marshal.c
  	./Programs/_freeze_importlib \
-@@ -789,8 +794,13 @@ $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGEN)
- $(GRAMMAR_C): $(GRAMMAR_H)
- 		touch $(GRAMMAR_C)
+@@ -796,8 +801,13 @@ $(GRAMMAR_H): @GENERATED_COMMENT@ $(GRAMMAR_INPUT) $(PGEN)
+ $(GRAMMAR_C): @GENERATED_COMMENT@ $(GRAMMAR_H)
+ 	touch $(GRAMMAR_C)
  
 +ifeq (@PGEN_FOR_BUILD@,)
  $(PGEN): $(PGENOBJS)
@@ -44,12 +46,12 @@ index 2466615..fdf622d 100644
  Parser/grammar.o:	$(srcdir)/Parser/grammar.c \
  				$(srcdir)/Include/token.h \
 diff --git a/configure.ac b/configure.ac
-index c4c2353..750c232 100644
+index 0cdd068..c2c5525 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -79,6 +79,9 @@ else
- fi
+@@ -91,6 +91,9 @@ fi
  AC_SUBST(PYTHON_FOR_BUILD)
+ AC_SUBST(GENERATED_COMMENT)
  
 +AC_SUBST(PGEN_FOR_BUILD)
 +AC_SUBST(FREEZE_IMPORTLIB_FOR_BUILD)
@@ -58,5 +60,5 @@ index c4c2353..750c232 100644
  dnl it does, we get path names containing '//' which is both ugly and
  dnl can cause trouble.
 -- 
-2.6.4
+2.9.3
 
diff --git a/package/python3/0031-Add-an-option-to-disable-openssl.patch b/package/python3/0029-Add-an-option-to-disable-openssl-support.patch
similarity index 66%
rename from package/python3/0031-Add-an-option-to-disable-openssl.patch
rename to package/python3/0029-Add-an-option-to-disable-openssl-support.patch
index d437520..762ee4a 100644
--- a/package/python3/0031-Add-an-option-to-disable-openssl.patch
+++ b/package/python3/0029-Add-an-option-to-disable-openssl-support.patch
@@ -1,14 +1,18 @@
+From 5a9c2f2d539b4ecbcd24f1d874a275a64cfb4bec Mon Sep 17 00:00:00 2001
 From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
-Subject: [PATCH] Add an option to disable openssl support.
+Date: Wed, 22 Feb 2017 17:55:59 -0800
+Subject: [PATCH 29/29] Add an option to disable openssl support.
 
 Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 ---
  configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
+diff --git a/configure.ac b/configure.ac
+index c2c5525..177a054 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3027,6 +3027,12 @@
+@@ -3140,6 +3140,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
@@ -21,3 +25,6 @@ Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
  AC_SUBST(TK)
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
+-- 
+2.9.3
+
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index f6f70a2..2a8ef4d 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
 # From https://www.python.org/downloads/release/python-352/
-md5 8906efbacfcdc7c3c9198aeefafd159e Python-3.5.2.tar.xz
+md5 82b143ebbf4514d7e05876bed7a6b1f5 Python-3.6.0.tar.xz
 # Locally computed
-sha256 0010f56100b9b74259ebcd5d4b295a32324b58b517403a10d1a2aa7cb22bca40 Python-3.5.2.tar.xz
+b0c5f904f685e32d9232f7bdcbece9819a892929063b6e385414ad2dd6a23622 Python-3.6.0.tar.xz
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8bfae79..9f0bf4e 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON3_VERSION_MAJOR = 3.5
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
+PYTHON3_VERSION_MAJOR = 3.6
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python software foundation license v2, others
@@ -222,7 +222,7 @@ HOST_PYTHON3_POST_INSTALL_HOOKS += HOST_PYTHON3_INSTALL_SYMLINK
 endif
 
 # Provided to other packages
-PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sysconfigdata/:$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/
+PYTHON3_PATH = $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/:$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.9.3
