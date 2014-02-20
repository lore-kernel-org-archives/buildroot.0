From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 20 Feb 2014 14:34:10 +0100
Subject: [Buildroot] [PATCH 1/3] xscreensaver: add missing indirect
	dependencies from libgtk2
Message-ID: <1392903252-10253-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xscreensaver/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 21a19d0..e2534a6 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2->pango
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2->glib2
+	depends on BR2_USE_WCHAR # libgtk2->glib2
+	depends on BR2_USE_MMU # libgtk2->glib2
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBGLADE
 	select BR2_PACKAGE_JPEG
@@ -18,6 +20,7 @@ config BR2_PACKAGE_XSCREENSAVER
 
 	  http://www.jwz.org/xscreensaver/
 
-comment "xscreensaver needs a toolchain w/ C++, threads"
+comment "xscreensaver needs a toolchain w/ wchar, C++, threads"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
-- 
1.9.rc1
