From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Apr 2020 22:54:25 +0200
Subject: [Buildroot] [git commit] package/apcupsd: always depend on threads
Message-ID: <20200423204007.38DB48FDCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30365ace8a564576775896c859fc79c4813d5c98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/aa2ad7bdb37da611a4ec863ed2e986f34ea5228b/build-end.log

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apcupsd/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/apcupsd/Config.in b/package/apcupsd/Config.in
index 2849736a1a..4bc523eed4 100644
--- a/package/apcupsd/Config.in
+++ b/package/apcupsd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_APCUPSD
 	bool "apcupsd"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	help
 	  A daemon for controlling APC UPSes.
@@ -64,6 +65,6 @@ comment "usb support needs a toolchain w/ threads"
 
 endif
 
-comment "apcupsd needs a toolchain w/ C++"
+comment "apcupsd needs a toolchain w/ C++, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
