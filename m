From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 27 Jul 2014 00:58:54 -0300
Subject: [Buildroot] [PATCH] rdesktop: needs mmu
Message-ID: <1406433534-25974-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/8f2/8f24a81516383feaffed485c85958e7a1c68176c/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rdesktop/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rdesktop/Config.in b/package/rdesktop/Config.in
index c0abe27..f683ed3 100644
--- a/package/rdesktop/Config.in
+++ b/package/rdesktop/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_RDESKTOP
 	bool "rdesktop"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXT
-- 
1.8.5.5
