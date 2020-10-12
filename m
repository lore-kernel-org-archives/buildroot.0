From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 12 Oct 2020 22:18:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/sslh: drop C++ dependency
Message-ID: <20201012201849.3040707-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sslh is written in plain C so drop C++ dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sslh/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/sslh/Config.in b/package/sslh/Config.in
index 21bd65f165..e490c8c837 100644
--- a/package/sslh/Config.in
+++ b/package/sslh/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_SSLH
 	bool "sslh"
-	depends on BR2_INSTALL_LIBSTDCPP
 	# uses fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCONFIG
@@ -8,7 +7,3 @@ config BR2_PACKAGE_SSLH
 	  Applicative protocol multiplexer
 
 	  http://www.rutschle.net/tech/sslh.shtml
-
-comment "sslh needs a toolchain w/ C++"
-	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.28.0
