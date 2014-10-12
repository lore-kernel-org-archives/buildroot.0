From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 21:12:35 +0200
Subject: [Buildroot] [git commit] libva-intel-driver: add indirect
	dependency on BR2_PREFER_STATIC_LIB
Message-ID: <20141012194155.240C1B2B2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be364a39dc2d7aa978a70ec628595c0fb7adb411
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libva-intel-driver/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
index 89a3264..a0f397b 100644
--- a/package/libva-intel-driver/Config.in
+++ b/package/libva-intel-driver/Config.in
@@ -9,11 +9,13 @@ config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
 	depends on BR2_LARGEFILE # libdrm
+	depends on !BR2_PREFER_STATIC_LIB # libva
 	help
 	  VA-API back-end driver for Intel graphics chips
 
 	  https://01.org/linuxgraphics/community/vaapi
 
-comment "libva intel driver needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libva intel driver needs a toolchain w/ largefile, threads, dynamic library"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_PREFER_STATIC_LIB
 	depends on BR2_i386 || BR2_x86_64
