From: Joel Stanley <joel@jms.id.au>
Date: Tue, 27 Oct 2020 13:33:06 +1030
Subject: [Buildroot] [PATCH] pdbg: Bump version to v3.1
Message-ID: <20201027030306.488110-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uclibc build fix from v3.0 has since been merged.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../pdbg/0001-Fix-building-with-uclibc.patch  | 32 -------------------
 package/pdbg/pdbg.hash                        |  2 +-
 package/pdbg/pdbg.mk                          |  2 +-
 3 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 package/pdbg/0001-Fix-building-with-uclibc.patch

diff --git a/package/pdbg/0001-Fix-building-with-uclibc.patch b/package/pdbg/0001-Fix-building-with-uclibc.patch
deleted file mode 100644
index 90fe67b51f47..000000000000
--- a/package/pdbg/0001-Fix-building-with-uclibc.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 7ad1193f705563dc984b738b9af3c7461caeef37 Mon Sep 17 00:00:00 2001
-From: Joel Stanley <joel@jms.id.au>
-Date: Mon, 13 Jul 2020 14:57:31 +1000
-Subject: [PATCH] Fix building with uclibc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-libpdbg/target.h:66:2: error: unknown type name ?ssize_t?
-   66 |  ssize_t len;
-      |  ^~~~~~~
-
-Signed-off-by: Joel Stanley <joel@jms.id.au>
----
- libpdbg/target.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libpdbg/target.h b/libpdbg/target.h
-index 522a4dc..a12cce8 100644
---- a/libpdbg/target.h
-+++ b/libpdbg/target.h
-@@ -17,6 +17,7 @@
- #define __TARGET_H
- 
- #include <stdint.h>
-+#include <unistd.h>
- #include <ccan/list/list.h>
- #include <ccan/str/str.h>
- #include <ccan/container_of/container_of.h>
--- 
-2.17.1
-
diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index f2aa145cb1fe..bc5772f064d4 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1a2736a010d21a2e5b735212a35cd214d6ab90aab0cad5c0260b975398f19dc8 pdbg-3.0.tar.gz
+sha256 622446c76adbb41ccbe0b1e3a84b704ef66cdd8429e1e6fedec80493c54801e7 pdbg-3.1.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 17d65be7fd53..79e4f5c7cc39 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = 3.0
+PDBG_VERSION = 3.1
 PDBG_SITE = $(call github,open-power,pdbg,v$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
-- 
2.28.0
