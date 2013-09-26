From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 26 Sep 2013 09:54:53 +0800
Subject: [Buildroot] [PATCH] socat: needs mmu
Message-ID: <1380160493.18654.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Fix below build error:

sycls.o: In sycls.ofunction `: Fork'In:
sycls.c :function (.text`Fork+0x16d0':): undefined
 referencesycls.c to `fork'
collect2: ld returned 1 exit status:
(.text+0x16d0): undefined reference to `fork'
collect2: ld returned 1 exit status
make[1]: *** [procan] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [filan] Error 1

 package/socat/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/socat/Config.in b/package/socat/Config.in
index c478282..ec69c96 100644
--- a/package/socat/Config.in
+++ b/package/socat/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SOCAT
 	bool "socat"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Multipurpose socket relay program.
 
-- 
1.8.1.2
