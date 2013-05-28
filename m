From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 May 2013 23:32:25 +0200
Subject: [Buildroot] [git commit] wvstreams: need largefile support
Message-ID: <20130528214154.0AC949A623@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3029189aa45058dd864aac0425e5e1d682b0fad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/bc4/bc4c617a5d7740b6eedcfc0dd24aeed5bc888f6d/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/wvdial/Config.in    |    4 ++++
 package/wvstreams/Config.in |    5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/wvdial/Config.in b/package/wvdial/Config.in
index 730d35a..42431ca 100644
--- a/package/wvdial/Config.in
+++ b/package/wvdial/Config.in
@@ -1,9 +1,13 @@
 config BR2_PACKAGE_WVDIAL
 	bool "wvdial"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # wvstreams
 	select BR2_PACKAGE_WVSTREAMS
 	help
 	  wvdial is an intelligent Point-to-Point Protocol dialer
 
 	  http://wvdial.googlecode.com/
+
+comment "wvdial requires a toolchain with C++ and largefile support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
index c39ec33..11b8e44 100644
--- a/package/wvstreams/Config.in
+++ b/package/wvstreams/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_WVSTREAMS
 	bool "wvstreams"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
@@ -9,5 +10,5 @@ config BR2_PACKAGE_WVSTREAMS
 
 	  http://wvstreams.googlecode.com/
 
-comment "wvstreams requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "wvstreams requires a toolchain with C++ and largefile support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE
