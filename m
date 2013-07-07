From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Jul 2013 17:07:24 +0200
Subject: [Buildroot] [PATCH 3/3] enlightenment: bump to 0.17.3
In-Reply-To: <1373209644-18260-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1373209644-18260-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1373209644-18260-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../enlightenment/enlightenment-no-execinfo.patch  | 27 ----------------------
 package/enlightenment/enlightenment.mk             |  2 +-
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 package/enlightenment/enlightenment-no-execinfo.patch

diff --git a/package/enlightenment/enlightenment-no-execinfo.patch b/package/enlightenment/enlightenment-no-execinfo.patch
deleted file mode 100644
index 81fbe17..0000000
--- a/package/enlightenment/enlightenment-no-execinfo.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Do not include <execinfo.h> when not available
-
-On uClibc, <execinfo.h> is not necessarily installed, depending on the
-configuration. Enlightenment properly makes <execinfo.h> optional, but
-uses __GLIBC__ to check if it is available or not. Unfortunately,
-uClibc defines __GLIBC__, so it is not the right way to decide if
-<execinfo.h> is available.
-
-Instead, Enlightenment already has a configure.ac check for
-execinfo.h, so we simply use the result of this configure.ac check to
-decide whether execinfo.h is to be included or not.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/src/bin/e.h
-===================================================================
---- a/src/bin/e.h
-+++ b/src/bin/e.h
-@@ -92,7 +92,7 @@
- #  include <memcheck.h>
- # endif
- 
--# ifdef __GLIBC__
-+# ifdef HAVE_EXECINFO_H
- #  include <execinfo.h>
- # endif
- 
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 1163aa5..b415486 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.17.0-omega
+ENLIGHTENMENT_VERSION = 0.17.3
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/releases/
 ENLIGHTENMENT_LICENSE = BSD-2c
 ENLIGHTENMENT_LICENSE_FILES = COPYING
-- 
1.8.1.2
