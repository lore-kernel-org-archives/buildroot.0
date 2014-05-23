From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 22 May 2014 21:03:01 -0300
Subject: [Buildroot] [PATCH 2/2] libcurl: bump to version 7.37.0
In-Reply-To: <1400803381-5875-1-git-send-email-gustavo@zacarias.com.ar>
References: <1400803381-5875-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1400803381-5875-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl-01-disable-manual.patch | 31 -------------------------
 package/libcurl/libcurl.mk                      |  2 +-
 2 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 package/libcurl/libcurl-01-disable-manual.patch

diff --git a/package/libcurl/libcurl-01-disable-manual.patch b/package/libcurl/libcurl-01-disable-manual.patch
deleted file mode 100644
index 4872169..0000000
--- a/package/libcurl/libcurl-01-disable-manual.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Apply fix from 38d582ff541353d738858299d4a2b78bafac03ed to unbreak
-building with --disable-manual.
-We don't use the literal patch since that means re-generating files
-from the tarball that are usually shipped.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura curl-7.36.0.orig/src/tool_hugehelp.c curl-7.36.0/src/tool_hugehelp.c
---- curl-7.36.0.orig/src/tool_hugehelp.c	2014-03-31 19:28:23.018515093 -0300
-+++ curl-7.36.0/src/tool_hugehelp.c	2014-03-31 19:28:09.994076200 -0300
-@@ -4165,6 +4165,10 @@
- "  these mailing lists instead of mailing any individual.\n"
- , stdout) ;
- }
-+#else /* !USE_MANUAL */
-+/* built-in manual is disabled, blank function */
-+#include "tool_hugehelp.h"
-+void hugehelp(void) {}
- #endif /* USE_MANUAL */
- #else
- /*
-@@ -8192,5 +8196,9 @@
-   }
-   inflateEnd(&z);
- }
-+#else
-+/* built-in manual is disabled, blank function */
-+#include "tool_hugehelp.h"
-+void hugehelp(void) {}
- #endif /* USE_MANUAL */
- #endif /* HAVE_LIBZ */
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 2907303..00cff09 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.36.0
+LIBCURL_VERSION = 7.37.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
1.8.5.5
