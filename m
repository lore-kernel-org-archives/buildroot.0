From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Feb 2014 19:20:46 +0100
Subject: [Buildroot] [git commit] xscreensaver: add missing indirect
	dependencies from libgtk2
Message-ID: <20140220194859.89DAD9CAEF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8d164b52bee2b0e0db56a8ce1f77757ff7a975a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xscreensaver/Config.in |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

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
