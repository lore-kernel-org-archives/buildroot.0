From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Jan 2015 20:16:57 -0300
Subject: [Buildroot] [PATCH 2/7] liblogging: bump to version 1.0.5
In-Reply-To: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421191022-5509-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1421191022-5509-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file and drop upstream patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/liblogging/liblogging-01-stdarg.patch | 29 ---------------------------
 package/liblogging/liblogging.hash            |  2 ++
 package/liblogging/liblogging.mk              |  2 +-
 3 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 package/liblogging/liblogging-01-stdarg.patch
 create mode 100644 package/liblogging/liblogging.hash

diff --git a/package/liblogging/liblogging-01-stdarg.patch b/package/liblogging/liblogging-01-stdarg.patch
deleted file mode 100644
index 081824a..0000000
--- a/package/liblogging/liblogging-01-stdarg.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-[PATCH] stdlog: va_list needs stdarg.h
-
-Otherwise we get compilation errors like:
-
-In file included from stdlogctl.c:32:0:
-stdlog.h:80:75: error: unknown type name 'va_list'
-In file included from stdlogctl.c:32:0:
-stdlog.h:81:131: error: unknown type name 'va_list'
-
-Simplified version of upstream fix:
-https://github.com/rsyslog/liblogging/commit/3bf42ae392c1a317f09711846ea1c7072ef45634
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- stdlog/stdlog.h |    1 +
- 1 file changed, 1 insertion(+)
-
-Index: liblogging-1.0.2/stdlog/stdlog.h
-===================================================================
---- liblogging-1.0.2.orig/stdlog/stdlog.h
-+++ liblogging-1.0.2/stdlog/stdlog.h
-@@ -28,6 +28,7 @@
- #ifndef LIBLOGGING_STDLOG_H_INCLUDED
- #define LIBLOGGING_STDLOG_H_INCLUDED
- #include <stdint.h>
-+#include <stdarg.h>
- 
- /* options for stdlog_open() call */
- #define STDLOG_SIGSAFE 1	/* enforce signal-safe implementation */
diff --git a/package/liblogging/liblogging.hash b/package/liblogging/liblogging.hash
new file mode 100644
index 0000000..f5674a1
--- /dev/null
+++ b/package/liblogging/liblogging.hash
@@ -0,0 +1,2 @@
+# From http://www.liblogging.org/
+sha256	310dc1691279b7a669d383581fe4b0babdc7bf75c9b54a24e51e60428624890b	liblogging-1.0.5.tar.gz
diff --git a/package/liblogging/liblogging.mk b/package/liblogging/liblogging.mk
index 2e375ad..9ef2e28 100644
--- a/package/liblogging/liblogging.mk
+++ b/package/liblogging/liblogging.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLOGGING_VERSION = 1.0.2
+LIBLOGGING_VERSION = 1.0.5
 LIBLOGGING_SITE = http://download.rsyslog.com/liblogging
 LIBLOGGING_LICENSE = BSD-2c
 LIBLOGGING_LICENSE_FILES = COPYING
-- 
2.0.5
