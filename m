From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:14:07 +0200
Subject: [Buildroot] [git commit] package: use SPDX short identifier for
	GPLv1/GPLv1+
Message-ID: <20170401134424.9A9427FF41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cded7ae71ac746a454b0aa184f60d3cb243033c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to use SPDX identifier for licenses as much as possible. SPDX
short identifier for GPLv1/GPLv1+ is GPL-1.0/GPL-1.0+.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/GPLv1(\+)?/GPL-1.0\1/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/joe/joe.mk                                             | 2 +-
 package/libxml-parser-perl/libxml-parser-perl.mk               | 2 +-
 package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk | 2 +-
 package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk       | 2 +-
 package/perl-datetime-tiny/perl-datetime-tiny.mk               | 2 +-
 package/perl-digest-hmac/perl-digest-hmac.mk                   | 2 +-
 package/perl-digest-sha1/perl-digest-sha1.mk                   | 2 +-
 package/perl-encode-locale/perl-encode-locale.mk               | 2 +-
 package/perl-file-listing/perl-file-listing.mk                 | 2 +-
 package/perl-file-util/perl-file-util.mk                       | 2 +-
 package/perl-gd/perl-gd.mk                                     | 2 +-
 package/perl-gdgraph/perl-gdgraph.mk                           | 2 +-
 package/perl-html-parser/perl-html-parser.mk                   | 2 +-
 package/perl-html-tagset/perl-html-tagset.mk                   | 2 +-
 package/perl-http-cookies/perl-http-cookies.mk                 | 2 +-
 package/perl-http-daemon/perl-http-daemon.mk                   | 2 +-
 package/perl-http-date/perl-http-date.mk                       | 2 +-
 package/perl-http-message/perl-http-message.mk                 | 2 +-
 package/perl-http-negotiate/perl-http-negotiate.mk             | 2 +-
 package/perl-io-html/perl-io-html.mk                           | 2 +-
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk               | 2 +-
 package/perl-libwww-perl/perl-libwww-perl.mk                   | 2 +-
 package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk             | 2 +-
 package/perl-mailtools/perl-mailtools.mk                       | 2 +-
 package/perl-mime-base64/perl-mime-base64.mk                   | 2 +-
 package/perl-module-build/perl-module-build.mk                 | 2 +-
 package/perl-net-http/perl-net-http.mk                         | 2 +-
 package/perl-netaddr-ip/perl-netaddr-ip.mk                     | 2 +-
 package/perl-time-hires/perl-time-hires.mk                     | 2 +-
 package/perl-timedate/perl-timedate.mk                         | 2 +-
 package/perl-uri/perl-uri.mk                                   | 2 +-
 package/perl-www-robotrules/perl-www-robotrules.mk             | 2 +-
 package/perl-xml-libxml/perl-xml-libxml.mk                     | 2 +-
 package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk | 2 +-
 package/perl-xml-sax-base/perl-xml-sax-base.mk                 | 2 +-
 package/perl-xml-sax/perl-xml-sax.mk                           | 2 +-
 package/perl/perl.mk                                           | 2 +-
 37 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/package/joe/joe.mk b/package/joe/joe.mk
index e86007e..e19cae1 100644
--- a/package/joe/joe.mk
+++ b/package/joe/joe.mk
@@ -6,7 +6,7 @@
 
 JOE_VERSION = 3.7
 JOE_SITE = http://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-$(JOE_VERSION)
-JOE_LICENSE = GPLv1+
+JOE_LICENSE = GPL-1.0+
 JOE_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
diff --git a/package/libxml-parser-perl/libxml-parser-perl.mk b/package/libxml-parser-perl/libxml-parser-perl.mk
index e512815..401470d 100644
--- a/package/libxml-parser-perl/libxml-parser-perl.mk
+++ b/package/libxml-parser-perl/libxml-parser-perl.mk
@@ -8,7 +8,7 @@ LIBXML_PARSER_PERL_VERSION = 2.44
 LIBXML_PARSER_PERL_SOURCE = XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
 LIBXML_PARSER_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TODDR
 HOST_LIBXML_PARSER_PERL_DEPENDENCIES = host-expat
-LIBXML_PARSER_PERL_LICENSE = Artistic or GPLv1+
+LIBXML_PARSER_PERL_LICENSE = Artistic or GPL-1.0+
 LIBXML_PARSER_PERL_RUN_PERL = `which perl`
 
 define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
diff --git a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
index 6152821..de029e9 100644
--- a/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
+++ b/package/perl-crypt-openssl-random/perl-crypt-openssl-random.mk
@@ -8,7 +8,7 @@ PERL_CRYPT_OPENSSL_RANDOM_VERSION = 0.11
 PERL_CRYPT_OPENSSL_RANDOM_SOURCE = Crypt-OpenSSL-Random-$(PERL_CRYPT_OPENSSL_RANDOM_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RANDOM_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
 PERL_CRYPT_OPENSSL_RANDOM_DEPENDENCIES = openssl
-PERL_CRYPT_OPENSSL_RANDOM_LICENSE = Artistic or GPLv1+
+PERL_CRYPT_OPENSSL_RANDOM_LICENSE = Artistic or GPL-1.0+
 PERL_CRYPT_OPENSSL_RANDOM_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
diff --git a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
index 7a4e31e..b853d99 100644
--- a/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
+++ b/package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk
@@ -8,7 +8,7 @@ PERL_CRYPT_OPENSSL_RSA_VERSION = 0.28
 PERL_CRYPT_OPENSSL_RSA_SOURCE = Crypt-OpenSSL-RSA-$(PERL_CRYPT_OPENSSL_RSA_VERSION).tar.gz
 PERL_CRYPT_OPENSSL_RSA_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERLER
 PERL_CRYPT_OPENSSL_RSA_DEPENDENCIES = perl-crypt-openssl-random
-PERL_CRYPT_OPENSSL_RSA_LICENSE = Artistic or GPLv1+
+PERL_CRYPT_OPENSSL_RSA_LICENSE = Artistic or GPL-1.0+
 PERL_CRYPT_OPENSSL_RSA_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
diff --git a/package/perl-datetime-tiny/perl-datetime-tiny.mk b/package/perl-datetime-tiny/perl-datetime-tiny.mk
index 5758973..6b54967 100644
--- a/package/perl-datetime-tiny/perl-datetime-tiny.mk
+++ b/package/perl-datetime-tiny/perl-datetime-tiny.mk
@@ -7,7 +7,7 @@
 PERL_DATETIME_TINY_VERSION = 1.06
 PERL_DATETIME_TINY_SOURCE = DateTime-Tiny-$(PERL_DATETIME_TINY_VERSION).tar.gz
 PERL_DATETIME_TINY_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DA/DAGOLDEN
-PERL_DATETIME_TINY_LICENSE = Artistic or GPLv1+
+PERL_DATETIME_TINY_LICENSE = Artistic or GPL-1.0+
 PERL_DATETIME_TINY_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
diff --git a/package/perl-digest-hmac/perl-digest-hmac.mk b/package/perl-digest-hmac/perl-digest-hmac.mk
index bee32f4..a926a1e 100644
--- a/package/perl-digest-hmac/perl-digest-hmac.mk
+++ b/package/perl-digest-hmac/perl-digest-hmac.mk
@@ -7,7 +7,7 @@
 PERL_DIGEST_HMAC_VERSION = 1.03
 PERL_DIGEST_HMAC_SOURCE = Digest-HMAC-$(PERL_DIGEST_HMAC_VERSION).tar.gz
 PERL_DIGEST_HMAC_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_DIGEST_HMAC_LICENSE = Artistic or GPLv1+
+PERL_DIGEST_HMAC_LICENSE = Artistic or GPL-1.0+
 PERL_DIGEST_HMAC_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-digest-sha1/perl-digest-sha1.mk b/package/perl-digest-sha1/perl-digest-sha1.mk
index 52b9ec3..d93159b 100644
--- a/package/perl-digest-sha1/perl-digest-sha1.mk
+++ b/package/perl-digest-sha1/perl-digest-sha1.mk
@@ -7,7 +7,7 @@
 PERL_DIGEST_SHA1_VERSION = 2.13
 PERL_DIGEST_SHA1_SOURCE = Digest-SHA1-$(PERL_DIGEST_SHA1_VERSION).tar.gz
 PERL_DIGEST_SHA1_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_DIGEST_SHA1_LICENSE = Artistic or GPLv1+
+PERL_DIGEST_SHA1_LICENSE = Artistic or GPL-1.0+
 PERL_DIGEST_SHA1_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-encode-locale/perl-encode-locale.mk b/package/perl-encode-locale/perl-encode-locale.mk
index 2544b16..80d9c3b 100644
--- a/package/perl-encode-locale/perl-encode-locale.mk
+++ b/package/perl-encode-locale/perl-encode-locale.mk
@@ -7,7 +7,7 @@
 PERL_ENCODE_LOCALE_VERSION = 1.05
 PERL_ENCODE_LOCALE_SOURCE = Encode-Locale-$(PERL_ENCODE_LOCALE_VERSION).tar.gz
 PERL_ENCODE_LOCALE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_ENCODE_LOCALE_LICENSE = Artistic or GPLv1+
+PERL_ENCODE_LOCALE_LICENSE = Artistic or GPL-1.0+
 PERL_ENCODE_LOCALE_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-file-listing/perl-file-listing.mk b/package/perl-file-listing/perl-file-listing.mk
index a9d8ced..e150de7 100644
--- a/package/perl-file-listing/perl-file-listing.mk
+++ b/package/perl-file-listing/perl-file-listing.mk
@@ -8,7 +8,7 @@ PERL_FILE_LISTING_VERSION = 6.04
 PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
 PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_FILE_LISTING_DEPENDENCIES = perl-http-date
-PERL_FILE_LISTING_LICENSE = Artistic or GPLv1+
+PERL_FILE_LISTING_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_LISTING_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-file-util/perl-file-util.mk b/package/perl-file-util/perl-file-util.mk
index 7026515..723cc7a 100644
--- a/package/perl-file-util/perl-file-util.mk
+++ b/package/perl-file-util/perl-file-util.mk
@@ -8,7 +8,7 @@ PERL_FILE_UTIL_VERSION = 4.132140
 PERL_FILE_UTIL_SOURCE = File-Util-$(PERL_FILE_UTIL_VERSION).tar.gz
 PERL_FILE_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOMMY
 PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
-PERL_FILE_UTIL_LICENSE = Artistic or GPLv1+
+PERL_FILE_UTIL_LICENSE = Artistic or GPL-1.0+
 PERL_FILE_UTIL_LICENSE_FILES = COPYING LICENSE
 HOST_PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
 
diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index 2ad966c..89a21cf 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -8,7 +8,7 @@ PERL_GD_VERSION = 2.56
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LD/LDS
 PERL_GD_DEPENDENCIES = zlib libpng freetype gd
-PERL_GD_LICENSE = Artistic or GPLv1+
+PERL_GD_LICENSE = Artistic or GPL-1.0+
 PERL_GD_LICENSE_FILES = LICENSE
 PERL_GD_PREFER_INSTALLER = EUMM
 
diff --git a/package/perl-gdgraph/perl-gdgraph.mk b/package/perl-gdgraph/perl-gdgraph.mk
index dc7ffd9..c431707 100644
--- a/package/perl-gdgraph/perl-gdgraph.mk
+++ b/package/perl-gdgraph/perl-gdgraph.mk
@@ -8,7 +8,7 @@ PERL_GDGRAPH_VERSION = 1.54
 PERL_GDGRAPH_SOURCE = GDGraph-$(PERL_GDGRAPH_VERSION).tar.gz
 PERL_GDGRAPH_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RUZ
 PERL_GDGRAPH_DEPENDENCIES = perl-gd perl-gdtextutil
-PERL_GDGRAPH_LICENSE = Artistic or GPLv1+
+PERL_GDGRAPH_LICENSE = Artistic or GPL-1.0+
 PERL_GDGRAPH_LICENSE_FILES = Dustismo.LICENSE
 
 $(eval $(perl-package))
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
index 14a2826..66016eb 100644
--- a/package/perl-html-parser/perl-html-parser.mk
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -8,7 +8,7 @@ PERL_HTML_PARSER_VERSION = 3.72
 PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
 PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_HTML_PARSER_DEPENDENCIES = perl-html-tagset
-PERL_HTML_PARSER_LICENSE = Artistic or GPLv1+
+PERL_HTML_PARSER_LICENSE = Artistic or GPL-1.0+
 PERL_HTML_PARSER_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-html-tagset/perl-html-tagset.mk b/package/perl-html-tagset/perl-html-tagset.mk
index d18d6a6..ff371fa 100644
--- a/package/perl-html-tagset/perl-html-tagset.mk
+++ b/package/perl-html-tagset/perl-html-tagset.mk
@@ -7,7 +7,7 @@
 PERL_HTML_TAGSET_VERSION = 3.20
 PERL_HTML_TAGSET_SOURCE = HTML-Tagset-$(PERL_HTML_TAGSET_VERSION).tar.gz
 PERL_HTML_TAGSET_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PETDANCE
-PERL_HTML_TAGSET_LICENSE = Artistic or GPLv1+
+PERL_HTML_TAGSET_LICENSE = Artistic or GPL-1.0+
 PERL_HTML_TAGSET_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-http-cookies/perl-http-cookies.mk b/package/perl-http-cookies/perl-http-cookies.mk
index 52ee74a..a4ef552 100644
--- a/package/perl-http-cookies/perl-http-cookies.mk
+++ b/package/perl-http-cookies/perl-http-cookies.mk
@@ -8,7 +8,7 @@ PERL_HTTP_COOKIES_VERSION = 6.01
 PERL_HTTP_COOKIES_SOURCE = HTTP-Cookies-$(PERL_HTTP_COOKIES_VERSION).tar.gz
 PERL_HTTP_COOKIES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_HTTP_COOKIES_DEPENDENCIES = perl-http-date perl-http-message
-PERL_HTTP_COOKIES_LICENSE = Artistic or GPLv1+
+PERL_HTTP_COOKIES_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_COOKIES_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-http-daemon/perl-http-daemon.mk b/package/perl-http-daemon/perl-http-daemon.mk
index 56dbd78..65cdaf8 100644
--- a/package/perl-http-daemon/perl-http-daemon.mk
+++ b/package/perl-http-daemon/perl-http-daemon.mk
@@ -8,7 +8,7 @@ PERL_HTTP_DAEMON_VERSION = 6.01
 PERL_HTTP_DAEMON_SOURCE = HTTP-Daemon-$(PERL_HTTP_DAEMON_VERSION).tar.gz
 PERL_HTTP_DAEMON_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_HTTP_DAEMON_DEPENDENCIES = perl-http-date perl-http-message perl-lwp-mediatypes
-PERL_HTTP_DAEMON_LICENSE = Artistic or GPLv1+
+PERL_HTTP_DAEMON_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_DAEMON_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-http-date/perl-http-date.mk b/package/perl-http-date/perl-http-date.mk
index bb5f4dc..feccf25 100644
--- a/package/perl-http-date/perl-http-date.mk
+++ b/package/perl-http-date/perl-http-date.mk
@@ -7,7 +7,7 @@
 PERL_HTTP_DATE_VERSION = 6.02
 PERL_HTTP_DATE_SOURCE = HTTP-Date-$(PERL_HTTP_DATE_VERSION).tar.gz
 PERL_HTTP_DATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_HTTP_DATE_LICENSE = Artistic or GPLv1+
+PERL_HTTP_DATE_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_DATE_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-http-message/perl-http-message.mk b/package/perl-http-message/perl-http-message.mk
index 77213fa..a66353a 100644
--- a/package/perl-http-message/perl-http-message.mk
+++ b/package/perl-http-message/perl-http-message.mk
@@ -8,7 +8,7 @@ PERL_HTTP_MESSAGE_VERSION = 6.11
 PERL_HTTP_MESSAGE_SOURCE = HTTP-Message-$(PERL_HTTP_MESSAGE_VERSION).tar.gz
 PERL_HTTP_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
 PERL_HTTP_MESSAGE_DEPENDENCIES = perl-encode-locale perl-http-date perl-io-html perl-lwp-mediatypes perl-uri
-PERL_HTTP_MESSAGE_LICENSE = Artistic or GPLv1+
+PERL_HTTP_MESSAGE_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_MESSAGE_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
diff --git a/package/perl-http-negotiate/perl-http-negotiate.mk b/package/perl-http-negotiate/perl-http-negotiate.mk
index 569ed2b..86ca554 100644
--- a/package/perl-http-negotiate/perl-http-negotiate.mk
+++ b/package/perl-http-negotiate/perl-http-negotiate.mk
@@ -8,7 +8,7 @@ PERL_HTTP_NEGOTIATE_VERSION = 6.01
 PERL_HTTP_NEGOTIATE_SOURCE = HTTP-Negotiate-$(PERL_HTTP_NEGOTIATE_VERSION).tar.gz
 PERL_HTTP_NEGOTIATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_HTTP_NEGOTIATE_DEPENDENCIES = perl-http-message
-PERL_HTTP_NEGOTIATE_LICENSE = Artistic or GPLv1+
+PERL_HTTP_NEGOTIATE_LICENSE = Artistic or GPL-1.0+
 PERL_HTTP_NEGOTIATE_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-io-html/perl-io-html.mk b/package/perl-io-html/perl-io-html.mk
index 4bdcc8d..bb79f45 100644
--- a/package/perl-io-html/perl-io-html.mk
+++ b/package/perl-io-html/perl-io-html.mk
@@ -7,7 +7,7 @@
 PERL_IO_HTML_VERSION = 1.001
 PERL_IO_HTML_SOURCE = IO-HTML-$(PERL_IO_HTML_VERSION).tar.gz
 PERL_IO_HTML_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CJ/CJM
-PERL_IO_HTML_LICENSE = Artistic or GPLv1+
+PERL_IO_HTML_LICENSE = Artistic or GPL-1.0+
 PERL_IO_HTML_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index 5bbd0c6..be7db72 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -8,7 +8,7 @@ PERL_IO_SOCKET_SSL_VERSION = 2.022
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_DEPENDENCIES = perl-net-ssleay
-PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPLv1+
+PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
 PERL_IO_SOCKET_SSL_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index 8d4d00e..fe5bd98 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -20,7 +20,7 @@ PERL_LIBWWW_PERL_DEPENDENCIES = \
 	perl-net-http \
 	perl-uri \
 	perl-www-robotrules
-PERL_LIBWWW_PERL_LICENSE = Artistic or GPLv1+
+PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LIBWWW_PERL_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
diff --git a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
index cd7c75a..bcf4e5f 100644
--- a/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
+++ b/package/perl-lwp-mediatypes/perl-lwp-mediatypes.mk
@@ -7,7 +7,7 @@
 PERL_LWP_MEDIATYPES_VERSION = 6.02
 PERL_LWP_MEDIATYPES_SOURCE = LWP-MediaTypes-$(PERL_LWP_MEDIATYPES_VERSION).tar.gz
 PERL_LWP_MEDIATYPES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_LWP_MEDIATYPES_LICENSE = Artistic or GPLv1+
+PERL_LWP_MEDIATYPES_LICENSE = Artistic or GPL-1.0+
 PERL_LWP_MEDIATYPES_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-mailtools/perl-mailtools.mk b/package/perl-mailtools/perl-mailtools.mk
index 1c41831..bddaf9f 100644
--- a/package/perl-mailtools/perl-mailtools.mk
+++ b/package/perl-mailtools/perl-mailtools.mk
@@ -8,7 +8,7 @@ PERL_MAILTOOLS_VERSION = 2.18
 PERL_MAILTOOLS_SOURCE = MailTools-$(PERL_MAILTOOLS_VERSION).tar.gz
 PERL_MAILTOOLS_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKOV
 PERL_MAILTOOLS_DEPENDENCIES = perl-timedate
-PERL_MAILTOOLS_LICENSE = Artistic or GPLv1+
+PERL_MAILTOOLS_LICENSE = Artistic or GPL-1.0+
 PERL_MAILTOOLS_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-mime-base64/perl-mime-base64.mk b/package/perl-mime-base64/perl-mime-base64.mk
index d064337..e7febe1 100644
--- a/package/perl-mime-base64/perl-mime-base64.mk
+++ b/package/perl-mime-base64/perl-mime-base64.mk
@@ -7,7 +7,7 @@
 PERL_MIME_BASE64_VERSION = 3.15
 PERL_MIME_BASE64_SOURCE = MIME-Base64-$(PERL_MIME_BASE64_VERSION).tar.gz
 PERL_MIME_BASE64_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
-PERL_MIME_BASE64_LICENSE = Artistic or GPLv1+
+PERL_MIME_BASE64_LICENSE = Artistic or GPL-1.0+
 PERL_MIME_BASE64_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-module-build/perl-module-build.mk b/package/perl-module-build/perl-module-build.mk
index 3c27002..080e817 100644
--- a/package/perl-module-build/perl-module-build.mk
+++ b/package/perl-module-build/perl-module-build.mk
@@ -7,7 +7,7 @@
 PERL_MODULE_BUILD_VERSION = 0.4220
 PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
 PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
-PERL_MODULE_BUILD_LICENSE = Artistic or GPLv1+
+PERL_MODULE_BUILD_LICENSE = Artistic or GPL-1.0+
 PERL_MODULE_BUILD_LICENSE_FILES = LICENSE
 
 $(eval $(host-perl-package))
diff --git a/package/perl-net-http/perl-net-http.mk b/package/perl-net-http/perl-net-http.mk
index ec74a3f..8dfe278 100644
--- a/package/perl-net-http/perl-net-http.mk
+++ b/package/perl-net-http/perl-net-http.mk
@@ -8,7 +8,7 @@ PERL_NET_HTTP_VERSION = 6.12
 PERL_NET_HTTP_SOURCE = Net-HTTP-$(PERL_NET_HTTP_VERSION).tar.gz
 PERL_NET_HTTP_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_NET_HTTP_DEPENDENCIES = perl-uri
-PERL_NET_HTTP_LICENSE = Artistic or GPLv1+
+PERL_NET_HTTP_LICENSE = Artistic or GPL-1.0+
 PERL_NET_HTTP_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
diff --git a/package/perl-netaddr-ip/perl-netaddr-ip.mk b/package/perl-netaddr-ip/perl-netaddr-ip.mk
index b5ee9a1..a1f02c6 100644
--- a/package/perl-netaddr-ip/perl-netaddr-ip.mk
+++ b/package/perl-netaddr-ip/perl-netaddr-ip.mk
@@ -7,7 +7,7 @@
 PERL_NETADDR_IP_VERSION = 4.079
 PERL_NETADDR_IP_SOURCE = NetAddr-IP-$(PERL_NETADDR_IP_VERSION).tar.gz
 PERL_NETADDR_IP_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKER
-PERL_NETADDR_IP_LICENSE = Artistic or GPLv1+
+PERL_NETADDR_IP_LICENSE = Artistic or GPL-1.0+
 PERL_NETADDR_IP_LICENSE_FILES = Artistic Copying
 
 # we always build the Pure Perl version.
diff --git a/package/perl-time-hires/perl-time-hires.mk b/package/perl-time-hires/perl-time-hires.mk
index 7436d96..e1c32a2 100644
--- a/package/perl-time-hires/perl-time-hires.mk
+++ b/package/perl-time-hires/perl-time-hires.mk
@@ -7,7 +7,7 @@
 PERL_TIME_HIRES_VERSION = 1.9726
 PERL_TIME_HIRES_SOURCE = Time-HiRes-$(PERL_TIME_HIRES_VERSION).tar.gz
 PERL_TIME_HIRES_SITE = $(BR2_CPAN_MIRROR)/authors/id/Z/ZE/ZEFRAM
-PERL_TIME_HIRES_LICENSE = Artistic or GPLv1+
+PERL_TIME_HIRES_LICENSE = Artistic or GPL-1.0+
 PERL_TIME_HIRES_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-timedate/perl-timedate.mk b/package/perl-timedate/perl-timedate.mk
index 4c594fb..cdc2c07 100644
--- a/package/perl-timedate/perl-timedate.mk
+++ b/package/perl-timedate/perl-timedate.mk
@@ -7,7 +7,7 @@
 PERL_TIMEDATE_VERSION = 2.30
 PERL_TIMEDATE_SOURCE = TimeDate-$(PERL_TIMEDATE_VERSION).tar.gz
 PERL_TIMEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GB/GBARR
-PERL_TIMEDATE_LICENSE = Artistic or GPLv1+
+PERL_TIMEDATE_LICENSE = Artistic or GPL-1.0+
 PERL_TIMEDATE_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
index e7118fc..effeb16 100644
--- a/package/perl-uri/perl-uri.mk
+++ b/package/perl-uri/perl-uri.mk
@@ -7,7 +7,7 @@
 PERL_URI_VERSION = 1.71
 PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
 PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
-PERL_URI_LICENSE = Artistic or GPLv1+
+PERL_URI_LICENSE = Artistic or GPL-1.0+
 PERL_URI_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
diff --git a/package/perl-www-robotrules/perl-www-robotrules.mk b/package/perl-www-robotrules/perl-www-robotrules.mk
index 0c68b98..5e8bab9 100644
--- a/package/perl-www-robotrules/perl-www-robotrules.mk
+++ b/package/perl-www-robotrules/perl-www-robotrules.mk
@@ -8,7 +8,7 @@ PERL_WWW_ROBOTRULES_VERSION = 6.02
 PERL_WWW_ROBOTRULES_SOURCE = WWW-RobotRules-$(PERL_WWW_ROBOTRULES_VERSION).tar.gz
 PERL_WWW_ROBOTRULES_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
 PERL_WWW_ROBOTRULES_DEPENDENCIES = perl-uri
-PERL_WWW_ROBOTRULES_LICENSE = Artistic or GPLv1+
+PERL_WWW_ROBOTRULES_LICENSE = Artistic or GPL-1.0+
 PERL_WWW_ROBOTRULES_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-xml-libxml/perl-xml-libxml.mk b/package/perl-xml-libxml/perl-xml-libxml.mk
index 8d8f590..69cf57c 100644
--- a/package/perl-xml-libxml/perl-xml-libxml.mk
+++ b/package/perl-xml-libxml/perl-xml-libxml.mk
@@ -8,7 +8,7 @@ PERL_XML_LIBXML_VERSION = 2.0128
 PERL_XML_LIBXML_SOURCE = XML-LibXML-$(PERL_XML_LIBXML_VERSION).tar.gz
 PERL_XML_LIBXML_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHLOMIF
 PERL_XML_LIBXML_DEPENDENCIES = zlib libxml2 perl-xml-namespacesupport perl-xml-sax perl-xml-sax-base
-PERL_XML_LIBXML_LICENSE = Artistic or GPLv1+
+PERL_XML_LIBXML_LICENSE = Artistic or GPL-1.0+
 PERL_XML_LIBXML_LICENSE_FILES = LICENSE
 
 PERL_XML_LIBXML_CONF_OPTS = \
diff --git a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
index 31b71c1..d7bcdd4 100644
--- a/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
+++ b/package/perl-xml-namespacesupport/perl-xml-namespacesupport.mk
@@ -7,7 +7,7 @@
 PERL_XML_NAMESPACESUPPORT_VERSION = 1.11
 PERL_XML_NAMESPACESUPPORT_SOURCE = XML-NamespaceSupport-$(PERL_XML_NAMESPACESUPPORT_VERSION).tar.gz
 PERL_XML_NAMESPACESUPPORT_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PERIGRIN
-PERL_XML_NAMESPACESUPPORT_LICENSE = Artistic or GPLv1+
+PERL_XML_NAMESPACESUPPORT_LICENSE = Artistic or GPL-1.0+
 PERL_XML_NAMESPACESUPPORT_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-xml-sax-base/perl-xml-sax-base.mk b/package/perl-xml-sax-base/perl-xml-sax-base.mk
index 60dec31..bb197ae 100644
--- a/package/perl-xml-sax-base/perl-xml-sax-base.mk
+++ b/package/perl-xml-sax-base/perl-xml-sax-base.mk
@@ -7,7 +7,7 @@
 PERL_XML_SAX_BASE_VERSION = 1.08
 PERL_XML_SAX_BASE_SOURCE = XML-SAX-Base-$(PERL_XML_SAX_BASE_VERSION).tar.gz
 PERL_XML_SAX_BASE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
-PERL_XML_SAX_BASE_LICENSE = Artistic or GPLv1+
+PERL_XML_SAX_BASE_LICENSE = Artistic or GPL-1.0+
 PERL_XML_SAX_BASE_LICENSE_FILES = README
 
 $(eval $(perl-package))
diff --git a/package/perl-xml-sax/perl-xml-sax.mk b/package/perl-xml-sax/perl-xml-sax.mk
index f6d0372..90b2cd6 100644
--- a/package/perl-xml-sax/perl-xml-sax.mk
+++ b/package/perl-xml-sax/perl-xml-sax.mk
@@ -8,7 +8,7 @@ PERL_XML_SAX_VERSION = 0.99
 PERL_XML_SAX_SOURCE = XML-SAX-$(PERL_XML_SAX_VERSION).tar.gz
 PERL_XML_SAX_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GR/GRANTM
 PERL_XML_SAX_DEPENDENCIES = perl-xml-namespacesupport perl-xml-sax-base
-PERL_XML_SAX_LICENSE = Artistic or GPLv1+
+PERL_XML_SAX_LICENSE = Artistic or GPL-1.0+
 PERL_XML_SAX_LICENSE_FILES = LICENSE
 
 $(eval $(perl-package))
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index b407e05..130441f 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -9,7 +9,7 @@ PERL_VERSION_MAJOR = 24
 PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
-PERL_LICENSE = Artistic or GPLv1+
+PERL_LICENSE = Artistic or GPL-1.0+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
