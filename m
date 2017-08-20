From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 20 Aug 2017 10:03:18 +0200
Subject: [Buildroot] [PATCH 05/18] perl-libwww-perl: bump to version 6.26
In-Reply-To: <20170820080331.12935-1-francois.perrad@gadz.org>
References: <20170820080331.12935-1-francois.perrad@gadz.org>
Message-ID: <20170820080331.12935-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-libwww-perl/Config.in             | 3 ++-
 package/perl-libwww-perl/perl-libwww-perl.hash | 4 ++--
 package/perl-libwww-perl/perl-libwww-perl.mk   | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/perl-libwww-perl/Config.in b/package/perl-libwww-perl/Config.in
index fc46bf1df..09fc00543 100644
--- a/package/perl-libwww-perl/Config.in
+++ b/package/perl-libwww-perl/Config.in
@@ -11,12 +11,13 @@ config BR2_PACKAGE_PERL_LIBWWW_PERL
 	select BR2_PACKAGE_PERL_HTTP_NEGOTIATE
 	select BR2_PACKAGE_PERL_LWP_MEDIATYPES
 	select BR2_PACKAGE_PERL_NET_HTTP
+	select BR2_PACKAGE_PERL_TRY_TINY
 	select BR2_PACKAGE_PERL_URI
 	select BR2_PACKAGE_PERL_WWW_ROBOTRULES
 	help
 	  The World-Wide Web library for Perl
 
-	  https://metacpan.org/release/libwww-perl
+	  https://github.com/libwww-perl/libwww-perl
 
 comment "perl-libwww-perl needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index d3b332864..24e077d38 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,3 +1,3 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5    0880fade10edcf5f60087e42f1db4481 libwww-perl-6.16.tar.gz
-sha256 daffd268000f92d241f8ae5508ae5616dbd02f15a587b4fbcd14998ccc15ce22 libwww-perl-6.16.tar.gz
+md5    457bf4a4f40af3e2f43653329a9c6ab7 libwww-perl-6.26.tar.gz
+sha256 d0c5435275f8638ff36fff8f655ad2ccad1156e66cc47bfacfb9e44fc585b24f libwww-perl-6.26.tar.gz
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index fe5bd984e..fd4857cf5 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.16
+PERL_LIBWWW_PERL_VERSION = 6.26
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_DEPENDENCIES = \
@@ -18,6 +18,7 @@ PERL_LIBWWW_PERL_DEPENDENCIES = \
 	perl-http-negotiate \
 	perl-lwp-mediatypes \
 	perl-net-http \
+	perl-try-tiny \
 	perl-uri \
 	perl-www-robotrules
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
-- 
2.11.0
