From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 21:21:07 +0200
Subject: [Buildroot] [git commit] perl-*: regeneration of Config.in files
Message-ID: <20181010191957.AED91826E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b67d9566d18f9abbf80987761f8a30f510cd36b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-apache-logformat-compiler/Config.in   |  2 +-
 package/perl-class-load/Config.in                  | 10 ++++----
 package/perl-class-std-fast/Config.in              |  2 +-
 package/perl-cookie-baker/Config.in                |  2 +-
 package/perl-crypt-openssl-rsa/Config.in           |  2 +-
 package/perl-data-optlist/Config.in                |  4 ++--
 package/perl-dbd-mysql/Config.in                   |  2 +-
 package/perl-devel-stacktrace-ashtml/Config.in     |  2 +-
 package/perl-dist-checkconflicts/Config.in         |  2 +-
 package/perl-file-listing/Config.in                |  2 +-
 package/perl-file-sharedir/Config.in               |  2 +-
 package/perl-gdgraph/Config.in                     |  4 ++--
 package/perl-html-parser/Config.in                 |  2 +-
 package/perl-http-cookies/Config.in                |  4 ++--
 package/perl-http-daemon/Config.in                 |  6 ++---
 package/perl-http-entity-parser/Config.in          | 10 ++++----
 package/perl-http-headers-fast/Config.in           |  2 +-
 package/perl-http-message/Config.in                | 10 ++++----
 package/perl-http-negotiate/Config.in              |  2 +-
 package/perl-io-socket-multicast/Config.in         |  2 +-
 package/perl-io-socket-ssl/Config.in               |  2 +-
 package/perl-libwww-perl/Config.in                 | 26 ++++++++++----------
 package/perl-mail-dkim/Config.in                   |  6 ++---
 package/perl-mailtools/Config.in                   |  2 +-
 package/perl-mime-tools/Config.in                  |  2 +-
 package/perl-module-implementation/Config.in       |  4 ++--
 .../Config.in                                      |  2 +-
 package/perl-net-dns/Config.in                     |  2 +-
 package/perl-net-http/Config.in                    |  2 +-
 package/perl-package-stash/Config.in               |  4 ++--
 package/perl-plack/Config.in                       | 28 +++++++++++-----------
 package/perl-www-robotrules/Config.in              |  2 +-
 package/perl-x10/Config.in                         |  6 ++---
 package/perl-xml-libxml/Config.in                  |  6 ++---
 package/perl-xml-sax/Config.in                     |  4 ++--
 35 files changed, 86 insertions(+), 86 deletions(-)

diff --git a/package/perl-apache-logformat-compiler/Config.in b/package/perl-apache-logformat-compiler/Config.in
index 81d621082c..8506837dd4 100644
--- a/package/perl-apache-logformat-compiler/Config.in
+++ b/package/perl-apache-logformat-compiler/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_APACHE_LOGFORMAT_COMPILER
 	bool "perl-apache-logformat-compiler"
-	select BR2_PACKAGE_PERL_POSIX_STRFTIME_COMPILER
+	select BR2_PACKAGE_PERL_POSIX_STRFTIME_COMPILER # runtime
 	help
 	  Compile a log format string to perl-code
 
diff --git a/package/perl-class-load/Config.in b/package/perl-class-load/Config.in
index fef9431e49..eb0bd366a2 100644
--- a/package/perl-class-load/Config.in
+++ b/package/perl-class-load/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_PERL_CLASS_LOAD
 	bool "perl-class-load"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PERL_DATA_OPTLIST
-	select BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION
-	select BR2_PACKAGE_PERL_MODULE_RUNTIME
-	select BR2_PACKAGE_PERL_PACKAGE_STASH
-	select BR2_PACKAGE_PERL_TRY_TINY
+	select BR2_PACKAGE_PERL_DATA_OPTLIST # runtime
+	select BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION # runtime
+	select BR2_PACKAGE_PERL_MODULE_RUNTIME # runtime
+	select BR2_PACKAGE_PERL_PACKAGE_STASH # runtime
+	select BR2_PACKAGE_PERL_TRY_TINY # runtime
 	help
 	  A working (require "Class::Name") and more
 
diff --git a/package/perl-class-std-fast/Config.in b/package/perl-class-std-fast/Config.in
index 10b1e0d786..6f5994ef59 100644
--- a/package/perl-class-std-fast/Config.in
+++ b/package/perl-class-std-fast/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_CLASS_STD_FAST
 	bool "perl-class-std-fast"
-	select BR2_PACKAGE_PERL_CLASS_STD
+	select BR2_PACKAGE_PERL_CLASS_STD # runtime
 	help
 	  faster but less secure than Class::Std
 
diff --git a/package/perl-cookie-baker/Config.in b/package/perl-cookie-baker/Config.in
index e6846a21e0..9e746237a2 100644
--- a/package/perl-cookie-baker/Config.in
+++ b/package/perl-cookie-baker/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_COOKIE_BAKER
 	bool "perl-cookie-baker"
-	select BR2_PACKAGE_PERL_URI
+	select BR2_PACKAGE_PERL_URI # runtime
 	help
 	  Cookie string generator / parser
 
diff --git a/package/perl-crypt-openssl-rsa/Config.in b/package/perl-crypt-openssl-rsa/Config.in
index fe2e0cf59e..155ec03ecf 100644
--- a/package/perl-crypt-openssl-rsa/Config.in
+++ b/package/perl-crypt-openssl-rsa/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
 	bool "perl-crypt-openssl-rsa"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM
+	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM # runtime
 	help
 	  RSA encoding and decoding, using the openSSL libraries
 
diff --git a/package/perl-data-optlist/Config.in b/package/perl-data-optlist/Config.in
index 0393e65645..a95ca05f5b 100644
--- a/package/perl-data-optlist/Config.in
+++ b/package/perl-data-optlist/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PERL_DATA_OPTLIST
 	bool "perl-data-optlist"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PERL_PARAMS_UTIL
-	select BR2_PACKAGE_PERL_SUB_INSTALL
+	select BR2_PACKAGE_PERL_PARAMS_UTIL # runtime
+	select BR2_PACKAGE_PERL_SUB_INSTALL # runtime
 	help
 	  parse and validate simple name/value option pairs
 
diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/Config.in
index f6cc3f99e4..c00d64be6d 100644
--- a/package/perl-dbd-mysql/Config.in
+++ b/package/perl-dbd-mysql/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_PERL_DBD_MYSQL
 	depends on BR2_INSTALL_LIBSTDCPP # mysql
 	depends on BR2_USE_MMU # mysql
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mysql
-	select BR2_PACKAGE_PERL_DBI
 	select BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_PERL_DBI # runtime
 	help
 	  A MySQL driver for the Perl5 Database Interface (DBI)
 
diff --git a/package/perl-devel-stacktrace-ashtml/Config.in b/package/perl-devel-stacktrace-ashtml/Config.in
index 001709a6aa..ce6f750bde 100644
--- a/package/perl-devel-stacktrace-ashtml/Config.in
+++ b/package/perl-devel-stacktrace-ashtml/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_DEVEL_STACKTRACE_ASHTML
 	bool "perl-devel-stacktrace-ashtml"
-	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE
+	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE # runtime
 	help
 	  Displays stack trace in HTML
 
diff --git a/package/perl-dist-checkconflicts/Config.in b/package/perl-dist-checkconflicts/Config.in
index 10f0944aa8..e834d01136 100644
--- a/package/perl-dist-checkconflicts/Config.in
+++ b/package/perl-dist-checkconflicts/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_DIST_CHECKCONFLICTS
 	bool "perl-dist-checkconflicts"
-	select BR2_PACKAGE_PERL_MODULE_RUNTIME
+	select BR2_PACKAGE_PERL_MODULE_RUNTIME # runtime
 	help
 	  declare version conflicts for your dist
 
diff --git a/package/perl-file-listing/Config.in b/package/perl-file-listing/Config.in
index 3cb1996772..e1fbb05b72 100644
--- a/package/perl-file-listing/Config.in
+++ b/package/perl-file-listing/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_FILE_LISTING
 	bool "perl-file-listing"
-	select BR2_PACKAGE_PERL_HTTP_DATE
+	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	help
 	  parse directory listing
 
diff --git a/package/perl-file-sharedir/Config.in b/package/perl-file-sharedir/Config.in
index 592dc8f43e..b8dee5acd7 100644
--- a/package/perl-file-sharedir/Config.in
+++ b/package/perl-file-sharedir/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_FILE_SHAREDIR
 	bool "perl-file-sharedir"
-	select BR2_PACKAGE_PERL_CLASS_INSPECTOR
+	select BR2_PACKAGE_PERL_CLASS_INSPECTOR # runtime
 	help
 	  Locate per-dist and per-module shared files
 
diff --git a/package/perl-gdgraph/Config.in b/package/perl-gdgraph/Config.in
index 10b3cd0323..e0b6a25a43 100644
--- a/package/perl-gdgraph/Config.in
+++ b/package/perl-gdgraph/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PERL_GDGRAPH
 	bool "perl-gdgraph"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PERL_GD
-	select BR2_PACKAGE_PERL_GDTEXTUTIL
+	select BR2_PACKAGE_PERL_GD # runtime
+	select BR2_PACKAGE_PERL_GDTEXTUTIL # runtime
 	help
 	  Produces charts with GD
 
diff --git a/package/perl-html-parser/Config.in b/package/perl-html-parser/Config.in
index 22a16d646f..bc1c9a59e3 100644
--- a/package/perl-html-parser/Config.in
+++ b/package/perl-html-parser/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PERL_HTML_PARSER
 	bool "perl-html-parser"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PERL_HTML_TAGSET
+	select BR2_PACKAGE_PERL_HTML_TAGSET # runtime
 	help
 	  HTML parser class
 
diff --git a/package/perl-http-cookies/Config.in b/package/perl-http-cookies/Config.in
index 4095fee824..117e11a84d 100644
--- a/package/perl-http-cookies/Config.in
+++ b/package/perl-http-cookies/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PERL_HTTP_COOKIES
 	bool "perl-http-cookies"
-	select BR2_PACKAGE_PERL_HTTP_DATE
-	select BR2_PACKAGE_PERL_HTTP_MESSAGE
+	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
+	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	help
 	  HTTP cookie jars
 
diff --git a/package/perl-http-daemon/Config.in b/package/perl-http-daemon/Config.in
index b5ed5a4180..ff302c12b1 100644
--- a/package/perl-http-daemon/Config.in
+++ b/package/perl-http-daemon/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PERL_HTTP_DAEMON
 	bool "perl-http-daemon"
-	select BR2_PACKAGE_PERL_HTTP_DATE
-	select BR2_PACKAGE_PERL_HTTP_MESSAGE
-	select BR2_PACKAGE_PERL_LWP_MEDIATYPES
+	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
+	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
+	select BR2_PACKAGE_PERL_LWP_MEDIATYPES # runtime
 	help
 	  a simple http server class
 
diff --git a/package/perl-http-entity-parser/Config.in b/package/perl-http-entity-parser/Config.in
index 41883ac017..998182aace 100644
--- a/package/perl-http-entity-parser/Config.in
+++ b/package/perl-http-entity-parser/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_PERL_HTTP_ENTITY_PARSER
 	bool "perl-http-entity-parser"
-	select BR2_PACKAGE_PERL_HTTP_MULTIPARTPARSER
-	select BR2_PACKAGE_PERL_HASH_MULTIVALUE
-	select BR2_PACKAGE_PERL_JSON_MAYBEXS
-	select BR2_PACKAGE_PERL_STREAM_BUFFERED
-	select BR2_PACKAGE_PERL_WWW_FORM_URLENCODED
+	select BR2_PACKAGE_PERL_HTTP_MULTIPARTPARSER # runtime
+	select BR2_PACKAGE_PERL_HASH_MULTIVALUE # runtime
+	select BR2_PACKAGE_PERL_JSON_MAYBEXS # runtime
+	select BR2_PACKAGE_PERL_STREAM_BUFFERED # runtime
+	select BR2_PACKAGE_PERL_WWW_FORM_URLENCODED # runtime
 	help
 	  PSGI compliant HTTP Entity Parser
 
diff --git a/package/perl-http-headers-fast/Config.in b/package/perl-http-headers-fast/Config.in
index 7272aaad49..fe022ae30a 100644
--- a/package/perl-http-headers-fast/Config.in
+++ b/package/perl-http-headers-fast/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_HEADERS_FAST
 	bool "perl-http-headers-fast"
-	select BR2_PACKAGE_PERL_HTTP_DATE
+	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	help
 	  faster implementation of HTTP::Headers
 
diff --git a/package/perl-http-message/Config.in b/package/perl-http-message/Config.in
index 682a4b01fa..c8162cae35 100644
--- a/package/perl-http-message/Config.in
+++ b/package/perl-http-message/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_PERL_HTTP_MESSAGE
 	bool "perl-http-message"
-	select BR2_PACKAGE_PERL_ENCODE_LOCALE
-	select BR2_PACKAGE_PERL_HTTP_DATE
-	select BR2_PACKAGE_PERL_IO_HTML
-	select BR2_PACKAGE_PERL_LWP_MEDIATYPES
-	select BR2_PACKAGE_PERL_URI
+	select BR2_PACKAGE_PERL_ENCODE_LOCALE # runtime
+	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
+	select BR2_PACKAGE_PERL_IO_HTML # runtime
+	select BR2_PACKAGE_PERL_LWP_MEDIATYPES # runtime
+	select BR2_PACKAGE_PERL_URI # runtime
 	help
 	  HTTP style message (base class)
 
diff --git a/package/perl-http-negotiate/Config.in b/package/perl-http-negotiate/Config.in
index 449b0861a5..20838d9cd7 100644
--- a/package/perl-http-negotiate/Config.in
+++ b/package/perl-http-negotiate/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_HTTP_NEGOTIATE
 	bool "perl-http-negotiate"
-	select BR2_PACKAGE_PERL_HTTP_MESSAGE
+	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	help
 	  choose a variant to serve
 
diff --git a/package/perl-io-socket-multicast/Config.in b/package/perl-io-socket-multicast/Config.in
index f63a4e1bf9..87865eedf3 100644
--- a/package/perl-io-socket-multicast/Config.in
+++ b/package/perl-io-socket-multicast/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PERL_IO_SOCKET_MULTICAST
 	bool "perl-io-socket-multicast"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PERL_IO_INTERFACE
+	select BR2_PACKAGE_PERL_IO_INTERFACE # runtime
 	help
 	  Send and receive multicast messages
 
diff --git a/package/perl-io-socket-ssl/Config.in b/package/perl-io-socket-ssl/Config.in
index d24e568bc5..a7b94a3925 100644
--- a/package/perl-io-socket-ssl/Config.in
+++ b/package/perl-io-socket-ssl/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PERL_IO_SOCKET_SSL
 	bool "perl-io-socket-ssl"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PERL_NET_SSLEAY
+	select BR2_PACKAGE_PERL_NET_SSLEAY # runtime
 	help
 	  Nearly transparent SSL encapsulation for IO::Socket::INET.
 
diff --git a/package/perl-libwww-perl/Config.in b/package/perl-libwww-perl/Config.in
index 09fc00543d..b53e36a681 100644
--- a/package/perl-libwww-perl/Config.in
+++ b/package/perl-libwww-perl/Config.in
@@ -1,19 +1,19 @@
 config BR2_PACKAGE_PERL_LIBWWW_PERL
 	bool "perl-libwww-perl"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PERL_ENCODE_LOCALE
-	select BR2_PACKAGE_PERL_FILE_LISTING
-	select BR2_PACKAGE_PERL_HTML_PARSER
-	select BR2_PACKAGE_PERL_HTTP_COOKIES
-	select BR2_PACKAGE_PERL_HTTP_DAEMON
-	select BR2_PACKAGE_PERL_HTTP_DATE
-	select BR2_PACKAGE_PERL_HTTP_MESSAGE
-	select BR2_PACKAGE_PERL_HTTP_NEGOTIATE
-	select BR2_PACKAGE_PERL_LWP_MEDIATYPES
-	select BR2_PACKAGE_PERL_NET_HTTP
-	select BR2_PACKAGE_PERL_TRY_TINY
-	select BR2_PACKAGE_PERL_URI
-	select BR2_PACKAGE_PERL_WWW_ROBOTRULES
+	select BR2_PACKAGE_PERL_ENCODE_LOCALE # runtime
+	select BR2_PACKAGE_PERL_FILE_LISTING # runtime
+	select BR2_PACKAGE_PERL_HTML_PARSER # runtime
+	select BR2_PACKAGE_PERL_HTTP_COOKIES # runtime
+	select BR2_PACKAGE_PERL_HTTP_DAEMON # runtime
+	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
+	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
+	select BR2_PACKAGE_PERL_HTTP_NEGOTIATE # runtime
+	select BR2_PACKAGE_PERL_LWP_MEDIATYPES # runtime
+	select BR2_PACKAGE_PERL_NET_HTTP # runtime
+	select BR2_PACKAGE_PERL_TRY_TINY # runtime
+	select BR2_PACKAGE_PERL_URI # runtime
+	select BR2_PACKAGE_PERL_WWW_ROBOTRULES # runtime
 	help
 	  The World-Wide Web library for Perl
 
diff --git a/package/perl-mail-dkim/Config.in b/package/perl-mail-dkim/Config.in
index 3db54f3c39..f13ef0a4b4 100644
--- a/package/perl-mail-dkim/Config.in
+++ b/package/perl-mail-dkim/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PERL_MAIL_DKIM
 	bool "perl-mail-dkim"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
-	select BR2_PACKAGE_PERL_MAILTOOLS
-	select BR2_PACKAGE_PERL_NET_DNS
+	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA # runtime
+	select BR2_PACKAGE_PERL_MAILTOOLS # runtime
+	select BR2_PACKAGE_PERL_NET_DNS # runtime
 	help
 	  Signs/verifies Internet mail with DKIM/DomainKey signatures
 
diff --git a/package/perl-mailtools/Config.in b/package/perl-mailtools/Config.in
index 2123c61ea3..adbccd34fd 100644
--- a/package/perl-mailtools/Config.in
+++ b/package/perl-mailtools/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_MAILTOOLS
 	bool "perl-mailtools"
-	select BR2_PACKAGE_PERL_TIMEDATE
+	select BR2_PACKAGE_PERL_TIMEDATE # runtime
 	help
 	  Various ancient e-mail related modules
 
diff --git a/package/perl-mime-tools/Config.in b/package/perl-mime-tools/Config.in
index 740651d1d0..d07d76f379 100644
--- a/package/perl-mime-tools/Config.in
+++ b/package/perl-mime-tools/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_MIME_TOOLS
 	bool "perl-mime-tools"
-	select BR2_PACKAGE_PERL_MAILTOOLS
+	select BR2_PACKAGE_PERL_MAILTOOLS # runtime
 	help
 	  Tools to manipulate MIME messages
 
diff --git a/package/perl-module-implementation/Config.in b/package/perl-module-implementation/Config.in
index d7c526cec2..713cd2a531 100644
--- a/package/perl-module-implementation/Config.in
+++ b/package/perl-module-implementation/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION
 	bool "perl-module-implementation"
-	select BR2_PACKAGE_PERL_MODULE_RUNTIME
-	select BR2_PACKAGE_PERL_TRY_TINY
+	select BR2_PACKAGE_PERL_MODULE_RUNTIME # runtime
+	select BR2_PACKAGE_PERL_TRY_TINY # runtime
 	help
 	  Loads one of several alternate underlying implementations for
 	  a module
diff --git a/package/perl-mojolicious-plugin-authentication/Config.in b/package/perl-mojolicious-plugin-authentication/Config.in
index 26c3cde5d4..0a7a3d62ec 100644
--- a/package/perl-mojolicious-plugin-authentication/Config.in
+++ b/package/perl-mojolicious-plugin-authentication/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION
 	bool "perl-mojolicious-plugin-authentication"
-	select BR2_PACKAGE_PERL_MOJOLICIOUS
+	select BR2_PACKAGE_PERL_MOJOLICIOUS # runtime
 	help
 	  A plugin to make authentication a bit easier
 
diff --git a/package/perl-net-dns/Config.in b/package/perl-net-dns/Config.in
index c156505c76..bc90b55cd9 100644
--- a/package/perl-net-dns/Config.in
+++ b/package/perl-net-dns/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_NET_DNS
 	bool "perl-net-dns"
-	select BR2_PACKAGE_PERL_DIGEST_HMAC
+	select BR2_PACKAGE_PERL_DIGEST_HMAC # runtime
 	help
 	  Perl Interface to the Domain Name System
 
diff --git a/package/perl-net-http/Config.in b/package/perl-net-http/Config.in
index 63215772a4..522711f544 100644
--- a/package/perl-net-http/Config.in
+++ b/package/perl-net-http/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_NET_HTTP
 	bool "perl-net-http"
-	select BR2_PACKAGE_PERL_URI
+	select BR2_PACKAGE_PERL_URI # runtime
 	help
 	  Low-level HTTP connection (client)
 
diff --git a/package/perl-package-stash/Config.in b/package/perl-package-stash/Config.in
index 755850f7b6..d7778e50c2 100644
--- a/package/perl-package-stash/Config.in
+++ b/package/perl-package-stash/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PERL_PACKAGE_STASH
 	bool "perl-package-stash"
-	select BR2_PACKAGE_PERL_DIST_CHECKCONFLICTS
-	select BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION
+	select BR2_PACKAGE_PERL_DIST_CHECKCONFLICTS # runtime
+	select BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION # runtime
 	help
 	  routines for manipulating stashes
 
diff --git a/package/perl-plack/Config.in b/package/perl-plack/Config.in
index 50d56e439c..0401fa3e08 100644
--- a/package/perl-plack/Config.in
+++ b/package/perl-plack/Config.in
@@ -1,19 +1,19 @@
 config BR2_PACKAGE_PERL_PLACK
 	bool "perl-plack"
-	select BR2_PACKAGE_PERL_APACHE_LOGFORMAT_COMPILER
-	select BR2_PACKAGE_PERL_COOKIE_BAKER
-	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE
-	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE_ASHTML
-	select BR2_PACKAGE_PERL_FILE_SHAREDIR
-	select BR2_PACKAGE_PERL_FILESYS_NOTIFY_SIMPLE
-	select BR2_PACKAGE_PERL_HTTP_ENTITY_PARSER
-	select BR2_PACKAGE_PERL_HTTP_HEADERS_FAST
-	select BR2_PACKAGE_PERL_HTTP_MESSAGE
-	select BR2_PACKAGE_PERL_HASH_MULTIVALUE
-	select BR2_PACKAGE_PERL_STREAM_BUFFERED
-	select BR2_PACKAGE_PERL_TRY_TINY
-	select BR2_PACKAGE_PERL_URI
-	select BR2_PACKAGE_PERL_WWW_FORM_URLENCODED
+	select BR2_PACKAGE_PERL_APACHE_LOGFORMAT_COMPILER # runtime
+	select BR2_PACKAGE_PERL_COOKIE_BAKER # runtime
+	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE # runtime
+	select BR2_PACKAGE_PERL_DEVEL_STACKTRACE_ASHTML # runtime
+	select BR2_PACKAGE_PERL_FILE_SHAREDIR # runtime
+	select BR2_PACKAGE_PERL_FILESYS_NOTIFY_SIMPLE # runtime
+	select BR2_PACKAGE_PERL_HTTP_ENTITY_PARSER # runtime
+	select BR2_PACKAGE_PERL_HTTP_HEADERS_FAST # runtime
+	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
+	select BR2_PACKAGE_PERL_HASH_MULTIVALUE # runtime
+	select BR2_PACKAGE_PERL_STREAM_BUFFERED # runtime
+	select BR2_PACKAGE_PERL_TRY_TINY # runtime
+	select BR2_PACKAGE_PERL_URI # runtime
+	select BR2_PACKAGE_PERL_WWW_FORM_URLENCODED # runtime
 	help
 	  Perl Superglue for Web frameworks and Web Servers (PSGI
 	  toolkit)
diff --git a/package/perl-www-robotrules/Config.in b/package/perl-www-robotrules/Config.in
index f43d2904d1..80db06f0c1 100644
--- a/package/perl-www-robotrules/Config.in
+++ b/package/perl-www-robotrules/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PERL_WWW_ROBOTRULES
 	bool "perl-www-robotrules"
-	select BR2_PACKAGE_PERL_URI
+	select BR2_PACKAGE_PERL_URI # runtime
 	help
 	  database of robots.txt-derived permissions
 
diff --git a/package/perl-x10/Config.in b/package/perl-x10/Config.in
index 984a561b05..884dbb82d3 100644
--- a/package/perl-x10/Config.in
+++ b/package/perl-x10/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PERL_X10
 	bool "perl-x10"
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_PERL_ASTRO_SUNTIME
-	select BR2_PACKAGE_PERL_DEVICE_SERIALPORT
-	select BR2_PACKAGE_PERL_TIME_PARSEDATE
+	select BR2_PACKAGE_PERL_ASTRO_SUNTIME # runtime
+	select BR2_PACKAGE_PERL_DEVICE_SERIALPORT # runtime
+	select BR2_PACKAGE_PERL_TIME_PARSEDATE # runtime
 	help
 	  creates a server used to receive events from an x10 client
 
diff --git a/package/perl-xml-libxml/Config.in b/package/perl-xml-libxml/Config.in
index fb15e1011c..0e4169867f 100644
--- a/package/perl-xml-libxml/Config.in
+++ b/package/perl-xml-libxml/Config.in
@@ -3,9 +3,9 @@ config BR2_PACKAGE_PERL_XML_LIBXML
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT
-	select BR2_PACKAGE_PERL_XML_SAX
-	select BR2_PACKAGE_PERL_XML_SAX_BASE
+	select BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT # runtime
+	select BR2_PACKAGE_PERL_XML_SAX # runtime
+	select BR2_PACKAGE_PERL_XML_SAX_BASE # runtime
 	help
 	  Interface to Gnome libxml2 xml parsing and DOM library
 
diff --git a/package/perl-xml-sax/Config.in b/package/perl-xml-sax/Config.in
index 4f5567e251..cf89c21be3 100644
--- a/package/perl-xml-sax/Config.in
+++ b/package/perl-xml-sax/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PERL_XML_SAX
 	bool "perl-xml-sax"
-	select BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT
-	select BR2_PACKAGE_PERL_XML_SAX_BASE
+	select BR2_PACKAGE_PERL_XML_NAMESPACESUPPORT # runtime
+	select BR2_PACKAGE_PERL_XML_SAX_BASE # runtime
 	help
 	  Simple API for XML
 
