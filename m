From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 25 Sep 2013 09:55:16 +0800
Subject: [Buildroot] [PATCH] proftpd: needs mmu
Message-ID: <1380074116.19850.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Fix below build error:

src/main.o: In function `fork_server':
main.c:(.text+0x26fc): undefined reference to `fork'
src/main.o: In function `main':
main.c:(.text+0x39bc): undefined reference to `fork'
collect2: ld returned 1 exit status
make[1]: *** [proftpd] Error 1

 package/proftpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index 7793713..18407d1 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PROFTPD
 	bool "proftpd"
+	depends on BR2_USE_MMU # fork()
 	help
 	  ProFTPD, a highly configurable FTP server.
 
-- 
1.8.1.2
