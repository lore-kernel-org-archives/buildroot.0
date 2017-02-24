From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Feb 2017 12:02:25 +0100
Subject: [Buildroot] [git commit] glibc: install libanl.so to target
Message-ID: <20170225154244.58875821DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba684f0a128e33b24b7c4a4bce0d0d557887f8df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libanl.so is needed for asynchronous network address and service
translation, declared in netdb.h

Signed-off-by: Jesper B??kdahl <jbb@gamblify.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
