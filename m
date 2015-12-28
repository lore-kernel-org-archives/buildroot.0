From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 22:31:45 +0100
Subject: [Buildroot] [git commit] package/gtkmm3: reorder select/depends
Message-ID: <20151228213231.B8201822B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09649f2a305e0b9d52555c35c24178255aa298df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From [1]:
"Even though the ordering has absolutely no consequences in Kconfig, it
is not logical (when reading). It is more logical and far easier to
understand when depends come first, followed by the selects."

Also, the Config.in exemple in the manual suggest to use this coding
style [2].

[1] http://lists.busybox.net/pipermail/buildroot/2015-October/142955.html
[2] http://buildroot.uclibc.org/downloads/manual/manual.html#writing-rules-config-in

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gtkmm3/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index 30d3492..f617d83 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -1,17 +1,17 @@
 config BR2_PACKAGE_GTKMM3
 	bool "gtkmm3"
-	select BR2_PACKAGE_ATKMM
-	select BR2_PACKAGE_CAIROMM
-	select BR2_PACKAGE_GLIBMM
-	select BR2_PACKAGE_LIBGTK3
-	select BR2_PACKAGE_LIBSIGC
-	select BR2_PACKAGE_PANGOMM
 	depends on BR2_ARCH_HAS_ATOMICS # libcairomm/libgtk3/libpangomm -> cairo
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
+	select BR2_PACKAGE_ATKMM
+	select BR2_PACKAGE_CAIROMM
+	select BR2_PACKAGE_GLIBMM
+	select BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_LIBSIGC
+	select BR2_PACKAGE_PANGOMM
 	help
 	  The gtkmm3 package is a set of C++ bindings for GTK 3.
 
