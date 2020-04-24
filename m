From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 24 Apr 2020 01:22:29 -0600
Subject: [Buildroot] [PATCH 1/1] package/exfatprogs: bump to version 1.0.2
Message-ID: <20200424072229.3477-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch that is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...rogs-add-missing-include-sys-types.h.patch | 49 -------------------
 package/exfatprogs/exfatprogs.hash            |  2 +-
 package/exfatprogs/exfatprogs.mk              |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch

diff --git a/package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch b/package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch
deleted file mode 100644
index 6019e5952b..0000000000
--- a/package/exfatprogs/0001-exfatprogs-add-missing-include-sys-types.h.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From da03ba80944668817c374a816b8b0c515af0ac89 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Fri, 17 Apr 2020 13:10:49 -0600
-Subject: [PATCH] exfatprogs: add missing #include <sys/types.h>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes:
-../include/libexfat.h:72:1: error: unknown type name ?ssize_t?
- ssize_t exfat_read(int fd, void *buf, size_t size, off_t offset);
- ^
-../include/libexfat.h:72:52: error: unknown type name ?off_t?
- ssize_t exfat_read(int fd, void *buf, size_t size, off_t offset);
-                                                    ^
-../include/libexfat.h:73:1: error: unknown type name ?ssize_t?
- ssize_t exfat_write(int fd, void *buf, size_t size, off_t offset);
- ^
-../include/libexfat.h:73:53: error: unknown type name ?off_t?
- ssize_t exfat_write(int fd, void *buf, size_t size, off_t offset);
-                                                     ^
-../include/libexfat.h:75:1: error: unknown type name ?ssize_t?
- ssize_t exfat_utf16_enc(const char *in_str, __u16 *out_str, size_t out_size);
- ^
-../include/libexfat.h:76:1: error: unknown type name ?ssize_t?
- ssize_t exfat_utf16_dec(const __u16 *in_str, size_t in_len,
- ^
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status: https://github.com/exfatprogs/exfatprogs/pull/50]
----
- include/exfat_tools.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/exfat_tools.h b/include/exfat_tools.h
-index 45de4aa..105fd2a 100644
---- a/include/exfat_tools.h
-+++ b/include/exfat_tools.h
-@@ -6,6 +6,7 @@
- #ifndef _EXFAT_TOOLS_H
- 
- #include <stdbool.h>
-+#include <sys/types.h>
- #include <wchar.h>
- 
- #define KB			(1024)
--- 
-2.20.1
-
diff --git a/package/exfatprogs/exfatprogs.hash b/package/exfatprogs/exfatprogs.hash
index 424cc2b1fa..654366d865 100644
--- a/package/exfatprogs/exfatprogs.hash
+++ b/package/exfatprogs/exfatprogs.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9cd3b71b0d90695969b83a68d5412898c120a60893e01434ef5e2be9f14fe570  exfatprogs-1.0.1.tar.gz
+sha256  e7f14f32dd67601ff42717f432093a400de878774796f6f1684fb9dbf0d499e1  exfatprogs-1.0.2.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/exfatprogs/exfatprogs.mk b/package/exfatprogs/exfatprogs.mk
index a69f119582..508f4ffff5 100644
--- a/package/exfatprogs/exfatprogs.mk
+++ b/package/exfatprogs/exfatprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFATPROGS_VERSION = 1.0.1
+EXFATPROGS_VERSION = 1.0.2
 EXFATPROGS_SITE = $(call github,exfatprogs,exfatprogs,$(EXFATPROGS_VERSION))
 EXFATPROGS_LICENSE = GPL-2.0+
 EXFATPROGS_LICENSE_FILES = COPYING
-- 
2.20.1
