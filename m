From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Apr 2021 22:46:43 +0200
Subject: [Buildroot] [git commit] package/perl-io-socket-ssl: bump to
 version 2.070
Message-ID: <20210424202051.E467D80257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9962e3020c1c46e8b5a70b9ac2eaf8722b8ab062
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-io-socket-ssl/Config.in                     | 1 +
 package/perl-io-socket-ssl/perl-io-socket-ssl.hash       | 4 ++--
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk         | 2 +-
 support/testing/tests/package/test_perl_io_socket_ssl.py | 1 +
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/perl-io-socket-ssl/Config.in b/package/perl-io-socket-ssl/Config.in
index a7b94a3925..2797a11557 100644
--- a/package/perl-io-socket-ssl/Config.in
+++ b/package/perl-io-socket-ssl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PERL_IO_SOCKET_SSL
 	bool "perl-io-socket-ssl"
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_MOZILLA_CA # runtime
 	select BR2_PACKAGE_PERL_NET_SSLEAY # runtime
 	help
 	  Nearly transparent SSL encapsulation for IO::Socket::INET.
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
index 2180b6be35..076e145acd 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  4230c829c8875889848093b2b46a7284  IO-Socket-SSL-2.068.tar.gz
-sha256  4420fc0056f1827b4dd1245eacca0da56e2182b4ef6fc078f107dc43c3fb8ff9  IO-Socket-SSL-2.068.tar.gz
+md5  3c8df96b5249c02025e2eb48596c213b  IO-Socket-SSL-2.070.tar.gz
+sha256  876fe09763e7a474519431aff248cb1f1abaf070d6bdc791f60bf9abe781cd3b  IO-Socket-SSL-2.070.tar.gz
 
 # computed by scancpan
 sha256  090aff5421fd55a9dceeaf6c612c36360402e8d29c1284aef88c87be565ce032  README
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
index b6c0ceb37f..1751bef0e4 100644
--- a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_IO_SOCKET_SSL_VERSION = 2.068
+PERL_IO_SOCKET_SSL_VERSION = 2.070
 PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
 PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR
 PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPL-1.0+
diff --git a/support/testing/tests/package/test_perl_io_socket_ssl.py b/support/testing/tests/package/test_perl_io_socket_ssl.py
index 51663e837c..80835fdcc1 100644
--- a/support/testing/tests/package/test_perl_io_socket_ssl.py
+++ b/support/testing/tests/package/test_perl_io_socket_ssl.py
@@ -6,6 +6,7 @@ class TestPerlIOSocketSSL(TestPerlBase):
     package:
         IO-Socket-SSL
     direct dependencies:
+        Mozilla-CA
         Net-SSLeay   XS
     """
 
