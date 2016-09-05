From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  5 Sep 2016 18:16:52 -0300
Subject: [Buildroot] [PATCH] libgtk3: fix typo
Message-ID: <1473110212-14012-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's wayland, not waylandd, hence gtk3+ with the wayland backend went
completely poof.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk3/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 2dd6dfa..738f865 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -29,7 +29,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLANDD || \
+	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
 	help
 	  The GTK+ version 3 graphical user interface library
-- 
2.7.3
