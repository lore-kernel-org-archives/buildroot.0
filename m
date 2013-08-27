From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Aug 2013 00:23:37 +0200
Subject: [Buildroot] [git commit] neon: factorize 'depends on
	BR2_PACKAGE_NEON'
Message-ID: <20130831213337.B6C9D9B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f6d97131220bc3bc4b604af4ee8a79fc7e8cab73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/neon/Config.in |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/neon/Config.in b/package/neon/Config.in
index f972dbb..54b51c8 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -5,23 +5,22 @@ config BR2_PACKAGE_NEON
 
 	  http://www.webdav.org/neon/
 
+if BR2_PACKAGE_NEON
+
 config BR2_PACKAGE_NEON_ZLIB
 	bool "ZLIB support"
-	depends on BR2_PACKAGE_NEON
 	select BR2_PACKAGE_ZLIB
 	help
 	  build with ZLIB support
 
 config BR2_PACKAGE_NEON_SSL
 	bool "SSL support"
-	depends on BR2_PACKAGE_NEON
 	select BR2_PACKAGE_OPENSSL
 	help
 	  build with SSL support
 
 choice
 	prompt "XML Support"
-	depends on BR2_PACKAGE_NEON
 	help
 	  Select which XML library to use...
 	  none       do not build with XML support
@@ -46,3 +45,5 @@ config BR2_PACKAGE_NEON_LIBXML2
 	  libxml2    use libxml2, a library to read, modify and
 	             write XML and HTML files.
 endchoice
+
+endif
