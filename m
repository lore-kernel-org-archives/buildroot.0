From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 30 Jan 2016 19:01:59 +0100
Subject: [Buildroot] [PATCH 2/2] package/libseccomp: fix musl build
In-Reply-To: <1454176919-12144-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454176919-12144-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1454176919-12144-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/0cd/0cd47d7e6a49c268b57981ae8bb9abe4c4a183c7/
http://autobuild.buildroot.net/results/34b/34b0bea52bd7e65a927142dc0e1f28f85629c634/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libseccomp/0002-musl.patch | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/libseccomp/0002-musl.patch

diff --git a/package/libseccomp/0002-musl.patch b/package/libseccomp/0002-musl.patch
new file mode 100644
index 0000000..c3affba
--- /dev/null
+++ b/package/libseccomp/0002-musl.patch
@@ -0,0 +1,33 @@
+Fix musl build
+
+Downloaded from upstream PR:
+https://github.com/seccomp/libseccomp/pull/23
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+
+From eb5382287cd25235e760b5da4939510b11bbf2a1 Mon Sep 17 00:00:00 2001
+From: Kylie McClain <somasis@exherbo.org>
+Date: Fri, 1 Jan 2016 13:12:59 -0500
+Subject: [PATCH] system.h: Remove conflicting kernel header include
+
+This fixes building on musl libc, since musl does not include kernel
+headers. I've tested this as working on both glibc and musl.
+
+Signed-off-by: Kylie McClain <somasis@exherbo.org>
+---
+ src/system.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/system.h b/src/system.h
+index 4660679..e84b0a0 100644
+--- a/src/system.h
++++ b/src/system.h
+@@ -23,7 +23,6 @@
+ #define _SYSTEM_H
+ 
+ #include <linux/filter.h>
+-#include <linux/prctl.h>
+ 
+ #include "configure.h"
+ 
-- 
2.7.0.rc3
