From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Sat, 15 Aug 2015 18:07:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/cifs-utils: add upstream patch to
	fix musl build
Message-ID: <1439654841-18845-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build error with the musl C library:

```
error: '_PATH_MOUNTED' undeclared (first use in this function)
```

Fixes:
http://autobuild.buildroot.net/results/44e/44e800d9933160c48b9c2447d63eeb37a0065d03/
http://autobuild.buildroot.net/results/b9f/b9f918bba4952566e3818fb99f45a7e425acf727/
http://autobuild.buildroot.net/results/8de/8dec8c46ad1959066101efe7cc1781f3d4732028/
http://autobuild.buildroot.net/results/cc3/cc38e7581b4bba362a9be388099b0ea237f4e580/

and many more.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 ...-mtab.c-include-paths.h-for-_PATH_MOUNTED.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/cifs-utils/0001-mtab.c-include-paths.h-for-_PATH_MOUNTED.patch

diff --git a/package/cifs-utils/0001-mtab.c-include-paths.h-for-_PATH_MOUNTED.patch b/package/cifs-utils/0001-mtab.c-include-paths.h-for-_PATH_MOUNTED.patch
new file mode 100644
index 0000000..8fbec11
--- /dev/null
+++ b/package/cifs-utils/0001-mtab.c-include-paths.h-for-_PATH_MOUNTED.patch
@@ -0,0 +1,31 @@
+From 6603cef0f06c450196a1bca06bb143d8fcda5651 Mon Sep 17 00:00:00 2001
+From: Felix Janda <felix.janda@posteo.de>
+Date: Fri, 5 Dec 2014 23:19:29 +0100
+Subject: [PATCH 1/1] mtab.c: include <paths.h> for _PATH_MOUNTED
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Backported from: 6603cef0f06c450196a1bca06bb143d8fcda5651
+
+Signed-off-by: Felix Janda <felix.janda@posteo.de>
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ mtab.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mtab.c b/mtab.c
+index 7b365b3..a662a3c 100644
+--- a/mtab.c
++++ b/mtab.c
+@@ -38,6 +38,7 @@
+ #include <mntent.h>
+ #include <stdlib.h>
+ #include <signal.h>
++#include <paths.h>
+ #include "mount.h"
+ #include "config.h"
+ 
+-- 
+2.5.0
+
-- 
2.5.0
