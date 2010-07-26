From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Jul 2010 22:25:19 +0200
Subject: [Buildroot] [git commit master 1/1] java: mark as broken
Message-ID: <20100726203257.6E758834AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=39e6ba1b39de98e445f0d4694567a232cfc42332
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We haven't had any updates to the java packages in a long time,
gcj in 4.3.x doesn't build, and 4.4.x is missing ecj1, so it cannot
have many users.

Mark it as broken and remove during the 2010.11 cycle, unless someone
steps up to maintain it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                 |    4 ++++
 package/Config.in       |    2 ++
 toolchain/gcc/Config.in |    1 +
 3 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index aeaef6f..3418a72 100644
--- a/CHANGES
+++ b/CHANGES
@@ -11,6 +11,10 @@
 
 	New GTK-based configurator, usable using 'make gconfig'.
 
+	Java packages marked as broken. Unless someone steps up to
+	support this, they will be removed during the 2010.11
+	development cycle.
+
 	New packages: cgilua, copas, coxpcall, ffmpeg, libsvgtiny,
 	luafilesystem, luasocket, rings, wsapi, xavante, xterm
 
diff --git a/package/Config.in b/package/Config.in
index 6b3616a..f6a3f34 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -287,10 +287,12 @@ source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 endmenu
 
+if BROKEN
 menu "Java"
 source "package/java/classpath/Config.in"
 source "package/java/concierge/Config.in"
 endmenu
+endif
 
 menu "Networking"
 source "package/libcgi/Config.in"
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 0c72957..31eba6b 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -96,6 +96,7 @@ config BR2_INSTALL_LIBGCJ
 	depends on !BR2_avr32 && BR2_INSTALL_LIBSTDCPP
 	select BR2_GCC_CROSS_JAVA
 	select BR2_LARGEFILE
+	depends on BROKEN
 	help
 	  Build/install java compiler and libgcj?
 
-- 
1.7.1
