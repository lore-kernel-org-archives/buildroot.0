From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 24 Jan 2016 00:12:02 +0100
Subject: [Buildroot] [PATCH] package/efl: disable Lua 5.2+ support
Message-ID: <1453590722-2490-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The efl are currently broken with Lua 5.2+.

See: https://phab.enlightenment.org/T2728

Avoid:
http://autobuild.buildroot.net/results/e178371c2c3bf42d59c6fc26409e098081239ccb/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 85e46b1..87b72ee 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_EFL
 	bool "efl"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HAS_UDEV # libudev
-	depends on BR2_PACKAGE_LUA # lua 5.1 or better
+	# https://phab.enlightenment.org/T2728
+	depends on BR2_PACKAGE_LUA_5_1 # needs lua 5.1, broken with 5.2+
 	depends on BR2_TOOLCHAIN_HAS_THREADS # untested without threads
 	depends on BR2_USE_MMU
 	depends on BR2_USE_WCHAR # use wchar_t
@@ -185,6 +186,6 @@ comment "efl needs udev /dev management and a toolchain w/ C++, dynamic library,
 		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
 	depends on BR2_USE_MMU
 
-comment "efl needs lua"
-	depends on !BR2_PACKAGE_LUA
+comment "efl needs lua 5.1"
+	depends on !BR2_PACKAGE_LUA_5_1
 	depends on BR2_USE_MMU
-- 
2.4.3
