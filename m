From: Chris Zankel <chris@zankel.net>
Date: Thu, 7 Nov 2013 14:22:12 -0800
Subject: [Buildroot] [PATCH] uclibc-snapshot: enable option
	UCLIBC_HAS_OBSTACK
Message-ID: <527c2507.a60d440a.1787.ffff99f7@mx.google.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Prior to uClibc commit f143f920694c, uClibc used to always include the
gnu obstack extension, which is used and required by many tools, such as
binutils.

Because of the change mentioned above, obstack is now optional, and got
disabled per default, so enable it in the uClibc snapshot configuration file.

Signed-off-by: Chris Zankel <chris@zankel.net>
---
 package/uclibc/uClibc-snapshot.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
index cb6258d..145f709 100644
--- a/package/uclibc/uClibc-snapshot.config
+++ b/package/uclibc/uClibc-snapshot.config
@@ -113,6 +113,7 @@ UCLIBC_HAS_LFS=y
 # MALLOC_SIMPLE is not set
 MALLOC_STANDARD=y
 MALLOC_GLIBC_COMPAT=y
+UCLIBC_HAS_OBSTACK=y
 UCLIBC_DYNAMIC_ATEXIT=y
 # COMPAT_ATEXIT is not set
 UCLIBC_SUSV3_LEGACY=y
-- 
1.8.1.2
