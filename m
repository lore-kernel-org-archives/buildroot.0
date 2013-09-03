From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 3 Sep 2013 16:39:29 +0200
Subject: [Buildroot] [git commit] libcec: needs wchar
Message-ID: <20130903144123.1CCD09A2C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3d2001f2871a85891e216fbc9ad894f5c671c1c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/dae/dae6ec4f75b2aeb793b88567f48d94b07a6a59da/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcec/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libcec/Config.in b/package/libcec/Config.in
index 7a67952..256c6d6 100644
--- a/package/libcec/Config.in
+++ b/package/libcec/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBCEC
 	bool "libcec"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
 	help
 	  libcec allows you in combination with the right hardware to
 	  control your home theater devices with your TV remote
@@ -9,5 +10,6 @@ config BR2_PACKAGE_LIBCEC
 
 	  http://libcec.pulse-eight.com
 
-comment "libcec requires C++ and threading support in toolchain"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "libcec requires C++, WCHAR and threading support in toolchain"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
