From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Jul 2014 12:42:39 +0200
Subject: [Buildroot] [PATCH 2/2] python3: bump to version 3.4.1
In-Reply-To: <1404816159-9152-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1404816159-9152-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1404816159-9152-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A few minor updates on the patches were needed to resolve some
conflicts on the main Makefile.pre.in file, in the list of modules to
build/install.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ython3-003-sysconfigdata-install-location.patch |  2 +-
 .../python3-006-cross-compile-getaddrinfo.patch    |  2 +-
 .../python3/python3-007-disable-extensions.patch   |  2 +-
 .../python3-100-optional-test-modules.patch        | 20 +++++++++++---------
 package/python3/python3-101-optional-pydoc.patch   | 14 +++++++-------
 package/python3/python3-102-optional-2to3.patch    | 22 +++++++++++-----------
 package/python3/python3-103-optional-sqlite.patch  | 21 ++++++++++-----------
 package/python3/python3-104-optional-tk.patch      |  8 ++++----
 package/python3/python3-105-optional-curses.patch  |  6 +++---
 package/python3/python3-106-optional-expat.patch   |  6 +++---
 .../python3/python3-107-optional-codecs-cjk.patch  |  2 +-
 package/python3/python3-108-optional-nis.patch     |  2 +-
 .../python3/python3-109-optional-unicodedata.patch |  2 +-
 package/python3/python3-110-optional-idle.patch    |  6 +++---
 package/python3/python3.mk                         |  2 +-
 15 files changed, 59 insertions(+), 58 deletions(-)

diff --git a/package/python3/python3-003-sysconfigdata-install-location.patch b/package/python3/python3-003-sysconfigdata-install-location.patch
index af796d4..1f230d4 100644
--- a/package/python3/python3-003-sysconfigdata-install-location.patch
+++ b/package/python3/python3-003-sysconfigdata-install-location.patch
@@ -52,7 +52,7 @@ Index: b/Makefile.pre.in
  	@for d in $(LIBSUBDIRS); \
  	do \
  		a=$(srcdir)/Lib/$$d; \
-@@ -1513,7 +1521,7 @@
+@@ -1514,7 +1522,7 @@
  	find build -name 'fficonfig.h' -exec rm -f {} ';' || true
  	find build -name '*.py' -exec rm -f {} ';' || true
  	find build -name '*.py[co]' -exec rm -f {} ';' || true
diff --git a/package/python3/python3-006-cross-compile-getaddrinfo.patch b/package/python3/python3-006-cross-compile-getaddrinfo.patch
index 512a534..7347be5 100644
--- a/package/python3/python3-006-cross-compile-getaddrinfo.patch
+++ b/package/python3/python3-006-cross-compile-getaddrinfo.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3423,7 +3423,7 @@
+@@ -3412,7 +3412,7 @@
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
diff --git a/package/python3/python3-007-disable-extensions.patch b/package/python3/python3-007-disable-extensions.patch
index 462fed4..63c06b1 100644
--- a/package/python3/python3-007-disable-extensions.patch
+++ b/package/python3/python3-007-disable-extensions.patch
@@ -73,7 +73,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2360,6 +2360,8 @@
+@@ -2349,6 +2349,8 @@
  
  AC_PATH_TOOL([PKG_CONFIG], [pkg-config])
  
diff --git a/package/python3/python3-100-optional-test-modules.patch b/package/python3/python3-100-optional-test-modules.patch
index 6b52509..f6214d0 100644
--- a/package/python3/python3-100-optional-test-modules.patch
+++ b/package/python3/python3-100-optional-test-modules.patch
@@ -42,16 +42,16 @@ Index: b/Makefile.pre.in
 +		curses pydoc_data $(MACHDEPS)
 +
 +TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
-+		test test/test_asyncio ctypes/test \
++		test test/test_asyncio \
 +		test/test_email test/test_email/data \
 +		test/test_json \
  		test/audiodata \
  		test/capath test/data \
  		test/cjkencodings test/decimaltestdata test/xmltestdata \
-@@ -1148,28 +1170,20 @@
- 		test/namespace_pkgs/project3/parent/child \
-                 test/namespace_pkgs/module_and_namespace_package \
-                 test/namespace_pkgs/module_and_namespace_package/a_test \
+@@ -1148,28 +1170,22 @@
+ 		test/test_importlib/namespace_pkgs/project3/parent/child \
+                 test/test_importlib/namespace_pkgs/module_and_namespace_package \
+                 test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
 -		asyncio \
 -		test/test_asyncio \
 -		collections concurrent concurrent/futures encodings \
@@ -61,6 +61,7 @@ Index: b/Makefile.pre.in
 -		sqlite3 sqlite3/test \
 -		logging csv wsgiref urllib \
 -		lib2to3 lib2to3/fixes lib2to3/pgen2 lib2to3/tests \
++		sqlite3/test \
 +		lib2to3/tests \
  		lib2to3/tests/data lib2to3/tests/data/fixers \
  		lib2to3/tests/data/fixers/myfixes \
@@ -68,7 +69,9 @@ Index: b/Makefile.pre.in
 -		idlelib idlelib/Icons idlelib/idle_test \
 -		distutils distutils/command distutils/tests $(XMLLIBSUBDIRS) \
 -		importlib test/test_importlib test/test_importlib/builtin \
-+		sqlite3/test idlelib/idle_test \
++		ctypes/test \
++		idlelib/idle_test \
++		distutils/tests \
 +		test/test_importlib test/test_importlib/builtin \
  		test/test_importlib/extension test/test_importlib/frozen \
  		test/test_importlib/import_ test/test_importlib/source \
@@ -77,8 +80,7 @@ Index: b/Makefile.pre.in
 -		unittest unittest/test unittest/test/testmock \
 -		venv venv/scripts venv/scripts/posix \
 -		curses pydoc_data $(MACHDEPS)
-+		unittest/test unittest/test/testmock \
-+		distutils/tests
++		unittest/test unittest/test/testmock
 +
 +ifeq (@TEST_MODULES@,yes)
 +LIBSUBDIRS += $(TESTSUBDIRS)
@@ -91,7 +93,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2667,6 +2667,12 @@
+@@ -2656,6 +2656,12 @@
  fi
  
  
diff --git a/package/python3/python3-101-optional-pydoc.patch b/package/python3/python3-101-optional-pydoc.patch
index 331c842..ddd5468 100644
--- a/package/python3/python3-101-optional-pydoc.patch
+++ b/package/python3/python3-101-optional-pydoc.patch
@@ -34,10 +34,10 @@ Index: b/Makefile.pre.in
 +		curses $(MACHDEPS)
  
  TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
- 		test test/test_asyncio ctypes/test \
-@@ -1180,6 +1182,10 @@
- 		unittest/test unittest/test/testmock \
- 		distutils/tests
+ 		test test/test_asyncio \
+@@ -1182,6 +1184,10 @@
+ 		test/test_importlib/import_ test/test_importlib/source \
+ 		unittest/test unittest/test/testmock
  
 +ifeq (@PYDOC@,yes)
 +LIBSUBDIRS += pydoc_data
@@ -50,7 +50,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2666,6 +2666,11 @@
+@@ -2655,6 +2655,11 @@
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -66,7 +66,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2182,6 +2182,12 @@
+@@ -2203,6 +2203,12 @@
      # turn off warnings when deprecated modules are imported
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
@@ -79,7 +79,7 @@ Index: b/setup.py
      setup(# PyPI Metadata (PEP 301)
            name = "Python",
            version = sys.version.split()[0],
-@@ -2206,8 +2212,7 @@
+@@ -2227,8 +2233,7 @@
            # If you change the scripts installed here, you also need to
            # check the PyBuildScripts command above, and change the links
            # created by the bininstall target in Makefile.pre.in
diff --git a/package/python3/python3-102-optional-2to3.patch b/package/python3/python3-102-optional-2to3.patch
index facf6e1..a23584f 100644
--- a/package/python3/python3-102-optional-2to3.patch
+++ b/package/python3/python3-102-optional-2to3.patch
@@ -34,17 +34,17 @@ Index: b/Makefile.pre.in
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
  		distutils distutils/command $(XMLLIBSUBDIRS) \
-@@ -1172,9 +1173,6 @@
- 		test/namespace_pkgs/project3/parent/child \
-                 test/namespace_pkgs/module_and_namespace_package \
-                 test/namespace_pkgs/module_and_namespace_package/a_test \
+@@ -1173,9 +1174,6 @@
+                 test/test_importlib/namespace_pkgs/module_and_namespace_package \
+                 test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
+ 		sqlite3/test \
 -		lib2to3/tests \
 -		lib2to3/tests/data lib2to3/tests/data/fixers \
 -		lib2to3/tests/data/fixers/myfixes \
- 		sqlite3/test idlelib/idle_test \
- 		test/test_importlib test/test_importlib/builtin \
- 		test/test_importlib/extension test/test_importlib/frozen \
-@@ -1186,6 +1184,14 @@
+ 		ctypes/test \
+ 		idlelib/idle_test \
+ 		distutils/tests \
+@@ -1188,6 +1186,14 @@
  LIBSUBDIRS += pydoc_data
  endif
  
@@ -59,7 +59,7 @@ Index: b/Makefile.pre.in
  ifeq (@TEST_MODULES@,yes)
  LIBSUBDIRS += $(TESTSUBDIRS)
  endif
-@@ -1281,10 +1287,12 @@
+@@ -1283,10 +1289,12 @@
  		-d $(LIBDEST)/site-packages -f $(STDLIB_CACHE_FLAGS) \
  		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
  endif
@@ -76,7 +76,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2183,10 +2183,11 @@
+@@ -2204,10 +2204,11 @@
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
@@ -94,7 +94,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2678,6 +2678,12 @@
+@@ -2667,6 +2667,12 @@
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
diff --git a/package/python3/python3-103-optional-sqlite.patch b/package/python3/python3-103-optional-sqlite.patch
index eb8d242..e444301 100644
--- a/package/python3/python3-103-optional-sqlite.patch
+++ b/package/python3/python3-103-optional-sqlite.patch
@@ -12,7 +12,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2666,6 +2666,15 @@
+@@ -2655,6 +2655,15 @@
        AC_CHECK_FUNCS(pthread_atfork)
  fi
  
@@ -40,16 +40,15 @@ Index: b/Makefile.pre.in
  		logging csv wsgiref urllib \
  		ctypes ctypes/macholib \
  		idlelib idlelib/Icons \
-@@ -1173,7 +1172,7 @@
- 		test/namespace_pkgs/project3/parent/child \
-                 test/namespace_pkgs/module_and_namespace_package \
-                 test/namespace_pkgs/module_and_namespace_package/a_test \
--		sqlite3/test idlelib/idle_test \
-+		idlelib/idle_test \
- 		test/test_importlib test/test_importlib/builtin \
- 		test/test_importlib/extension test/test_importlib/frozen \
- 		test/test_importlib/import_ test/test_importlib/source \
-@@ -1192,6 +1191,11 @@
+@@ -1173,7 +1172,6 @@
+ 		test/test_importlib/namespace_pkgs/project3/parent/child \
+                 test/test_importlib/namespace_pkgs/module_and_namespace_package \
+                 test/test_importlib/namespace_pkgs/module_and_namespace_package/a_test \
+-		sqlite3/test \
+ 		ctypes/test \
+ 		idlelib/idle_test \
+ 		distutils/tests \
+@@ -1194,6 +1192,11 @@
  	lib2to3/tests/data/fixers/myfixes
  endif
  
diff --git a/package/python3/python3-104-optional-tk.patch b/package/python3/python3-104-optional-tk.patch
index 32e2bee..0d15fe1 100644
--- a/package/python3/python3-104-optional-tk.patch
+++ b/package/python3/python3-104-optional-tk.patch
@@ -26,12 +26,12 @@ Index: b/Makefile.pre.in
  		curses $(MACHDEPS)
  
 -TESTSUBDIRS = 	tkinter/test tkinter/test/test_tkinter tkinter/test/test_ttk \
--		test test/test_asyncio ctypes/test \
-+TESTSUBDIRS = 	test test/test_asyncio ctypes/test \
+-		test test/test_asyncio \
++TESTSUBDIRS = 	test test/test_asyncio \
  		test/test_email test/test_email/data \
  		test/test_json \
  		test/audiodata \
-@@ -1196,6 +1195,12 @@
+@@ -1197,6 +1196,12 @@
  TESTSUBDIRS += sqlite3/test
  endif
  
@@ -48,7 +48,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2675,6 +2675,15 @@
+@@ -2664,6 +2664,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/python3-105-optional-curses.patch b/package/python3/python3-105-optional-curses.patch
index 75e2558..8e63908 100644
--- a/package/python3/python3-105-optional-curses.patch
+++ b/package/python3/python3-105-optional-curses.patch
@@ -19,9 +19,9 @@ Index: b/Makefile.pre.in
 -		curses $(MACHDEPS)
 +		$(MACHDEPS)
  
- TESTSUBDIRS = 	test test/test_asyncio ctypes/test \
+ TESTSUBDIRS = 	test test/test_asyncio \
  		test/test_email test/test_email/data \
-@@ -1201,6 +1201,10 @@
+@@ -1202,6 +1202,10 @@
  	tkinter/test/test_ttk
  endif
  
@@ -36,7 +36,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2684,6 +2684,15 @@
+@@ -2673,6 +2673,15 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python3/python3-106-optional-expat.patch b/package/python3/python3-106-optional-expat.patch
index 80da939..ce1eb2a 100644
--- a/package/python3/python3-106-optional-expat.patch
+++ b/package/python3/python3-106-optional-expat.patch
@@ -28,7 +28,7 @@ Index: b/Makefile.pre.in
  		importlib \
  		turtledemo \
  		multiprocessing multiprocessing/dummy \
-@@ -1205,6 +1205,10 @@
+@@ -1206,6 +1206,10 @@
  LIBSUBDIRS += curses
  endif
  
@@ -43,7 +43,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2363,13 +2363,21 @@
+@@ -2352,13 +2352,21 @@
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
@@ -74,7 +74,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -1396,7 +1396,7 @@
+@@ -1417,7 +1417,7 @@
          #
          # More information on Expat can be found at www.libexpat.org.
          #
diff --git a/package/python3/python3-107-optional-codecs-cjk.patch b/package/python3/python3-107-optional-codecs-cjk.patch
index f9d377d..0f261fc 100644
--- a/package/python3/python3-107-optional-codecs-cjk.patch
+++ b/package/python3/python3-107-optional-codecs-cjk.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2683,6 +2683,12 @@
+@@ -2672,6 +2672,12 @@
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/python3-108-optional-nis.patch b/package/python3/python3-108-optional-nis.patch
index 7ec5b19..de6057c 100644
--- a/package/python3/python3-108-optional-nis.patch
+++ b/package/python3/python3-108-optional-nis.patch
@@ -13,7 +13,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2689,6 +2689,12 @@
+@@ -2678,6 +2678,12 @@
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
diff --git a/package/python3/python3-109-optional-unicodedata.patch b/package/python3/python3-109-optional-unicodedata.patch
index 4b671ed..46e9a6f 100644
--- a/package/python3/python3-109-optional-unicodedata.patch
+++ b/package/python3/python3-109-optional-unicodedata.patch
@@ -10,7 +10,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2695,6 +2695,12 @@
+@@ -2684,6 +2684,12 @@
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python3/python3-110-optional-idle.patch b/package/python3/python3-110-optional-idle.patch
index f657cbd..4d5e70b 100644
--- a/package/python3/python3-110-optional-idle.patch
+++ b/package/python3/python3-110-optional-idle.patch
@@ -33,7 +33,7 @@ Index: b/Makefile.pre.in
  		distutils distutils/command \
  		importlib \
  		turtledemo \
-@@ -1209,6 +1210,10 @@
+@@ -1210,6 +1211,10 @@
  LIBSUBDIRS += $(XMLLIBSUBDIRS)
  endif
  
@@ -48,7 +48,7 @@ Index: b/configure.ac
 ===================================================================
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2737,6 +2737,12 @@
+@@ -2726,6 +2726,12 @@
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
@@ -65,7 +65,7 @@ Index: b/setup.py
 ===================================================================
 --- a/setup.py
 +++ b/setup.py
-@@ -2183,11 +2183,13 @@
+@@ -2204,11 +2204,13 @@
      import warnings
      warnings.filterwarnings("ignore",category=DeprecationWarning)
  
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 80ad88e..98fc31b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.4
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).0
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = http://python.org/ftp/python/$(PYTHON3_VERSION)
 
-- 
2.0.0
