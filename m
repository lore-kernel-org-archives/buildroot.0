From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jan 2016 14:58:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/libssh: fix musl build
Message-ID: <1453557518-17573-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/dee/dee903ec7d813ef8a0969c5036b189124362819f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libssh/0001-musl-fix-includes.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/libssh/0001-musl-fix-includes.patch

diff --git a/package/libssh/0001-musl-fix-includes.patch b/package/libssh/0001-musl-fix-includes.patch
new file mode 100644
index 0000000..50a6e46
--- /dev/null
+++ b/package/libssh/0001-musl-fix-includes.patch
@@ -0,0 +1,17 @@
+Fix musl build
+
+Downloaded from
+http://git.alpinelinux.org/cgit/aports/tree/main/libssh/fix-includes.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+--- libssh-0.5.5.orig/include/libssh/libssh.h
++++ libssh-0.5.5/include/libssh/libssh.h
+@@ -57,6 +57,7 @@
+   typedef unsigned long long uint64_t;
+   typedef int mode_t;
+ #else /* _MSC_VER */
++  #include <sys/types.h>
+   #include <unistd.h>
+   #include <inttypes.h>
+ #endif /* _MSC_VER */
-- 
2.7.0.rc3
