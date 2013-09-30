From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 30 Sep 2013 10:04:29 +0800
Subject: [Buildroot] [PATCH] findutils: needs mmu
Message-ID: <1380506669.14281.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Fix below build error:

./libfindtools.a(pred.o): In function `launch':
pred.c:(.text+0x240c): undefined reference to `fork'
collect2: .ld returned 1 exit status/libfindtools.a
(pred.o): In function `launch':
pred.c:(.text+0x240c): undefined reference to `fork'
collect2: ld returned 1 exit status
make[4]: *** [oldfind] Error 1
make[4]: *** Waiting for unfinished jobs....
make[4]: *** [find] Error 1

 package/findutils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/findutils/Config.in b/package/findutils/Config.in
index bbe2cc1..32e87c2 100644
--- a/package/findutils/Config.in
+++ b/package/findutils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FINDUTILS
 	bool "findutils"
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # fork()
 	help
 	  Basic directory searching utilities.  Provides the
 	  common 'find', 'xargs', 'locate', and 'updatedb' binaries.
-- 
1.8.1.2
