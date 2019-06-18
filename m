From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 18 Jun 2019 18:43:52 +0300
Subject: [Buildroot] [PATCH v1] fb-test-app: Revert upstream 77bdfc6 "add
 function to place framebuffer ..."
Message-ID: <20190618154352.50597-1-andriy.shevchenko@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch breaks at least hotplug displays to work.

More details in submitted PR to the upstream, i.e.
https://github.com/prpplague/fb-test-app/pull/5.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../0001-update-version-number.patch          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/fb-test-app/0001-update-version-number.patch

diff --git a/package/fb-test-app/0001-update-version-number.patch b/package/fb-test-app/0001-update-version-number.patch
new file mode 100644
index 0000000000..84d59be2e9
--- /dev/null
+++ b/package/fb-test-app/0001-update-version-number.patch
@@ -0,0 +1,27 @@
+From 063ec650960c2d79ac51f5c5f026cb05343a33e2 Mon Sep 17 00:00:00 2001
+From: David Anders <danders.dev@gmail.com>
+Date: Thu, 25 Sep 2014 11:52:11 -0500
+Subject: [PATCH 1/1] update version number
+
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index fecbbe4..ef786a2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,8 +1,8 @@
+ VERSION = 1
+-PATCHLEVEL = 0
++PATCHLEVEL = 1
+ SUBLEVEL = 0
+ EXTRAVERSION = .git
+-NAME = tablet_rosa
++NAME = rosetta
+ 
+ ifdef CROSS_COMPILE
+ 	CC=$(CROSS_COMPILE)gcc
+-- 
+2.20.1
+
-- 
2.20.1
