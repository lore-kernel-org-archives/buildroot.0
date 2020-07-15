From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 23:07:40 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python3: security
 bump to version 3.8.3
Message-ID: <20200715210441.A5D2087471@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbe6c566a9c1d6d3989499b1ccb5a2deeca6281b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

- bpo-40121: Fixes audit events raised on creating a new socket

- bpo-38576: Disallow control characters in hostnames in http.client,
  addressing CVE-2019-18348.  Such potentially malicious header injection
  URLs now cause a InvalidURL to be raised.

- bpo-39503: CVE-2020-8492: The AbstractBasicAuthHandler class of the
  urllib.request module uses an inefficient regular expression which can be
  exploited by an attacker to cause a denial of service.  Fix the regex to
  prevent the catastrophic backtracking.  Vulnerability reported by Ben
  Caller and Matt Schwager.

For more details, see the changelog:
https://docs.python.org/release/3.8.3/whatsnew/changelog.html#security

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5ff01eb31fde46bb51fe7b0072871344acdaa405)
[Peter: mention security impact]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/0001-Make-the-build-of-pyc-files-conditional.patch  | 2 +-
 .../0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch | 2 +-
 .../0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch | 2 +-
 .../0013-Add-an-option-to-disable-installation-of-test-module.patch | 2 +-
 package/python3/0014-Add-an-option-to-disable-pydoc.patch           | 2 +-
 package/python3/0015-Add-an-option-to-disable-lib2to3.patch         | 2 +-
 package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch | 2 +-
 package/python3/0017-Add-an-option-to-disable-the-tk-module.patch   | 2 +-
 .../python3/0018-Add-an-option-to-disable-the-curses-module.patch   | 2 +-
 package/python3/0019-Add-an-option-to-disable-expat.patch           | 2 +-
 package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch      | 2 +-
 package/python3/0021-Add-an-option-to-disable-NIS.patch             | 2 +-
 package/python3/0022-Add-an-option-to-disable-unicodedata.patch     | 2 +-
 package/python3/0023-Add-an-option-to-disable-IDLE.patch            | 2 +-
 package/python3/0024-Add-an-option-to-disable-decimal.patch         | 6 +++---
 .../0025-Add-an-option-to-disable-the-ossaudiodev-module.patch      | 6 +++---
 package/python3/0026-Add-an-option-to-disable-openssl-support.patch | 2 +-
 .../python3/0027-Add-an-option-to-disable-the-readline-module.patch | 2 +-
 .../0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch     | 2 +-
 package/python3/0031-Add-an-option-to-disable-uuid-module.patch     | 2 +-
 .../0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch | 2 +-
 package/python3/python3.hash                                        | 6 +++---
 package/python3/python3.mk                                          | 2 +-
 23 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
index 00a6884771..1010d08d53 100644
--- a/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
+++ b/package/python3/0001-Make-the-build-of-pyc-files-conditional.patch
@@ -38,7 +38,7 @@ diff --git a/configure.ac b/configure.ac
 index a189d42c2c..4690cdba9f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1085,6 +1085,12 @@ fi
+@@ -1091,6 +1091,12 @@ fi
  
  AC_MSG_CHECKING(LDLIBRARY)
  
diff --git a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
index 95db44a4d3..e9e5b32ca2 100644
--- a/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
+++ b/package/python3/0002-Disable-buggy_getaddrinfo-configure-test-when-cross-.patch
@@ -13,7 +13,7 @@ diff --git a/configure.ac b/configure.ac
 index 4690cdba9f..ffeec102b7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -4059,7 +4059,7 @@ fi
+@@ -4080,7 +4080,7 @@ fi
  
  AC_MSG_RESULT($ac_cv_buggy_getaddrinfo)
  
diff --git a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
index 9bdd9b4897..c4620949bd 100644
--- a/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
+++ b/package/python3/0003-Add-infrastructure-to-disable-the-build-of-certain-e.patch
@@ -78,7 +78,7 @@ diff --git a/configure.ac b/configure.ac
 index ffeec102b7..7872b4dfee 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2952,6 +2952,8 @@ LIBS="$withval $LIBS"
+@@ -2958,6 +2958,8 @@ LIBS="$withval $LIBS"
  
  PKG_PROG_PKG_CONFIG
  
diff --git a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
index d34a2883ad..675c2c1abf 100644
--- a/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python3/0013-Add-an-option-to-disable-installation-of-test-module.patch
@@ -95,7 +95,7 @@ diff --git a/configure.ac b/configure.ac
 index 7872b4dfee..b820d18c7c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3213,6 +3213,11 @@ if test "$posix_threads" = "yes"; then
+@@ -3234,6 +3234,11 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
diff --git a/package/python3/0014-Add-an-option-to-disable-pydoc.patch b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
index cdcabc0c11..a3436e31bf 100644
--- a/package/python3/0014-Add-an-option-to-disable-pydoc.patch
+++ b/package/python3/0014-Add-an-option-to-disable-pydoc.patch
@@ -54,7 +54,7 @@ diff --git a/configure.ac b/configure.ac
 index b820d18c7c..f53cc86d89 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3213,6 +3213,12 @@ if test "$posix_threads" = "yes"; then
+@@ -3234,6 +3234,12 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
diff --git a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
index 03064612a0..1bd1ae511f 100644
--- a/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
+++ b/package/python3/0015-Add-an-option-to-disable-lib2to3.patch
@@ -80,7 +80,7 @@ diff --git a/configure.ac b/configure.ac
 index f53cc86d89..caa8eaf88a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3225,6 +3225,12 @@ AC_ARG_ENABLE(test-modules,
+@@ -3246,6 +3246,12 @@ AC_ARG_ENABLE(test-modules,
  	AS_HELP_STRING([--disable-test-modules], [disable test modules]),
  	[ TEST_MODULES="${enableval}" ], [ TEST_MODULES=yes ])
  
diff --git a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
index 4f5e0dbd86..364d1b1ec8 100644
--- a/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
+++ b/package/python3/0016-Add-option-to-disable-the-sqlite3-module.patch
@@ -48,7 +48,7 @@ diff --git a/configure.ac b/configure.ac
 index caa8eaf88a..79a8255f44 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3213,6 +3213,15 @@ if test "$posix_threads" = "yes"; then
+@@ -3234,6 +3234,15 @@ if test "$posix_threads" = "yes"; then
        AC_CHECK_FUNCS(pthread_getcpuclockid)
  fi
  
diff --git a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
index b248ecd40c..eb0ad26daa 100644
--- a/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
+++ b/package/python3/0017-Add-an-option-to-disable-the-tk-module.patch
@@ -52,7 +52,7 @@ diff --git a/configure.ac b/configure.ac
 index 79a8255f44..b5922451cc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3222,6 +3222,15 @@ if test "$SQLITE3" = "no" ; then
+@@ -3243,6 +3243,15 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
index d442f7b807..0628669b93 100644
--- a/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
+++ b/package/python3/0018-Add-an-option-to-disable-the-curses-module.patch
@@ -41,7 +41,7 @@ diff --git a/configure.ac b/configure.ac
 index b5922451cc..ea422a86a9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3231,6 +3231,15 @@ if test "$TK" = "no"; then
+@@ -3252,6 +3252,15 @@ if test "$TK" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _tkinter"
  fi
  
diff --git a/package/python3/0019-Add-an-option-to-disable-expat.patch b/package/python3/0019-Add-an-option-to-disable-expat.patch
index 3015d1e107..e31f3e105e 100644
--- a/package/python3/0019-Add-an-option-to-disable-expat.patch
+++ b/package/python3/0019-Add-an-option-to-disable-expat.patch
@@ -47,7 +47,7 @@ diff --git a/configure.ac b/configure.ac
 index ea422a86a9..3c1e2c088d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2955,13 +2955,21 @@ PKG_PROG_PKG_CONFIG
+@@ -2961,13 +2961,21 @@ PKG_PROG_PKG_CONFIG
  AC_SUBST(DISABLED_EXTENSIONS)
  
  # Check for use of the system expat library
diff --git a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
index dfe8614a5d..1b18c54591 100644
--- a/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
+++ b/package/python3/0020-Add-an-option-to-disable-CJK-codecs.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 3c1e2c088d..30a92f9c2e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3230,6 +3230,12 @@ if test "$SQLITE3" = "no" ; then
+@@ -3251,6 +3251,12 @@ if test "$SQLITE3" = "no" ; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _sqlite3"
  fi
  
diff --git a/package/python3/0021-Add-an-option-to-disable-NIS.patch b/package/python3/0021-Add-an-option-to-disable-NIS.patch
index 35bfe5aed9..71645be9f4 100644
--- a/package/python3/0021-Add-an-option-to-disable-NIS.patch
+++ b/package/python3/0021-Add-an-option-to-disable-NIS.patch
@@ -15,7 +15,7 @@ diff --git a/configure.ac b/configure.ac
 index 30a92f9c2e..20f326db46 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3236,6 +3236,12 @@ AC_ARG_ENABLE(codecs-cjk,
+@@ -3257,6 +3257,12 @@ AC_ARG_ENABLE(codecs-cjk,
  		DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _codecs_kr _codecs_jp _codecs_cn _codecs_tw _codecs_hk _codecs_iso2022"
  	fi])
  
diff --git a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
index a8ec0e499f..3805e1aad9 100644
--- a/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
+++ b/package/python3/0022-Add-an-option-to-disable-unicodedata.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 20f326db46..99bbc37b07 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3242,6 +3242,12 @@ AC_ARG_ENABLE(nis,
+@@ -3263,6 +3263,12 @@ AC_ARG_ENABLE(nis,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} nis"
    	  fi])
  
diff --git a/package/python3/0023-Add-an-option-to-disable-IDLE.patch b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
index bb23879e34..3a138f966f 100644
--- a/package/python3/0023-Add-an-option-to-disable-IDLE.patch
+++ b/package/python3/0023-Add-an-option-to-disable-IDLE.patch
@@ -52,7 +52,7 @@ diff --git a/configure.ac b/configure.ac
 index 99bbc37b07..8c9706582e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3284,6 +3284,12 @@ AC_ARG_ENABLE(lib2to3,
+@@ -3305,6 +3305,12 @@ AC_ARG_ENABLE(lib2to3,
  	AS_HELP_STRING([--disable-lib2to3], [disable lib2to3]),
  	[ LIB2TO3="${enableval}" ], [ LIB2TO3=yes ])
  
diff --git a/package/python3/0024-Add-an-option-to-disable-decimal.patch b/package/python3/0024-Add-an-option-to-disable-decimal.patch
index 7d96f5c416..5906f9d385 100644
--- a/package/python3/0024-Add-an-option-to-disable-decimal.patch
+++ b/package/python3/0024-Add-an-option-to-disable-decimal.patch
@@ -20,7 +20,7 @@ diff --git a/configure.ac b/configure.ac
 index 8c9706582e..e6255babb6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3006,13 +3006,20 @@ fi
+@@ -3012,13 +3012,20 @@ fi
  AC_SUBST(LIBFFI_INCLUDEDIR)
  
  # Check for use of the system libmpdec library
@@ -44,8 +44,8 @@ index 8c9706582e..e6255babb6 100644
 +fi
 +AC_SUBST(MPDEC)
  
- # Check for support for loadable sqlite extensions
- AC_MSG_CHECKING(for --enable-loadable-sqlite-extensions)
+ # Check whether _decimal should use a coroutine-local or thread-local context
+ AC_MSG_CHECKING(for --with-decimal-contextvar)
 diff --git a/setup.py b/setup.py
 index 9f09b3d985..a7f2e23d87 100644
 --- a/setup.py
diff --git a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
index 56f56adfcb..55ba22a0e5 100644
--- a/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
+++ b/package/python3/0025-Add-an-option-to-disable-the-ossaudiodev-module.patch
@@ -12,9 +12,9 @@ diff --git a/configure.ac b/configure.ac
 index e6255babb6..5809233aac 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3021,6 +3021,12 @@ else
- fi
- AC_SUBST(MPDEC)
+@@ -3042,6 +3042,12 @@ fi
+ 
+ AC_MSG_RESULT($with_decimal_contextvar)
  
 +AC_ARG_ENABLE(ossaudiodev,
 +	AS_HELP_STRING([--disable-ossaudiodev], [disable OSSAUDIODEV]),
diff --git a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
index ced3fa93e7..814ffdb561 100644
--- a/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
+++ b/package/python3/0026-Add-an-option-to-disable-openssl-support.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 5809233aac..6b09bafda4 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3261,6 +3261,12 @@ AC_ARG_ENABLE(unicodedata,
+@@ -3282,6 +3282,12 @@ AC_ARG_ENABLE(unicodedata,
      	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} unicodedata"
    	  fi])
  
diff --git a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
index e70c9984e4..30651244f4 100644
--- a/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
+++ b/package/python3/0027-Add-an-option-to-disable-the-readline-module.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index 6b09bafda4..b64518eed5 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3267,6 +3267,12 @@ AC_ARG_ENABLE(openssl,
+@@ -3288,6 +3288,12 @@ AC_ARG_ENABLE(openssl,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} ssl _ssl _hashlib"
  	  fi])
  
diff --git a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
index 004b3d1c8f..330b549c01 100644
--- a/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
+++ b/package/python3/0028-Add-options-to-disable-zlib-bzip2-and-xz-modules.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index b64518eed5..d07e371c57 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3273,6 +3273,24 @@ AC_ARG_ENABLE(readline,
+@@ -3294,6 +3294,24 @@ AC_ARG_ENABLE(readline,
  	     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} readline"
  	  fi])
  
diff --git a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch b/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
index a777475c9e..6ea5f68590 100644
--- a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
+++ b/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
@@ -12,7 +12,7 @@ diff --git a/configure.ac b/configure.ac
 index d07e371c57..55ab6c3c26 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -3309,6 +3309,15 @@ if test "$CURSES" = "no"; then
+@@ -3330,6 +3330,15 @@ if test "$CURSES" = "no"; then
     DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
  fi
  
diff --git a/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch b/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
index 5a5a104dc5..2f5f7a8bf0 100644
--- a/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
+++ b/package/python3/0033-configure.ac-fixup-CC-print-multiarch-output-for-mus.patch
@@ -32,7 +32,7 @@ diff --git a/configure.ac b/configure.ac
 index 55ab6c3c26..4a6d0662ac 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -700,7 +700,9 @@ then
+@@ -706,7 +706,9 @@ then
  fi
  
  
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index cb7c6b2f25..fc34e8aa59 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-382/
-md5  e9d6ebc92183a177b8e8a58cad5b8d67  Python-3.8.2.tar.xz
+# From https://www.python.org/downloads/release/python-383/
+md5  3000cf50aaa413052aef82fd2122ca78  Python-3.8.3.tar.xz
 # Locally computed
-sha256  2646e7dc233362f59714c6193017bb2d6f7b38d6ab4a0cb5fbac5c36c4d845df  Python-3.8.2.tar.xz
+sha256  dfab5ec723c218082fe3d5d7ae17ecbdebffa9a1aea4d64aa3a2ecdd2e795864  Python-3.8.3.tar.xz
 sha256  de4d1f2d2ad5ad0cfd1657a106476b31cb5db5ef9d1ff842b237c0c81f0c8a23  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 2656037efd..4e43027cff 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.8
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).3
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
