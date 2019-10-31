From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Oct 2019 22:23:33 +0100
Subject: [Buildroot] [git commit] package/sysrepo: needs NPTL
Message-ID: <20191031211708.431A18E368@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f91ae31a183aa674d705bac0d0f2574b5a273af5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sysrepo needs pthread_rwlock_timedrdlock

Fixes:
 - http://autobuild.buildroot.org/results/f0e4368977f257d76aedff335af3068deafaf28f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysrepo/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index 3ad6040858..64050adfda 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_SYSREPO
 	depends on BR2_USE_MMU # libnetconf2
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # host-protobuf
 	select BR2_PACKAGE_LIBAVL
@@ -28,8 +28,8 @@ config BR2_PACKAGE_SYSREPO_EXAMPLES
 
 endif
 
-comment "sysrepo needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "sysrepo needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_NPTL
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
