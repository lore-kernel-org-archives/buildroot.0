From: =?UTF-8?q?Jesper=20B=C3=A6kdahl?= <jbb@gamblify.com>
Date: Thu, 23 Feb 2017 12:11:10 +0100
Subject: [Buildroot] [PATCH 1/1] glibc: install libanl.so to target
Message-ID: <1487848270-32609-1-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jesper B?kdahl <jbb@gamblify.com>
---
 package/glibc/glibc.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index c11f7cd..ee52539 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -101,9 +101,9 @@ endef
 #
 
 GLIBC_LIBS_LIB = \
-	ld*.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* libm.so.*        \
-	libnsl.so.* libpthread.so.* libresolv.so.* librt.so.* libutil.so.*   \
-	libnss_files.so.* libnss_dns.so.* libmvec.so.*
+	ld*.so.* libanl.so.* libc.so.* libcrypt.so.* libdl.so.* libgcc_s.so.* \
+	libm.so.* libnsl.so.* libpthread.so.* libresolv.so.* librt.so.* \
+	libutil.so.* libnss_files.so.* libnss_dns.so.* libmvec.so.*
 
 ifeq ($(BR2_PACKAGE_GDB),y)
 GLIBC_LIBS_LIB += libthread_db.so.*
-- 
2.7.4
