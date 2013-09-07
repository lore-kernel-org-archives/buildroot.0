From: Axel Lin <axel.lin@ingics.com>
Date: Sat, 07 Sep 2013 14:07:23 +0800
Subject: [Buildroot] [PATCH] vsftpd: Fix dependency for needs mmu
Message-ID: <1378534043.18257.3.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 2eb995759 "vsftpd: needs mmu" adds "depends on BR2_TOOLCHAIN_HAS_THREADS".

The build error is:
sysutil.c:(.text+0x37ac): undefined reference to `fork'

Thus it should depend on BR2_USE_MMU rather than BR2_TOOLCHAIN_HAS_THREADS.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/vsftpd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vsftpd/Config.in b/package/vsftpd/Config.in
index 3d4cff1..54ef7bd 100644
--- a/package/vsftpd/Config.in
+++ b/package/vsftpd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_VSFTPD
 	bool "vsftpd"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # fork()
+	depends on BR2_USE_MMU # fork()
 	help
 	  vsftpd is an ftp daemon written with security in mind.
 	  http://vsftpd.beasts.org/
-- 
1.8.1.2
