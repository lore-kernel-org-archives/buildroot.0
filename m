From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 26 Sep 2017 23:50:14 +0200
Subject: [Buildroot] [git commit] package/efl: bump to 1.20.4
Message-ID: <20170926215334.38662807DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0990a6a17345bf2f6562f82e4482441f5387b85c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.enlightenment.org/news/efl-1.20.4

Remove upstream patch.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...g-add-missing-header-for-big-endian-build.patch | 35 ----------------------
 package/efl/efl.hash                               |  4 +--
 package/efl/efl.mk                                 |  2 +-
 3 files changed, 3 insertions(+), 38 deletions(-)

diff --git a/package/efl/0001-eina_debug-add-missing-header-for-big-endian-build.patch b/package/efl/0001-eina_debug-add-missing-header-for-big-endian-build.patch
deleted file mode 100644
index 9f0653d..0000000
--- a/package/efl/0001-eina_debug-add-missing-header-for-big-endian-build.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 135f4233266443a4546bdf8217f145a0f7bbb90d Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Thu, 7 Sep 2017 22:25:48 +0200
-Subject: [PATCH] eina_debug: add missing header for big endian build
-
-The build fail for big endian system due to missing eina_swap32
-definition.
-Add "eina_cpu.h" include where eina_swap32 prototype is defined.
-
-Patch provided by sharkcz in [1].
-
-Uptream status: pending
-
-[1] https://phab.enlightenment.org/D5158
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/lib/eina/eina_debug.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/lib/eina/eina_debug.c b/src/lib/eina/eina_debug.c
-index ca1bdad..468ca43 100644
---- a/src/lib/eina/eina_debug.c
-+++ b/src/lib/eina/eina_debug.c
-@@ -60,6 +60,7 @@
- #endif
- 
- #include "eina_debug.h"
-+#include "eina_cpu.h"
- #include "eina_types.h"
- #include "eina_list.h"
- #include "eina_mempool.h"
--- 
-2.9.5
-
diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index ceeb788..e388f50 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.20.3.tar.xz.sha256
-sha256	1273014aff3cd313a315f6745b02958668083726d830873b681fe726b9421191	efl-1.20.3.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.20.4.tar.xz.sha256
+sha256	316135c402758945d51d3b316addbeb1d537a0d75f9cf593868646fd8251b0cb 	efl-1.20.4.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index f1bcd53..f456928 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.20.3
+EFL_VERSION = 1.20.4
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+
