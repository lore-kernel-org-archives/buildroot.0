From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Sep 2009 23:21:50 +0200
Subject: [Buildroot] [git commit master] dbus-glib: tighten dbus expat
	dependency
Message-ID: <20090927212248.BE5D277780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a6dfb9265b6184c5b9dc7fae752125dc96f3e40c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Depend on dbus being compiled with expat support and not just on expat
being enabled, as you can have expat enabled and still compile dbus
with libxml2 support instead.

While we're at it, only show comment about unforfilled dependencies if
dbus is enabled.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dbus-glib/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-glib/Config.in b/package/dbus-glib/Config.in
index be10c9f..7c992b0 100644
--- a/package/dbus-glib/Config.in
+++ b/package/dbus-glib/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_DBUS_GLIB
 	bool "dbus-glib"
 	depends on BR2_PACKAGE_DBUS
-	depends on BR2_PACKAGE_EXPAT
+	depends on BR2_DBUS_EXPAT
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  GLib bindings for D-Bus.
@@ -9,4 +9,4 @@ config BR2_PACKAGE_DBUS_GLIB
 	  http://www.freedesktop.org/software/dbus
 
 comment "dbus-glib needs dbus to be compiled with expat support"
-	depends on !BR2_PACKAGE_EXPAT
+	depends on BR2_PACKAGE_DBUS && !BR2_DBUS_EXPAT
-- 
1.6.3.3
