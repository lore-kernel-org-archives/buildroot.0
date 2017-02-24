From: =?UTF-8?q?Jesper=20B=C3=A6kdahl?= <jbb@gamblify.com>
Date: Fri, 24 Feb 2017 10:03:07 +0100
Subject: [Buildroot] [PATCH v2 1/2] glibc: install libanl.so to target
In-Reply-To: <1487848270-32609-1-git-send-email-jbb@gamblify.com>
References: <1487848270-32609-1-git-send-email-jbb@gamblify.com>
Message-ID: <1487926988-32495-1-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libanl.so is needed for asynchronous network address and service
translation, declared in netdb.h

Signed-off-by: Jesper B?kdahl <jbb@gamblify.com>

---
Changes v1 -> v2:
 - Added info on libanl.so usage

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
