From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 23:24:19 +0200
Subject: [Buildroot] [git commit] package/pdbg: bump version to v3.0
Message-ID: <20200713212043.A0D7D86D6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2efeec8eaffc9382bcf71186378de2cc9a38c7b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This includes a patch to fix building with uclibc, where pdbg was
missing a header for ssize_t.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pdbg/0001-Fix-building-with-uclibc.patch | 32 ++++++++++++++++++++++++
 package/pdbg/pdbg.hash                           |  2 +-
 package/pdbg/pdbg.mk                             |  2 +-
 3 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/package/pdbg/0001-Fix-building-with-uclibc.patch b/package/pdbg/0001-Fix-building-with-uclibc.patch
new file mode 100644
index 0000000000..90fe67b51f
--- /dev/null
+++ b/package/pdbg/0001-Fix-building-with-uclibc.patch
@@ -0,0 +1,32 @@
+From 7ad1193f705563dc984b738b9af3c7461caeef37 Mon Sep 17 00:00:00 2001
+From: Joel Stanley <joel@jms.id.au>
+Date: Mon, 13 Jul 2020 14:57:31 +1000
+Subject: [PATCH] Fix building with uclibc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+libpdbg/target.h:66:2: error: unknown type name ???ssize_t???
+   66 |  ssize_t len;
+      |  ^~~~~~~
+
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ libpdbg/target.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libpdbg/target.h b/libpdbg/target.h
+index 522a4dc..a12cce8 100644
+--- a/libpdbg/target.h
++++ b/libpdbg/target.h
+@@ -17,6 +17,7 @@
+ #define __TARGET_H
+ 
+ #include <stdint.h>
++#include <unistd.h>
+ #include <ccan/list/list.h>
+ #include <ccan/str/str.h>
+ #include <ccan/container_of/container_of.h>
+-- 
+2.17.1
+
diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index 486dff240d..f2aa145cb1 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 10f701c4bb8557a35de166c4322d77fa64ddbdd1146141a88a3d530144545820 pdbg-2.4.tar.gz
+sha256 1a2736a010d21a2e5b735212a35cd214d6ab90aab0cad5c0260b975398f19dc8 pdbg-3.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 9977a126fb..17d65be7fd 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = 2.4
+PDBG_VERSION = 3.0
 PDBG_SITE = $(call github,open-power,pdbg,v$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
