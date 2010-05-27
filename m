From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 May 2010 14:48:47 +0200
Subject: [Buildroot] [git commit master] hal: dbus expat option is
	BR2_DBUS_EXPAT
Message-ID: <20100527124910.AFB56BF412@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=170b3d3d0550b8000cfc0cf789a5a902237353e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES               |    6 ++++++
 Config.in             |    2 +-
 package/hal/Config.in |    2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 202913d..f6a4ecd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,9 @@
+2010.05-rc4, Not yet released:
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: hal
+
 2010.05-rc3, Released May 27th, 2010:
 
 	Fixes all over the tree.
diff --git a/Config.in b/Config.in
index 4d4dfc9..9451be7 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.05-rc3"
+	default "2010.05-rc3-git"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/package/hal/Config.in b/package/hal/Config.in
index f8dc9dd..1951c9d 100644
--- a/package/hal/Config.in
+++ b/package/hal/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_HAL
 	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_DBUS
-	select BR2_PACKAGE_DBUS_EXPAT
+	select BR2_DBUS_EXPAT
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_HWDATA
 	select BR2_PACKAGE_UDEV
-- 
1.6.3.3
