From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 24 Apr 2020 14:29:59 -0600
Subject: [Buildroot] [PATCH 1/1] package/exfatprogs: add patch fixing
 missing <sys/types.h>
Message-ID: <20200424202959.77348-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch had been merged by upstream but appears to have been
accidentially overwritten with a force push. Let's add back the
rebased version until fixed by upstream.

Fixes:
http://autobuild.buildroot.net/results/667/667409f1d44a3f9be43aaff3f9a3426fe1386de2/build-end.log

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...rogs-add-missing-include-sys-types.h.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch

diff --git a/package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch b/package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch
new file mode 100644
index 0000000000..f3705d2ebc
--- /dev/null
+++ b/package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch
@@ -0,0 +1,49 @@
+From c00522e0a890265d18dcdc92738e524d48297ed5 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 17 Apr 2020 13:10:49 -0600
+Subject: [PATCH] exfatprogs: add missing #include <sys/types.h>
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+../include/libexfat.h:72:1: error: unknown type name ?ssize_t?
+ ssize_t exfat_read(int fd, void *buf, size_t size, off_t offset);
+ ^
+../include/libexfat.h:72:52: error: unknown type name ?off_t?
+ ssize_t exfat_read(int fd, void *buf, size_t size, off_t offset);
+                                                    ^
+../include/libexfat.h:73:1: error: unknown type name ?ssize_t?
+ ssize_t exfat_write(int fd, void *buf, size_t size, off_t offset);
+ ^
+../include/libexfat.h:73:53: error: unknown type name ?off_t?
+ ssize_t exfat_write(int fd, void *buf, size_t size, off_t offset);
+                                                     ^
+../include/libexfat.h:75:1: error: unknown type name ?ssize_t?
+ ssize_t exfat_utf16_enc(const char *in_str, __u16 *out_str, size_t out_size);
+ ^
+../include/libexfat.h:76:1: error: unknown type name ?ssize_t?
+ ssize_t exfat_utf16_dec(const __u16 *in_str, size_t in_len,
+ ^
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status: https://github.com/exfatprogs/exfatprogs/pull/50]
+---
+ include/libexfat.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/libexfat.h b/include/libexfat.h
+index ed1fb4c..36c8bdd 100644
+--- a/include/libexfat.h
++++ b/include/libexfat.h
+@@ -6,6 +6,7 @@
+ #ifndef _LIBEXFAT_H
+ 
+ #include <stdbool.h>
++#include <sys/types.h>
+ #include <wchar.h>
+ 
+ #define KB			(1024)
+-- 
+2.20.1
+
-- 
2.20.1
