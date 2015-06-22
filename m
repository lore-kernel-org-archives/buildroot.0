From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 Jun 2015 23:13:46 +0200
Subject: [Buildroot] [git commit] python: bump to 2.7.10
Message-ID: <20150622211449.83C5580776@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7076e6f61cbcd45f463eb70ab1ffbb8ff7f27819
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches are simply refreshed, except
004-sysconfigdata-install-location.patch where a minor conflict
resolution was needed.

[Peter: fixup .hash as pointed out by Arnout]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../004-sysconfigdata-install-location.patch       |    4 ++--
 package/python/005-pyc-pyo-conditional.patch       |    2 +-
 package/python/006-cross-compile-getaddrinfo.patch |    2 +-
 package/python/007-disable-extensions.patch        |    4 ++--
 package/python/010-fix-python-config.patch         |    8 ++++----
 package/python/013-dont-add-multiarch-path.patch   |    2 +-
 package/python/100-optional-test-modules.patch     |    2 +-
 package/python/101-optional-pydoc.patch            |    6 +++---
 package/python/102-optional-2to3.patch             |    4 ++--
 package/python/103-optional-sqlite.patch           |    2 +-
 package/python/104-optional-tk.patch               |    2 +-
 package/python/105-optional-curses.patch           |    2 +-
 package/python/106-optional-expat.patch            |    4 ++--
 package/python/107-optional-codecs-cjk.patch       |    2 +-
 package/python/108-optional-nis.patch              |    2 +-
 package/python/109-optional-unicodedata.patch      |    2 +-
 package/python/110-optional-db.patch               |    2 +-
 package/python/111-optional-ssl.patch              |    2 +-
 package/python/112-optional-bzip2.patch            |    2 +-
 package/python/113-optional-zlib.patch             |    2 +-
 package/python/114-remove-idle-editor.patch        |    2 +-
 package/python/115-optional-ossaudiodev.patch      |    9 +++------
 package/python/python.hash                         |    6 ++++--
 package/python/python.mk                           |    2 +-
 24 files changed, 38 insertions(+), 39 deletions(-)

diff --git a/package/python/004-sysconfigdata-install-location.patch b/package/python/004-sysconfigdata-install-location.patch
index a72db1a..edf7120 100644
--- a/package/python/004-sysconfigdata-install-location.patch
+++ b/package/python/004-sysconfigdata-install-location.patch
@@ -69,8 +69,8 @@ Index: b/configure.ac
  	    AC_MSG_ERROR([python$PACKAGE_VERSION interpreter not found])
  	fi
          AC_MSG_RESULT($interp)
--	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
-+	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pysysconfigdatadir.txt && echo $(abs_builddir)/`cat pysysconfigdatadir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/plat-$(MACHDEP) '$interp
+-	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pybuilddir.txt && echo $(abs_builddir)/`cat pybuilddir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
++	PYTHON_FOR_BUILD='_PYTHON_PROJECT_BASE=$(abs_builddir) _PYTHON_HOST_PLATFORM=$(_PYTHON_HOST_PLATFORM) PYTHONPATH=$(shell test -f pysysconfigdatadir.txt && echo $(abs_builddir)/`cat pysysconfigdatadir.txt`:)$(srcdir)/Lib:$(srcdir)/Lib/$(PLATDIR) '$interp
      fi
  elif test "$cross_compiling" = maybe; then
      AC_MSG_ERROR([Cross compiling required --host=HOST-TUPLE and --build=ARCH])
diff --git a/package/python/005-pyc-pyo-conditional.patch b/package/python/005-pyc-pyo-conditional.patch
index 0a2f727..1b677df 100644
--- a/package/python/005-pyc-pyo-conditional.patch
+++ b/package/python/005-pyc-pyo-conditional.patch
@@ -39,7 +39,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -736,6 +736,17 @@
+@@ -739,6 +739,17 @@
      ;;
  esac
  
diff --git a/package/python/006-cross-compile-getaddrinfo.patch b/package/python/006-cross-compile-getaddrinfo.patch
index ba6e6f0..dd44ec1 100644
--- a/package/python/006-cross-compile-getaddrinfo.patch
+++ b/package/python/006-cross-compile-getaddrinfo.patch
@@ -2,7 +2,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3346,7 +3346,7 @@
+@@ -3353,7 +3353,7 @@
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
diff --git a/package/python/007-disable-extensions.patch b/package/python/007-disable-extensions.patch
index be4d943..9365cb1 100644
--- a/package/python/007-disable-extensions.patch
+++ b/package/python/007-disable-extensions.patch
@@ -33,9 +33,9 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2284,6 +2284,8 @@
+@@ -2290,6 +2290,8 @@
  
- AC_PATH_TOOL([PKG_CONFIG], [pkg-config])
+ PKG_PROG_PKG_CONFIG
  
 +AC_SUBST(DISABLED_EXTENSIONS)
 +
diff --git a/package/python/010-fix-python-config.patch b/package/python/010-fix-python-config.patch
index 2beb233..1266f3d 100644
--- a/package/python/010-fix-python-config.patch
+++ b/package/python/010-fix-python-config.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -882,6 +882,7 @@
+@@ -885,6 +885,7 @@
  
  # Other platforms follow
  if test $enable_shared = "yes"; then
@@ -18,7 +18,7 @@ Index: b/configure.ac
    AC_DEFINE(Py_ENABLE_SHARED, 1, [Defined if Python is built as a shared library.])
    case $ac_sys_system in
      BeOS*)
-@@ -942,6 +943,7 @@
+@@ -945,6 +946,7 @@
  
    esac
  else # shared is disabled
@@ -26,7 +26,7 @@ Index: b/configure.ac
    case $ac_sys_system in
      CYGWIN*)
            BLDLIBRARY='$(LIBRARY)'
-@@ -1918,6 +1920,9 @@
+@@ -1921,6 +1923,9 @@
  AC_SUBST(BLDSHARED)
  AC_SUBST(CCSHARED)
  AC_SUBST(LINKFORSHARED)
@@ -36,7 +36,7 @@ Index: b/configure.ac
  # SO is the extension of shared libraries `(including the dot!)
  # -- usually .so, .sl on HP-UX, .dll on Cygwin
  AC_MSG_CHECKING(SO)
-@@ -4581,7 +4586,7 @@
+@@ -4588,7 +4593,7 @@
  AC_SUBST(ENSUREPIP)
  
  # generate output files
diff --git a/package/python/013-dont-add-multiarch-path.patch b/package/python/013-dont-add-multiarch-path.patch
index 24e7af9..94fcb0f 100644
--- a/package/python/013-dont-add-multiarch-path.patch
+++ b/package/python/013-dont-add-multiarch-path.patch
@@ -14,7 +14,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -456,9 +456,9 @@
+@@ -445,9 +445,9 @@
          if not cross_compiling:
              add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
              add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
diff --git a/package/python/100-optional-test-modules.patch b/package/python/100-optional-test-modules.patch
index 1180b29..3de6f26 100644
--- a/package/python/100-optional-test-modules.patch
+++ b/package/python/100-optional-test-modules.patch
@@ -79,7 +79,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2628,6 +2628,12 @@
+@@ -2634,6 +2634,12 @@
  fi
  
  
diff --git a/package/python/101-optional-pydoc.patch b/package/python/101-optional-pydoc.patch
index d5dc3d7..143e11a 100644
--- a/package/python/101-optional-pydoc.patch
+++ b/package/python/101-optional-pydoc.patch
@@ -40,7 +40,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2627,6 +2627,11 @@
+@@ -2633,6 +2633,11 @@
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -56,7 +56,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2222,6 +2222,12 @@
+@@ -2211,6 +2211,12 @@
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -69,7 +69,7 @@ Index: b/setup.py
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2242,9 +2248,7 @@
+@@ -2231,9 +2237,7 @@
            ext_modules=[Extension('_struct', ['_struct.c'])],
  
            # Scripts to install
diff --git a/package/python/102-optional-2to3.patch b/package/python/102-optional-2to3.patch
index 76edfa1..100c417 100644
--- a/package/python/102-optional-2to3.patch
+++ b/package/python/102-optional-2to3.patch
@@ -52,7 +52,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2639,6 +2639,12 @@
+@@ -2645,6 +2645,12 @@
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
@@ -69,7 +69,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2223,10 +2223,11 @@
+@@ -2212,10 +2212,11 @@
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python/103-optional-sqlite.patch b/package/python/103-optional-sqlite.patch
index eb43c7a..3a48011 100644
--- a/package/python/103-optional-sqlite.patch
+++ b/package/python/103-optional-sqlite.patch
@@ -12,7 +12,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2627,6 +2627,15 @@
+@@ -2633,6 +2633,15 @@
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
diff --git a/package/python/104-optional-tk.patch b/package/python/104-optional-tk.patch
index f402e42..18024d3 100644
--- a/package/python/104-optional-tk.patch
+++ b/package/python/104-optional-tk.patch
@@ -48,7 +48,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2636,6 +2636,15 @@
+@@ -2642,6 +2642,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python/105-optional-curses.patch b/package/python/105-optional-curses.patch
index a73fb04..9e1ac5a 100644
--- a/package/python/105-optional-curses.patch
+++ b/package/python/105-optional-curses.patch
@@ -36,7 +36,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2645,6 +2645,15 @@
+@@ -2651,6 +2651,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python/106-optional-expat.patch b/package/python/106-optional-expat.patch
index 1ee117c..6ebaf16 100644
--- a/package/python/106-optional-expat.patch
+++ b/package/python/106-optional-expat.patch
@@ -43,7 +43,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2292,13 +2292,21 @@
+@@ -2298,13 +2298,21 @@
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -74,7 +74,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -1474,7 +1474,7 @@
+@@ -1463,7 +1463,7 @@
          #
          # More information on Expat can be found at www.libexpat.org.
          #
diff --git a/package/python/107-optional-codecs-cjk.patch b/package/python/107-optional-codecs-cjk.patch
index 6329b0c..22a2fed 100644
--- a/package/python/107-optional-codecs-cjk.patch
+++ b/package/python/107-optional-codecs-cjk.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2644,6 +2644,12 @@
+@@ -2650,6 +2650,12 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python/108-optional-nis.patch b/package/python/108-optional-nis.patch
index f07bbb6..d19ebe1 100644
--- a/package/python/108-optional-nis.patch
+++ b/package/python/108-optional-nis.patch
@@ -13,7 +13,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2650,6 +2650,12 @@
+@@ -2656,6 +2656,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk"
    	  fi])
  
diff --git a/package/python/109-optional-unicodedata.patch b/package/python/109-optional-unicodedata.patch
index 10da1ea..841f2a7 100644
--- a/package/python/109-optional-unicodedata.patch
+++ b/package/python/109-optional-unicodedata.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2656,6 +2656,12 @@
+@@ -2662,6 +2662,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/110-optional-db.patch b/package/python/110-optional-db.patch
index 4b54e24..b8c454c 100644
--- a/package/python/110-optional-db.patch
+++ b/package/python/110-optional-db.patch
@@ -49,7 +49,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2656,6 +2656,28 @@
+@@ -2662,6 +2662,28 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/111-optional-ssl.patch b/package/python/111-optional-ssl.patch
index 72891cd..956d2a0 100644
--- a/package/python/111-optional-ssl.patch
+++ b/package/python/111-optional-ssl.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2656,6 +2656,12 @@
+@@ -2662,6 +2662,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python/112-optional-bzip2.patch b/package/python/112-optional-bzip2.patch
index 3a646e1..99fe83c 100644
--- a/package/python/112-optional-bzip2.patch
+++ b/package/python/112-optional-bzip2.patch
@@ -9,7 +9,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2662,6 +2662,12 @@
+@@ -2668,6 +2668,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl"
    	  fi])
  
diff --git a/package/python/113-optional-zlib.patch b/package/python/113-optional-zlib.patch
index a4ca8bd..652a586 100644
--- a/package/python/113-optional-zlib.patch
+++ b/package/python/113-optional-zlib.patch
@@ -9,7 +9,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2668,6 +2668,12 @@
+@@ -2674,6 +2674,12 @@
              DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} bz2"
           fi])
  
diff --git a/package/python/114-remove-idle-editor.patch b/package/python/114-remove-idle-editor.patch
index 67b9050..512eedc 100644
--- a/package/python/114-remove-idle-editor.patch
+++ b/package/python/114-remove-idle-editor.patch
@@ -32,7 +32,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2223,7 +2223,7 @@
+@@ -2212,7 +2212,7 @@
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python/115-optional-ossaudiodev.patch b/package/python/115-optional-ossaudiodev.patch
index de82036..89335ba 100644
--- a/package/python/115-optional-ossaudiodev.patch
+++ b/package/python/115-optional-ossaudiodev.patch
@@ -8,11 +8,11 @@ Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
  configure.ac | 6 ++++++
  1 file changed, 6 insertions(+)
 
-diff --git a/configure.ac b/configure.ac
-index e8cb52a..579e05b 100644
+Index: b/configure.ac
+===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2717,6 +2717,12 @@ if test "$CURSES" = "no"; then
+@@ -2726,6 +2726,12 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
  fi
  
@@ -25,6 +25,3 @@ index e8cb52a..579e05b 100644
  AC_SUBST(PYDOC)
  
  AC_ARG_ENABLE(pydoc,
--- 
-2.1.0
-
diff --git a/package/python/python.hash b/package/python/python.hash
index f741e85..ef8dd98 100644
--- a/package/python/python.hash
+++ b/package/python/python.hash
@@ -1,2 +1,4 @@
-# Locally calculated after checking pgp signature
-sha256	90d27e14ea7e03570026850e2e50ba71ad20b7eb31035aada1cf3def8f8d4916	Python-2.7.9.tar.xz
+# From https://www.python.org/downloads/release/python-2710/
+md5	c685ef0b8e9f27b5e3db5db12b268ac6	Python-2.7.10.tar.xz
+# Locally calculated
+sha256	1cd3730781b91caf0fa1c4d472dc29274186480161a150294c42ce9b5c5effc0	Python-2.7.10.tar.xz
diff --git a/package/python/python.mk b/package/python/python.mk
index 4a3e71c..80ffbde 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).9
+PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).10
 PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
 PYTHON_SITE = http://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE = Python software foundation license v2, others
