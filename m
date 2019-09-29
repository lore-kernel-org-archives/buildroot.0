From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Sep 2019 09:44:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/fwts: bump to version 19.09.00
Message-ID: <20190929074421.19282-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- fix up the 'V' prefix in the version: in order for the fwts version to
  match what is given by release-monitoring.org, the 'V' prefix should
  be encoded in FWTS_SOURCE and not FWTS_VERSION
- Update patch
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fwts/0001-build-do-not-use-Werror.patch | 14 ++++++++------
 package/fwts/fwts.hash                          |  5 ++++-
 package/fwts/fwts.mk                            |  3 ++-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/package/fwts/0001-build-do-not-use-Werror.patch b/package/fwts/0001-build-do-not-use-Werror.patch
index 2dbf5313d5..c3ea2efc22 100644
--- a/package/fwts/0001-build-do-not-use-Werror.patch
+++ b/package/fwts/0001-build-do-not-use-Werror.patch
@@ -10,6 +10,8 @@ newer versions that introduce new warnings.
 Remove use of -Werror.
 
 Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
+[Fabrice: updated for 19.09.00]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  configure.ac              | 2 +-
  src/Makefile.am           | 2 +-
@@ -36,11 +38,11 @@ index 52c637dd..d9d73f1c 100644
  	`pkg-config --silence-errors --cflags json` \
  	`pkg-config --silence-errors --cflags json-c` \
  	-pthread `pkg-config --cflags glib-2.0 gio-2.0` \
--	-Wall -Werror -Wextra
-+	-Wall -Wextra
+-	-Wall -Werror -Wextra				\
++	-Wall -Wextra					\
+ 	-Wno-address-of-packed-member
  
  bin_PROGRAMS = fwts
- 
 diff --git a/src/lib/src/Makefile.am b/src/lib/src/Makefile.am
 index 54de7f44..e129ed16 100644
 --- a/src/lib/src/Makefile.am
@@ -49,11 +51,11 @@ index 54de7f44..e129ed16 100644
  	`pkg-config --silence-errors --cflags json-c`	\
  	`pkg-config --cflags glib-2.0 gio-2.0` 		\
  	-DDATAROOTDIR=\"$(datarootdir)\"		\
--	-Wall -Werror -Wextra
-+	-Wall -Wextra
+-	-Wall -Werror -Wextra				\
++	-Wall -Wextra					\
+ 	-Wno-address-of-packed-member
  
  pkglib_LTLIBRARIES = libfwts.la
- 
 diff --git a/src/utilities/Makefile.am b/src/utilities/Makefile.am
 index aa37de55..4d5297cc 100644
 --- a/src/utilities/Makefile.am
diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index c3f3b57801..6338077732 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,2 +1,5 @@
 # Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256 7fcdcf3acecfb92510fcb2faef3ab0db66f639bf3f068cf77a4e0aebba036f93 fwts-V18.09.00.tar.gz
+sha256 91075982d067deef86d2830d622c27ed5f5c0b04dfd712902343a67fee753bfd fwts-V19.09.00.tar.gz
+
+# Hash for license file
+sha256 9cfdcde669bcdbd2eb640dca6ed3f9b5ae381d100ac208f9dca6e12e61ad639c debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index b29de2cf25..853f27af49 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-FWTS_VERSION = V18.09.00
+FWTS_VERSION = 19.09.00
+FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = http://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
 FWTS_LICENSE = GPL-2.0, LGPL-2.1, Custom
-- 
2.23.0
