From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 21:54:00 +0100
Subject: [Buildroot] [git commit] openal: needs NPTL threads
Message-ID: <20151216205414.122E381FB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57c489ce5a7cfc8c4122515fbc4f4b13a4a6ec33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ef2/ef22efa0f8a73458852b529a32a7f21e9c72caa8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openal/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/openal/Config.in b/package/openal/Config.in
index 0f9d03d..4a73f45 100644
--- a/package/openal/Config.in
+++ b/package/openal/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OPENAL
 	bool "openal"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	help
 	  OpenAL provides capabilities for playing audio in a virtual
 	  3D environment. Distance attenuation, doppler shift, and
@@ -10,5 +10,6 @@ config BR2_PACKAGE_OPENAL
 
 	  http://kcat.strangesoft.net/openal.html
 
-comment "openal needs a toolchain w/ threads, C++"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+comment "openal needs a toolchain w/ NPTL, C++"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
+		|| !BR2_INSTALL_LIBSTDCPP
