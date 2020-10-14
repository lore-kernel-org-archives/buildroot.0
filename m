From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 21:12:52 +0200
Subject: [Buildroot] [git commit] package/python3: rebase patches with
 incorrect offsets for python 3.9.0
Message-ID: <20201014190134.F0E0781641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43ef89e6d477f56dc2de32af0a56cb21cd9b8227
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This rebases the remaining patches for python 3.9.0 not included in
f26ce577605e843ebf0f5583242ee9ff3cd08ac3.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-Make-the-build-of-pyc-files-conditional.patch | 14 ++++++-------
 ...gy_getaddrinfo-configure-test-when-cross-.patch |  8 ++++----
 ...ructure-to-disable-the-build-of-certain-e.patch | 20 +++++++++---------
 ...ibrary-header-paths-for-cross-compilation.patch | 12 +++++------
 ...n-t-look-in-usr-lib-termcap-for-libraries.patch |  8 ++++----
 .../python3/0006-Don-t-add-multiarch-paths.patch   |  8 ++++----
 .../0007-Abort-on-failed-module-build.patch        |  8 ++++----
 package/python3/0008-Serial-ioctl-workaround.patch |  6 +++---
 ...st-the-shebang-of-Python-scripts-for-cros.patch |  4 ++--
 ...-config.sh.in-ensure-sed-invocations-only.patch |  4 ++--
 ...0012-Add-importlib-fix-for-PEP-3147-issue.patch | 12 +++++------
 .../0015-Add-an-option-to-disable-lib2to3.patch    | 24 +++++++++++-----------
 ...-Add-option-to-disable-the-sqlite3-module.patch | 16 +++++++--------
 ...17-Add-an-option-to-disable-the-tk-module.patch | 20 +++++++++---------
 .../0020-Add-an-option-to-disable-CJK-codecs.patch |  8 ++++----
 .../0021-Add-an-option-to-disable-NIS.patch        |  8 ++++----
 ...0022-Add-an-option-to-disable-unicodedata.patch |  8 ++++----
 .../0023-Add-an-option-to-disable-IDLE.patch       | 20 +++++++++---------
 ...-option-to-disable-the-ossaudiodev-module.patch |  8 ++++----
 ...-Add-an-option-to-disable-openssl-support.patch |  8 ++++----
 ...-an-option-to-disable-the-readline-module.patch |  8 ++++----
 ...ions-to-disable-zlib-bzip2-and-xz-modules.patch |  8 ++++----
 ...29-python-config.sh-don-t-reassign-prefix.patch |  4 ++--
 .../0030-Fix-cross-compiling-the-uuid-module.patch |  8 ++++----
 ...0031-Add-an-option-to-disable-uuid-module.patch |  8 ++++----
 .../0032-fix-building-on-older-distributions.patch |  4 ++--
 ...c-fixup-CC-print-multiarch-output-for-mus.patch |  8 ++++----
 27 files changed, 136 insertions(+), 136 deletions(-)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 1010d08d53..5eb296c6d8 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -1,4 +1,4 @@
-From 586a67bb448290a98df45e9f61d803952d2aa761 Mon Sep 17 00:00:00 2001
+From 322724e166d7ec0393aec577c12fdf6ef2b61e1d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:21:31 -0800
 Subject: [PATCH] Make the build of pyc files conditional
@@ -15,10 +15,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 8 insertions(+)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 502317aa0c..f9011c132a 100644
+index 77f91e72b1..0c809f3d8a 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1455,6 +1455,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1528,6 +1528,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
  			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
  	fi
@@ -26,7 +26,7 @@ index 502317aa0c..f9011c132a 100644
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
  		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST) -f \
-@@ -1482,6 +1483,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
+@@ -1555,6 +1556,7 @@ libinstall:	build_all $(srcdir)/Modules/xxmodule.c
  		$(PYTHON_FOR_BUILD) -Wi -OO $(DESTDIR)$(LIBDEST)/compileall.py \
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
@@ -35,10 +35,10 @@ index 502317aa0c..f9011c132a 100644
  		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
  	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
 diff --git a/configure.ac b/configure.ac
-index a189d42c2c..4690cdba9f 100644
+index d60f05251a..1ee5a09588 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1091,6 +1091,12 @@ fi
+@@ -1112,6 +1112,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
@@ -52,5 +52,5 @@ index a189d42c2c..4690cdba9f 100644
  # library that we build, but we do not want to link against it (we
  # will find it with a -framework option). For this reason there is an
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index e9e5b32ca2..c291d14460 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -1,4 +1,4 @@
-From 3b558cfb1670300afece09b957e1e4b7072bce6b Mon Sep 17 00:00:00 2001
+From 72e20220f3a592b3ab9f440fbe74efa9f9e82d49 Mon Sep 17 00:00:00 2001
 From: Vanya Sergeev <vsergeev@gmail.com>
 Date: Wed, 23 Dec 2015 11:30:33 +0100
 Subject: [PATCH] Disable buggy_getaddrinfo configure test when cross-compiling
@@ -10,10 +10,10 @@ Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4690cdba9f..ffeec102b7 100644
+index 1ee5a09588..c2445edc88 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4080,7 +4080,7 @@ fi
+@@ -4175,7 +4175,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
@@ -23,5 +23,5 @@ index 4690cdba9f..ffeec102b7 100644
  	if test $ipv6 = yes
  	then
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index c4620949bd..b0dcce7d77 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -1,4 +1,4 @@
-From 36c138c15515e80f72a570b61da324e55ae3e80c Mon Sep 17 00:00:00 2001
+From df7c95b4ceecf390b961d843a556c470ac9080b2 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 16:33:22 -0800
 Subject: [PATCH] Add infrastructure to disable the build of certain extensions
@@ -44,10 +44,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 11 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f9011c132a..e8a6bd5c03 100644
+index 0c809f3d8a..7c3dde8dd4 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -205,6 +205,8 @@ FILEMODE=	644
+@@ -213,6 +213,8 @@ FILEMODE=	644
  # configure script arguments
  CONFIG_ARGS=	@CONFIG_ARGS@
  
@@ -56,7 +56,7 @@ index f9011c132a..e8a6bd5c03 100644
  
  # Subdirectories with code
  SRCDIRS= 	@SRCDIRS@
-@@ -605,6 +607,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
+@@ -629,6 +631,7 @@ sharedmods: $(BUILDPYTHON) pybuilddir.txt Modules/_math.o
  	esac; \
  	echo "$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
@@ -64,7 +64,7 @@ index f9011c132a..e8a6bd5c03 100644
  		$(PYTHON_FOR_BUILD) $(srcdir)/setup.py $$quiet build"; \
  	$(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' \
  		_TCLTK_INCLUDES='$(TCLTK_INCLUDES)' _TCLTK_LIBS='$(TCLTK_LIBS)' \
-@@ -1601,7 +1604,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
+@@ -1674,7 +1677,8 @@ libainstall:	@DEF_MAKE_RULE@ python-config
  # Install the dynamically loadable modules
  # This goes into $(exec_prefix)
  sharedinstall: sharedmods
@@ -75,10 +75,10 @@ index f9011c132a..e8a6bd5c03 100644
  		--install-scripts=$(BINDIR) \
  		--install-platlib=$(DESTSHARED) \
 diff --git a/configure.ac b/configure.ac
-index ffeec102b7..7872b4dfee 100644
+index c2445edc88..73d66167de 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2958,6 +2958,8 @@ LIBS="$withval $LIBS"
+@@ -3052,6 +3052,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
@@ -88,10 +88,10 @@ index ffeec102b7..7872b4dfee 100644
  AC_MSG_CHECKING(for --with-system-expat)
  AC_ARG_WITH(system_expat,
 diff --git a/setup.py b/setup.py
-index 20d7f35652..d3f2cc1b37 100644
+index 770866bca7..b6c829b3a5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -24,7 +24,10 @@ from distutils.spawn import find_executable
+@@ -43,7 +43,10 @@ from distutils.spawn import find_executable
  TEST_EXTENSIONS = True
  
  # This global variable is used to hold the list of modules to be disabled.
@@ -104,5 +104,5 @@ index 20d7f35652..d3f2cc1b37 100644
  
  def get_platform():
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
index 0ac5116213..24f369f87f 100644
--- a/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
+++ b/package/python3/0004-Adjust-library-header-paths-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From f5ed27c9b9efb4756630e5799be14fefdc3b2702 Mon Sep 17 00:00:00 2001
+From 61af65485f1dade4aa08d0cf2b24082aeda24c51 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:33:14 +0100
 Subject: [PATCH] Adjust library/header paths for cross-compilation
@@ -21,7 +21,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  2 files changed, 15 insertions(+), 5 deletions(-)
 
 diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
-index 2d7cdf063f..cba150075c 100644
+index 1a9bd1200f..3cf7d6746e 100644
 --- a/Lib/distutils/command/build_ext.py
 +++ b/Lib/distutils/command/build_ext.py
 @@ -234,7 +234,10 @@ class build_ext(Command):
@@ -37,11 +37,11 @@ index 2d7cdf063f..cba150075c 100644
                  # building python standard extensions
                  self.library_dirs.append('.')
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index b51629eb94..011a437bcd 100644
+index 37feae5df7..e9c3a27856 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -18,10 +18,17 @@ from .errors import DistutilsPlatformError
- from .util import get_platform, get_host_platform
+@@ -17,10 +17,17 @@ import sys
+ from .errors import DistutilsPlatformError
  
  # These are needed in a couple of spots, so just compute them once.
 -PREFIX = os.path.normpath(sys.prefix)
@@ -63,5 +63,5 @@ index b51629eb94..011a437bcd 100644
  # Path to the base directory of the project. On Windows the binary may
  # live in project/PCbuild/win32 or project/PCbuild/amd64.
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
index 935e0c3b55..83c88ff399 100644
--- a/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
+++ b/package/python3/0005-Don-t-look-in-usr-lib-termcap-for-libraries.patch
@@ -1,4 +1,4 @@
-From 5bcb991a8de2f1b9bdf44e78894417ed2ee137a5 Mon Sep 17 00:00:00 2001
+From 60d71e37d167ea89445250be436170a6cfee84e7 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:00 +0100
 Subject: [PATCH] Don't look in /usr/lib/termcap for libraries
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 4 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index d3f2cc1b37..5d504d7638 100644
+index b6c829b3a5..ec3ba60607 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -955,12 +955,9 @@ class PyBuildExt(build_ext):
+@@ -1056,12 +1056,9 @@ class PyBuildExt(build_ext):
                  pass # Issue 7384: Already linked against curses or tinfo.
              elif curses_library:
                  readline_libs.append(curses_library)
@@ -27,5 +27,5 @@ index d3f2cc1b37..5d504d7638 100644
                                 libraries=readline_libs))
          else:
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0006-Don-t-add-multiarch-paths.patch b/package/python3/0006-Don-t-add-multiarch-paths.patch
index ab1e295e70..f55238d0c4 100644
--- a/package/python3/0006-Don-t-add-multiarch-paths.patch
+++ b/package/python3/0006-Don-t-add-multiarch-paths.patch
@@ -1,4 +1,4 @@
-From b878b174e12a5cb2e1943f1f79d94033c1ee80d7 Mon Sep 17 00:00:00 2001
+From f5933b8f973cd11698b52d535a10d0474e49f5a5 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:36:27 +0100
 Subject: [PATCH] Don't add multiarch paths
@@ -17,10 +17,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 5d504d7638..282a592dc6 100644
+index ec3ba60607..e27620035c 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -654,10 +654,10 @@ class PyBuildExt(build_ext):
+@@ -749,10 +749,10 @@ class PyBuildExt(build_ext):
          if not CROSS_COMPILING:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
@@ -33,5 +33,5 @@ index 5d504d7638..282a592dc6 100644
  
      def init_inc_lib_dirs(self):
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0007-Abort-on-failed-module-build.patch b/package/python3/0007-Abort-on-failed-module-build.patch
index 1dcf8a017d..0e96e7522a 100644
--- a/package/python3/0007-Abort-on-failed-module-build.patch
+++ b/package/python3/0007-Abort-on-failed-module-build.patch
@@ -1,4 +1,4 @@
-From fceda5bae52571213b6671ce0220d1a85b38f8c7 Mon Sep 17 00:00:00 2001
+From 188c0ebfdb71f5252fa7701013b8d1209f28aef7 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:43:24 +0100
 Subject: [PATCH] Abort on failed module build
@@ -14,10 +14,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/setup.py b/setup.py
-index 282a592dc6..8fda3b4d47 100644
+index e27620035c..d3f0e663f2 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -444,6 +444,7 @@ class PyBuildExt(build_ext):
+@@ -539,6 +539,7 @@ class PyBuildExt(build_ext):
              print("Failed to build these modules:")
              print_three_column(failed)
              print()
@@ -26,5 +26,5 @@ index 282a592dc6..8fda3b4d47 100644
          if self.failed_on_import:
              failed = self.failed_on_import[:]
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0008-Serial-ioctl-workaround.patch b/package/python3/0008-Serial-ioctl-workaround.patch
index 9303e188c9..df31cd6220 100644
--- a/package/python3/0008-Serial-ioctl-workaround.patch
+++ b/package/python3/0008-Serial-ioctl-workaround.patch
@@ -1,4 +1,4 @@
-From 91e8058cf9085795db64f43e2c9548926ea46ab0 Mon Sep 17 00:00:00 2001
+From 9e6211b0d6d4610e5fb7d2c7e1152eb7c64d968b Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Wed, 23 Dec 2015 11:44:02 +0100
 Subject: [PATCH] Serial ioctl() workaround
@@ -15,7 +15,7 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
  1 file changed, 2 insertions(+)
 
 diff --git a/Modules/termios.c b/Modules/termios.c
-index aee7f12c57..ba2ff77d06 100644
+index 75e5e52320..eefbddfe69 100644
 --- a/Modules/termios.c
 +++ b/Modules/termios.c
 @@ -15,7 +15,9 @@
@@ -29,5 +29,5 @@ index aee7f12c57..ba2ff77d06 100644
  /* HP-UX requires that this be included to pick up MDCD, MCTS, MDSR,
   * MDTR, MRI, and MRTS (apparently used internally by some things
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
index 32e3bdfea0..8a77fe3708 100644
--- a/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
+++ b/package/python3/0009-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
@@ -1,4 +1,4 @@
-From 3ec9bbf5bd9cced0005c99d7d65997b119abf2f6 Mon Sep 17 00:00:00 2001
+From cb595a591c71e0bf7c63a3706b0be45ac6a642e3 Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 23 Dec 2015 11:44:30 +0100
 Subject: [PATCH] Do not adjust the shebang of Python scripts for
@@ -31,5 +31,5 @@ index ccc70e6465..d6d54195c1 100644
                           self.build_dir)
                  updated_files.append(outfile)
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
index a8ccba7784..a1f9ab6cd9 100644
--- a/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
+++ b/package/python3/0010-Misc-python-config.sh.in-ensure-sed-invocations-only.patch
@@ -1,4 +1,4 @@
-From 7b3839bcf9f79988fb944cd65717839cde166cb8 Mon Sep 17 00:00:00 2001
+From eb51497e4b5799f8ab0277426d3e54414acb9d4b Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Thu, 20 Nov 2014 13:24:59 +0100
 Subject: [PATCH] Misc/python-config.sh.in: ensure sed invocations only match
@@ -63,5 +63,5 @@ index 2602fe24c0..a1bc3cd5f7 100644
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
  INCDIR="-I$includedir/python${VERSION}${ABIFLAGS}"
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
index aacb6dca6c..42dfa0d693 100644
--- a/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
+++ b/package/python3/0012-Add-importlib-fix-for-PEP-3147-issue.patch
@@ -1,4 +1,4 @@
-From c50b8e7fb9b2e61d4d195a055cd1bbf993cc455f Mon Sep 17 00:00:00 2001
+From e2ea659eac1849db471d3c01a0d0af9d6fca2e9a Mon Sep 17 00:00:00 2001
 From: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
 Date: Wed, 22 Feb 2017 16:48:49 -0800
 Subject: [PATCH] Add importlib fix for PEP 3147 issue
@@ -25,10 +25,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  1 file changed, 5 insertions(+), 39 deletions(-)
 
 diff --git a/Lib/importlib/_bootstrap_external.py b/Lib/importlib/_bootstrap_external.py
-index b8ac482994..db034f605a 100644
+index 25a3f8c0e0..2cb9a9aa52 100644
 --- a/Lib/importlib/_bootstrap_external.py
 +++ b/Lib/importlib/_bootstrap_external.py
-@@ -306,8 +306,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -313,8 +313,6 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
      a True value is the same as setting 'optimization' to the empty string
      while a False value is equivalent to setting 'optimization' to '1'.
  
@@ -37,7 +37,7 @@ index b8ac482994..db034f605a 100644
      """
      if debug_override is not None:
          _warnings.warn('the debug_override parameter is deprecated; use '
-@@ -319,10 +317,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -326,10 +324,7 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
      path = _os.fspath(path)
      head, tail = _path_split(path)
      base, sep, rest = tail.rpartition('.')
@@ -49,7 +49,7 @@ index b8ac482994..db034f605a 100644
      if optimization is None:
          if sys.flags.optimize == 0:
              optimization = ''
-@@ -359,46 +354,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
+@@ -366,46 +361,17 @@ def cache_from_source(path, debug_override=None, *, optimization=None):
              head.lstrip(path_separators),
              filename,
          )
@@ -101,5 +101,5 @@ index b8ac482994..db034f605a 100644
  
  
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
index 1bd1ae511f..5cec11a00a 100644
--- a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
@@ -1,4 +1,4 @@
-From 868823f15bab031caf05dc5e8ce2eac076bfc82b Mon Sep 17 00:00:00 2001
+From f034b1b0f33a7bd4dde23f0bc1fa8e00e3518c9d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:15:31 -0800
 Subject: [PATCH] Add an option to disable lib2to3
@@ -17,10 +17,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 21 insertions(+), 6 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 6fa0549a56..3e1f130532 100644
+index 63e3df0470..8b7de12999 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1293,7 +1293,9 @@ ifeq (@PYDOC@,yes)
+@@ -1361,7 +1361,9 @@ ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
  endif
  	-rm -f $(DESTDIR)$(BINDIR)/2to3
@@ -30,7 +30,7 @@ index 6fa0549a56..3e1f130532 100644
  	if test "x$(LIPO_32BIT_FLAGS)" != "x" ; then \
  		rm -f $(DESTDIR)$(BINDIR)/python3-32$(EXE); \
  		(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-32$(EXE) python3-32$(EXE)) \
-@@ -1328,7 +1330,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1396,7 +1398,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		html json http dbm xmlrpc \
  		sqlite3 \
  		logging csv wsgiref urllib \
@@ -38,7 +38,7 @@ index 6fa0549a56..3e1f130532 100644
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1402,9 +1403,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1473,9 +1474,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_email test/test_email/data \
  		test/test_json \
  		sqlite3/test \
@@ -48,7 +48,7 @@ index 6fa0549a56..3e1f130532 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1412,6 +1410,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1484,6 +1482,14 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -63,7 +63,7 @@ index 6fa0549a56..3e1f130532 100644
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1511,10 +1517,12 @@ ifeq (@PYC_BUILD@,yes)
+@@ -1584,10 +1590,12 @@ ifeq (@PYC_BUILD@,yes)
  		-j0 -d $(LIBDEST)/site-packages -f \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -77,10 +77,10 @@ index 6fa0549a56..3e1f130532 100644
  # bpo-21536: Misc/python-config.sh is generated in the build directory
  # from $(srcdir)Misc/python-config.sh.in.
 diff --git a/configure.ac b/configure.ac
-index f53cc86d89..caa8eaf88a 100644
+index 174ed85a7c..f1f5e9a7b0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3246,6 +3246,12 @@ AC_ARG_ENABLE(test-modules,
+@@ -3341,6 +3341,12 @@ AC_ARG_ENABLE(test-modules,
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -94,10 +94,10 @@ index f53cc86d89..caa8eaf88a 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index 748c269960..1669797cad 100644
+index 1fc5fac90c..4063d7ffa5 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2402,10 +2402,11 @@ def main():
+@@ -2587,10 +2587,11 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -112,5 +112,5 @@ index 748c269960..1669797cad 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
index 364d1b1ec8..47ee112e27 100644
--- a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
@@ -1,4 +1,4 @@
-From 1a1d13a973d9dcbd6660bfef40cf35c7638f779b Mon Sep 17 00:00:00 2001
+From dd2722dec08eb9c72c36313e93661eeca3ad64d8 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:20:45 -0800
 Subject: [PATCH] Add option to disable the sqlite3 module
@@ -13,10 +13,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 3e1f130532..cf9add0bc7 100644
+index 8b7de12999..d826d8ac4b 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1328,7 +1328,6 @@ LIBSUBDIRS=	tkinter site-packages \
+@@ -1396,7 +1396,6 @@ LIBSUBDIRS=	tkinter site-packages \
  		email email/mime \
  		ensurepip ensurepip/_bundled \
  		html json http dbm xmlrpc \
@@ -24,7 +24,7 @@ index 3e1f130532..cf9add0bc7 100644
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1402,7 +1401,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1473,7 +1472,6 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_asyncio \
  		test/test_email test/test_email/data \
  		test/test_json \
@@ -32,7 +32,7 @@ index 3e1f130532..cf9add0bc7 100644
  		ctypes/test \
  		idlelib/idle_test \
  		distutils/tests \
-@@ -1418,6 +1416,11 @@ TESTSUBDIRS += lib2to3/tests			\
+@@ -1490,6 +1488,11 @@ TESTSUBDIRS += lib2to3/tests			\
  	lib2to3/tests/data/fixers/myfixes
  endif
  
@@ -45,10 +45,10 @@ index 3e1f130532..cf9add0bc7 100644
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
 diff --git a/configure.ac b/configure.ac
-index caa8eaf88a..79a8255f44 100644
+index f1f5e9a7b0..8b5c65974c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3234,6 +3234,15 @@ if test "$posix_threads" = "yes"; then
+@@ -3329,6 +3329,15 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
@@ -65,5 +65,5 @@ index caa8eaf88a..79a8255f44 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
index eb0ad26daa..132fd17386 100644
--- a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
@@ -1,4 +1,4 @@
-From c54cb57b3bd80fa2819f6409d5d2b98d82fbfcb2 Mon Sep 17 00:00:00 2001
+From ad6b66b34f71ff6b60b3be5f6fd3e781cdeecd59 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:23:42 -0800
 Subject: [PATCH] Add an option to disable the tk module
@@ -13,10 +13,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  2 files changed, 17 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index cf9add0bc7..5d78419fd4 100644
+index d826d8ac4b..dc84384680 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1322,7 +1322,7 @@ maninstall:	altmaninstall
+@@ -1390,7 +1390,7 @@ maninstall:	altmaninstall
  # Install the library
  XMLLIBSUBDIRS=  xml xml/dom xml/etree xml/parsers xml/sax
  
@@ -25,9 +25,9 @@ index cf9add0bc7..5d78419fd4 100644
  		asyncio \
  		collections concurrent concurrent/futures encodings \
  		email email/mime \
-@@ -1339,8 +1339,7 @@ LIBSUBDIRS=	tkinter site-packages \
- 		venv venv/scripts venv/scripts/common venv/scripts/posix \
- 		curses
+@@ -1408,8 +1408,7 @@ LIBSUBDIRS=	tkinter site-packages \
+ 		curses \
+ 		zoneinfo
  
 -TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
 -		tkinter/test/test_ttk test \
@@ -35,7 +35,7 @@ index cf9add0bc7..5d78419fd4 100644
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata \
-@@ -1408,6 +1407,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
+@@ -1480,6 +1479,12 @@ TESTSUBDIRS=	tkinter/test tkinter/test/test_tkinter \
  		test/test_tools test/test_warnings test/test_warnings/data \
  		unittest/test unittest/test/testmock
  
@@ -49,10 +49,10 @@ index cf9add0bc7..5d78419fd4 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index 79a8255f44..b5922451cc 100644
+index 8b5c65974c..4c72dae960 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3243,6 +3243,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -3338,6 +3338,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -69,5 +69,5 @@ index 79a8255f44..b5922451cc 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
index 1b18c54591..ede78c9b1e 100644
--- a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
@@ -1,4 +1,4 @@
-From 347f359b484c8e34b49f71132701252b966d93aa Mon Sep 17 00:00:00 2001
+From 2c0d31bb91fc7f94283c3ab632925fbbe24e94d6 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:49:55 +0100
 Subject: [PATCH] Add an option to disable CJK codecs
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 3c1e2c088d..30a92f9c2e 100644
+index 9ef0ecd42f..18e6fd70a0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3251,6 +3251,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -3346,6 +3346,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
@@ -26,5 +26,5 @@ index 3c1e2c088d..30a92f9c2e 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0021-Add-an-option-to-disable-NIS.patch b/package/python3/0021-Add-an-option-to-disable-NIS.patch
index 71645be9f4..b2668c6eb2 100644
--- a/package/python3/0021-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0021-Add-an-option-to-disable-NIS.patch
@@ -1,4 +1,4 @@
-From ff9bebed083c5d20fe31f94b868f6f1a8c6cc744 Mon Sep 17 00:00:00 2001
+From 2041d0c8dba87991edaf088b16e37b5189a3466d Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:11 +0100
 Subject: [PATCH] Add an option to disable NIS
@@ -12,10 +12,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 30a92f9c2e..20f326db46 100644
+index 18e6fd70a0..46d2a8131e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3257,6 +3257,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -3352,6 +3352,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
@@ -29,5 +29,5 @@ index 30a92f9c2e..20f326db46 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
index 3805e1aad9..7a0157fd71 100644
--- a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
@@ -1,4 +1,4 @@
-From 47f9caca90e6c8c18736e5dfd0acf47aae27eefb Mon Sep 17 00:00:00 2001
+From dd82a401ff6ba4ba116bf4d520e981a1808ed443 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:50:27 +0100
 Subject: [PATCH] Add an option to disable unicodedata
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 20f326db46..99bbc37b07 100644
+index 46d2a8131e..5844e3b73f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3263,6 +3263,12 @@ AC_ARG_ENABLE(nis,
+@@ -3358,6 +3358,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
@@ -26,5 +26,5 @@ index 20f326db46..99bbc37b07 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0023-Add-an-option-to-disable-IDLE.patch b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
index 3a138f966f..0611e3a347 100644
--- a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
@@ -1,4 +1,4 @@
-From c3ad1d6fc8f1fa56ee0522389227454710bf7877 Mon Sep 17 00:00:00 2001
+From f1b15834045d0641c43014b970721df066fa71f7 Mon Sep 17 00:00:00 2001
 From: Maxime Ripard <maxime.ripard@free-electrons.com>
 Date: Wed, 22 Feb 2017 17:45:14 -0800
 Subject: [PATCH] Add an option to disable IDLE
@@ -16,10 +16,10 @@ Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
  3 files changed, 15 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f49abf8395..bc777e6504 100644
+index e678c8817e..1148bd8708 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1287,7 +1287,9 @@ bininstall: altbininstall
+@@ -1355,7 +1355,9 @@ bininstall: altbininstall
  	-rm -f $(DESTDIR)$(LIBPC)/python3-embed.pc
  	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION)-embed.pc python3-embed.pc)
  	-rm -f $(DESTDIR)$(BINDIR)/idle3
@@ -29,7 +29,7 @@ index f49abf8395..bc777e6504 100644
  	-rm -f $(DESTDIR)$(BINDIR)/pydoc3
  ifeq (@PYDOC@,yes)
  	(cd $(DESTDIR)$(BINDIR); $(LN) -s pydoc$(VERSION) pydoc3)
-@@ -1330,7 +1332,6 @@ LIBSUBDIRS=	site-packages \
+@@ -1398,7 +1400,6 @@ LIBSUBDIRS=	site-packages \
  		html json http dbm xmlrpc \
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
@@ -37,7 +37,7 @@ index f49abf8395..bc777e6504 100644
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1420,6 +1421,10 @@ ifeq (@EXPAT@,yes)
+@@ -1492,6 +1493,10 @@ ifeq (@EXPAT@,yes)
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -49,10 +49,10 @@ index f49abf8395..bc777e6504 100644
  LIBSUBDIRS += lib2to3 lib2to3/fixes lib2to3/pgen2
  TESTSUBDIRS += lib2to3/tests			\
 diff --git a/configure.ac b/configure.ac
-index 99bbc37b07..8c9706582e 100644
+index 5844e3b73f..7bd4623ccd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3305,6 +3305,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -3400,6 +3400,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -66,10 +66,10 @@ index 99bbc37b07..8c9706582e 100644
  AH_TEMPLATE(ENABLE_IPV6, [Define if --enable-ipv6 is specified])
  AC_MSG_CHECKING([if --enable-ipv6 is specified])
 diff --git a/setup.py b/setup.py
-index d2727c0da5..9f09b3d985 100644
+index 211a160f29..c4ee989ba3 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -2402,11 +2402,13 @@ def main():
+@@ -2587,11 +2587,13 @@ def main():
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -85,5 +85,5 @@ index d2727c0da5..9f09b3d985 100644
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 55ba22a0e5..8a792c1fac 100644
--- a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -1,4 +1,4 @@
-From c68234aba844cb1034fdcfb50aef03da454723f9 Mon Sep 17 00:00:00 2001
+From 9bedc56d2a4b8856162650a11c1fcb6ec38f160b Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Wed, 23 Dec 2015 11:51:58 +0100
 Subject: [PATCH] Add an option to disable the ossaudiodev module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index e6255babb6..5809233aac 100644
+index e513ef6a20..c07505e89e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3042,6 +3042,12 @@ fi
+@@ -3136,6 +3136,12 @@ fi
  
  AC_MSG_RESULT($with_decimal_contextvar)
  
@@ -26,5 +26,5 @@ index e6255babb6..5809233aac 100644
  AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
  AC_ARG_ENABLE(loadable-sqlite-extensions,
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
index 814ffdb561..d9e9d13f31 100644
--- a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
@@ -1,4 +1,4 @@
-From 8faf197969bf531279d5c59a5bb2bc3a21acc378 Mon Sep 17 00:00:00 2001
+From 90ed5c692b8b5596ca0b3ae1436276c8181251d8 Mon Sep 17 00:00:00 2001
 From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
 Date: Wed, 22 Feb 2017 17:55:59 -0800
 Subject: [PATCH] Add an option to disable openssl support.
@@ -9,10 +9,10 @@ Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 5809233aac..6b09bafda4 100644
+index c07505e89e..612e32faf5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3282,6 +3282,12 @@ AC_ARG_ENABLE(unicodedata,
+@@ -3377,6 +3377,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
@@ -26,5 +26,5 @@ index 5809233aac..6b09bafda4 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
index 30651244f4..2324ffdcf2 100644
--- a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
@@ -1,4 +1,4 @@
-From 6e3923f90497ba7230b62fdd3f2dca1cb79852bf Mon Sep 17 00:00:00 2001
+From 049e7a51e1ffd0d28d6608c707ab4b54e816d338 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:29:05 +0100
 Subject: [PATCH] Add an option to disable the readline module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 6b09bafda4..b64518eed5 100644
+index 612e32faf5..2a6aaeff60 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3288,6 +3288,12 @@ AC_ARG_ENABLE(openssl,
+@@ -3383,6 +3383,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
@@ -26,5 +26,5 @@ index 6b09bafda4..b64518eed5 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index 330b549c01..04d0ab31bf 100644
--- a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -1,4 +1,4 @@
-From e6f44f93db96ed7f3b2baa0e09ea32a32c78c638 Mon Sep 17 00:00:00 2001
+From 146730a04dfe98e3d7971ebf5410801ceae88e11 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Date: Tue, 7 Mar 2017 23:31:11 +0100
 Subject: [PATCH] Add options to disable zlib, bzip2 and xz modules
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
  1 file changed, 18 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index b64518eed5..d07e371c57 100644
+index 2a6aaeff60..21479bbd7d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3294,6 +3294,24 @@ AC_ARG_ENABLE(readline,
+@@ -3389,6 +3389,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
@@ -38,5 +38,5 @@ index b64518eed5..d07e371c57 100644
  AC_ARG_ENABLE(tk,
  	AS_HELP_STRING([--disable-tk], [disable tk]),
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
index f69b887c9b..4478b40162 100644
--- a/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
+++ b/package/python3/0029-python-config.sh-don-t-reassign-prefix.patch
@@ -1,4 +1,4 @@
-From e3221e3b714374e1e53dc11c9556733bd2807c2c Mon Sep 17 00:00:00 2001
+From 106d9378c61e7fa9cad0a63ba068668d54cd11b8 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Fri, 6 Oct 2017 09:54:15 -0500
 Subject: [PATCH] python-config.sh: don't reassign ${prefix}
@@ -49,5 +49,5 @@ index a1bc3cd5f7..164d2d3603 100644
  SO="@EXT_SUFFIX@"
  PYTHONFRAMEWORK="@PYTHONFRAMEWORK@"
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch b/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
index d39befaf1c..806801b2b9 100644
--- a/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
+++ b/package/python3/0030-Fix-cross-compiling-the-uuid-module.patch
@@ -1,4 +1,4 @@
-From 28008e1e4f0349241d22aace3c54f7e9425c6c1f Mon Sep 17 00:00:00 2001
+From d7b90b157eddefbd0ed59e35c90b083c0c03b644 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Fri, 20 Jul 2018 10:17:39 -0400
 Subject: [PATCH] Fix cross compiling the uuid module
@@ -20,10 +20,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index a7f2e23d87..b0274a3f67 100644
+index 3d0c74bb7f..c7be85f352 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -1674,7 +1674,8 @@ class PyBuildExt(build_ext):
+@@ -1779,7 +1779,8 @@ class PyBuildExt(build_ext):
  
      def detect_uuid(self):
          # Build the _uuid module if possible
@@ -34,5 +34,5 @@ index a7f2e23d87..b0274a3f67 100644
              if self.compiler.find_library_file(self.lib_dirs, 'uuid'):
                  uuid_libs = ['uuid']
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch b/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
index 6ea5f68590..6ea57d2cde 100644
--- a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
+++ b/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
@@ -1,4 +1,4 @@
-From 74007603df0921450f14e8626df36140426cc300 Mon Sep 17 00:00:00 2001
+From 3bb693408eda77dda145ec5fecee56ea73031e9f Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sat, 18 Aug 2018 10:54:56 +0200
 Subject: [PATCH] Add an option to disable uuid module
@@ -9,10 +9,10 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 9 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index d07e371c57..55ab6c3c26 100644
+index 21479bbd7d..615c16aced 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3330,6 +3330,15 @@ if test "$CURSES" = "no"; then
+@@ -3425,6 +3425,15 @@ if test "$CURSES" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
  fi
  
@@ -29,5 +29,5 @@ index d07e371c57..55ab6c3c26 100644
  
  AC_ARG_ENABLE(pydoc,
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0032-fix-building-on-older-distributions.patch b/package/python3/0032-fix-building-on-older-distributions.patch
index 69998a36dd..fb59e593f4 100644
--- a/package/python3/0032-fix-building-on-older-distributions.patch
+++ b/package/python3/0032-fix-building-on-older-distributions.patch
@@ -1,4 +1,4 @@
-From 3ddda00652f809a3bd8b4e3f7b0a3a4270b280a6 Mon Sep 17 00:00:00 2001
+From 94c62f96ca61f1a28124c837d7ec5ed0b9ae8786 Mon Sep 17 00:00:00 2001
 From: Adam Duskett <aduskett@gmail.com>
 Date: Thu, 16 Aug 2018 14:52:37 -0700
 Subject: [PATCH] fix building on older distributions
@@ -34,5 +34,5 @@ index 224585c69b..ef458c0c63 100644
          os.unlink(new_path)
  
 -- 
-2.20.1
+2.25.1
 
diff --git a/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index 2f5f7a8bf0..304a595fce 100644
--- a/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -1,4 +1,4 @@
-From 5932fedd9d1d43a230fa353df434f253e9d2b5a0 Mon Sep 17 00:00:00 2001
+From edc0757c56090364e0a95aabfa9f645a16a27569 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <peter@korsgaard.com>
 Date: Fri, 2 Aug 2019 15:53:16 +0200
 Subject: [PATCH] configure.ac: fixup $CC --print-multiarch output for
@@ -29,10 +29,10 @@ Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 55ab6c3c26..4a6d0662ac 100644
+index 615c16aced..241298e6cf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -706,7 +706,9 @@ then
+@@ -718,7 +718,9 @@ then
  fi
  
  
@@ -44,5 +44,5 @@ index 55ab6c3c26..4a6d0662ac 100644
  
  AC_MSG_CHECKING([for the platform triplet based on compiler characteristics])
 -- 
-2.20.1
+2.25.1
 
