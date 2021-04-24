From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 24 Apr 2021 21:20:23 +0200
Subject: [Buildroot] [PATCH 3/9] package/perl-libwww-perl: bump to version
 6.53
In-Reply-To: <20210424192029.595977-1-francois.perrad@gadz.org>
References: <20210424192029.595977-1-francois.perrad@gadz.org>
Message-ID: <20210424192029.595977-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-libwww-perl/Config.in                     | 1 -
 package/perl-libwww-perl/perl-libwww-perl.hash         | 4 ++--
 package/perl-libwww-perl/perl-libwww-perl.mk           | 2 +-
 support/testing/tests/package/test_perl_libwww_perl.py | 2 --
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/perl-libwww-perl/Config.in b/package/perl-libwww-perl/Config.in
index 6e191dd52..3967d3570 100644
--- a/package/perl-libwww-perl/Config.in
+++ b/package/perl-libwww-perl/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PERL_LIBWWW_PERL
 	select BR2_PACKAGE_PERL_FILE_LISTING # runtime
 	select BR2_PACKAGE_PERL_HTML_PARSER # runtime
 	select BR2_PACKAGE_PERL_HTTP_COOKIES # runtime
-	select BR2_PACKAGE_PERL_HTTP_DAEMON # runtime
 	select BR2_PACKAGE_PERL_HTTP_DATE # runtime
 	select BR2_PACKAGE_PERL_HTTP_MESSAGE # runtime
 	select BR2_PACKAGE_PERL_HTTP_NEGOTIATE # runtime
diff --git a/package/perl-libwww-perl/perl-libwww-perl.hash b/package/perl-libwww-perl/perl-libwww-perl.hash
index 453463798..8081e127f 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.hash
+++ b/package/perl-libwww-perl/perl-libwww-perl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  7b5959aff7b11509bd87fa1de753f127  libwww-perl-6.52.tar.gz
-sha256  b63f67647b7cfb0bace19ada32e4feb2c2e8e0f4204546c62ce6247fa59d778d  libwww-perl-6.52.tar.gz
+md5  33fdb6415018b8bf94242cace1b06479  libwww-perl-6.53.tar.gz
+sha256  9cbb7c688416a20c1aba9a32568504af1143ced58b572c502a1b2fb8a500f535  libwww-perl-6.53.tar.gz
 
 # computed by scancpan
 sha256  e84ac5ab84ace59952d2640e0ca4522eb0aaa8c2aa696352d1252aa109ea20bc  LICENSE
diff --git a/package/perl-libwww-perl/perl-libwww-perl.mk b/package/perl-libwww-perl/perl-libwww-perl.mk
index d121dea91..d96035e42 100644
--- a/package/perl-libwww-perl/perl-libwww-perl.mk
+++ b/package/perl-libwww-perl/perl-libwww-perl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_LIBWWW_PERL_VERSION = 6.52
+PERL_LIBWWW_PERL_VERSION = 6.53
 PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
 PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/O/OA/OALDERS
 PERL_LIBWWW_PERL_LICENSE = Artistic or GPL-1.0+
diff --git a/support/testing/tests/package/test_perl_libwww_perl.py b/support/testing/tests/package/test_perl_libwww_perl.py
index 7b30e4b94..4dcfa06f1 100644
--- a/support/testing/tests/package/test_perl_libwww_perl.py
+++ b/support/testing/tests/package/test_perl_libwww_perl.py
@@ -10,7 +10,6 @@ class TestPerllibwwwperl(TestPerlBase):
         File-Listing
         HTML-Parser   XS
         HTTP-Cookies
-        HTTP-Daemon
         HTTP-Date
         HTTP-Message
         HTTP-Negotiate
@@ -38,5 +37,4 @@ class TestPerllibwwwperl(TestPerlBase):
         self.module_test("LWP::Authen::Digest")
         self.module_test("HTML::Parser")
         self.module_test("HTTP::Message")
-        self.module_test("HTTP::Daemon")
         self.module_test("WWW::RobotRules")
-- 
2.27.0
