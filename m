From: Romain Naour <romain.naour@gmail.com>
Date: Sat,  3 Sep 2016 18:24:06 +0200
Subject: [Buildroot] [PATCH] package/dosfstools: Fix undefined PATH_MAX
	under musl
Message-ID: <1472919846-30643-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dosfstools doesn't build with musl only if BR2_PACKAGE_HAS_UDEV is set
due to a missing include for PATH_MAX (limits.h).

Fixes:
http://autobuild.buildroot.net/results/346/346feda6a4a83850dbb62919eb33482302053490

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ..._info.c-Fix-undefined-PATH_MAX-under-musl.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/dosfstools/0002-src-device_info.c-Fix-undefined-PATH_MAX-under-musl.patch

diff --git a/package/dosfstools/0002-src-device_info.c-Fix-undefined-PATH_MAX-under-musl.patch b/package/dosfstools/0002-src-device_info.c-Fix-undefined-PATH_MAX-under-musl.patch
new file mode 100644
index 0000000..9740304
--- /dev/null
+++ b/package/dosfstools/0002-src-device_info.c-Fix-undefined-PATH_MAX-under-musl.patch
@@ -0,0 +1,31 @@
+From 06ce096dabd8a29c72dc0bc5110d2c4867baa490 Mon Sep 17 00:00:00 2001
+From: Alessio Sergi <al3hex@gmail.com>
+Date: Fri, 6 May 2016 18:18:18 +0200
+Subject: [PATCH] src/device_info.c: Fix undefined PATH_MAX under musl
+
+In musl libc, PATH_MAX is defined in <limits.h>.
+
+Status: pending
+https://github.com/dosfstools/dosfstools/pull/27
+
+[Romain: add patch status]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/device_info.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/device_info.c b/src/device_info.c
+index f5d11ac..cd57388 100644
+--- a/src/device_info.c
++++ b/src/device_info.c
+@@ -17,6 +17,7 @@
+ */
+ 
+ 
++#include <limits.h>
+ #include <stdint.h>
+ #include <stdbool.h>
+ #include <sys/types.h>
+-- 
+2.5.5
+
-- 
2.5.5
