From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 05 Oct 2013 17:07:09 +0800
Subject: [Buildroot] [PATCH] ndisc6: needs mmu
Message-ID: <1380964029.3121.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix below build error if !BR2_USE_MMU:

tcpspray.o: In function `tcpspray':
tcpspray.c:(.text+0x4a8): undefined reference to `fork'
collect2: ld returned 1 exit status
make[3]: *** [tcpspray] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/ndisc6/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ndisc6/Config.in b/package/ndisc6/Config.in
index 6abe4ce..095b2e8 100644
--- a/package/ndisc6/Config.in
+++ b/package/ndisc6/Config.in
@@ -4,6 +4,7 @@ comment "ndisc6 requires a toolchain with IPv6 support"
 config BR2_PACKAGE_NDISC6
 	bool "ndisc6 tools"
 	depends on BR2_INET_IPV6
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  NDisc6 is a small collection of useful tools for IPv6 networking
-- 
1.8.1.2
