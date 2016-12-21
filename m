From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Dec 2016 19:59:12 -0300
Subject: [Buildroot] [PATCH 1/2] alsa-lib: bump to version 1.1.3
Message-ID: <20161221225913.25818-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../alsa-lib/0006-ucm-parser-needs-limits.h.patch  | 30 ++++++++++++++++++++++
 package/alsa-lib/alsa-lib.hash                     |  2 +-
 package/alsa-lib/alsa-lib.mk                       |  2 +-
 3 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 package/alsa-lib/0006-ucm-parser-needs-limits.h.patch

diff --git a/package/alsa-lib/0006-ucm-parser-needs-limits.h.patch b/package/alsa-lib/0006-ucm-parser-needs-limits.h.patch
new file mode 100644
index 0000000..b47dedb
--- /dev/null
+++ b/package/alsa-lib/0006-ucm-parser-needs-limits.h.patch
@@ -0,0 +1,30 @@
+From 13a796b4bd00defa9f9297fd23d508b430682aed Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 21 Dec 2016 19:41:26 -0300
+Subject: [PATCH] ucm: parser needs limits.h
+
+It's using PATH_MAX which is defined there, otherwise the build fails on
+musl libc.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+---
+Patch status: sent to alsa-devel ML.
+
+ src/ucm/parser.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ucm/parser.c b/src/ucm/parser.c
+index c98373a..f520abc 100644
+--- a/src/ucm/parser.c
++++ b/src/ucm/parser.c
+@@ -32,6 +32,7 @@
+ 
+ #include "ucm_local.h"
+ #include <dirent.h>
++#include <limits.h>
+ 
+ /** The name of the environment variable containing the UCM directory */
+ #define ALSA_CONFIG_UCM_VAR "ALSA_CONFIG_UCM"
+-- 
+2.10.2
+
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 47542e5..6f56a76 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 d38dacd9892b06b8bff04923c380b38fb2e379ee5538935ff37e45b395d861d6  alsa-lib-1.1.2.tar.bz2
+sha256 71282502184c592c1a008e256c22ed0ba5728ca65e05273ceb480c70f515969c  alsa-lib-1.1.3.tar.bz2
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index a86d6bb..5957568 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.1.2
+ALSA_LIB_VERSION = 1.1.3
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
 ALSA_LIB_LICENSE = LGPLv2.1+ (library), GPLv2+ (aserver)
-- 
2.10.2
