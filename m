From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 12:14:46 +0200
Subject: [Buildroot] [PATCH 2/2] perl-*: regeneration of Config.in files
In-Reply-To: <20181010101446.30160-1-francois.perrad@gadz.org>
References: <20181010101446.30160-1-francois.perrad@gadz.org>
Message-ID: <20181010101446.30160-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-apache-logformat-compiler/Config.in         | 1 +
 package/perl-class-load/Config.in                        | 1 +
 package/perl-class-std-fast/Config.in                    | 1 +
 package/perl-cookie-baker/Config.in                      | 1 +
 package/perl-crypt-openssl-rsa/Config.in                 | 1 +
 package/perl-data-optlist/Config.in                      | 1 +
 package/perl-dbd-mysql/Config.in                         | 3 ++-
 package/perl-devel-stacktrace-ashtml/Config.in           | 1 +
 package/perl-dist-checkconflicts/Config.in               | 1 +
 package/perl-file-listing/Config.in                      | 1 +
 package/perl-file-sharedir/Config.in                     | 1 +
 package/perl-gdgraph/Config.in                           | 1 +
 package/perl-html-parser/Config.in                       | 1 +
 package/perl-http-cookies/Config.in                      | 1 +
 package/perl-http-daemon/Config.in                       | 1 +
 package/perl-http-entity-parser/Config.in                | 1 +
 package/perl-http-headers-fast/Config.in                 | 1 +
 package/perl-http-message/Config.in                      | 1 +
 package/perl-http-negotiate/Config.in                    | 1 +
 package/perl-io-socket-multicast/Config.in               | 1 +
 package/perl-io-socket-ssl/Config.in                     | 1 +
 package/perl-libwww-perl/Config.in                       | 1 +
 package/perl-mail-dkim/Config.in                         | 1 +
 package/perl-mailtools/Config.in                         | 1 +
 package/perl-mime-tools/Config.in                        | 1 +
 package/perl-module-implementation/Config.in             | 1 +
 package/perl-mojolicious-plugin-authentication/Config.in | 1 +
 package/perl-net-dns/Config.in                           | 1 +
 package/perl-net-http/Config.in                          | 1 +
 package/perl-package-stash/Config.in                     | 1 +
 package/perl-plack/Config.in                             | 1 +
 package/perl-www-robotrules/Config.in                    | 1 +
 package/perl-x10/Config.in                               | 1 +
 package/perl-xml-libxml/Config.in                        | 1 +
 package/perl-xml-sax/Config.in                           | 1 +
 35 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/package/perl-apache-logformat-compiler/Config.in b/package/perl-apache-logformat-compiler/Config.in
index 81d621082..f8f427006 100644
--- a/package/perl-apache-logformat-compiler/Config.in
+++ b/package/perl-apache-logformat-compiler/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_APACHE_LOGFORMAT_COMPILER
 	bool "perl-apache-logformat-compiler"
+	# runtime
 	select BR2_PACKAGE_PERL_POSIX_STRFTIME_COMPILER
 	help
 	  Compile a log format string to perl-code
diff --git a/package/perl-class-load/Config.in b/package/perl-class-load/Config.in
index fef9431e4..89d607003 100644
--- a/package/perl-class-load/Config.in
+++ b/package/perl-class-load/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_CLASS_LOAD
 	bool "perl-class-load"
 	depends on !BR2_STATIC_LIBS
+	# runtime
 	select BR2_PACKAGE_PERL_DATA_OPTLIST
 	select BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION
 	select BR2_PACKAGE_PERL_MODULE_RUNTIME
diff --git a/package/perl-class-std-fast/Config.in b/package/perl-class-std-fast/Config.in
index 10b1e0d78..c63fe9f64 100644
--- a/package/perl-class-std-fast/Config.in
+++ b/package/perl-class-std-fast/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_CLASS_STD_FAST
 	bool "perl-class-std-fast"
+	# runtime
 	select BR2_PACKAGE_PERL_CLASS_STD
 	help
 	  faster but less secure than Class::Std
diff --git a/package/perl-cookie-baker/Config.in b/package/perl-cookie-baker/Config.in
index e6846a21e..6bd102f0b 100644
--- a/package/perl-cookie-baker/Config.in
+++ b/package/perl-cookie-baker/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_COOKIE_BAKER
 	bool "perl-cookie-baker"
+	# runtime
 	select BR2_PACKAGE_PERL_URI
 	help
 	  Cookie string generator / parser
diff --git a/package/perl-crypt-openssl-rsa/Config.in b/package/perl-crypt-openssl-rsa/Config.in
index fe2e0cf59..700143609 100644
--- a/package/perl-crypt-openssl-rsa/Config.in
+++ b/package/perl-crypt-openssl-rsa/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
 	bool "perl-crypt-openssl-rsa"
 	depends on !BR2_STATIC_LIBS
+	# runtime
 	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM
 	help
 	  RSA encoding and decoding, using the openSSL libraries
diff --git a/package/perl-data-optlist/Config.in b/package/perl-data-optlist/Config.in
index 0393e6564..8be22807d 100644
--- a/package/perl-data-optlist/Config.in
+++ b/package/perl-data-optlist/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_DATA_OPTLIST
 	bool "perl-data-optlist"
 	depends on !BR2_STATIC_LIBS
+	# runtime
 	select BR2_PACKAGE_PERL_PARAMS_UTIL
 	select BR2_PACKAGE_PERL_SUB_INSTALL
 	help
diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/Config.in
index f6cc3f99e..621fabb84 100644
--- a/package/perl-dbd-mysql/Config.in
+++ b/package/perl-dbd-mysql/Config.in
@@ -4,8 +4,9 @@ config BR2_PACKAGE_PERL_DBD_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
 	depends on BR2_USE_MMU # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
-	select BR2_PACKAGE_PERL_DBI
 	select BR2_PACKAGE_MYSQL
+	# runtime
+	select BR2_PACKAGE_PERL_DBI
 	help
 	  A MySQL driver for the Perl5 Database Interface (DBI)
 
diff --git a/package/perl-devel-stacktrace-ashtml/Config.in b/package/perl-devel-stacktrace-ashtml/Config.in
index 001709a6a..4c0f964d1 100644
--- a/package/perl-devel-stacktrace-ashtml/Config.in
+++ b/package/perl-devel-stacktrace-ashtml/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_DEVEL_STACKTRACE_ASHTML
 	bool "perl-devel-stacktrace-ashtml"
+	# runtime
 	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE
 	help
 	  Displays stack trace in HTML
diff --git a/package/perl-dist-checkconflicts/Config.in b/package/perl-dist-checkconflicts/Config.in
index 10f0944aa..d893cd711 100644
--- a/package/perl-dist-checkconflicts/Config.in
+++ b/package/perl-dist-checkconflicts/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_DIST_CHECKCONFLICTS
 	bool "perl-dist-checkconflicts"
+	# runtime
 	select BR2_PACKAGE_PERL_MODULE_RUNTIME
 	help
 	  declare version conflicts for your dist
diff --git a/package/perl-file-listing/Config.in b/package/perl-file-listing/Config.in
index 3cb199677..819191c90 100644
--- a/package/perl-file-listing/Config.in
+++ b/package/perl-file-listing/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_FILE_LISTING
 	bool "perl-file-listing"
+	# runtime
 	select BR2_PACKAGE_PERL_HTTP_DATE
 	help
 	  parse directory listing
diff --git a/package/perl-file-sharedir/Config.in b/package/perl-file-sharedir/Config.in
index 592dc8f43..98d103100 100644
--- a/package/perl-file-sharedir/Config.in
+++ b/package/perl-file-sharedir/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_FILE_SHAREDIR
 	bool "perl-file-sharedir"
+	# runtime
 	select BR2_PACKAGE_PERL_CLASS_INSPECTOR
 	help
 	  Locate per-dist and per-module shared files
diff --git a/package/perl-gdgraph/Config.in b/package/perl-gdgraph/Config.in
index 10b3cd032..6429e7fb1 100644
--- a/package/perl-gdgraph/Config.in
+++ b/package/perl-gdgraph/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_GDGRAPH
 	bool "perl-gdgraph"
 	depends on !BR2_STATIC_LIBS
+	# runtime
 	select BR2_PACKAGE_PERL_GD
 	select BR2_PACKAGE_PERL_GDTEXTUTIL
 	help
diff --git a/package/perl-html-parser/Config.in b/package/perl-html-parser/Config.in
index 22a16d646..47776a8ea 100644
--- a/package/perl-html-parser/Config.in
+++ b/package/perl-html-parser/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_HTML_PARSER
 	bool "perl-html-parser"
 	depends on !BR2_STATIC_LIBS
+	# runtime
 	select BR2_PACKAGE_PERL_HTML_TAGSET
 	help
 	  HTML parser class
diff --git a/package/perl-http-cookies/Config.in b/package/perl-http-cookies/Config.in
index 4095fee82..41b1f383c 100644
--- a/package/perl-http-cookies/Config.in
+++ b/package/perl-http-cookies/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_COOKIES
 	bool "perl-http-cookies"
+	# runtime
 	select BR2_PACKAGE_PERL_HTTP_DATE
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE
 	help
diff --git a/package/perl-http-daemon/Config.in b/package/perl-http-daemon/Config.in
index b5ed5a418..5dbc2c3d3 100644
--- a/package/perl-http-daemon/Config.in
+++ b/package/perl-http-daemon/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_DAEMON
 	bool "perl-http-daemon"
+	# runtime
 	select BR2_PACKAGE_PERL_HTTP_DATE
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE
 	select BR2_PACKAGE_PERL_LWP_MEDIATYPES
diff --git a/package/perl-http-entity-parser/Config.in b/package/perl-http-entity-parser/Config.in
index 41883ac01..0fb17caa7 100644
--- a/package/perl-http-entity-parser/Config.in
+++ b/package/perl-http-entity-parser/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_ENTITY_PARSER
 	bool "perl-http-entity-parser"
+	# runtime
 	select BR2_PACKAGE_PERL_HTTP_MULTIPARTPARSER
 	select BR2_PACKAGE_PERL_HASH_MULTIVALUE
 	select BR2_PACKAGE_PERL_JSON_MAYBEXS
diff --git a/package/perl-http-headers-fast/Config.in b/package/perl-http-headers-fast/Config.in
index 7272aaad4..4a58f39cf 100644
--- a/package/perl-http-headers-fast/Config.in
+++ b/package/perl-http-headers-fast/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_HEADERS_FAST
 	bool "perl-http-headers-fast"
+	# runtime
 	select BR2_PACKAGE_PERL_HTTP_DATE
 	help
 	  faster implementation of HTTP::Headers
diff --git a/package/perl-http-message/Config.in b/package/perl-http-message/Config.in
index 682a4b01f..f87f5fa87 100644
--- a/package/perl-http-message/Config.in
+++ b/package/perl-http-message/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_MESSAGE
 	bool "perl-http-message"
+	# runtime
 	select BR2_PACKAGE_PERL_ENCODE_LOCALE
 	select BR2_PACKAGE_PERL_HTTP_DATE
 	select BR2_PACKAGE_PERL_IO_HTML
diff --git a/package/perl-http-negotiate/Config.in b/package/perl-http-negotiate/Config.in
index 449b0861a..69601d9a1 100644
--- a/package/perl-http-negotiate/Config.in
+++ b/package/perl-http-negotiate/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_NEGOTIATE
 	bool "perl-http-negotiate"
+	# runtime
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE
 	help
 	  choose a variant to serve
diff --git a/package/perl-io-socket-multicast/Config.in b/package/perl-io-socket-multicast/Config.in
index f63a4e1bf..f9f1f9c59 100644
--- a/package/perl-io-socket-multicast/Config.in
+++ b/package/perl-io-socket-multicast/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_IO_SOCKET_MULTICAST
 	bool "perl-io-socket-multicast"
 	depends on !BR2_STATIC_LIBS
+	# runtime
 	select BR2_PACKAGE_PERL_IO_INTERFACE
 	help
 	  Send and receive multicast messages
diff --git a/package/perl-io-socket-ssl/Config.in b/package/perl-io-socket-ssl/Config.in
index d24e568bc..3a37ecf83 100644
--- a/package/perl-io-socket-ssl/Config.in
+++ b/package/perl-io-socket-ssl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_IO_SOCKET_SSL
 	bool "perl-io-socket-ssl"
 	depends on !BR2_STATIC_LIBS
+	# runtime
 	select BR2_PACKAGE_PERL_NET_SSLEAY
 	help
 	  Nearly transparent SSL encapsulation for IO::Socket::INET.
diff --git a/package/perl-libwww-perl/Config.in b/package/perl-libwww-perl/Config.in
index 09fc00543..ce9bf0c0a 100644
--- a/package/perl-libwww-perl/Config.in
+++ b/package/perl-libwww-perl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_LIBWWW_PERL
 	bool "perl-libwww-perl"
 	depends on !BR2_STATIC_LIBS
+	# runtime
 	select BR2_PACKAGE_PERL_ENCODE_LOCALE
 	select BR2_PACKAGE_PERL_FILE_LISTING
 	select BR2_PACKAGE_PERL_HTML_PARSER
diff --git a/package/perl-mail-dkim/Config.in b/package/perl-mail-dkim/Config.in
index 3db54f3c3..efd298852 100644
--- a/package/perl-mail-dkim/Config.in
+++ b/package/perl-mail-dkim/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_MAIL_DKIM
 	bool "perl-mail-dkim"
 	depends on !BR2_STATIC_LIBS
+	# runtime
 	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
 	select BR2_PACKAGE_PERL_MAILTOOLS
 	select BR2_PACKAGE_PERL_NET_DNS
diff --git a/package/perl-mailtools/Config.in b/package/perl-mailtools/Config.in
index 2123c61ea..3a0a8fa62 100644
--- a/package/perl-mailtools/Config.in
+++ b/package/perl-mailtools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_MAILTOOLS
 	bool "perl-mailtools"
+	# runtime
 	select BR2_PACKAGE_PERL_TIMEDATE
 	help
 	  Various ancient e-mail related modules
diff --git a/package/perl-mime-tools/Config.in b/package/perl-mime-tools/Config.in
index 740651d1d..53ec09dba 100644
--- a/package/perl-mime-tools/Config.in
+++ b/package/perl-mime-tools/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_MIME_TOOLS
 	bool "perl-mime-tools"
+	# runtime
 	select BR2_PACKAGE_PERL_MAILTOOLS
 	help
 	  Tools to manipulate MIME messages
diff --git a/package/perl-module-implementation/Config.in b/package/perl-module-implementation/Config.in
index d7c526cec..c0a3ea7a5 100644
--- a/package/perl-module-implementation/Config.in
+++ b/package/perl-module-implementation/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION
 	bool "perl-module-implementation"
+	# runtime
 	select BR2_PACKAGE_PERL_MODULE_RUNTIME
 	select BR2_PACKAGE_PERL_TRY_TINY
 	help
diff --git a/package/perl-mojolicious-plugin-authentication/Config.in b/package/perl-mojolicious-plugin-authentication/Config.in
index 26c3cde5d..10c05e76c 100644
--- a/package/perl-mojolicious-plugin-authentication/Config.in
+++ b/package/perl-mojolicious-plugin-authentication/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION
 	bool "perl-mojolicious-plugin-authentication"
+	# runtime
 	select BR2_PACKAGE_PERL_MOJOLICIOUS
 	help
 	  A plugin to make authentication a bit easier
diff --git a/package/perl-net-dns/Config.in b/package/perl-net-dns/Config.in
index c156505c7..bbf9f09c7 100644
--- a/package/perl-net-dns/Config.in
+++ b/package/perl-net-dns/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_NET_DNS
 	bool "perl-net-dns"
+	# runtime
 	select BR2_PACKAGE_PERL_DIGEST_HMAC
 	help
 	  Perl Interface to the Domain Name System
diff --git a/package/perl-net-http/Config.in b/package/perl-net-http/Config.in
index 63215772a..0ea1adb65 100644
--- a/package/perl-net-http/Config.in
+++ b/package/perl-net-http/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_NET_HTTP
 	bool "perl-net-http"
+	# runtime
 	select BR2_PACKAGE_PERL_URI
 	help
 	  Low-level HTTP connection (client)
diff --git a/package/perl-package-stash/Config.in b/package/perl-package-stash/Config.in
index 755850f7b..02c1d83a4 100644
--- a/package/perl-package-stash/Config.in
+++ b/package/perl-package-stash/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_PACKAGE_STASH
 	bool "perl-package-stash"
+	# runtime
 	select BR2_PACKAGE_PERL_DIST_CHECKCONFLICTS
 	select BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION
 	help
diff --git a/package/perl-plack/Config.in b/package/perl-plack/Config.in
index 50d56e439..38a9fcb7a 100644
--- a/package/perl-plack/Config.in
+++ b/package/perl-plack/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_PLACK
 	bool "perl-plack"
+	# runtime
 	select BR2_PACKAGE_PERL_APACHE_LOGFORMAT_COMPILER
 	select BR2_PACKAGE_PERL_COOKIE_BAKER
 	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE
diff --git a/package/perl-www-robotrules/Config.in b/package/perl-www-robotrules/Config.in
index f43d2904d..1bb3f206b 100644
--- a/package/perl-www-robotrules/Config.in
+++ b/package/perl-www-robotrules/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_WWW_ROBOTRULES
 	bool "perl-www-robotrules"
+	# runtime
 	select BR2_PACKAGE_PERL_URI
 	help
 	  database of robots.txt-derived permissions
diff --git a/package/perl-x10/Config.in b/package/perl-x10/Config.in
index 984a561b0..857394f60 100644
--- a/package/perl-x10/Config.in
+++ b/package/perl-x10/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_X10
 	bool "perl-x10"
 	depends on !BR2_STATIC_LIBS
+	# runtime
 	select BR2_PACKAGE_PERL_ASTRO_SUNTIME
 	select BR2_PACKAGE_PERL_DEVICE_SERIALPORT
 	select BR2_PACKAGE_PERL_TIME_PARSEDATE
diff --git a/package/perl-xml-libxml/Config.in b/package/perl-xml-libxml/Config.in
index fb15e1011..ae41568e9 100644
--- a/package/perl-xml-libxml/Config.in
+++ b/package/perl-xml-libxml/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PERL_XML_LIBXML
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_ZLIB
+	# runtime
 	select BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT
 	select BR2_PACKAGE_PERL_XML_SAX
 	select BR2_PACKAGE_PERL_XML_SAX_BASE
diff --git a/package/perl-xml-sax/Config.in b/package/perl-xml-sax/Config.in
index 4f5567e25..0d2e26deb 100644
--- a/package/perl-xml-sax/Config.in
+++ b/package/perl-xml-sax/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PERL_XML_SAX
 	bool "perl-xml-sax"
+	# runtime
 	select BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT
 	select BR2_PACKAGE_PERL_XML_SAX_BASE
 	help
-- 
2.17.1
