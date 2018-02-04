From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Feb 2018 10:57:01 +0100
Subject: [Buildroot] [git commit] gconf: add dependency on toolchain w/
 dynamic lib
Message-ID: <20180204095716.B5FF188347@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=032e229e4425ff7bc1c128be5ebc467e9d6c4203
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GConf fails to build when BR2_STATIC_LIBS=y.

Fixes:
    http://autobuild.buildroot.net/results/ad8a9b082006f0334010c9c4dc5a90c2071df121/

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gconf/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gconf/Config.in b/package/gconf/Config.in
index a68287525b..a967d61644 100644
--- a/package/gconf/Config.in
+++ b/package/gconf/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_GCONF
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
 	depends on BR2_USE_MMU # dbus, libglib2
 	depends on BR2_USE_WCHAR # libglib2
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_LIBGLIB2
@@ -14,6 +15,7 @@ config BR2_PACKAGE_GCONF
 
 	  https://projects.gnome.org/gconf/
 
-comment "gconf needs a toolchain w/ threads, wchar"
+comment "gconf needs a toolchain w/ threads, wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR \
+		|| BR2_STATIC_LIBS
