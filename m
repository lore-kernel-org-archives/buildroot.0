From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 20:51:16 +0200
Subject: [Buildroot] [git commit] perl-io-socket-ssl: new package
Message-ID: <20140717185514.05C379D26B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a97d7e8f1ae6e05df15aa0baa9f5fe70c23ca0d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |    1 +
 package/perl-io-socket-ssl/Config.in             |   11 +++++++++++
 package/perl-io-socket-ssl/perl-io-socket-ssl.mk |   13 +++++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4b7ccd9..b52d347 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -429,6 +429,7 @@ endif
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
+	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-ssleay/Config.in"
 	source "package/perl-xml-libxml/Config.in"
diff --git a/package/perl-io-socket-ssl/Config.in b/package/perl-io-socket-ssl/Config.in
new file mode 100644
index 0000000..c8d038a
--- /dev/null
+++ b/package/perl-io-socket-ssl/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_IO_SOCKET_SSL
+	bool "perl-io-socket-ssl"
+	depends on !BR2_PREFER_STATIC_LIB
+	select BR2_PACKAGE_PERL_NET_SSLEAY
+	help
+	  Nearly transparent SSL encapsulation for IO::Socket::INET.
+
+	  https://github.com/noxxi/p5-io-socket-ssl
+
+comment "perl-io-socket-ssl needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
diff --git a/package/perl-io-socket-ssl/perl-io-socket-ssl.mk b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
new file mode 100644
index 0000000..103a160
--- /dev/null
+++ b/package/perl-io-socket-ssl/perl-io-socket-ssl.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-io-socket-ssl
+#
+################################################################################
+
+PERL_IO_SOCKET_SSL_VERSION = 1.997
+PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
+PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR/
+PERL_IO_SOCKET_SSL_DEPENDENCIES = perl perl-net-ssleay
+PERL_IO_SOCKET_SSL_LICENSE = Artistic or GPLv1+
+
+$(eval $(perl-package))
