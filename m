From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 23:48:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/memcached: fix musl build
Message-ID: <1453589315-26060-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/537/537a84d98f3cfa13bdb933f7e46819493bfd432a/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/memcached/0001-musl-includes.patch | 54 ++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 package/memcached/0001-musl-includes.patch

diff --git a/package/memcached/0001-musl-includes.patch b/package/memcached/0001-musl-includes.patch
new file mode 100644
index 0000000..4d77bca
--- /dev/null
+++ b/package/memcached/0001-musl-includes.patch
@@ -0,0 +1,54 @@
+Fix musl build
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/plain/main/memcached/musl-includes.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- memcached-1.4.15.orig/assoc.c
++++ memcached-1.4.15/assoc.c
+@@ -14,8 +14,8 @@
+ #include "memcached.h"
+ #include <sys/stat.h>
+ #include <sys/socket.h>
+-#include <sys/signal.h>
+ #include <sys/resource.h>
++#include <signal.h>
+ #include <fcntl.h>
+ #include <netinet/in.h>
+ #include <errno.h>
+--- memcached-1.4.15.orig/items.c
++++ memcached-1.4.15/items.c
+@@ -2,13 +2,13 @@
+ #include "memcached.h"
+ #include <sys/stat.h>
+ #include <sys/socket.h>
+-#include <sys/signal.h>
+ #include <sys/resource.h>
+ #include <fcntl.h>
+ #include <netinet/in.h>
+ #include <errno.h>
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <signal.h>
+ #include <string.h>
+ #include <time.h>
+ #include <assert.h>
+--- memcached-1.4.15.orig/slabs.c
++++ memcached-1.4.15/slabs.c
+@@ -10,7 +10,6 @@
+ #include "memcached.h"
+ #include <sys/stat.h>
+ #include <sys/socket.h>
+-#include <sys/signal.h>
+ #include <sys/resource.h>
+ #include <fcntl.h>
+ #include <netinet/in.h>
+@@ -18,6 +17,7 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <string.h>
++#include <signal.h>
+ #include <assert.h>
+ #include <pthread.h>
+ 
-- 
2.7.0.rc3
