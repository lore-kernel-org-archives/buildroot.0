From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 19:08:03 +0200
Subject: [Buildroot] [PATCHv2 1/3] neon: factorize 'depends on
	BR2_PACKAGE_NEON'
In-Reply-To: <1377623285-3359-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1377623285-3359-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1377623285-3359-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/neon/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

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
-- 
1.8.1.2
