From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 15 Feb 2017 12:38:10 +0100
Subject: [Buildroot] [PATCH] cannelloni: fix build failure caused by missing
	include
Message-ID: <1487158690-2977-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add a patch, that explicitly includes cstdio header.

Fixes:
http://autobuild.buildroot.net/results/82d/82d1dca3aa7ee9189baae985db59464d95696ed7/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0001-Add-missing-cstdio-include.patch          | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/cannelloni/0001-Add-missing-cstdio-include.patch

diff --git a/package/cannelloni/0001-Add-missing-cstdio-include.patch b/package/cannelloni/0001-Add-missing-cstdio-include.patch
new file mode 100644
index 0000000..1e4ad00
--- /dev/null
+++ b/package/cannelloni/0001-Add-missing-cstdio-include.patch
@@ -0,0 +1,29 @@
+From d41f5ec6bb66654558757c3ef9cd2a158ee06ccc Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 15 Feb 2017 09:29:29 +0100
+Subject: [PATCH] Add missing <cstdio> include
+
+This header defines EOF macro. Some toolchains cannot
+find this macro, if <cstdio> is missing. So include it
+explicitly.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ sctpthread.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sctpthread.cpp b/sctpthread.cpp
+index 6c83fed..d83b472 100644
+--- a/sctpthread.cpp
++++ b/sctpthread.cpp
+@@ -19,6 +19,7 @@
+  */
+ 
+ #include <chrono>
++#include <cstdio>
+ #include <algorithm>
+ 
+ #include <string.h>
+-- 
+2.1.4
+
-- 
2.1.4
