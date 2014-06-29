From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jun 2014 10:32:29 +0200
Subject: [Buildroot] [git commit] libndp: bump to 1.3
Message-ID: <20140629083648.D99AE9D090@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b6aff85b2b5f6e3f737091b3d769b6d7c80e57f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove upstreamed patch.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libndp/libndp-01-missing-stdarg-include.patch  |   16 ----------------
 package/libndp/libndp.mk                           |    2 +-
 2 files changed, 1 insertions(+), 17 deletions(-)

diff --git a/package/libndp/libndp-01-missing-stdarg-include.patch b/package/libndp/libndp-01-missing-stdarg-include.patch
deleted file mode 100644
index e10848e..0000000
--- a/package/libndp/libndp-01-missing-stdarg-include.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Add missing <stdarg.h> include for va_list
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: b/include/ndp.h
-===================================================================
---- a/include/ndp.h
-+++ b/include/ndp.h
-@@ -20,6 +20,7 @@
- #ifndef _NDP_H_
- #define _NDP_H_
- 
-+#include <stdarg.h>
- #include <stdbool.h>
- #include <netinet/in.h>
- 
diff --git a/package/libndp/libndp.mk b/package/libndp/libndp.mk
index 55d172b..2f11a07 100644
--- a/package/libndp/libndp.mk
+++ b/package/libndp/libndp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNDP_VERSION = v1.2
+LIBNDP_VERSION = v1.3
 LIBNDP_SITE = $(call github,jpirko,libndp,$(LIBNDP_VERSION))
 LIBNDP_LICENSE = LGPLv2.1+
 LIBNDP_LICENSE_FILES = COPYING
