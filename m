From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 09:36:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/ddrescue: remove patch
Message-ID: <20190804073636.1158-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Not needed anymore after upstream change:
https://lists.gnu.org/archive/html/bug-ddrescue/2017-02/msg00002.html

Build-tested using br-x86-64-core2-full.config

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0001-io.cc-add-stdio.h-include.patch      | 36 -------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 package/ddrescue/0001-io.cc-add-stdio.h-include.patch

diff --git a/package/ddrescue/0001-io.cc-add-stdio.h-include.patch b/package/ddrescue/0001-io.cc-add-stdio.h-include.patch
deleted file mode 100644
index e719c708e8..0000000000
--- a/package/ddrescue/0001-io.cc-add-stdio.h-include.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0f72787b922c53c33d497b17300a959b911e621f Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Tue, 14 Feb 2017 20:12:05 +0100
-Subject: [PATCH] io.cc: add stdio.h include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes buildroot compile failure with uclibc [1]:
-
-  In file included from io.cc:28:0:
-  block.h:219:22: error: ?FILE? has not been declared
-     int write_mapfile( FILE * f = 0, const bool timestamp = false,
-
-[1] http://autobuild.buildroot.net/results/4ac0754f1cc5ea934d6437e89d1f4906fb3fd0a8
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- io.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/io.cc b/io.cc
-index 36b8341..2d6a76e 100644
---- a/io.cc
-+++ b/io.cc
-@@ -23,6 +23,7 @@
- #include <string>
- #include <vector>
- #include <stdint.h>
-+#include <stdio.h>
- #include <unistd.h>
- 
- #include "block.h"
--- 
-2.11.0
-
-- 
2.20.1
