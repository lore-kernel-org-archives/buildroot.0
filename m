From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 13:34:01 +0200
Subject: [Buildroot] [git commit] package/sslh: drop C++ dependency
Message-ID: <20201013112322.047618892C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=35c474f8ee718c7c2189b3e5938337c951a57162
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sslh is written in plain C so drop C++ dependency

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
