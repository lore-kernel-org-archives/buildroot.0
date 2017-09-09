From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:42:07 +0200
Subject: [Buildroot] [git commit] package/efl: fix build issue on big endian
	system
Message-ID: <20170909203455.D1E3280FB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f2ed9b21508fc1c48ac4634c9ff15b802a539887
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/0f1/0f12919f59dc92a8d91e23d3b0c1120bc06720db
http://autobuild.buildroot.net/results/62e/62e96be61601347e92f9c115209af4962fe82492

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...g-add-missing-header-for-big-endian-build.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/efl/0001-eina_debug-add-missing-header-for-big-endian-build.patch b/package/efl/0001-eina_debug-add-missing-header-for-big-endian-build.patch
new file mode 100644
index 0000000..9f0653d
--- /dev/null
+++ b/package/efl/0001-eina_debug-add-missing-header-for-big-endian-build.patch
@@ -0,0 +1,35 @@
+From 135f4233266443a4546bdf8217f145a0f7bbb90d Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Thu, 7 Sep 2017 22:25:48 +0200
+Subject: [PATCH] eina_debug: add missing header for big endian build
+
+The build fail for big endian system due to missing eina_swap32
+definition.
+Add "eina_cpu.h" include where eina_swap32 prototype is defined.
+
+Patch provided by sharkcz in [1].
+
+Uptream status: pending
+
+[1] https://phab.enlightenment.org/D5158
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/lib/eina/eina_debug.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lib/eina/eina_debug.c b/src/lib/eina/eina_debug.c
+index ca1bdad..468ca43 100644
+--- a/src/lib/eina/eina_debug.c
++++ b/src/lib/eina/eina_debug.c
+@@ -60,6 +60,7 @@
+ #endif
+ 
+ #include "eina_debug.h"
++#include "eina_cpu.h"
+ #include "eina_types.h"
+ #include "eina_list.h"
+ #include "eina_mempool.h"
+-- 
+2.9.5
+
