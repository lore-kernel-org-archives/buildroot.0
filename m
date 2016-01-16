From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:08 +0100
Subject: [Buildroot] [PATCH 16/80 v1] package/perl: use 'menuconfig' instead
	of 'config'+'menu'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <f3584f55129fe51f459d0148c62bdfce2f7fc9c9.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the perl library/modules inclusion to the perl's Config.in.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in      | 47 -----------------------------------------------
 package/perl/Config.in | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 47 insertions(+), 48 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b62f570..6fd68a8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -543,53 +543,6 @@ endif
 	source "package/mono/Config.in"
 	source "package/nodejs/Config.in"
 	source "package/perl/Config.in"
-if BR2_PACKAGE_PERL
-menu "Perl libraries/modules"
-	source "package/perl-crypt-openssl-random/Config.in"
-	source "package/perl-crypt-openssl-rsa/Config.in"
-	source "package/perl-datetime-tiny/Config.in"
-	source "package/perl-db-file/Config.in"
-	source "package/perl-digest-hmac/Config.in"
-	source "package/perl-digest-sha1/Config.in"
-	source "package/perl-encode-detect/Config.in"
-	source "package/perl-encode-locale/Config.in"
-	source "package/perl-file-listing/Config.in"
-	source "package/perl-file-util/Config.in"
-	source "package/perl-gd/Config.in"
-	source "package/perl-gdgraph/Config.in"
-	source "package/perl-gdtextutil/Config.in"
-	source "package/perl-html-parser/Config.in"
-	source "package/perl-html-tagset/Config.in"
-	source "package/perl-http-cookies/Config.in"
-	source "package/perl-http-daemon/Config.in"
-	source "package/perl-http-date/Config.in"
-	source "package/perl-http-message/Config.in"
-	source "package/perl-http-negotiate/Config.in"
-	source "package/perl-io-html/Config.in"
-	source "package/perl-io-socket-ssl/Config.in"
-	source "package/perl-json-tiny/Config.in"
-	source "package/perl-libwww-perl/Config.in"
-	source "package/perl-lwp-mediatypes/Config.in"
-	source "package/perl-mail-dkim/Config.in"
-	source "package/perl-mailtools/Config.in"
-	source "package/perl-mime-base64/Config.in"
-	source "package/perl-mojolicious/Config.in"
-	source "package/perl-net-dns/Config.in"
-	source "package/perl-net-http/Config.in"
-	source "package/perl-net-ssleay/Config.in"
-	source "package/perl-netaddr-ip/Config.in"
-	source "package/perl-path-tiny/Config.in"
-	source "package/perl-time-hires/Config.in"
-	source "package/perl-timedate/Config.in"
-	source "package/perl-try-tiny/Config.in"
-	source "package/perl-uri/Config.in"
-	source "package/perl-www-robotrules/Config.in"
-	source "package/perl-xml-libxml/Config.in"
-	source "package/perl-xml-namespacesupport/Config.in"
-	source "package/perl-xml-sax/Config.in"
-	source "package/perl-xml-sax-base/Config.in"
-endmenu
-endif
 	source "package/php/Config.in"
 if BR2_PACKAGE_PHP
 if !BR2_STATIC_LIBS
diff --git a/package/perl/Config.in b/package/perl/Config.in
index cdd5aab..635a6f8 100644
--- a/package/perl/Config.in
+++ b/package/perl/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_PERL
+menuconfig BR2_PACKAGE_PERL
 	bool "perl"
 	depends on BR2_USE_MMU # fork()
 	help
@@ -24,4 +24,50 @@ config BR2_PACKAGE_PERL_MODULES
 	  Leave empty for all modules (as far as the external libraries
 	  are available).
 
+comment "Perl libraries/modules"
+
+source "package/perl-crypt-openssl-random/Config.in"
+source "package/perl-crypt-openssl-rsa/Config.in"
+source "package/perl-datetime-tiny/Config.in"
+source "package/perl-db-file/Config.in"
+source "package/perl-digest-hmac/Config.in"
+source "package/perl-digest-sha1/Config.in"
+source "package/perl-encode-detect/Config.in"
+source "package/perl-encode-locale/Config.in"
+source "package/perl-file-listing/Config.in"
+source "package/perl-file-util/Config.in"
+source "package/perl-gd/Config.in"
+source "package/perl-gdgraph/Config.in"
+source "package/perl-gdtextutil/Config.in"
+source "package/perl-html-parser/Config.in"
+source "package/perl-html-tagset/Config.in"
+source "package/perl-http-cookies/Config.in"
+source "package/perl-http-daemon/Config.in"
+source "package/perl-http-date/Config.in"
+source "package/perl-http-message/Config.in"
+source "package/perl-http-negotiate/Config.in"
+source "package/perl-io-html/Config.in"
+source "package/perl-io-socket-ssl/Config.in"
+source "package/perl-json-tiny/Config.in"
+source "package/perl-libwww-perl/Config.in"
+source "package/perl-lwp-mediatypes/Config.in"
+source "package/perl-mail-dkim/Config.in"
+source "package/perl-mailtools/Config.in"
+source "package/perl-mime-base64/Config.in"
+source "package/perl-mojolicious/Config.in"
+source "package/perl-net-dns/Config.in"
+source "package/perl-net-http/Config.in"
+source "package/perl-net-ssleay/Config.in"
+source "package/perl-netaddr-ip/Config.in"
+source "package/perl-path-tiny/Config.in"
+source "package/perl-time-hires/Config.in"
+source "package/perl-timedate/Config.in"
+source "package/perl-try-tiny/Config.in"
+source "package/perl-uri/Config.in"
+source "package/perl-www-robotrules/Config.in"
+source "package/perl-xml-libxml/Config.in"
+source "package/perl-xml-namespacesupport/Config.in"
+source "package/perl-xml-sax/Config.in"
+source "package/perl-xml-sax-base/Config.in"
+
 endif
-- 
1.9.1
