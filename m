From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Jun 2014 17:21:46 -0300
Subject: [Buildroot] [PATCH] libwebsockets: needs mmu
Message-ID: <1401826906-14174-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/92d/92d29c3f8ab0686c6de765c108937240a6649d18/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libwebsockets/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index 1d927bb..2b350bf 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBWEBSOCKETS
 	bool "libwebsockets"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
 	help
 	  Libwebsockets is a lightweight pure C library built to use
-- 
1.8.5.5
