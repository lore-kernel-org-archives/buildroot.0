From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 16 Dec 2015 08:16:42 -0300
Subject: [Buildroot] [PATCH] openal: needs NPTL threads
Message-ID: <1450264602-18028-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/ef2/ef22efa0f8a73458852b529a32a7f21e9c72caa8/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.4.10
