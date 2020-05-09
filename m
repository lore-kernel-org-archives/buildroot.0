From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 May 2020 16:47:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/cvs: add license
Message-ID: <20200509144709.3442939-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CVS is licensed under GPL-1.0+ as stated in README (referenced in source
code) and COPYING files.
COPYING.LIB also give the terms of LGPL-2.0+ but it does not seem to be
referenced in the source code (it is only referenced in ChangeLog and
Makefile.in)

Also update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cvs/cvs.hash | 7 +++++--
 package/cvs/cvs.mk   | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/cvs/cvs.hash b/package/cvs/cvs.hash
index b386d887b7..247733aef2 100644
--- a/package/cvs/cvs.hash
+++ b/package/cvs/cvs.hash
@@ -1,3 +1,6 @@
 # From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs/cvs_1.12.13-12%2Bsqueeze1.dsc
-sha256	b5961c2476b996e5758fa5e22b60af085adca41164cac0d8f68a1d3b49d4e4f1	cvs_1.12.13.orig.tar.gz
-sha256	d52a9232d9cf36302a150d782fc7e5b6f92f8115505ae8a7dc6acfc83e809d2f	cvs_1.12.13-12+squeeze1.diff.gz
+sha256  b5961c2476b996e5758fa5e22b60af085adca41164cac0d8f68a1d3b49d4e4f1  cvs_1.12.13.orig.tar.gz
+sha256  d52a9232d9cf36302a150d782fc7e5b6f92f8115505ae8a7dc6acfc83e809d2f  cvs_1.12.13-12+squeeze1.diff.gz
+
+# Hash for license file
+sha256  569c5b876327d899cf444b2277fe910128a38ca71d90755fe4125dd44f8ece02  COPYING
diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 6f28b4dbec..9dc6871f09 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -8,6 +8,8 @@ CVS_VERSION = 1.12.13
 CVS_SOURCE = cvs_$(CVS_VERSION).orig.tar.gz
 CVS_PATCH = cvs_$(CVS_VERSION)-12+squeeze1.diff.gz
 CVS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cvs
+CVS_LICENSE = GPL-1.0+
+CVS_LICENSE_FILES = COPYING
 CVS_DEPENDENCIES = ncurses
 
 CVS_CONF_ENV = cvs_cv_func_printf_ptr=yes
-- 
2.26.2
