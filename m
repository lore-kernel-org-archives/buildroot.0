From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 11 Jan 2017 14:24:23 +0000
Subject: [Buildroot] [PATCH] lttng-tools: bump version to 2.9.3
Message-ID: <20170111142423.48621-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

0001-Fix-Add-missing-pthread.h-include.patch already included in this
release:

  https://github.com/lttng/lttng-tools/commit/5f702b607116a8303cb09fb091d8b9740c06baca

--with-xml-prefix configure option doesn't exist, so drop it:

  configure:22815: WARNING: unrecognized options: [snip], --with-xml-prefix

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../0001-Fix-Add-missing-pthread.h-include.patch   | 29 ----------------------
 package/lttng-tools/lttng-tools.hash               |  6 ++---
 package/lttng-tools/lttng-tools.mk                 |  4 +--
 3 files changed, 5 insertions(+), 34 deletions(-)
 delete mode 100644 package/lttng-tools/0001-Fix-Add-missing-pthread.h-include.patch

diff --git a/package/lttng-tools/0001-Fix-Add-missing-pthread.h-include.patch b/package/lttng-tools/0001-Fix-Add-missing-pthread.h-include.patch
deleted file mode 100644
index 29706af..0000000
--- a/package/lttng-tools/0001-Fix-Add-missing-pthread.h-include.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c948391121f2eb411bc7d2049d96f267bfa643d8 Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 5 Dec 2016 15:39:26 -0500
-Subject: [PATCH] Fix: Add missing pthread.h include
-
-Some libc like musl and uClibc requires explicit includes of pthread.h
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-[Thomas: taken from lttng mailing list.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- src/common/defaults.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/common/defaults.h b/src/common/defaults.h
-index 27f1ddc..37d222a 100644
---- a/src/common/defaults.h
-+++ b/src/common/defaults.h
-@@ -20,6 +20,7 @@
- #ifndef _DEFAULTS_H
- #define _DEFAULTS_H
- 
-+#include <pthread.h>
- #include <src/common/macros.h>
- 
- /* Default unix group name for tracing. */
--- 
-2.7.4
-
diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index 729ccf2..4f3d283 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,3 +1,3 @@
-# From http://lttng.org/files/lttng-tools/lttng-tools-2.9.0.tar.bz2.{md5,sha1}
-md5 75b5feb18aa2a136ebf70a14d2a5a6e5  lttng-tools-2.9.0.tar.bz2
-sha1 299158fd8614e45ee596d793696feb86cdea34b2  lttng-tools-2.9.0.tar.bz2
+# From http://lttng.org/files/lttng-tools/lttng-tools-2.9.3.tar.bz2.{md5,sha1}
+md5 19fdcc5e9c307ef66581a2743a08a541  lttng-tools-2.9.3.tar.bz2
+sha1 78fdc9b7fd15f33ac60ea08320d679ce66e18bf7  lttng-tools-2.9.3.tar.bz2
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 66ac687..2df2dff 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.9.0
+LTTNG_TOOLS_VERSION = 2.9.3
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPLv2+, LGPLv2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt LICENSE
-LTTNG_TOOLS_CONF_OPTS += --with-xml-prefix=$(STAGING_DIR)/usr --disable-man-pages
+LTTNG_TOOLS_CONF_OPTS += --disable-man-pages
 
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
 
-- 
2.10.2
