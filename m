From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 10 Oct 2018 08:46:17 +0200
Subject: [Buildroot] [PATCH 09/13] perl-*: regeneration of *.mk files
In-Reply-To: <20181010064621.19253-1-francois.perrad@gadz.org>
References: <20181010064621.19253-1-francois.perrad@gadz.org>
Message-ID: <20181010064621.19253-10-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

remove runtime dependencies

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-apache-logformat-compiler.mk            |  2 +-
 package/perl-class-load/perl-class-load.mk       |  6 ------
 .../perl-class-std-fast/perl-class-std-fast.mk   |  1 -
 package/perl-cookie-baker/perl-cookie-baker.mk   |  2 +-
 package/perl-data-optlist/perl-data-optlist.mk   |  1 -
 package/perl-dbd-mysql/perl-dbd-mysql.mk         |  6 ++++--
 .../perl-devel-stacktrace-ashtml.mk              |  1 -
 .../perl-dist-checkconflicts.mk                  |  1 -
 package/perl-file-listing/perl-file-listing.mk   |  1 -
 package/perl-file-sharedir/perl-file-sharedir.mk |  2 +-
 package/perl-gdgraph/perl-gdgraph.mk             |  1 -
 package/perl-html-parser/perl-html-parser.mk     |  1 -
 package/perl-http-cookies/perl-http-cookies.mk   |  1 -
 package/perl-http-daemon/perl-http-daemon.mk     |  1 -
 .../perl-http-entity-parser.mk                   |  8 +-------
 .../perl-http-headers-fast.mk                    |  2 +-
 package/perl-http-message/perl-http-message.mk   |  1 -
 .../perl-http-negotiate/perl-http-negotiate.mk   |  1 -
 .../perl-io-socket-multicast.mk                  |  1 -
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk |  1 -
 package/perl-libwww-perl/perl-libwww-perl.mk     | 14 --------------
 package/perl-mail-dkim/perl-mail-dkim.mk         |  1 -
 package/perl-mailtools/perl-mailtools.mk         |  1 -
 package/perl-mime-tools/perl-mime-tools.mk       |  1 -
 .../perl-module-build-tiny.mk                    |  5 ++++-
 .../perl-module-implementation.mk                |  1 -
 .../perl-mojolicious-plugin-authentication.mk    |  1 -
 package/perl-net-dns/perl-net-dns.mk             |  1 -
 package/perl-net-http/perl-net-http.mk           |  1 -
 package/perl-package-stash/perl-package-stash.mk |  1 -
 package/perl-plack/perl-plack.mk                 | 16 +---------------
 package/perl-sys-mmap/perl-sys-mmap.mk           |  2 +-
 .../perl-www-robotrules/perl-www-robotrules.mk   |  1 -
 package/perl-x10/perl-x10.mk                     |  1 -
 package/perl-xml-libxml/perl-xml-libxml.mk       |  2 +-
 package/perl-xml-sax/perl-xml-sax.mk             |  1 -
 36 files changed, 16 insertions(+), 75 deletions(-)

diff --git a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
index 156a0aaa4..a25c71793 100644
--- a/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
+++ b/package/perl-apache-logformat-compiler/perl-apache-logformat-compiler.mk
@@ -7,7 +7,7 @@
 PERL_APACHE_LOGFORMAT_COMPILER_VERSION = 0.35
 PERL_APACHE_LOGFORMAT_COMPILER_SOURCE = Apache-LogFormat-Compiler-$(PERL_APACHE_LOGFORMAT_COMPILER_VERSION).tar.gz
 PERL_APACHE_LOGFORMAT_COMPILER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
-PERL_APACHE_LOGFORMAT_COMPILER_DEPENDENCIES = host-perl-module-build-tiny perl-posix-strftime-compiler
+PERL_APACHE_LOGFORMAT_COMPILER_DEPENDENCIES = host-perl-module-build-tiny
 PERL_APACHE_LOGFORMAT_COMPILER_LICENSE = Artistic or GPL-1.0+
 PERL_APACHE_LOGFORMAT_COMPILER_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-class-load/perl-class-load.mk b/package/perl-class-load/perl-class-load.mk
index e581ba920..199a3c2eb 100644
--- a/package/perl-class-load/perl-class-load.mk
+++ b/package/perl-class-load/perl-class-load.mk
@@ -7,12 +7,6 @@
 PERL_CLASS_LOAD_VERSION = 0.25
 PERL_CLASS_LOAD_SOURCE = Class-Load-$(PERL_CLASS_LOAD_VERSION).tar.gz
 PERL_CLASS_LOAD_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
-PERL_CLASS_LOAD_DEPENDENCIES = \
-	perl-data-optlist \
-	perl-module-implementation \
-	perl-module-runtime \
-	perl-package-stash \
-	perl-try-tiny
 PERL_CLASS_LOAD_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_LOAD_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-class-std-fast/perl-class-std-fast.mk b/package/perl-class-std-fast/perl-class-std-fast.mk
index 7c008622d..ba0feaf72 100644
--- a/package/perl-class-std-fast/perl-class-std-fast.mk
+++ b/package/perl-class-std-fast/perl-class-std-fast.mk
@@ -7,7 +7,6 @@
 PERL_CLASS_STD_FAST_VERSION = v0.0.8
 PERL_CLASS_STD_FAST_SOURCE = Class-Std-Fast-$(PERL_CLASS_STD_FAST_VERSION).tar.gz
 PERL_CLASS_STD_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AC/ACID
-PERL_CLASS_STD_FAST_DEPENDENCIES = perl-class-std
 PERL_CLASS_STD_FAST_LICENSE = Artistic or GPL-1.0+
 PERL_CLASS_STD_FAST_LICENSE_FILES = README
 
diff --git a/package/perl-cookie-baker/perl-cookie-baker.mk b/package/perl-cookie-baker/perl-cookie-baker.mk
index 31410ee74..3dd02869d 100644
--- a/package/perl-cookie-baker/perl-cookie-baker.mk
+++ b/package/perl-cookie-baker/perl-cookie-baker.mk
@@ -7,7 +7,7 @@
 PERL_COOKIE_BAKER_VERSION = 0.10
 PERL_COOKIE_BAKER_SOURCE = Cookie-Baker-$(PERL_COOKIE_BAKER_VERSION).tar.gz
 PERL_COOKIE_BAKER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
-PERL_COOKIE_BAKER_DEPENDENCIES = host-perl-module-build-tiny perl-uri
+PERL_COOKIE_BAKER_DEPENDENCIES = host-perl-module-build-tiny
 PERL_COOKIE_BAKER_LICENSE = Artistic or GPL-1.0+
 PERL_COOKIE_BAKER_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-data-optlist/perl-data-optlist.mk b/package/perl-data-optlist/perl-data-optlist.mk
index ef643cf84..523857cc6 100644
--- a/package/perl-data-optlist/perl-data-optlist.mk
+++ b/package/perl-data-optlist/perl-data-optlist.mk
@@ -7,7 +7,6 @@
 PERL_DATA_OPTLIST_VERSION = 0.110
 PERL_DATA_OPTLIST_SOURCE = Data-OptList-$(PERL_DATA_OPTLIST_VERSION).tar.gz
 PERL_DATA_OPTLIST_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
-PERL_DATA_OPTLIST_DEPENDENCIES = perl-params-util perl-sub-install
 PERL_DATA_OPTLIST_LICENSE = Artistic or GPL-1.0+
 PERL_DATA_OPTLIST_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-dbd-mysql/perl-dbd-mysql.mk b/package/perl-dbd-mysql/perl-dbd-mysql.mk
index 560b97b82..06a1a115a 100644
--- a/package/perl-dbd-mysql/perl-dbd-mysql.mk
+++ b/package/perl-dbd-mysql/perl-dbd-mysql.mk
@@ -7,9 +7,11 @@
 PERL_DBD_MYSQL_VERSION = 4.046
 PERL_DBD_MYSQL_SOURCE = DBD-mysql-$(PERL_DBD_MYSQL_VERSION).tar.gz
 PERL_DBD_MYSQL_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPTTOFU
-PERL_DBD_MYSQL_DEPENDENCIES = host-perl-dbi perl-dbi mysql
-PERL_DBD_MYSQL_CONF_OPTS = --mysql_config=$(STAGING_DIR)/usr/bin/mysql_config
+PERL_DBD_MYSQL_DEPENDENCIES = \
+	host-perl-dbi \
+	mysql
 PERL_DBD_MYSQL_LICENSE = Artistic or GPL-1.0+
 PERL_DBD_MYSQL_LICENSE_FILES = LICENSE
+PERL_DBD_MYSQL_CONF_OPTS = --mysql_config=$(STAGING_DIR)/usr/bin/mysql_config
 
 $(eval $(perl-package))
diff --git a/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk b/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk
index 4f1bc127e..bebe486b5 100644
--- a/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk
+++ b/package/perl-devel-stacktrace-ashtml/perl-devel-stacktrace-ashtml.mk
@@ -7,7 +7,6 @@
 PERL_DEVEL_STACKTRACE_ASHTML_VERSION = 0.15
 PERL_DEVEL_STACKTRACE_ASHTML_SOURCE = Devel-StackTrace-AsHTML-$(PERL_DEVEL_STACKTRACE_ASHTML_VERSION).tar.gz
 PERL_DEVEL_STACKTRACE_ASHTML_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
-PERL_DEVEL_STACKTRACE_ASHTML_DEPENDENCIES = perl-devel-stacktrace
 PERL_DEVEL_STACKTRACE_ASHTML_LICENSE = Artistic or GPL-1.0+
 PERL_DEVEL_STACKTRACE_ASHTML_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk b/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
index 4242b50ab..9bccf2bb4 100644
--- a/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
+++ b/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
@@ -7,7 +7,6 @@
 PERL_DIST_CHECKCONFLICTS_VERSION = 0.11
 PERL_DIST_CHECKCONFLICTS_SOURCE = Dist-CheckConflicts-$(PERL_DIST_CHECKCONFLICTS_VERSION).tar.gz
 PERL_DIST_CHECKCONFLICTS_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
-PERL_DIST_CHECKCONFLICTS_DEPENDENCIES = perl-module-runtime
 PERL_DIST_CHECKCONFLICTS_LICENSE = Artistic or GPL-1.0+
 PERL_DIST_CHECKCONFLICTS_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
index e150de77a..54d9370c5 100644
--- a/package/perl-file-listing/perl-file-listing.mk
+++ b/package/perl-file-listing/perl-file-listing.mk
@@ -7,7 +7,6 @@
 PERL_FILE_LISTING_VERSION = 6.04
 PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
 PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_FILE_LISTING_DEPENDENCIES = perl-http-date
 PERL_FILE_LISTING_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_LISTING_LICENSE_FILES = README
 
diff --git a/package/perl-file-sharedir/perl-file-sharedir.mk b/package/perl-file-sharedir/perl-file-sharedir.mk
index e34379757..fb868161a 100644
--- a/package/perl-file-sharedir/perl-file-sharedir.mk
+++ b/package/perl-file-sharedir/perl-file-sharedir.mk
@@ -7,7 +7,7 @@
 PERL_FILE_SHAREDIR_VERSION = 1.116
 PERL_FILE_SHAREDIR_SOURCE = File-ShareDir-$(PERL_FILE_SHAREDIR_VERSION).tar.gz
 PERL_FILE_SHAREDIR_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/REHSACK
-PERL_FILE_SHAREDIR_DEPENDENCIES = host-perl-file-sharedir-install perl-class-inspector
+PERL_FILE_SHAREDIR_DEPENDENCIES = host-perl-file-sharedir-install
 PERL_FILE_SHAREDIR_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_SHAREDIR_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-gdgraph/perl-gdgraph.mk b/package/perl-gdgraph/perl-gdgraph.mk
index c4317075f..d9049d9a8 100644
--- a/package/perl-gdgraph/perl-gdgraph.mk
+++ b/package/perl-gdgraph/perl-gdgraph.mk
@@ -7,7 +7,6 @@
 PERL_GDGRAPH_VERSION = 1.54
 PERL_GDGRAPH_SOURCE = GDGraph-$(PERL_GDGRAPH_VERSION).tar.gz
 PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RUZ
-PERL_GDGRAPH_DEPENDENCIES = perl-gd perl-gdtextutil
 PERL_GDGRAPH_LICENSE = Artistic or GPL-1.0+
 PERL_GDGRAPH_LICENSE_FILES = Dustismo.LICENSE
 
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 66016eb8b..b47db5454 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -7,7 +7,6 @@
 PERL_HTML_PARSER_VERSION = 3.72
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_HTML_PARSER_DEPENDENCIES = perl-html-tagset
 PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
 PERL_HTML_PARSER_LICENSE_FILES = README
 
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index 0777c0845..764358eac 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -7,7 +7,6 @@
 PERL_HTTP_COOKIES_VERSION = 6.04
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
-PERL_HTTP_COOKIES_DEPENDENCIES = perl-http-date perl-http-message
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_COOKIES_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
index 65cdaf8e2..9608d9306 100644
--- a/package/perl-http-daemon/perl-http-daemon.mk
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -7,7 +7,6 @@
 PERL_HTTP_DAEMON_VERSION = 6.01
 PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
 PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_HTTP_DAEMON_DEPENDENCIES = perl-http-date perl-http-message perl-lwp-mediatypes
 PERL_HTTP_DAEMON_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_DAEMON_LICENSE_FILES = README
 
diff --git a/package/perl-http-entity-parser/perl-http-entity-parser.mk b/package/perl-http-entity-parser/perl-http-entity-parser.mk
index 980ee92fa..28edde57c 100644
--- a/package/perl-http-entity-parser/perl-http-entity-parser.mk
+++ b/package/perl-http-entity-parser/perl-http-entity-parser.mk
@@ -7,13 +7,7 @@
 PERL_HTTP_ENTITY_PARSER_VERSION = 0.21
 PERL_HTTP_ENTITY_PARSER_SOURCE = HTTP-Entity-Parser-$(PERL_HTTP_ENTITY_PARSER_VERSION).tar.gz
 PERL_HTTP_ENTITY_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
-PERL_HTTP_ENTITY_PARSER_DEPENDENCIES = \
-	host-perl-module-build-tiny \
-	perl-http-multipartparser \
-	perl-hash-multivalue \
-	perl-json-maybexs \
-	perl-stream-buffered \
-	perl-www-form-urlencoded
+PERL_HTTP_ENTITY_PARSER_DEPENDENCIES = host-perl-module-build-tiny
 PERL_HTTP_ENTITY_PARSER_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_ENTITY_PARSER_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-http-headers-fast/perl-http-headers-fast.mk b/package/perl-http-headers-fast/perl-http-headers-fast.mk
index 2ad2d2316..16056fe67 100644
--- a/package/perl-http-headers-fast/perl-http-headers-fast.mk
+++ b/package/perl-http-headers-fast/perl-http-headers-fast.mk
@@ -7,7 +7,7 @@
 PERL_HTTP_HEADERS_FAST_VERSION = 0.21
 PERL_HTTP_HEADERS_FAST_SOURCE = HTTP-Headers-Fast-$(PERL_HTTP_HEADERS_FAST_VERSION).tar.gz
 PERL_HTTP_HEADERS_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOKUHIROM
-PERL_HTTP_HEADERS_FAST_DEPENDENCIES = host-perl-module-build-tiny perl-http-date
+PERL_HTTP_HEADERS_FAST_DEPENDENCIES = host-perl-module-build-tiny
 PERL_HTTP_HEADERS_FAST_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_HEADERS_FAST_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index e4d642afd..b218fb05d 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -7,7 +7,6 @@
 PERL_HTTP_MESSAGE_VERSION = 6.18
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
-PERL_HTTP_MESSAGE_DEPENDENCIES = perl-encode-locale perl-http-date perl-io-html perl-lwp-mediatypes perl-uri
 PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_MESSAGE_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-http-negotiate/perl-http-negotiate.mk b/package/perl-http-negotiate/perl-http-negotiate.mk
index 86ca554a6..f7a303237 100644
--- a/package/perl-http-negotiate/perl-http-negotiate.mk
+++ b/package/perl-http-negotiate/perl-http-negotiate.mk
@@ -7,7 +7,6 @@
 PERL_HTTP_NEGOTIATE_VERSION = 6.01
 PERL_HTTP_NEGOTIATE_SOURCE = HTTP-Negotiate-$(PERL_HTTP_NEGOTIATE_VERSION).tar.gz
 PERL_HTTP_NEGOTIATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_HTTP_NEGOTIATE_DEPENDENCIES = perl-http-message
 PERL_HTTP_NEGOTIATE_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_NEGOTIATE_LICENSE_FILES = README
 
diff --git a/package/perl-io-socket-multicast/perl-io-socket-multicast.mk b/package/perl-io-socket-multicast/perl-io-socket-multicast.mk
index 41e4fe404..7f8f5b3b1 100644
--- a/package/perl-io-socket-multicast/perl-io-socket-multicast.mk
+++ b/package/perl-io-socket-multicast/perl-io-socket-multicast.mk
@@ -7,7 +7,6 @@
 PERL_IO_SOCKET_MULTICAST_VERSION = 1.12
 PERL_IO_SOCKET_MULTICAST_SOURCE = IO-Socket-Multicast-$(PERL_IO_SOCKET_MULTICAST_VERSION).tar.gz
 PERL_IO_SOCKET_MULTICAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BR/BRAMBLE
-PERL_IO_SOCKET_MULTICAST_DEPENDENCIES = perl-io-interface
 PERL_IO_SOCKET_MULTICAST_LICENSE = Artistic or GPL-1.0+
 PERL_IO_SOCKET_MULTICAST_LICENSE_FILES = README
 
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 95bb852f5..2c84ef834 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -7,7 +7,6 @@
 PERL_IO_SOCKET_SSL_VERSION = 2.056
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
-PERL_IO_SOCKET_SSL_DEPENDENCIES = perl-net-ssleay
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
 PERL_IO_SOCKET_SSL_LICENSE_FILES = README
 
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 254603df7..d1e26aea4 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -7,20 +7,6 @@
 PERL_LIBWWW_PERL_VERSION = 6.34
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
-PERL_LIBWWW_PERL_DEPENDENCIES = \
-	perl-encode-locale \
-	perl-file-listing \
-	perl-html-parser \
-	perl-http-cookies \
-	perl-http-daemon \
-	perl-http-date \
-	perl-http-message \
-	perl-http-negotiate \
-	perl-lwp-mediatypes \
-	perl-net-http \
-	perl-try-tiny \
-	perl-uri \
-	perl-www-robotrules
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LIBWWW_PERL_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index e6bfd7bd8..e1ce8714c 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -7,6 +7,5 @@
 PERL_MAIL_DKIM_VERSION = 0.52
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
-PERL_MAIL_DKIM_DEPENDENCIES = perl-crypt-openssl-rsa perl-mailtools perl-net-dns
 
 $(eval $(perl-package))
diff --git a/package/perl-mailtools/perl-mailtools.mk b/package/perl-mailtools/perl-mailtools.mk
index ae595bbfc..3a23d5c53 100644
--- a/package/perl-mailtools/perl-mailtools.mk
+++ b/package/perl-mailtools/perl-mailtools.mk
@@ -7,7 +7,6 @@
 PERL_MAILTOOLS_VERSION = 2.20
 PERL_MAILTOOLS_SOURCE = MailTools-$(PERL_MAILTOOLS_VERSION).tar.gz
 PERL_MAILTOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKOV
-PERL_MAILTOOLS_DEPENDENCIES = perl-timedate
 PERL_MAILTOOLS_LICENSE = Artistic or GPL-1.0+
 PERL_MAILTOOLS_LICENSE_FILES = README
 
diff --git a/package/perl-mime-tools/perl-mime-tools.mk b/package/perl-mime-tools/perl-mime-tools.mk
index 03bea508e..53037bc31 100644
--- a/package/perl-mime-tools/perl-mime-tools.mk
+++ b/package/perl-mime-tools/perl-mime-tools.mk
@@ -7,7 +7,6 @@
 PERL_MIME_TOOLS_VERSION = 5.509
 PERL_MIME_TOOLS_SOURCE = MIME-tools-$(PERL_MIME_TOOLS_VERSION).tar.gz
 PERL_MIME_TOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DS/DSKOLL
-PERL_MIME_TOOLS_DEPENDENCIES = perl-mailtools
 PERL_MIME_TOOLS_LICENSE = Artistic or GPL-1.0+
 PERL_MIME_TOOLS_LICENSE_FILES = COPYING
 
diff --git a/package/perl-module-build-tiny/perl-module-build-tiny.mk b/package/perl-module-build-tiny/perl-module-build-tiny.mk
index 890fdc735..81e24ab73 100644
--- a/package/perl-module-build-tiny/perl-module-build-tiny.mk
+++ b/package/perl-module-build-tiny/perl-module-build-tiny.mk
@@ -7,7 +7,10 @@
 PERL_MODULE_BUILD_TINY_VERSION = 0.039
 PERL_MODULE_BUILD_TINY_SOURCE = Module-Build-Tiny-$(PERL_MODULE_BUILD_TINY_VERSION).tar.gz
 PERL_MODULE_BUILD_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
-HOST_PERL_MODULE_BUILD_TINY_DEPENDENCIES = host-perl-extutils-config host-perl-extutils-helpers host-perl-extutils-installpaths
+HOST_PERL_MODULE_BUILD_TINY_DEPENDENCIES = \
+	host-perl-extutils-config \
+	host-perl-extutils-helpers \
+	host-perl-extutils-installpaths
 PERL_MODULE_BUILD_TINY_LICENSE = Artistic or GPL-1.0+
 PERL_MODULE_BUILD_TINY_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-module-implementation/perl-module-implementation.mk b/package/perl-module-implementation/perl-module-implementation.mk
index 50ee8610a..7a23697f8 100644
--- a/package/perl-module-implementation/perl-module-implementation.mk
+++ b/package/perl-module-implementation/perl-module-implementation.mk
@@ -7,7 +7,6 @@
 PERL_MODULE_IMPLEMENTATION_VERSION = 0.09
 PERL_MODULE_IMPLEMENTATION_SOURCE = Module-Implementation-$(PERL_MODULE_IMPLEMENTATION_VERSION).tar.gz
 PERL_MODULE_IMPLEMENTATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DR/DROLSKY
-PERL_MODULE_IMPLEMENTATION_DEPENDENCIES = perl-module-runtime perl-try-tiny
 PERL_MODULE_IMPLEMENTATION_LICENSE = Artistic-2.0
 PERL_MODULE_IMPLEMENTATION_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
index 274896594..bf5fc9313 100644
--- a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
@@ -7,7 +7,6 @@
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION = 1.33
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SOURCE = Mojolicious-Plugin-Authentication-$(PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION).tar.gz
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JJ/JJATRIA
-PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_DEPENDENCIES = perl-mojolicious
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_LICENSE = Artistic or GPL-1.0+
 PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index f9d22c240..d594d47d5 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -7,7 +7,6 @@
 PERL_NET_DNS_VERSION = 1.15
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
-PERL_NET_DNS_DEPENDENCIES = perl-digest-hmac
 PERL_NET_DNS_LICENSE = MIT
 PERL_NET_DNS_LICENSE_FILES = README
 
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index 12bd50f84..1030d68b4 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -7,7 +7,6 @@
 PERL_NET_HTTP_VERSION = 6.18
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
-PERL_NET_HTTP_DEPENDENCIES = perl-uri
 PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
 PERL_NET_HTTP_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-package-stash/perl-package-stash.mk b/package/perl-package-stash/perl-package-stash.mk
index 28dad5ea3..5d787714b 100644
--- a/package/perl-package-stash/perl-package-stash.mk
+++ b/package/perl-package-stash/perl-package-stash.mk
@@ -7,7 +7,6 @@
 PERL_PACKAGE_STASH_VERSION = 0.37
 PERL_PACKAGE_STASH_SOURCE = Package-Stash-$(PERL_PACKAGE_STASH_VERSION).tar.gz
 PERL_PACKAGE_STASH_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
-PERL_PACKAGE_STASH_DEPENDENCIES = perl-dist-checkconflicts perl-module-implementation
 PERL_PACKAGE_STASH_LICENSE = Artistic or GPL-1.0+
 PERL_PACKAGE_STASH_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-plack/perl-plack.mk b/package/perl-plack/perl-plack.mk
index 380848dc8..d6c8bf449 100644
--- a/package/perl-plack/perl-plack.mk
+++ b/package/perl-plack/perl-plack.mk
@@ -7,21 +7,7 @@
 PERL_PLACK_VERSION = 1.0047
 PERL_PLACK_SOURCE = Plack-$(PERL_PLACK_VERSION).tar.gz
 PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
-PERL_PLACK_DEPENDENCIES = \
-	host-perl-file-sharedir-install \
-	perl-apache-logformat-compiler \
-	perl-cookie-baker \
-	perl-devel-stacktrace \
-	perl-devel-stacktrace-ashtml \
-	perl-file-sharedir \
-	perl-filesys-notify-simple \
-	perl-http-entity-parser \
-	perl-http-headers-fast \
-	perl-http-message \
-	perl-hash-multivalue \
-	perl-stream-buffered \
-	perl-try-tiny perl-uri \
-	perl-www-form-urlencoded
+PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install
 PERL_PLACK_LICENSE = Artistic or GPL-1.0+
 PERL_PLACK_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-sys-mmap/perl-sys-mmap.mk b/package/perl-sys-mmap/perl-sys-mmap.mk
index ed2ca79b0..e028da100 100644
--- a/package/perl-sys-mmap/perl-sys-mmap.mk
+++ b/package/perl-sys-mmap/perl-sys-mmap.mk
@@ -8,6 +8,6 @@ PERL_SYS_MMAP_VERSION = 0.19
 PERL_SYS_MMAP_SOURCE = Sys-Mmap-$(PERL_SYS_MMAP_VERSION).tar.gz
 PERL_SYS_MMAP_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SW/SWALTERS
 PERL_SYS_MMAP_LICENSE = Artistic or GPL-1.0+
-PERL_SYS_MMAP_LICENSE_FILES = Copying Artistic
+PERL_SYS_MMAP_LICENSE_FILES = Artistic Copying
 
 $(eval $(perl-package))
diff --git a/package/perl-www-robotrules/perl-www-robotrules.mk b/package/perl-www-robotrules/perl-www-robotrules.mk
index 5e8bab9d5..7d85aa25e 100644
--- a/package/perl-www-robotrules/perl-www-robotrules.mk
+++ b/package/perl-www-robotrules/perl-www-robotrules.mk
@@ -7,7 +7,6 @@
 PERL_WWW_ROBOTRULES_VERSION = 6.02
 PERL_WWW_ROBOTRULES_SOURCE = WWW-RobotRules-$(PERL_WWW_ROBOTRULES_VERSION).tar.gz
 PERL_WWW_ROBOTRULES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_WWW_ROBOTRULES_DEPENDENCIES = perl-uri
 PERL_WWW_ROBOTRULES_LICENSE = Artistic or GPL-1.0+
 PERL_WWW_ROBOTRULES_LICENSE_FILES = README
 
diff --git a/package/perl-x10/perl-x10.mk b/package/perl-x10/perl-x10.mk
index 8f091b950..e19426756 100644
--- a/package/perl-x10/perl-x10.mk
+++ b/package/perl-x10/perl-x10.mk
@@ -7,7 +7,6 @@
 PERL_X10_VERSION = 0.04
 PERL_X10_SOURCE = X10-$(PERL_X10_VERSION).tar.gz
 PERL_X10_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RO/ROBF
-PERL_X10_DEPENDENCIES = perl-astro-suntime perl-device-serialport perl-time-parsedate
 PERL_X10_LICENSE = GPL-3.0
 PERL_X10_LICENSE_FILES = README
 
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index ff831bb07..81a379fa5 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -7,7 +7,7 @@
 PERL_XML_LIBXML_VERSION = 2.0132
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
-PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2 perl-xml-namespacesupport perl-xml-sax perl-xml-sax-base
+PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2
 PERL_XML_LIBXML_LICENSE = Artistic or GPL-1.0+
 PERL_XML_LIBXML_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-xml-sax/perl-xml-sax.mk b/package/perl-xml-sax/perl-xml-sax.mk
index 024ac6211..abfac5ed1 100644
--- a/package/perl-xml-sax/perl-xml-sax.mk
+++ b/package/perl-xml-sax/perl-xml-sax.mk
@@ -7,7 +7,6 @@
 PERL_XML_SAX_VERSION = 1.00
 PERL_XML_SAX_SOURCE = XML-SAX-$(PERL_XML_SAX_VERSION).tar.gz
 PERL_XML_SAX_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
-PERL_XML_SAX_DEPENDENCIES = perl-xml-namespacesupport perl-xml-sax-base
 PERL_XML_SAX_LICENSE = Artistic or GPL-1.0+
 PERL_XML_SAX_LICENSE_FILES = LICENSE
 
-- 
2.17.1
