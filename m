From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Oct 2019 00:08:11 +0200
Subject: [Buildroot] [git commit] package/android-tools: fastboot now
 available on !glibc toolchains
Message-ID: <20191009221024.06B377FB52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20d990669c5eee5097b0b5c3fb1ef4379bde964f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libselinux can now be built on !glibc toolchains, so we can re-enable
building fastboot on !glibc toolchains as well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/android-tools/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index 478f1392dc..881fa3b2a6 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -38,7 +38,6 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	bool "fastboot"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
-	depends on BR2_TOOLCHAIN_USES_GLIBC # libselinux
 	depends on !BR2_arc # libselinux
 	depends on BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
 	select BR2_PACKAGE_LIBSELINUX
@@ -48,10 +47,9 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	  the target, which can be used to reflash other target devices
 	  implementing the fastboot protocol.
 
-comment "fastboot needs a glibc toolchain w/ threads, dynamic library"
+comment "fastboot needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_arc
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 comment "fastboot needs headers >= 3.10 (PowerPC64), headers >= 3.16 (MIPS64)"
 	depends on !BR2_arc
