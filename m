From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 25 Sep 2013 13:44:06 +0800
Subject: [Buildroot] [PATCH] stress: needs mmu
Message-ID: <1380087846.2156.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Fix below build error:

stress.o: In function `main':
stress.c:(.text+0x20b0): undefined reference to `fork'
stress.c:(.text+0x21d0): undefined reference to `fork'
stress.c:(.text+0x22f0): undefined reference to `fork'
stress.c:(.text+0x2434): undefined reference to `fork'
collect2: ld returned 1 exit status
make[2]: *** [stress] Error 1

 package/stress/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/stress/Config.in b/package/stress/Config.in
index b092b03..37f8946 100644
--- a/package/stress/Config.in
+++ b/package/stress/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_STRESS
 	bool "stress"
+	depends on BR2_USE_MMU # fork()
 	help
 	  A deliberately simple workload generator for POSIX systems.
 	  It imposes a configurable amount of CPU, memory, I/O, and
-- 
1.8.1.2
