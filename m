From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:06:46 +0100
Subject: [Buildroot] [git commit] libgail: add missing indirect dependency
	on C++ and atomics
Message-ID: <20150207202910.393BB8046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0cd69846a61aafb2a69aad4e69d3021cd6dcc729
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgail/Config.in |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/libgail/Config.in b/package/libgail/Config.in
index 512f228..3967083 100644
--- a/package/libgail/Config.in
+++ b/package/libgail/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_LIBGAIL
 	depends on BR2_USE_WCHAR # pango -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> libglib2
 	depends on BR2_USE_MMU # pango -> libglib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
+	depends on BR2_ARCH_HAS_ATOMICS # pango -> cairo
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_PANGO
 	help
@@ -20,7 +22,8 @@ config BR2_PACKAGE_LIBGAIL
 
 	  http://developer.gnome.org/projects/gap
 
-comment "libgail needs a toolchain w/ wchar, threads"
+comment "libgail needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_PACKAGE_LIBGTK2
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
+	depends on BR2_ARCH_HAS_ATOMICS
