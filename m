From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Fri, 28 May 2021 16:02:17 +0200
Subject: [Buildroot] [PATCH] package/fwts: bump to version 21.05.00
Message-ID: <20210528140218.9878-1-vincent.stehle@laposte.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update patch

Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
Cc: Erico Nunes <nunes.erico@gmail.com>
---
 .../fwts/0001-build-do-not-use-Werror.patch   | 33 +++++++++++--------
 package/fwts/fwts.hash                        |  2 +-
 package/fwts/fwts.mk                          |  2 +-
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/package/fwts/0001-build-do-not-use-Werror.patch b/package/fwts/0001-build-do-not-use-Werror.patch
index 07f64b35b1..715c4f63a5 100644
--- a/package/fwts/0001-build-do-not-use-Werror.patch
+++ b/package/fwts/0001-build-do-not-use-Werror.patch
@@ -1,7 +1,10 @@
-From 4c202c0fd7e5bd3264c720d715f05573047d9cf5 Mon Sep 17 00:00:00 2001
+From e481c2f990ffa71f205d4b9daf0823e71269a7f3 Mon Sep 17 00:00:00 2001
 From: Erico Nunes <nunes.erico@gmail.com>
 Date: Fri, 12 Aug 2016 23:11:56 +0200
 Subject: [PATCH] fwts: do not use -Werror
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Warnings come and go with various compiler versions, so using -Werror is
 prone to cause build failures with various compiler versions, especially
@@ -12,6 +15,8 @@ Remove use of -Werror.
 Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
 [Fabrice: updated for 20.08.00]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Vincent: rebased onto V21.05.00]
+Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
 ---
  configure.ac              | 2 +-
  src/Makefile.am           | 2 +-
@@ -20,7 +25,7 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  4 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0109d644..3ca599e1 100644
+index f40c3678..0ff5025b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -1,5 +1,5 @@
@@ -31,12 +36,12 @@ index 0109d644..3ca599e1 100644
  	  AC_CANONICAL_HOST
  	  AC_CONFIG_MACRO_DIR([m4])
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 52c637dd..d9d73f1c 100644
+index cdabb386..7c2e5730 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -14,7 +14,7 @@ AM_CPPFLAGS = \
- 	`pkg-config --silence-errors --cflags json` \
- 	`pkg-config --silence-errors --cflags json-c` \
+@@ -12,7 +12,7 @@ AM_CPPFLAGS = \
+ 	-I$(top_srcdir)/src/acpica/source/compiler	\
+ 	-I$(top_srcdir)/efi_runtime			\
  	-pthread `pkg-config --cflags glib-2.0 gio-2.0` \
 -	-Wall -Werror -Wextra				\
 +	-Wall -Wextra					\
@@ -44,10 +49,10 @@ index 52c637dd..d9d73f1c 100644
  	-Wfloat-equal -Wmissing-declarations		\
  	-Wno-long-long -Wredundant-decls -Wshadow	\
 diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
-index 54de7f44..e129ed16 100644
+index 55c52b41..50efa97a 100644
 --- a/src/lib/src/Makefile.am
 +++ b/src/lib/src/Makefile.am
-@@ -24,7 +24,7 @@ AM_CPPFLAGS = \
+@@ -25,7 +25,7 @@ AM_CPPFLAGS = \
  	`pkg-config --silence-errors --cflags json-c`	\
  	`pkg-config --cflags glib-2.0 gio-2.0` 		\
  	-DDATAROOTDIR=\"$(datarootdir)\"		\
@@ -57,18 +62,18 @@ index 54de7f44..e129ed16 100644
  
  pkglib_LTLIBRARIES = libfwts.la
 diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
-index aa37de55..4d5297cc 100644
+index 1fc0fc02..53614e33 100644
 --- a/src/utilities/Makefile.am
 +++ b/src/utilities/Makefile.am
 @@ -16,7 +16,7 @@
  # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  #
  
--AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
-+AM_CPPFLAGS = -Wall -Wextra -DDATAROOTDIR=\"$(datarootdir)\" \
- 	`pkg-config --silence-errors --cflags json` \
- 	`pkg-config --silence-errors --cflags json-c`
+-AM_CPPFLAGS = -Wall -Werror -Wextra -DDATAROOTDIR=\"$(datarootdir)\" 	\
++AM_CPPFLAGS = -Wall -Wextra -DDATAROOTDIR=\"$(datarootdir)\" 	\
+ 	-I$(srcdir)/../lib/include
  
+ bin_PROGRAMS = kernelscan
 -- 
-2.17.1
+2.30.2
 
diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 916035bda6..fc79a0b812 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256  02160657383a918a48c946a0ffb72c047d19a46f1455c29c0fff4d9ef7e48680  fwts-V21.02.00.tar.gz
+sha256  e2d6e8b0704eba859a567fb8764e5dc5385793fc26bd00ecc70e7af03fd2568d  fwts-V21.05.00.tar.gz
 
 # Hash for license file
 sha256  2003f5c8a1e40d7882f1499bd7adb7bc748c9656851abb28647a3d297c2e8e23  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index eaff7b786b..402a9e0b8f 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 21.02.00
+FWTS_VERSION = 21.05.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = http://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
-- 
2.30.2
