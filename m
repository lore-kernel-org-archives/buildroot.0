From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  3 Apr 2021 09:50:45 +0200
Subject: [Buildroot] [PATCH 4/6] package/perl-mail-dkim: bump version to
 1.20200907
In-Reply-To: <20210403075047.598935-1-bernd.kuhls@t-online.de>
References: <20210403075047.598935-1-bernd.kuhls@t-online.de>
Message-ID: <20210403075047.598935-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

scancpan added runtime dependency to perl-mail-authenticationresults
and updated test_perl_mail_dkim.py.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/perl-mail-dkim/Config.in                     | 1 +
 package/perl-mail-dkim/perl-mail-dkim.hash           | 4 ++--
 package/perl-mail-dkim/perl-mail-dkim.mk             | 2 +-
 support/testing/tests/package/test_perl_mail_dkim.py | 7 +++----
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/perl-mail-dkim/Config.in b/package/perl-mail-dkim/Config.in
index 057796b501..350a9ea467 100644
--- a/package/perl-mail-dkim/Config.in
+++ b/package/perl-mail-dkim/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PERL_MAIL_DKIM
 	bool "perl-mail-dkim"
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA # runtime
+	select BR2_PACKAGE_PERL_MAIL_AUTHENTICATIONRESULTS # runtime
 	select BR2_PACKAGE_PERL_MAILTOOLS # runtime
 	select BR2_PACKAGE_PERL_NET_DNS # runtime
 	help
diff --git a/package/perl-mail-dkim/perl-mail-dkim.hash b/package/perl-mail-dkim/perl-mail-dkim.hash
index e94adfc6ed..d74764dc48 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.hash
+++ b/package/perl-mail-dkim/perl-mail-dkim.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  9de35f8aa77a85dc17423cbcce2bf46d  Mail-DKIM-1.20200824.tar.gz
-sha256  871d329830acb4840423aa59036622fb2ee394efc1d09316dcc32ae94454e916  Mail-DKIM-1.20200824.tar.gz
+md5  63ba8a807256ce13f7890c5acb206b3c  Mail-DKIM-1.20200907.tar.gz
+sha256  abff11bd0977b9b8c3b2c3fc2a0dbdd2d38da249568698710fec1002d4251bf5  Mail-DKIM-1.20200907.tar.gz
 
 # computed by scancpan
 sha256  ffaa40feb768566e52d93879fedd2c5483828b6de483874f30a0a4425351555f  LICENSE
diff --git a/package/perl-mail-dkim/perl-mail-dkim.mk b/package/perl-mail-dkim/perl-mail-dkim.mk
index e67bf5ee18..73d432124e 100644
--- a/package/perl-mail-dkim/perl-mail-dkim.mk
+++ b/package/perl-mail-dkim/perl-mail-dkim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MAIL_DKIM_VERSION = 1.20200824
+PERL_MAIL_DKIM_VERSION = 1.20200907
 PERL_MAIL_DKIM_SOURCE = Mail-DKIM-$(PERL_MAIL_DKIM_VERSION).tar.gz
 PERL_MAIL_DKIM_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MB/MBRADSHAW
 PERL_MAIL_DKIM_LICENSE = Artistic or GPL-1.0+
diff --git a/support/testing/tests/package/test_perl_mail_dkim.py b/support/testing/tests/package/test_perl_mail_dkim.py
index cd9e75795b..88f3d7cde9 100644
--- a/support/testing/tests/package/test_perl_mail_dkim.py
+++ b/support/testing/tests/package/test_perl_mail_dkim.py
@@ -7,13 +7,13 @@ class TestPerlMailDKIM(TestPerlBase):
         Mail-DKIM
     direct dependencies:
         Crypt-OpenSSL-RSA   XS
+        Mail-AuthenticationResults
         MailTools
         Net-DNS
-        Net-DNS-Resolver-Mock
-        YAML-LibYAML   XS
     indirect dependencies:
-        Crypt-OpenSSL-Random   XS
+        Crypt::OpenSSL::Random
         Digest-HMAC
+        JSON
         TimeDate
     """
 
@@ -25,6 +25,5 @@ class TestPerlMailDKIM(TestPerlBase):
 
     def test_run(self):
         self.login()
-        self.module_test("Crypt::OpenSSL::Random")
         self.module_test("Crypt::OpenSSL::RSA")
         self.module_test("Mail::DKIM")
-- 
2.29.2
