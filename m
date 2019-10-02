From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 Oct 2019 21:18:41 +0200
Subject: [Buildroot] [git commit] package/pdbg: bump version to v2.3
Message-ID: <20191002191321.EB80A813C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a00908315ec9112a9c0a374658229ef0bba381b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the endian.h patch has this has been fixed upstream.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../pdbg/0001-src-thread.c-include-endian.h.patch  | 35 ----------------------
 package/pdbg/pdbg.hash                             |  2 +-
 package/pdbg/pdbg.mk                               |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/package/pdbg/0001-src-thread.c-include-endian.h.patch b/package/pdbg/0001-src-thread.c-include-endian.h.patch
deleted file mode 100644
index b7ee09a27a..0000000000
--- a/package/pdbg/0001-src-thread.c-include-endian.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e6a903ce82392c59d653f870a8af57d263c83a4f Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 2 Aug 2019 12:28:42 +0200
-Subject: [PATCH] src/thread.c: include endian.h
-
-endian.h is needed for be64oh otherwise build with musl fails on:
-
-src/thread.c: In function 'flip_endian':
-src/thread.c:49:9: error: implicit declaration of function 'be64toh' [-Werror=implicit-function-declaration]
-  return be64toh(v);
-
-Fixes:
- - http://autobuild.buildroot.org/results/81b1107bdb06250e1a7837506aec0c9762e771c5
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/open-power/pdbg/pull/43]
----
- src/thread.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/thread.c b/src/thread.c
-index 7fd53a8..7ead430 100644
---- a/src/thread.c
-+++ b/src/thread.c
-@@ -18,6 +18,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <assert.h>
-+#include <endian.h>
- 
- #include <libpdbg.h>
- 
--- 
-2.20.1
-
diff --git a/package/pdbg/pdbg.hash b/package/pdbg/pdbg.hash
index b856e4ce8c..68c7735e19 100644
--- a/package/pdbg/pdbg.hash
+++ b/package/pdbg/pdbg.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b3bd93475da1e68502732309fa274514fb0a1193d574adfd68d5feeabeb30571  pdbg-2.2.tar.gz
+sha256 dffeb0774dd2600b384bb42903fbbbff1396eb078f3430d129fec10ca194a4bb pdbg-2.3.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/pdbg/pdbg.mk b/package/pdbg/pdbg.mk
index 97832f23d1..52eaddb0b4 100644
--- a/package/pdbg/pdbg.mk
+++ b/package/pdbg/pdbg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PDBG_VERSION = 2.2
+PDBG_VERSION = 2.3
 PDBG_SITE = $(call github,open-power,pdbg,v$(PDBG_VERSION))
 PDBG_LICENSE = Apache-2.0
 PDBG_LICENSE_FILES = COPYING
