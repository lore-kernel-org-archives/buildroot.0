From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Jul 2021 16:17:01 +0200
Subject: [Buildroot] [git commit] package/python3: bump version to 3.9.6
Message-ID: <20210704134422.3D4248FF58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f01b69885c43a0e48f3a6604793e4cd4a8da2e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Rename 0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch to
    0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch, as to not
    overlap with 0034-Add-an-option-to-disable-the-berkeleydb-module.patch

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Make-the-build-of-pyc-files-conditional.patch     |  6 +++---
 ...able-buggy_getaddrinfo-configure-test-when-cross-.patch |  2 +-
 ...-infrastructure-to-disable-the-build-of-certain-e.patch | 10 +++++-----
 .../0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch |  2 +-
 package/python3/0006-Don-t-add-multiarch-paths.patch       |  2 +-
 package/python3/0007-Abort-on-failed-module-build.patch    |  2 +-
 ...rride-system-locale-and-set-to-default-when-addin.patch |  2 +-
 .../0012-Add-importlib-fix-for-PEP-3147-issue.patch        |  6 +++---
 ...-an-option-to-disable-installation-of-test-module.patch |  6 +++---
 package/python3/0014-Add-an-option-to-disable-pydoc.patch  | 12 ++++++------
 .../python3/0015-Add-an-option-to-disable-lib2to3.patch    | 14 +++++++-------
 .../0016-Add-option-to-disable-the-sqlite3-module.patch    |  8 ++++----
 .../0017-Add-an-option-to-disable-the-tk-module.patch      |  8 ++++----
 .../0018-Add-an-option-to-disable-the-curses-module.patch  |  6 +++---
 package/python3/0019-Add-an-option-to-disable-expat.patch  |  8 ++++----
 .../python3/0020-Add-an-option-to-disable-CJK-codecs.patch |  2 +-
 package/python3/0021-Add-an-option-to-disable-NIS.patch    |  2 +-
 .../0022-Add-an-option-to-disable-unicodedata.patch        |  2 +-
 package/python3/0023-Add-an-option-to-disable-IDLE.patch   | 10 +++++-----
 .../python3/0024-Add-an-option-to-disable-decimal.patch    |  4 ++--
 ...5-Add-an-option-to-disable-the-ossaudiodev-module.patch |  2 +-
 .../0026-Add-an-option-to-disable-openssl-support.patch    |  2 +-
 ...0027-Add-an-option-to-disable-the-readline-module.patch |  2 +-
 ...-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch |  2 +-
 .../python3/0030-Fix-cross-compiling-the-uuid-module.patch |  2 +-
 .../0031-Add-an-option-to-disable-uuid-module.patch        |  2 +-
 ...figure.ac-fixup-CC-print-multiarch-output-for-mus.patch |  2 +-
 ...34-Add-an-option-to-disable-the-berkeleydb-module.patch |  2 +-
 ...crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch} |  0
 package/python3/python3.hash                               |  6 +++---
 package/python3/python3.mk                                 |  2 +-
 31 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 5eb296c6d8..44902725d7 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 77f91e72b1..0c809f3d8a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1528,6 +1528,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1550,6 +1550,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -26,7 +26,7 @@ index 77f91e72b1..0c809f3d8a 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST) -f \
-@@ -1555,6 +1556,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1577,6 +1578,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -38,7 +38,7 @@ diff --git a/configure.ac b/configure.ac
 index d60f05251a..1ee5a09588 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1112,6 +1112,12 @@ fi
+@@ -1121,6 +1121,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index c291d14460..00177814cc 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -13,7 +13,7 @@ diff --git a/configure.ac b/configure.ac
 index 1ee5a09588..c2445edc88 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4175,7 +4175,7 @@ fi
+@@ -4210,7 +4210,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index b0dcce7d77..7cccc588e9 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -47,7 +47,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 0c809f3d8a..7c3dde8dd4 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -213,6 +213,8 @@ FILEMODE=	644
+@@ -216,6 +216,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -56,7 +56,7 @@ index 0c809f3d8a..7c3dde8dd4 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -629,6 +631,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
+@@ -632,6 +634,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
  	esac; \
  	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -64,7 +64,7 @@ index 0c809f3d8a..7c3dde8dd4 100644
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
-@@ -1674,7 +1677,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
+@@ -1696,7 +1699,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -78,7 +78,7 @@ diff --git a/configure.ac b/configure.ac
 index c2445edc88..73d66167de 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3052,6 +3052,8 @@ LIBS="$withval $LIBS"
+@@ -3081,6 +3081,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
@@ -91,7 +91,7 @@ diff --git a/setup.py b/setup.py
 index 770866bca7..b6c829b3a5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -43,7 +43,10 @@ from distutils.spawn import find_executable
+@@ -44,7 +44,10 @@ from distutils.spawn import find_executable
  TEST_EXTENSIONS = True
  
  # This global variable is used to hold the list of modules to be disabled.
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index 83c88ff399..c5abcfd786 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -12,7 +12,7 @@ diff --git a/setup.py b/setup.py
 index b6c829b3a5..ec3ba60607 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1056,12 +1056,9 @@ class PyBuildExt(build_ext):
+@@ -1041,12 +1041,9 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
index f55238d0c4..bb861612b1 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -20,7 +20,7 @@ diff --git a/setup.py b/setup.py
 index ec3ba60607..e27620035c 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -749,10 +749,10 @@ class PyBuildExt(build_ext):
+@@ -734,10 +734,10 @@ class PyBuildExt(build_ext):
          if not CROSS_COMPILING:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
index 0e96e7522a..856fcaac21 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -17,7 +17,7 @@ diff --git a/setup.py b/setup.py
 index e27620035c..d3f0e663f2 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -539,6 +539,7 @@ class PyBuildExt(build_ext):
+@@ -524,6 +524,7 @@ class PyBuildExt(build_ext):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
diff --git a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
index 57f1bb5a2f..8b0d4f4c4d 100644
--- a/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
+++ b/package/python3/0011-Override-system-locale-and-set-to-default-when-addin.patch
@@ -25,7 +25,7 @@ diff --git a/setup.py b/setup.py
 index d3f0e663f2..926c16f58f 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -695,7 +695,7 @@ class PyBuildExt(build_ext):
+@@ -680,7 +680,7 @@ class PyBuildExt(build_ext):
          tmpfile = os.path.join(self.build_temp, 'ccpaths')
          if not os.path.exists(self.build_temp):
              os.makedirs(self.build_temp)
diff --git a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
index 42dfa0d693..7a885303cb 100644
--- a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
+++ b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
@@ -28,7 +28,7 @@ diff --git a/Lib/importlib/_bootstrap_external.py b/Lib/importlib/_bootstrap_ext
 index 25a3f8c0e0..2cb9a9aa52 100644
 --- a/Lib/importlib/_bootstrap_external.py
 +++ b/Lib/importlib/_bootstrap_external.py
-@@ -313,8 +313,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -373,8 +373,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
      a True value is the same as setting 'optimization' to the empty string
      while a False value is equivalent to setting 'optimization' to '1'.
  
@@ -37,7 +37,7 @@ index 25a3f8c0e0..2cb9a9aa52 100644
      """
      if debug_override is not None:
          _warnings.warn('the debug_override parameter is deprecated; use '
-@@ -326,10 +324,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -386,10 +384,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
      path = _os.fspath(path)
      head, tail = _path_split(path)
      base, sep, rest = tail.rpartition('.')
@@ -49,7 +49,7 @@ index 25a3f8c0e0..2cb9a9aa52 100644
      if optimization is None:
          if sys.flags.optimize == 0:
              optimization = ''
-@@ -366,46 +361,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -426,46 +421,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
              head.lstrip(path_separators),
              filename,
          )
diff --git a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
index b3380fd53f..8c1b989361 100644
--- a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
@@ -21,7 +21,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 7c3dde8dd4..204f293d53 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1385,8 +1385,29 @@ maninstall:	altmaninstall
+@@ -1406,8 +1406,29 @@ maninstall:	altmaninstall
  
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
@@ -53,7 +53,7 @@ index 7c3dde8dd4..204f293d53 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata \
-@@ -1446,28 +1467,25 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
+@@ -1468,28 +1489,25 @@ LIBSUBDIRS=	tkinter tkinter/test tkinter/test/test_tkinter \
  		test/test_importlib/zipdata02 \
  		test/test_zoneinfo test/test_zoneinfo/data \
  		test/ziptestdata \
@@ -100,7 +100,7 @@ diff --git a/configure.ac b/configure.ac
 index 73d66167de..92e28d02ee 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3329,6 +3329,11 @@ if test "$posix_threads" = "yes"; then
+@@ -3358,6 +3358,11 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
diff --git a/package/python3/0014-Add-an-option-to-disable-pydoc.patch b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
index abb86ea07b..0c928a0bb2 100644
--- a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 204f293d53..63e3df0470 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1357,7 +1357,9 @@ bininstall: altbininstall
+@@ -1374,7 +1374,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s idle$(VERSION) idle3)
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
@@ -30,7 +30,7 @@ index 204f293d53..63e3df0470 100644
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s 2to3-$(VERSION) 2to3)
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
-@@ -1403,7 +1405,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1424,7 +1426,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
@@ -39,7 +39,7 @@ index 204f293d53..63e3df0470 100644
  		zoneinfo
  
  TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
-@@ -1486,6 +1488,10 @@ ifeq (@TEST_MODULES@,yes)
+@@ -1508,6 +1510,10 @@ ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
  
@@ -54,7 +54,7 @@ diff --git a/configure.ac b/configure.ac
 index 92e28d02ee..174ed85a7c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3329,6 +3329,12 @@ if test "$posix_threads" = "yes"; then
+@@ -3358,6 +3358,12 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
@@ -71,7 +71,7 @@ diff --git a/setup.py b/setup.py
 index 926c16f58f..1fc5fac90c 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2586,6 +2586,12 @@ def main():
+@@ -2565,6 +2565,12 @@ def main():
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -84,7 +84,7 @@ index 926c16f58f..1fc5fac90c 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2610,8 +2616,7 @@ def main():
+@@ -2589,8 +2595,7 @@ def main():
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
diff --git a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
index 5cec11a00a..fe94cdfded 100644
--- a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 63e3df0470..8b7de12999 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1361,7 +1361,9 @@ ifeq (@PYDOC@,yes)
+@@ -1378,7 +1378,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -30,7 +30,7 @@ index 63e3df0470..8b7de12999 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -1396,7 +1398,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1417,7 +1419,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -38,7 +38,7 @@ index 63e3df0470..8b7de12999 100644
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1473,9 +1474,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1495,9 +1496,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_email test/test_email/data \
  		test/test_json \
  		sqlite3/test \
@@ -48,7 +48,7 @@ index 63e3df0470..8b7de12999 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1484,6 +1482,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1506,6 +1504,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -63,7 +63,7 @@ index 63e3df0470..8b7de12999 100644
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1584,10 +1590,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -1606,10 +1612,12 @@ ifeq (@PYC_BUILD@,yes)
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -80,7 +80,7 @@ diff --git a/configure.ac b/configure.ac
 index 174ed85a7c..f1f5e9a7b0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3341,6 +3341,12 @@ AC_ARG_ENABLE(test-modules,
+@@ -3370,6 +3370,12 @@ AC_ARG_ENABLE(test-modules,
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -97,7 +97,7 @@ diff --git a/setup.py b/setup.py
 index 1fc5fac90c..4063d7ffa5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2587,10 +2587,11 @@ def main():
+@@ -2566,10 +2566,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
index 47ee112e27..d6c9bccd45 100644
--- a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 8b7de12999..d826d8ac4b 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1396,7 +1396,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1417,7 +1417,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -24,7 +24,7 @@ index 8b7de12999..d826d8ac4b 100644
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1473,7 +1472,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1495,7 +1494,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_asyncio \
  		test/test_email test/test_email/data \
  		test/test_json \
@@ -32,7 +32,7 @@ index 8b7de12999..d826d8ac4b 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1490,6 +1488,11 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -1512,6 +1510,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -48,7 +48,7 @@ diff --git a/configure.ac b/configure.ac
 index f1f5e9a7b0..8b5c65974c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3329,6 +3329,15 @@ if test "$posix_threads" = "yes"; then
+@@ -3358,6 +3358,15 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
diff --git a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
index 132fd17386..b798eb56a5 100644
--- a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index d826d8ac4b..dc84384680 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1390,7 +1390,7 @@ maninstall:	altmaninstall
+@@ -1411,7 +1411,7 @@ maninstall:	altmaninstall
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
  
@@ -25,7 +25,7 @@ index d826d8ac4b..dc84384680 100644
  		asyncio \
  		collections concurrent concurrent/futures encodings \
  		email email/mime \
-@@ -1408,8 +1408,7 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1429,8 +1429,7 @@ LIBSUBDIRS=	tkinter site-packages \
  		curses \
  		zoneinfo
  
@@ -35,7 +35,7 @@ index d826d8ac4b..dc84384680 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata \
-@@ -1480,6 +1479,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1502,6 +1501,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -52,7 +52,7 @@ diff --git a/configure.ac b/configure.ac
 index 8b5c65974c..4c72dae960 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3338,6 +3338,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -3367,6 +3367,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
index d51267bbf0..93dfac26ec 100644
--- a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
@@ -16,7 +16,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dc84384680..2a82f3308f 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1405,7 +1405,6 @@ LIBSUBDIRS=	site-packages \
+@@ -1426,7 +1426,6 @@ LIBSUBDIRS=	site-packages \
  		multiprocessing multiprocessing/dummy \
  		unittest \
  		venv venv/scripts venv/scripts/common venv/scripts/posix \
@@ -24,7 +24,7 @@ index dc84384680..2a82f3308f 100644
  		zoneinfo
  
  TESTSUBDIRS=	test \
-@@ -1485,6 +1484,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
+@@ -1507,6 +1506,10 @@ TESTSUBDIRS += tkinter/test tkinter/test/test_tkinter \
  	tkinter/test/test_ttk
  endif
  
@@ -39,7 +39,7 @@ diff --git a/configure.ac b/configure.ac
 index 4c72dae960..acd98381a3 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3347,6 +3347,15 @@ if test "$TK" = "no"; then
+@@ -3376,6 +3376,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python3/0019-Add-an-option-to-disable-expat.patch b/package/python3/0019-Add-an-option-to-disable-expat.patch
index af6e1ebcc1..e7349058c8 100644
--- a/package/python3/0019-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0019-Add-an-option-to-disable-expat.patch
@@ -23,7 +23,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 2a82f3308f..e678c8817e 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1399,7 +1399,7 @@ LIBSUBDIRS=	site-packages \
+@@ -1420,7 +1420,7 @@ LIBSUBDIRS=	site-packages \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
@@ -32,7 +32,7 @@ index 2a82f3308f..e678c8817e 100644
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1488,6 +1488,10 @@ ifeq (@CURSES@,yes)
+@@ -1510,6 +1510,10 @@ ifeq (@CURSES@,yes)
  LIBSUBDIRS += curses
  endif
  
@@ -47,7 +47,7 @@ diff --git a/configure.ac b/configure.ac
 index acd98381a3..9ef0ecd42f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3055,13 +3055,21 @@ PKG_PROG_PKG_CONFIG
+@@ -3084,13 +3084,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -78,7 +78,7 @@ diff --git a/setup.py b/setup.py
 index 4063d7ffa5..211a160f29 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1681,7 +1681,7 @@ class PyBuildExt(build_ext):
+@@ -1666,7 +1666,7 @@ class PyBuildExt(build_ext):
          #
          # More information on Expat can be found at www.libexpat.org.
          #
diff --git a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
index ede78c9b1e..4e22543096 100644
--- a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 9ef0ecd42f..18e6fd70a0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3346,6 +3346,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -3375,6 +3375,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/0021-Add-an-option-to-disable-NIS.patch b/package/python3/0021-Add-an-option-to-disable-NIS.patch
index b2668c6eb2..9cd54df180 100644
--- a/package/python3/0021-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0021-Add-an-option-to-disable-NIS.patch
@@ -15,7 +15,7 @@ diff --git a/configure.ac b/configure.ac
 index 18e6fd70a0..46d2a8131e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3352,6 +3352,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -3381,6 +3381,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
diff --git a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
index 7a0157fd71..2ddf606a70 100644
--- a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 46d2a8131e..5844e3b73f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3358,6 +3358,12 @@ AC_ARG_ENABLE(nis,
+@@ -3387,6 +3387,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python3/0023-Add-an-option-to-disable-IDLE.patch b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
index 0611e3a347..0e35eea699 100644
--- a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index e678c8817e..1148bd8708 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1355,7 +1355,9 @@ bininstall: altbininstall
+@@ -1372,7 +1372,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -29,7 +29,7 @@ index e678c8817e..1148bd8708 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1398,7 +1400,6 @@ LIBSUBDIRS=	site-packages \
+@@ -1419,7 +1421,6 @@ LIBSUBDIRS=	site-packages \
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -37,7 +37,7 @@ index e678c8817e..1148bd8708 100644
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1492,6 +1493,10 @@ ifeq (@EXPAT@,yes)
+@@ -1514,6 +1515,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -52,7 +52,7 @@ diff --git a/configure.ac b/configure.ac
 index 5844e3b73f..7bd4623ccd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3400,6 +3400,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -3429,6 +3429,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -69,7 +69,7 @@ diff --git a/setup.py b/setup.py
 index 211a160f29..c4ee989ba3 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2587,11 +2587,13 @@ def main():
+@@ -2566,11 +2566,13 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch b/package/python3/0024-Add-an-option-to-disable-decimal.patch
index 438b76b91f..b5a12f7f38 100644
--- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0024-Add-an-option-to-disable-decimal.patch
@@ -22,7 +22,7 @@ diff --git a/configure.ac b/configure.ac
 index 7bd4623ccd..e513ef6a20 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3106,13 +3106,20 @@ fi
+@@ -3135,13 +3135,20 @@ fi
  AC_SUBST(LIBFFI_INCLUDEDIR)
  
  # Check for use of the system libmpdec library
@@ -52,7 +52,7 @@ diff --git a/setup.py b/setup.py
 index c4ee989ba3..3d0c74bb7f 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2221,7 +2221,7 @@ class PyBuildExt(build_ext):
+@@ -2195,7 +2195,7 @@ class PyBuildExt(build_ext):
          # Stefan Krah's _decimal module
          extra_compile_args = []
          undef_macros = []
diff --git a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 8a792c1fac..0f68a08356 100644
--- a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index e513ef6a20..c07505e89e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3136,6 +3136,12 @@ fi
+@@ -3165,6 +3165,12 @@ fi
  
  AC_MSG_RESULT($with_decimal_contextvar)
  
diff --git a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
index d9e9d13f31..44d1d3d6b3 100644
--- a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index c07505e89e..612e32faf5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3377,6 +3377,12 @@ AC_ARG_ENABLE(unicodedata,
+@@ -3406,6 +3406,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
diff --git a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
index 2324ffdcf2..1597a2a560 100644
--- a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 612e32faf5..2a6aaeff60 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3383,6 +3383,12 @@ AC_ARG_ENABLE(openssl,
+@@ -3412,6 +3412,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
diff --git a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index 04d0ab31bf..a1d2ef3255 100644
--- a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 2a6aaeff60..21479bbd7d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3389,6 +3389,24 @@ AC_ARG_ENABLE(readline,
+@@ -3418,6 +3418,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
diff --git a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch b/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
index 806801b2b9..1bf5fc6db4 100644
--- a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
+++ b/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
@@ -23,7 +23,7 @@ diff --git a/setup.py b/setup.py
 index 3d0c74bb7f..c7be85f352 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1779,7 +1779,8 @@ class PyBuildExt(build_ext):
+@@ -1764,7 +1764,8 @@ class PyBuildExt(build_ext):
  
      def detect_uuid(self):
          # Build the _uuid module if possible
diff --git a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch b/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
index 6ea57d2cde..92b24b211d 100644
--- a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
+++ b/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 21479bbd7d..615c16aced 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3425,6 +3425,15 @@ if test "$CURSES" = "no"; then
+@@ -3454,6 +3454,15 @@ if test "$CURSES" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
  fi
  
diff --git a/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index 304a595fce..f70990b254 100644
--- a/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -32,7 +32,7 @@ diff --git a/configure.ac b/configure.ac
 index 615c16aced..241298e6cf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -718,7 +718,9 @@ then
+@@ -727,7 +727,9 @@ then
  fi
  
  
diff --git a/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch b/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
index f763fcaa82..a4e8baf4dd 100644
--- a/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
+++ b/package/python3/0034-Add-an-option-to-disable-the-berkeleydb-module.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 72c1d86e82..8c3912d237 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3326,6 +3326,12 @@ if test "$UUID" = "no"; then
+@@ -3465,6 +3465,12 @@ if test "$UUID" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
  fi
  
diff --git a/package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
similarity index 100%
rename from package/python3/0034-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
rename to package/python3/0035-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 78571b5e0b..36e89a0678 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-395/
-md5  71f7ada6bec9cdbf4538adc326120cfd  Python-3.9.5.tar.xz
+# From https://www.python.org/downloads/release/python-396/
+md5  ecc29a7688f86e550d29dba2ee66cf80  Python-3.9.6.tar.xz
 # Locally computed
-sha256  0c5a140665436ec3dbfbb79e2dfb6d192655f26ef4a29aeffcb6d1820d716d83  Python-3.9.5.tar.xz
+sha256  397920af33efc5b97f2e0b57e91923512ef89fc5b3c1d21dbfc8c4828ce0108a  Python-3.9.6.tar.xz
 sha256  599826df92bfdcd2702eac691072498bb096c55af04ee984cf90f70ed77b5a70  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 991e24a440..d491a4c800 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.9
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
