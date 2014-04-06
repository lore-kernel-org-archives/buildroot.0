From: Romain Naour <romain.naour@openwide.fr>
Date: Sun,  6 Apr 2014 11:29:13 +0200
Subject: [Buildroot] [PATCH 2/2] util-linux: define mkostemp for uClibc
In-Reply-To: <1396776553-7064-1-git-send-email-romain.naour@openwide.fr>
References: <1396776553-7064-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1396776553-7064-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uclibc does not implement mkostemp GNU extension

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...util-linux-004-define-mkostemp-for-uClibc.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/util-linux/util-linux-004-define-mkostemp-for-uClibc.patch

diff --git a/package/util-linux/util-linux-004-define-mkostemp-for-uClibc.patch b/package/util-linux/util-linux-004-define-mkostemp-for-uClibc.patch
new file mode 100644
index 0000000..7b49d37
--- /dev/null
+++ b/package/util-linux/util-linux-004-define-mkostemp-for-uClibc.patch
@@ -0,0 +1,29 @@
+From d339af8fdc4b28175d6986d870f6735a9c2e90a3 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 6 Apr 2014 01:48:58 +0200
+Subject: [PATCH 1/1] c.h: define mkostemp for uClibc
+
+uclibc does not implement mkostemp GNU extension
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ include/c.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/include/c.h b/include/c.h
+index 4a9bf3d..3ba51c1 100644
+--- a/include/c.h
++++ b/include/c.h
+@@ -300,4 +300,9 @@ static inline int usleep(useconds_t usec)
+ # define SEEK_HOLE	4
+ #endif
+ 
++#ifdef __UCLIBC__
++/* uclibc does not implement mkostemp GNU extension */
++#define mkostemp(x,y) mkstemp(x)
++#endif
++
+ #endif /* UTIL_LINUX_C_H */
+-- 
+1.9.0
+
-- 
1.9.0
