From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jan 2020 14:15:54 +0200
Subject: [Buildroot] [PATCH] package/socat: bump to version 1.7.3.4
Message-ID: <7fc2887a08f5c80d39361d2207495be5c5c96cae.1578917754.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch #2. Upstream commit d8a5d49c2d8359 includes stddef.h in a
higher level header.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...h => 0002-compat-set-NETDB_INTERNAL.patch} |  0
 ...002-ptrdiff_t-is-defined-in-stddef.h.patch | 28 -------------------
 package/socat/socat.hash                      |  4 +--
 package/socat/socat.mk                        |  2 +-
 4 files changed, 3 insertions(+), 31 deletions(-)
 rename package/socat/{0003-compat-set-NETDB_INTERNAL.patch => 0002-compat-set-NETDB_INTERNAL.patch} (100%)
 delete mode 100644 package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch

diff --git a/package/socat/0003-compat-set-NETDB_INTERNAL.patch b/package/socat/0002-compat-set-NETDB_INTERNAL.patch
similarity index 100%
rename from package/socat/0003-compat-set-NETDB_INTERNAL.patch
rename to package/socat/0002-compat-set-NETDB_INTERNAL.patch
diff --git a/package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch b/package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch
deleted file mode 100644
index acae641b34b6..000000000000
--- a/package/socat/0002-ptrdiff_t-is-defined-in-stddef.h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 99c55f2694fe8621ca2344eb002610dac7f9c969 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 2 Feb 2016 09:34:24 -0300
-Subject: [PATCH] ptrdiff_t is defined in stddef.h
-
-Status: sent upstream via email.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- nestlex.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/nestlex.c b/nestlex.c
-index f7950f0..f49482d 100644
---- a/nestlex.c
-+++ b/nestlex.c
-@@ -4,6 +4,8 @@
- 
- /* a function for lexical scanning of nested character patterns */
- 
-+#include <stddef.h>	/* ptrdiff_t */
-+
- #include "config.h"
- #include "mytypes.h"
- 
--- 
-2.4.10
-
diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 92d62ab71642..ff4ef6262a6d 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,7 +1,7 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5	b2a032a47b8b89a18485697fa975154f	socat-1.7.3.3.tar.bz2
+md5	c9e71d0136c88a01d6fd30a13a3936ed	socat-1.7.3.4.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256	0dd63ffe498168a4aac41d307594c5076ff307aa0ac04b141f8f1cec6594d04a	socat-1.7.3.3.tar.bz2
+sha256	972374ca86f65498e23e3259c2ee1b8f9dbeb04d12c2a78c0c9b5d1cb97dfdfc	socat-1.7.3.4.tar.bz2
 # Locally calculated
 sha256	4846488cea98a2905dc75b7aa5eea721568e372447efe06b85bd896ee8c54f10	README
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 9e747e08fa62..3807d45379fc 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.7.3.3
+SOCAT_VERSION = 1.7.3.4
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
-- 
2.24.1
