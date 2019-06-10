From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Jun 2019 20:21:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/weston: drop unneeded first patch
Message-ID: <20190610182159.12909-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch is not needed since
https://gitlab.freedesktop.org/wayland/weston/commit/32838c93a509dbeda717e58279683c63a34a2e07

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...h => 0001-Fix-build-with-kernel-4.4.patch} |  0
 ...-define-CLOCK_BOOTTIME-when-not-avai.patch | 41 -------------------
 2 files changed, 41 deletions(-)
 rename package/weston/{0002-Fix-build-with-kernel-4.4.patch => 0001-Fix-build-with-kernel-4.4.patch} (100%)
 delete mode 100644 package/weston/0001-os-compatibility-define-CLOCK_BOOTTIME-when-not-avai.patch

diff --git a/package/weston/0002-Fix-build-with-kernel-4.4.patch b/package/weston/0001-Fix-build-with-kernel-4.4.patch
similarity index 100%
rename from package/weston/0002-Fix-build-with-kernel-4.4.patch
rename to package/weston/0001-Fix-build-with-kernel-4.4.patch
diff --git a/package/weston/0001-os-compatibility-define-CLOCK_BOOTTIME-when-not-avai.patch b/package/weston/0001-os-compatibility-define-CLOCK_BOOTTIME-when-not-avai.patch
deleted file mode 100644
index a7f2a34a88..0000000000
--- a/package/weston/0001-os-compatibility-define-CLOCK_BOOTTIME-when-not-avai.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 66b71951f8ce66f02040f8814e1d89db34c34a87 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 22 Feb 2015 12:36:00 +0100
-Subject: [PATCH] os-compatibility: define CLOCK_BOOTTIME when not available
-
-CLOCK_BOOTTIME is supposed to be provided by the C library headers,
-but uClibc 0.9.33.2 does not provide it. Instead of depending on an
-uClibc patch, let's make Weston define it to the right value when not
-already defined by the C library.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- shared/os-compatibility.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/shared/os-compatibility.h b/shared/os-compatibility.h
-index 172bb7e..e369899 100644
---- a/shared/os-compatibility.h
-+++ b/shared/os-compatibility.h
-@@ -26,6 +26,7 @@
- #include "config.h"
- 
- #include <sys/types.h>
-+#include <time.h>
- 
- #ifdef HAVE_EXECINFO_H
- #include <execinfo.h>
-@@ -37,6 +38,10 @@ backtrace(void **buffer, int size)
- }
- #endif
- 
-+#ifndef CLOCK_BOOTTIME
-+#define CLOCK_BOOTTIME 7
-+#endif
-+
- int
- os_socketpair_cloexec(int domain, int type, int protocol, int *sv);
- 
--- 
-2.1.0
-
-- 
2.20.1
