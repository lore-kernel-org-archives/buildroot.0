From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 21:42:37 +0200
Subject: [Buildroot] [git commit] libva-intel-driver: indirectly depends on
	XORG7
Message-ID: <20141012195151.0512CB2B69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=062bacfa67688b2747412a30ddeb996449d1c6df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva-intel-driver/Config.in |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
index a0f397b..cac2fed 100644
--- a/package/libva-intel-driver/Config.in
+++ b/package/libva-intel-driver/Config.in
@@ -3,10 +3,11 @@ config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 	select BR2_PACKAGE_LIBVA
 	select BR2_PACKAGE_LIBDRM
 	select BR2_PACKAGE_LIBDRM_INTEL
-	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXEXT if BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_XLIB_LIBXFIXES if BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXFIXES
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_XORG7 # libdrm intel
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
 	depends on BR2_LARGEFILE # libdrm
 	depends on !BR2_PREFER_STATIC_LIB # libva
@@ -19,3 +20,7 @@ comment "libva intel driver needs a toolchain w/ largefile, threads, dynamic lib
 	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_PREFER_STATIC_LIB
 	depends on BR2_i386 || BR2_x86_64
+
+comment "libva intel driver needs X.org"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_PACKAGE_XORG7
