From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 1 Apr 2011 23:08:12 +0200
Subject: [Buildroot] [git commit master 1/1] lighttpd: cleanup sub options
Message-ID: <20110401210832.1208981DFE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=252d9a20a16c5b15d8754d6dd20b89c18bdcbe30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Get rid of extra packages submenu and tweak the option descriptions.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/lighttpd/Config.in |   17 +++++------------
 1 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 49877e4..a822d90 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -12,43 +12,36 @@ config BR2_PACKAGE_LIGHTTPD
 	  http://www.lighttpd.net/
 
 if BR2_PACKAGE_LIGHTTPD
-menu "lighttpd packages"
 
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
-	bool "lighttpd openssl support"
-	depends on BR2_PACKAGE_LIGHTTPD
+	bool "openssl support"
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Enable OpenSSL support for lighttpd.
 
 config BR2_PACKAGE_LIGHTTPD_ZLIB
-	bool "lighttpd zlib support"
-	depends on BR2_PACKAGE_LIGHTTPD
+	bool "zlib support"
 	select BR2_PACKAGE_ZLIB
 	help
 	  Enable zlib support for lighttpd mod_compress.
 
 config BR2_PACKAGE_LIGHTTPD_BZIP2
-	bool "lighttpd bzip2 support"
-	depends on BR2_PACKAGE_LIGHTTPD
+	bool "bzip2 support"
 	select BR2_PACKAGE_BZIP2
 	help
 	  Enable bzip2 support for lighttpd mod_compress.
 
 config BR2_PACKAGE_LIGHTTPD_PCRE
-	bool "pcre"
-	depends on BR2_PACKAGE_LIGHTTPD
+	bool "pcre support"
 	select BR2_PACKAGE_PCRE
 	help
 	  Enable PCRE support. Needed to support mod_rewrite
 
 config BR2_PACKAGE_LIGHTTPD_WEBDAV
-	bool "webdav"
-	depends on BR2_PACKAGE_LIGHTTPD
+	bool "webdav support"
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_SQLITE
 	help
 	  Enable webdav support. Needed to support mod_webdav
 
-endmenu
 endif
-- 
1.7.3.4
