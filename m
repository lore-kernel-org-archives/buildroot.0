From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Mar 2014 13:54:01 -0300
Subject: [Buildroot] [PATCH] libcdio: need mmu
Message-ID: <1394643241-15375-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/92b/92b6513a10bed9018d64e1347c99ff6db96990eb/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcdio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcdio/Config.in b/package/libcdio/Config.in
index 555eb29..fdc001e 100644
--- a/package/libcdio/Config.in
+++ b/package/libcdio/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCDIO
 	bool "libcdio"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The GNU Compact Disc Input and Control library.
-- 
1.8.3.2
