From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 21 Jun 2011 11:39:37 +0200
Subject: [Buildroot] [git commit] dbus-glib: nowadays works with libxml2
	backend as well
Message-ID: <20110621094119.0D03B88D83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7a5d51cbdf49c69641f1cedfeb76ecbffe578e9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So get rid of expat dependency.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus-glib/Config.in |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/dbus-glib/Config.in b/package/dbus-glib/Config.in
index c019be7..f1dab43 100644
--- a/package/dbus-glib/Config.in
+++ b/package/dbus-glib/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_DBUS_GLIB
 	bool "dbus-glib"
 	depends on BR2_PACKAGE_DBUS
-	depends on BR2_DBUS_EXPAT
 	depends on BR2_USE_WCHAR # glib2
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -9,8 +8,5 @@ config BR2_PACKAGE_DBUS_GLIB
 
 	  http://www.freedesktop.org/software/dbus
 
-comment "dbus-glib needs dbus to be compiled with expat support"
-	depends on BR2_PACKAGE_DBUS && !BR2_DBUS_EXPAT
-
 comment "dbus-glib requires a toolchain with WCHAR support"
 	depends on BR2_PACKAGE_DBUS && !BR2_USE_WCHAR
-- 
1.7.3.4
