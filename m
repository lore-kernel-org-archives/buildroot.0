From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Mar 2014 11:20:35 +0200
Subject: [Buildroot] [PATCH 1/1] mtools: Does not compile on bfin
Message-ID: <1396171235-18112-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/c0f/c0ff79569690b5799c25c09bde581cee6acb9910/

expand.o: In function `_safePopenOut':
expand.c:(.text+0x1e): undefined reference to `_fork'
precmd.o: In function `_precmd':
precmd.c:(.text+0x16): undefined reference to `_fork'

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mtools/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtools/Config.in b/package/mtools/Config.in
index 5865223..1c83b9e 100644
--- a/package/mtools/Config.in
+++ b/package/mtools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MTOOLS
 	bool "mtools"
 	depends on BR2_USE_WCHAR
+	depends on !BR2_bfin # fork()
 	depends on BR2_USE_MMU # fork()
 	help
 	  Mtools is a collection of utilities to access MS-DOS disks from
-- 
1.7.10.4
