From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 20 Nov 2013 18:01:58 +0100
Subject: [Buildroot] [pkg-perl infra 10/12] libnet-ssleay-perl: new package
In-Reply-To: <1384966920-9454-1-git-send-email-francois.perrad@gadz.org>
References: <1384966920-9454-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1384966920-9454-11-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(depends on openssl)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/cpan/Config.in                             |    1 +
 package/cpan/libnet-ssleay-perl/Config.in          |    6 ++++++
 .../cpan/libnet-ssleay-perl/libnet-ssleay-perl.mk  |   16 ++++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/cpan/libnet-ssleay-perl/Config.in
 create mode 100644 package/cpan/libnet-ssleay-perl/libnet-ssleay-perl.mk

diff --git a/package/cpan/Config.in b/package/cpan/Config.in
index a4cd89d..8ace4e3 100644
--- a/package/cpan/Config.in
+++ b/package/cpan/Config.in
@@ -1,3 +1,4 @@
 source "package/cpan/libcurses-perl/Config.in"
 source "package/cpan/libmodule-build-perl/Config.in"
+source "package/cpan/libnet-ssleay-perl/Config.in"
 source "package/cpan/libxml-parser-perl/Config.in"
diff --git a/package/cpan/libnet-ssleay-perl/Config.in b/package/cpan/libnet-ssleay-perl/Config.in
new file mode 100644
index 0000000..19d21cf
--- /dev/null
+++ b/package/cpan/libnet-ssleay-perl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBNET_SSLEAY_PERL
+	bool "libnet-ssleay-perl"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Perl extension for using OpenSSL
+
diff --git a/package/cpan/libnet-ssleay-perl/libnet-ssleay-perl.mk b/package/cpan/libnet-ssleay-perl/libnet-ssleay-perl.mk
new file mode 100644
index 0000000..e067511
--- /dev/null
+++ b/package/cpan/libnet-ssleay-perl/libnet-ssleay-perl.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libnet-ssleay-perl
+#
+################################################################################
+
+LIBNET_SSLEAY_PERL_VERSION = 1.53
+LIBNET_SSLEAY_PERL_AUTHOR = MIKEM
+LIBNET_SSLEAY_PERL_SOURCE = Net-SSLeay-$(LIBNET_SSLEAY_PERL_VERSION).tar.gz
+LIBNET_SSLEAY_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM/
+LIBNET_SSLEAY_PERL_DEPENDENCIES = perl openssl
+HOST_LIBNET_SSLEAY_PERL_DEPENDENCIES = host-openssl
+LIBNET_SSLEAY_PERL_LICENSE = ssleay
+
+$(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
1.7.9.5
