From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Oct 2015 20:56:52 +0100
Subject: [Buildroot] [git commit] pkg-perl: remove the dependency generated
	by scancpan
Message-ID: <20151002195834.0BFDA81DE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=947f20f269c76960d9b38b46719d1ae6a9354a5f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../perl-crypt-openssl-random.mk                   |    2 +-
 .../perl-crypt-openssl-rsa.mk                      |    2 +-
 package/perl-datetime-tiny/perl-datetime-tiny.mk   |    1 -
 package/perl-db-file/perl-db-file.mk               |    2 +-
 package/perl-digest-hmac/perl-digest-hmac.mk       |    1 -
 package/perl-digest-sha1/perl-digest-sha1.mk       |    1 -
 package/perl-encode-detect/perl-encode-detect.mk   |    2 +-
 package/perl-encode-locale/perl-encode-locale.mk   |    1 -
 package/perl-file-listing/perl-file-listing.mk     |    2 +-
 package/perl-file-util/perl-file-util.mk           |    2 +-
 package/perl-gd/perl-gd.mk                         |    2 +-
 package/perl-gdgraph/perl-gdgraph.mk               |    2 +-
 package/perl-gdtextutil/perl-gdtextutil.mk         |    1 -
 package/perl-html-parser/perl-html-parser.mk       |    2 +-
 package/perl-html-tagset/perl-html-tagset.mk       |    1 -
 package/perl-http-cookies/perl-http-cookies.mk     |    2 +-
 package/perl-http-daemon/perl-http-daemon.mk       |    2 +-
 package/perl-http-date/perl-http-date.mk           |    1 -
 package/perl-http-negotiate/perl-http-negotiate.mk |    2 +-
 package/perl-io-html/perl-io-html.mk               |    1 -
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk   |    2 +-
 package/perl-json-tiny/perl-json-tiny.mk           |    1 -
 package/perl-libwww-perl/perl-libwww-perl.mk       |    1 -
 package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk |    1 -
 package/perl-mail-dkim/perl-mail-dkim.mk           |    2 +-
 package/perl-mailtools/perl-mailtools.mk           |    2 +-
 package/perl-mime-base64/perl-mime-base64.mk       |    1 -
 package/perl-mojolicious/perl-mojolicious.mk       |    1 -
 package/perl-net-dns/perl-net-dns.mk               |    2 +-
 package/perl-net-ssleay/perl-net-ssleay.mk         |    2 +-
 package/perl-netaddr-ip/perl-netaddr-ip.mk         |    1 -
 package/perl-path-tiny/perl-path-tiny.mk           |    1 -
 package/perl-time-hires/perl-time-hires.mk         |    1 -
 package/perl-timedate/perl-timedate.mk             |    1 -
 package/perl-try-tiny/perl-try-tiny.mk             |    1 -
 package/perl-uri/perl-uri.mk                       |    1 -
 package/perl-www-robotrules/perl-www-robotrules.mk |    2 +-
 package/perl-xml-libxml/perl-xml-libxml.mk         |    2 +-
 .../perl-xml-namespacesupport.mk                   |    1 -
 package/perl-xml-sax-base/perl-xml-sax-base.mk     |    1 -
 package/perl-xml-sax/perl-xml-sax.mk               |    2 +-
 41 files changed, 20 insertions(+), 41 deletions(-)

diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
index 2692236..32c0a03 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
@@ -7,7 +7,7 @@
 PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.10
 PERL_CRYPT_OPENSSL_RANDOM_SOURCE = Crypt-OpenSSL-Random-$(PERL_CRYPT_OPENSSL_RANDOM_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RANDOM_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
-PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = openssl perl
+PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = openssl
 PERL_CRYPT_OPENSSL_RANDOM_LICENSE = Artistic or GPLv1+
 PERL_CRYPT_OPENSSL_RANDOM_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
index 30d7303..7a4e31e 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
@@ -7,7 +7,7 @@
 PERL_CRYPT_OPENSSL_RSA_VERSION = 0.28
 PERL_CRYPT_OPENSSL_RSA_SOURCE = Crypt-OpenSSL-RSA-$(PERL_CRYPT_OPENSSL_RSA_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RSA_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERLER
-PERL_CRYPT_OPENSSL_RSA_DEPENDENCIES = perl perl-crypt-openssl-random
+PERL_CRYPT_OPENSSL_RSA_DEPENDENCIES = perl-crypt-openssl-random
 PERL_CRYPT_OPENSSL_RSA_LICENSE = Artistic or GPLv1+
 PERL_CRYPT_OPENSSL_RSA_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.mk b/package/perl-datetime-tiny/perl-datetime-tiny.mk
index 6e9c626..bf3b7d9 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.mk
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.mk
@@ -7,7 +7,6 @@
 PERL_DATETIME_TINY_VERSION = 1.04
 PERL_DATETIME_TINY_SOURCE = DateTime-Tiny-$(PERL_DATETIME_TINY_VERSION).tar.gz
 PERL_DATETIME_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AD/ADAMK
-PERL_DATETIME_TINY_DEPENDENCIES = perl
 PERL_DATETIME_TINY_LICENSE = Artistic or GPLv1+
 PERL_DATETIME_TINY_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-db-file/perl-db-file.mk b/package/perl-db-file/perl-db-file.mk
index 46b87ae..1011632 100644
--- a/package/perl-db-file/perl-db-file.mk
+++ b/package/perl-db-file/perl-db-file.mk
@@ -7,7 +7,7 @@
 PERL_DB_FILE_VERSION = 1.835
 PERL_DB_FILE_SOURCE = DB_File-$(PERL_DB_FILE_VERSION).tar.gz
 PERL_DB_FILE_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PM/PMQS
-PERL_DB_FILE_DEPENDENCIES = berkeleydb perl
+PERL_DB_FILE_DEPENDENCIES = berkeleydb
 PERL_DB_FILE_LICENSE = Artistic or GPLv1+
 
 $(eval $(perl-package))
diff --git a/package/perl-digest-hmac/perl-digest-hmac.mk b/package/perl-digest-hmac/perl-digest-hmac.mk
index 97ec43e..bee32f4 100644
--- a/package/perl-digest-hmac/perl-digest-hmac.mk
+++ b/package/perl-digest-hmac/perl-digest-hmac.mk
@@ -7,7 +7,6 @@
 PERL_DIGEST_HMAC_VERSION = 1.03
 PERL_DIGEST_HMAC_SOURCE = Digest-HMAC-$(PERL_DIGEST_HMAC_VERSION).tar.gz
 PERL_DIGEST_HMAC_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_DIGEST_HMAC_DEPENDENCIES = perl
 PERL_DIGEST_HMAC_LICENSE = Artistic or GPLv1+
 PERL_DIGEST_HMAC_LICENSE_FILES = README
 
diff --git a/package/perl-digest-sha1/perl-digest-sha1.mk b/package/perl-digest-sha1/perl-digest-sha1.mk
index d3224e1..1d7601b 100644
--- a/package/perl-digest-sha1/perl-digest-sha1.mk
+++ b/package/perl-digest-sha1/perl-digest-sha1.mk
@@ -7,7 +7,6 @@
 PERL_DIGEST_SHA1_VERSION = 2.13
 PERL_DIGEST_SHA1_SOURCE = Digest-SHA1-$(PERL_DIGEST_SHA1_VERSION).tar.gz
 PERL_DIGEST_SHA1_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_DIGEST_SHA1_DEPENDENCIES = perl
 PERL_DIGEST_SHA1_LICENSE = Artistic or GPLv1+
 
 $(eval $(perl-package))
diff --git a/package/perl-encode-detect/perl-encode-detect.mk b/package/perl-encode-detect/perl-encode-detect.mk
index de9c2ff..732fba8 100644
--- a/package/perl-encode-detect/perl-encode-detect.mk
+++ b/package/perl-encode-detect/perl-encode-detect.mk
@@ -7,7 +7,7 @@
 PERL_ENCODE_DETECT_VERSION = 1.01
 PERL_ENCODE_DETECT_SOURCE = Encode-Detect-$(PERL_ENCODE_DETECT_VERSION).tar.gz
 PERL_ENCODE_DETECT_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JG/JGMYERS
-PERL_ENCODE_DETECT_DEPENDENCIES = perl host-perl-module-build
+PERL_ENCODE_DETECT_DEPENDENCIES = host-perl-module-build
 PERL_ENCODE_DETECT_LICENSE = MPL-1.1
 PERL_ENCODE_DETECT_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-encode-locale/perl-encode-locale.mk b/package/perl-encode-locale/perl-encode-locale.mk
index be18589..2544b16 100644
--- a/package/perl-encode-locale/perl-encode-locale.mk
+++ b/package/perl-encode-locale/perl-encode-locale.mk
@@ -7,7 +7,6 @@
 PERL_ENCODE_LOCALE_VERSION = 1.05
 PERL_ENCODE_LOCALE_SOURCE = Encode-Locale-$(PERL_ENCODE_LOCALE_VERSION).tar.gz
 PERL_ENCODE_LOCALE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_ENCODE_LOCALE_DEPENDENCIES = perl
 PERL_ENCODE_LOCALE_LICENSE = Artistic or GPLv1+
 PERL_ENCODE_LOCALE_LICENSE_FILES = README
 
diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
index c376c61..a9d8ced 100644
--- a/package/perl-file-listing/perl-file-listing.mk
+++ b/package/perl-file-listing/perl-file-listing.mk
@@ -7,7 +7,7 @@
 PERL_FILE_LISTING_VERSION = 6.04
 PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
 PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_FILE_LISTING_DEPENDENCIES = perl perl-http-date
+PERL_FILE_LISTING_DEPENDENCIES = perl-http-date
 PERL_FILE_LISTING_LICENSE = Artistic or GPLv1+
 PERL_FILE_LISTING_LICENSE_FILES = README
 
diff --git a/package/perl-file-util/perl-file-util.mk b/package/perl-file-util/perl-file-util.mk
index c8b4441..2712aa4 100644
--- a/package/perl-file-util/perl-file-util.mk
+++ b/package/perl-file-util/perl-file-util.mk
@@ -7,7 +7,7 @@
 PERL_FILE_UTIL_VERSION = 4.132140
 PERL_FILE_UTIL_SOURCE = File-Util-$(PERL_FILE_UTIL_VERSION).tar.gz
 PERL_FILE_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOMMY
-PERL_FILE_UTIL_DEPENDENCIES = perl host-perl-module-build
+PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
 PERL_FILE_UTIL_LICENSE = Artistic or GPLv1+
 PERL_FILE_UTIL_LICENSE_FILES = COPYING LICENSE
 
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 843687b..99568cb 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -7,7 +7,7 @@
 PERL_GD_VERSION = 2.53
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
-PERL_GD_DEPENDENCIES = perl zlib libpng freetype gd
+PERL_GD_DEPENDENCIES = zlib libpng freetype gd
 PERL_GD_LICENSE = Artistic-2.0 or GPLv1+
 PERL_GD_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-gdgraph/perl-gdgraph.mk b/package/perl-gdgraph/perl-gdgraph.mk
index dfb08d1..dbc789e 100644
--- a/package/perl-gdgraph/perl-gdgraph.mk
+++ b/package/perl-gdgraph/perl-gdgraph.mk
@@ -7,7 +7,7 @@
 PERL_GDGRAPH_VERSION = 1.49
 PERL_GDGRAPH_SOURCE = GDGraph-$(PERL_GDGRAPH_VERSION).tar.gz
 PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RUZ
-PERL_GDGRAPH_DEPENDENCIES = perl perl-gd perl-gdtextutil
+PERL_GDGRAPH_DEPENDENCIES = perl-gd perl-gdtextutil
 PERL_GDGRAPH_LICENSE = Artistic or GPLv1+
 PERL_GDGRAPH_LICENSE_FILES = Dustismo.LICENSE
 
diff --git a/package/perl-gdtextutil/perl-gdtextutil.mk b/package/perl-gdtextutil/perl-gdtextutil.mk
index 381bd59..087102a 100644
--- a/package/perl-gdtextutil/perl-gdtextutil.mk
+++ b/package/perl-gdtextutil/perl-gdtextutil.mk
@@ -7,7 +7,6 @@
 PERL_GDTEXTUTIL_VERSION = 0.86
 PERL_GDTEXTUTIL_SOURCE = GDTextUtil-$(PERL_GDTEXTUTIL_VERSION).tar.gz
 PERL_GDTEXTUTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MV/MVERB
-PERL_GDTEXTUTIL_DEPENDENCIES = perl
 PERL_GDTEXTUTIL_LICENSE_FILES = Dustismo.LICENSE
 
 $(eval $(perl-package))
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index ecdd7fd..18d25c5 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -7,7 +7,7 @@
 PERL_HTML_PARSER_VERSION = 3.71
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_HTML_PARSER_DEPENDENCIES = perl perl-html-tagset
+PERL_HTML_PARSER_DEPENDENCIES = perl-html-tagset
 PERL_HTML_PARSER_LICENSE = Artistic or GPLv1+
 PERL_HTML_PARSER_LICENSE_FILES = README
 
diff --git a/package/perl-html-tagset/perl-html-tagset.mk b/package/perl-html-tagset/perl-html-tagset.mk
index 2629611..d18d6a6 100644
--- a/package/perl-html-tagset/perl-html-tagset.mk
+++ b/package/perl-html-tagset/perl-html-tagset.mk
@@ -7,7 +7,6 @@
 PERL_HTML_TAGSET_VERSION = 3.20
 PERL_HTML_TAGSET_SOURCE = HTML-Tagset-$(PERL_HTML_TAGSET_VERSION).tar.gz
 PERL_HTML_TAGSET_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PETDANCE
-PERL_HTML_TAGSET_DEPENDENCIES = perl
 PERL_HTML_TAGSET_LICENSE = Artistic or GPLv1+
 PERL_HTML_TAGSET_LICENSE_FILES = README
 
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index fa3a15a..52ee74a 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -7,7 +7,7 @@
 PERL_HTTP_COOKIES_VERSION = 6.01
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_HTTP_COOKIES_DEPENDENCIES = perl perl-http-date perl-http-message
+PERL_HTTP_COOKIES_DEPENDENCIES = perl-http-date perl-http-message
 PERL_HTTP_COOKIES_LICENSE = Artistic or GPLv1+
 PERL_HTTP_COOKIES_LICENSE_FILES = README
 
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
index 6c009a3..56dbd78 100644
--- a/package/perl-http-daemon/perl-http-daemon.mk
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -7,7 +7,7 @@
 PERL_HTTP_DAEMON_VERSION = 6.01
 PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
 PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_HTTP_DAEMON_DEPENDENCIES = perl perl-http-date perl-http-message perl-lwp-mediatypes
+PERL_HTTP_DAEMON_DEPENDENCIES = perl-http-date perl-http-message perl-lwp-mediatypes
 PERL_HTTP_DAEMON_LICENSE = Artistic or GPLv1+
 PERL_HTTP_DAEMON_LICENSE_FILES = README
 
diff --git a/package/perl-http-date/perl-http-date.mk b/package/perl-http-date/perl-http-date.mk
index 6de95b6..bb5f4dc 100644
--- a/package/perl-http-date/perl-http-date.mk
+++ b/package/perl-http-date/perl-http-date.mk
@@ -7,7 +7,6 @@
 PERL_HTTP_DATE_VERSION = 6.02
 PERL_HTTP_DATE_SOURCE = HTTP-Date-$(PERL_HTTP_DATE_VERSION).tar.gz
 PERL_HTTP_DATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_HTTP_DATE_DEPENDENCIES = perl
 PERL_HTTP_DATE_LICENSE = Artistic or GPLv1+
 PERL_HTTP_DATE_LICENSE_FILES = README
 
diff --git a/package/perl-http-negotiate/perl-http-negotiate.mk b/package/perl-http-negotiate/perl-http-negotiate.mk
index b267785..569ed2b 100644
--- a/package/perl-http-negotiate/perl-http-negotiate.mk
+++ b/package/perl-http-negotiate/perl-http-negotiate.mk
@@ -7,7 +7,7 @@
 PERL_HTTP_NEGOTIATE_VERSION = 6.01
 PERL_HTTP_NEGOTIATE_SOURCE = HTTP-Negotiate-$(PERL_HTTP_NEGOTIATE_VERSION).tar.gz
 PERL_HTTP_NEGOTIATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_HTTP_NEGOTIATE_DEPENDENCIES = perl perl-http-message
+PERL_HTTP_NEGOTIATE_DEPENDENCIES = perl-http-message
 PERL_HTTP_NEGOTIATE_LICENSE = Artistic or GPLv1+
 PERL_HTTP_NEGOTIATE_LICENSE_FILES = README
 
diff --git a/package/perl-io-html/perl-io-html.mk b/package/perl-io-html/perl-io-html.mk
index 3926d44..4bdcc8d 100644
--- a/package/perl-io-html/perl-io-html.mk
+++ b/package/perl-io-html/perl-io-html.mk
@@ -7,7 +7,6 @@
 PERL_IO_HTML_VERSION = 1.001
 PERL_IO_HTML_SOURCE = IO-HTML-$(PERL_IO_HTML_VERSION).tar.gz
 PERL_IO_HTML_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CJ/CJM
-PERL_IO_HTML_DEPENDENCIES = perl
 PERL_IO_HTML_LICENSE = Artistic or GPLv1+
 PERL_IO_HTML_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 1816e93..b0aa3df 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -7,7 +7,7 @@
 PERL_IO_SOCKET_SSL_VERSION = 2.016
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
-PERL_IO_SOCKET_SSL_DEPENDENCIES = perl perl-net-ssleay
+PERL_IO_SOCKET_SSL_DEPENDENCIES = perl-net-ssleay
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPLv1+
 
 $(eval $(perl-package))
diff --git a/package/perl-json-tiny/perl-json-tiny.mk b/package/perl-json-tiny/perl-json-tiny.mk
index ddc50ac..7a2a42e 100644
--- a/package/perl-json-tiny/perl-json-tiny.mk
+++ b/package/perl-json-tiny/perl-json-tiny.mk
@@ -7,7 +7,6 @@
 PERL_JSON_TINY_VERSION = 0.53
 PERL_JSON_TINY_SOURCE = JSON-Tiny-$(PERL_JSON_TINY_VERSION).tar.gz
 PERL_JSON_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAVIDO
-PERL_JSON_TINY_DEPENDENCIES = perl
 PERL_JSON_TINY_LICENSE = Artistic-2.0
 PERL_JSON_TINY_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 64cbfd4..d5cd195 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -10,7 +10,6 @@ PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPLv1+
 PERL_LIBWWW_LICENSE_FILES = README
 PERL_LIBWWW_PERL_DEPENDENCIES = \
-	perl \
 	perl-encode-locale \
 	perl-file-listing \
 	perl-html-parser \
diff --git a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
index 2442d41..cd7c75a 100644
--- a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
+++ b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
@@ -7,7 +7,6 @@
 PERL_LWP_MEDIATYPES_VERSION = 6.02
 PERL_LWP_MEDIATYPES_SOURCE = LWP-MediaTypes-$(PERL_LWP_MEDIATYPES_VERSION).tar.gz
 PERL_LWP_MEDIATYPES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_LWP_MEDIATYPES_DEPENDENCIES = perl
 PERL_LWP_MEDIATYPES_LICENSE = Artistic or GPLv1+
 PERL_LWP_MEDIATYPES_LICENSE_FILES = README
 
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index 7f00299..8c7926f 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -7,6 +7,6 @@
 PERL_MAIL_DKIM_VERSION = 0.40
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JA/JASLONG
-PERL_MAIL_DKIM_DEPENDENCIES = perl perl-crypt-openssl-rsa perl-mailtools perl-net-dns
+PERL_MAIL_DKIM_DEPENDENCIES = perl-crypt-openssl-rsa perl-mailtools perl-net-dns
 
 $(eval $(perl-package))
diff --git a/package/perl-mailtools/perl-mailtools.mk b/package/perl-mailtools/perl-mailtools.mk
index 5b11625..88f3a9f 100644
--- a/package/perl-mailtools/perl-mailtools.mk
+++ b/package/perl-mailtools/perl-mailtools.mk
@@ -7,7 +7,7 @@
 PERL_MAILTOOLS_VERSION = 2.14
 PERL_MAILTOOLS_SOURCE = MailTools-$(PERL_MAILTOOLS_VERSION).tar.gz
 PERL_MAILTOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKOV
-PERL_MAILTOOLS_DEPENDENCIES = perl perl-timedate
+PERL_MAILTOOLS_DEPENDENCIES = perl-timedate
 PERL_MAILTOOLS_LICENSE = Artistic or GPLv1+
 
 $(eval $(perl-package))
diff --git a/package/perl-mime-base64/perl-mime-base64.mk b/package/perl-mime-base64/perl-mime-base64.mk
index abb2704..d064337 100644
--- a/package/perl-mime-base64/perl-mime-base64.mk
+++ b/package/perl-mime-base64/perl-mime-base64.mk
@@ -7,7 +7,6 @@
 PERL_MIME_BASE64_VERSION = 3.15
 PERL_MIME_BASE64_SOURCE = MIME-Base64-$(PERL_MIME_BASE64_VERSION).tar.gz
 PERL_MIME_BASE64_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_MIME_BASE64_DEPENDENCIES = perl
 PERL_MIME_BASE64_LICENSE = Artistic or GPLv1+
 PERL_MIME_BASE64_LICENSE_FILES = README
 
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 50a7f98..302cedb 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -7,7 +7,6 @@
 PERL_MOJOLICIOUS_VERSION = 6.14
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
-PERL_MOJOLICIOUS_DEPENDENCIES = perl
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
 PERL_MOJOLICIOUS_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index 75c0a1b..f93b084 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -7,7 +7,7 @@
 PERL_NET_DNS_VERSION = 0.83
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
-PERL_NET_DNS_DEPENDENCIES = perl perl-digest-hmac
+PERL_NET_DNS_DEPENDENCIES = perl-digest-hmac
 PERL_NET_DNS_LICENSE = Artistic or GPLv1+
 PERL_NET_DNS_LICENSE_FILES = README
 
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
index 8a40a29..c400875 100644
--- a/package/perl-net-ssleay/perl-net-ssleay.mk
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -7,7 +7,7 @@
 PERL_NET_SSLEAY_VERSION = 1.70
 PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
 PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM
-PERL_NET_SSLEAY_DEPENDENCIES = perl openssl
+PERL_NET_SSLEAY_DEPENDENCIES = openssl
 PERL_NET_SSLEAY_LICENSE = OpenSSL
 PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index e8ace9d..8acb4d7 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.mk
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -7,7 +7,6 @@
 PERL_NETADDR_IP_VERSION = 4.075
 PERL_NETADDR_IP_SOURCE = NetAddr-IP-$(PERL_NETADDR_IP_VERSION).tar.gz
 PERL_NETADDR_IP_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKER
-PERL_NETADDR_IP_DEPENDENCIES = perl
 PERL_NETADDR_IP_LICENSE = Artistic or GPLv1+
 PERL_NETADDR_IP_LICENSE_FILES = Artistic Copying
 
diff --git a/package/perl-path-tiny/perl-path-tiny.mk b/package/perl-path-tiny/perl-path-tiny.mk
index 71e2e43..0af84fd 100644
--- a/package/perl-path-tiny/perl-path-tiny.mk
+++ b/package/perl-path-tiny/perl-path-tiny.mk
@@ -7,7 +7,6 @@
 PERL_PATH_TINY_VERSION = 0.072
 PERL_PATH_TINY_SOURCE = Path-Tiny-$(PERL_PATH_TINY_VERSION).tar.gz
 PERL_PATH_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
-PERL_PATH_TINY_DEPENDENCIES = perl
 PERL_PATH_TINY_LICENSE = Apache-2.0
 PERL_PATH_TINY_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-time-hires/perl-time-hires.mk b/package/perl-time-hires/perl-time-hires.mk
index 79207c9..7436d96 100644
--- a/package/perl-time-hires/perl-time-hires.mk
+++ b/package/perl-time-hires/perl-time-hires.mk
@@ -7,7 +7,6 @@
 PERL_TIME_HIRES_VERSION = 1.9726
 PERL_TIME_HIRES_SOURCE = Time-HiRes-$(PERL_TIME_HIRES_VERSION).tar.gz
 PERL_TIME_HIRES_SITE = $(BR2_CPAN_MIRROR)/authors/id/Z/ZE/ZEFRAM
-PERL_TIME_HIRES_DEPENDENCIES = perl
 PERL_TIME_HIRES_LICENSE = Artistic or GPLv1+
 PERL_TIME_HIRES_LICENSE_FILES = README
 
diff --git a/package/perl-timedate/perl-timedate.mk b/package/perl-timedate/perl-timedate.mk
index f0c6714..b7fcd08 100644
--- a/package/perl-timedate/perl-timedate.mk
+++ b/package/perl-timedate/perl-timedate.mk
@@ -7,7 +7,6 @@
 PERL_TIMEDATE_VERSION = 2.30
 PERL_TIMEDATE_SOURCE = TimeDate-$(PERL_TIMEDATE_VERSION).tar.gz
 PERL_TIMEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GB/GBARR
-PERL_TIMEDATE_DEPENDENCIES = perl
 PERL_TIMEDATE_LICENSE = Artistic or GPLv1+
 
 $(eval $(perl-package))
diff --git a/package/perl-try-tiny/perl-try-tiny.mk b/package/perl-try-tiny/perl-try-tiny.mk
index ba2b008..05cea54 100644
--- a/package/perl-try-tiny/perl-try-tiny.mk
+++ b/package/perl-try-tiny/perl-try-tiny.mk
@@ -7,7 +7,6 @@
 PERL_TRY_TINY_VERSION = 0.22
 PERL_TRY_TINY_SOURCE = Try-Tiny-$(PERL_TRY_TINY_VERSION).tar.gz
 PERL_TRY_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
-PERL_TRY_TINY_DEPENDENCIES = perl
 PERL_TRY_TINY_LICENSE = MIT
 PERL_TRY_TINY_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index f1aecb0..c51bb97 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -7,7 +7,6 @@
 PERL_URI_VERSION = 1.68
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
-PERL_URI_DEPENDENCIES = perl
 PERL_URI_LICENSE = Artistic or GPLv1+
 PERL_URI_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-www-robotrules/perl-www-robotrules.mk b/package/perl-www-robotrules/perl-www-robotrules.mk
index e74baab..0c68b98 100644
--- a/package/perl-www-robotrules/perl-www-robotrules.mk
+++ b/package/perl-www-robotrules/perl-www-robotrules.mk
@@ -7,7 +7,7 @@
 PERL_WWW_ROBOTRULES_VERSION = 6.02
 PERL_WWW_ROBOTRULES_SOURCE = WWW-RobotRules-$(PERL_WWW_ROBOTRULES_VERSION).tar.gz
 PERL_WWW_ROBOTRULES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_WWW_ROBOTRULES_DEPENDENCIES = perl perl-uri
+PERL_WWW_ROBOTRULES_DEPENDENCIES = perl-uri
 PERL_WWW_ROBOTRULES_LICENSE = Artistic or GPLv1+
 PERL_WWW_ROBOTRULES_LICENSE_FILES = README
 
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index d58a1f3..5717841 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -7,7 +7,7 @@
 PERL_XML_LIBXML_VERSION = 2.0121
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
-PERL_XML_LIBXML_DEPENDENCIES = perl zlib libxml2 perl-xml-sax perl-xml-namespacesupport
+PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2 perl-xml-sax perl-xml-namespacesupport
 PERL_XML_LIBXML_LICENSE = Artistic or GPLv1+
 PERL_XML_LIBXML_LICENSE_FILES = LICENSE
 
diff --git a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
index 812258e..727b9b8 100644
--- a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
+++ b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
@@ -7,7 +7,6 @@
 PERL_XML_NAMESPACESUPPORT_VERSION = 1.11
 PERL_XML_NAMESPACESUPPORT_SOURCE = XML-NamespaceSupport-$(PERL_XML_NAMESPACESUPPORT_VERSION).tar.gz
 PERL_XML_NAMESPACESUPPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERIGRIN
-PERL_XML_NAMESPACESUPPORT_DEPENDENCIES = perl
 PERL_XML_NAMESPACESUPPORT_LICENSE = Artistic or GPLv1+
 
 $(eval $(perl-package))
diff --git a/package/perl-xml-sax-base/perl-xml-sax-base.mk b/package/perl-xml-sax-base/perl-xml-sax-base.mk
index 528e976..de47ea4 100644
--- a/package/perl-xml-sax-base/perl-xml-sax-base.mk
+++ b/package/perl-xml-sax-base/perl-xml-sax-base.mk
@@ -7,7 +7,6 @@
 PERL_XML_SAX_BASE_VERSION = 1.08
 PERL_XML_SAX_BASE_SOURCE = XML-SAX-Base-$(PERL_XML_SAX_BASE_VERSION).tar.gz
 PERL_XML_SAX_BASE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
-PERL_XML_SAX_BASE_DEPENDENCIES = perl
 PERL_XML_SAX_BASE_LICENSE = Artistic or GPLv1+
 
 $(eval $(perl-package))
diff --git a/package/perl-xml-sax/perl-xml-sax.mk b/package/perl-xml-sax/perl-xml-sax.mk
index 04d8e54..f6d0372 100644
--- a/package/perl-xml-sax/perl-xml-sax.mk
+++ b/package/perl-xml-sax/perl-xml-sax.mk
@@ -7,7 +7,7 @@
 PERL_XML_SAX_VERSION = 0.99
 PERL_XML_SAX_SOURCE = XML-SAX-$(PERL_XML_SAX_VERSION).tar.gz
 PERL_XML_SAX_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
-PERL_XML_SAX_DEPENDENCIES = perl perl-xml-namespacesupport perl-xml-sax-base
+PERL_XML_SAX_DEPENDENCIES = perl-xml-namespacesupport perl-xml-sax-base
 PERL_XML_SAX_LICENSE = Artistic or GPLv1+
 PERL_XML_SAX_LICENSE_FILES = LICENSE
 
