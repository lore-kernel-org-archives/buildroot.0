From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 24 Aug 2013 13:07:42 +0200
Subject: [Buildroot] [PATCH 2/3] neon: factorize 'depends on
	BR2_PACKAGE_NEON'
In-Reply-To: <1377342463-17543-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1377342463-17543-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1377342463-17543-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/neon/Config.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/neon/Config.in b/package/neon/Config.in
index 3f18665..72d9fd7 100644
--- a/package/neon/Config.in
+++ b/package/neon/Config.in
@@ -5,16 +5,16 @@ config BR2_PACKAGE_NEON
 
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
@@ -22,7 +22,6 @@ config BR2_PACKAGE_NEON_SSL
 config BR2_PACKAGE_NEON_EXPAT
 	bool "XML support with expat"
 	select BR2_PACKAGE_EXPAT
-	depends on BR2_PACKAGE_NEON
 	depends on !BR2_PACKAGE_NEON_LIBXML2
 	help
 	  Enable XML support in neon, using the Expat XML library.
@@ -30,6 +29,7 @@ config BR2_PACKAGE_NEON_EXPAT
 config BR2_PACKAGE_NEON_LIBXML2
 	bool "XML support with libxml2"
 	select BR2_PACKAGE_LIBXML2
-	depends on BR2_PACKAGE_NEON
 	help
 	  Enable XML support in neon, using the libxml2 XML library.
+
+endif
-- 
1.8.1.2
