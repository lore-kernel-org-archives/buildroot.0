From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Oct 2019 10:18:13 +0200
Subject: [Buildroot] [PATCH 2/2] package/tvheadend: bump version
In-Reply-To: <20191019081813.8482-1-bernd.kuhls@t-online.de>
References: <20191019081813.8482-1-bernd.kuhls@t-online.de>
Message-ID: <20191019081813.8482-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch applied upstream:
https://github.com/tvheadend/tvheadend/commit/d1fc95a8ad4320054b5f1aa0d4398d193eba246e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-tvhcsa.c-include-stdio.h.patch       | 40 -------------------
 package/tvheadend/tvheadend.hash              |  2 +-
 package/tvheadend/tvheadend.mk                |  2 +-
 3 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 package/tvheadend/0002-tvhcsa.c-include-stdio.h.patch

diff --git a/package/tvheadend/0002-tvhcsa.c-include-stdio.h.patch b/package/tvheadend/0002-tvhcsa.c-include-stdio.h.patch
deleted file mode 100644
index a1e80568fb..0000000000
--- a/package/tvheadend/0002-tvhcsa.c-include-stdio.h.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 693e3a3fe281dd618dd244b245c9bb0a00c7d893 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 6 Jul 2019 08:36:11 +0200
-Subject: [PATCH] tvhcsa.c: include stdio.h
-
-Fixes uclibc build error:
-
-CC              src/descrambler/tvhcsa.o
-In file included from /home/buildroot/autobuild/instance-0/output/build/tvheadend-8f1de1621d78c91431238176bf4f6290870a031a/src/tvhlog.h:30:0,
-                 from src/descrambler/tvhcsa.h:30,
-                 from src/descrambler/tvhcsa.c:19:
-/home/buildroot/autobuild/instance-0/output/build/tvheadend-8f1de1621d78c91431238176bf4f6290870a031a/src/tvh_thread.h:163:25:
- error: unknown type name '__do_not_use_pthread_mutex_t'
- #define pthread_mutex_t __do_not_use_pthread_mutex_t
-
-detected by buildroot autobuilder:
-http://autobuild.buildroot.net/results/627/627e7080e655005d6724b9977670cc73059d6281/
-
-Patch sent upstream: https://github.com/tvheadend/tvheadend/pull/1285
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/descrambler/tvhcsa.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/descrambler/tvhcsa.c b/src/descrambler/tvhcsa.c
-index 1deefc50f..e97c14e99 100644
---- a/src/descrambler/tvhcsa.c
-+++ b/src/descrambler/tvhcsa.c
-@@ -16,6 +16,7 @@
-  *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
-  */
- 
-+#include <stdio.h>
- #include "tvhcsa.h"
- #include "input.h"
- #include "input/mpegts/tsdemux.h"
--- 
-2.20.1
-
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 8928a42dd0..5202ac8cd9 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 313267b2e2752e5a150e225ec735e7cb9e9af8bb7e9bd05391262f0df01d1437  tvheadend-baf746bc1d420e7d628994922df0ddcb665f698f.tar.gz
+sha256 9c7888ec3754e20a728dcc06e69c8fa53fd085879ee5191bbcf35105f82cc1d2  tvheadend-6fbb30d039c763268b3e9017e062b0c9ec6bebeb.tar.gz
 sha256 54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 377c224192..4ad6317ff1 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = baf746bc1d420e7d628994922df0ddcb665f698f
+TVHEADEND_VERSION = 6fbb30d039c763268b3e9017e062b0c9ec6bebeb
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.20.1
