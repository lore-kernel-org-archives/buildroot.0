From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 23 Jun 2014 20:14:45 +0200
Subject: [Buildroot] [PATCH 2/3] perl-net-ssleay: new package
In-Reply-To: <1403547286-8858-1-git-send-email-francois.perrad@gadz.org>
References: <1403547286-8858-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1403547286-8858-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                          |  1 +
 package/perl-net-ssleay/Config.in          |  7 +++++++
 package/perl-net-ssleay/perl-net-ssleay.mk | 14 ++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/perl-net-ssleay/Config.in
 create mode 100644 package/perl-net-ssleay/perl-net-ssleay.mk

diff --git a/package/Config.in b/package/Config.in
index 498630f..fb04014 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -424,6 +424,7 @@ endif
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-mojolicious/Config.in"
+	source "package/perl-net-ssleay/Config.in"
 endmenu
 endif
 	source "package/php/Config.in"
diff --git a/package/perl-net-ssleay/Config.in b/package/perl-net-ssleay/Config.in
new file mode 100644
index 0000000..bc219b0
--- /dev/null
+++ b/package/perl-net-ssleay/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_NET_SSLEAY
+	bool "perl-net-ssleay"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Perl extension for using OpenSSL
+
+	  https://metacpan.org/release/Net-SSLeay
diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
new file mode 100644
index 0000000..413fdf0
--- /dev/null
+++ b/package/perl-net-ssleay/perl-net-ssleay.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-net-ssleay
+#
+################################################################################
+
+PERL_NET_SSLEAY_VERSION = 1.64
+PERL_NET_SSLEAY_SOURCE = Net-SSLeay-$(PERL_NET_SSLEAY_VERSION).tar.gz
+PERL_NET_SSLEAY_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIKEM/
+PERL_NET_SSLEAY_DEPENDENCIES = perl openssl
+PERL_NET_SSLEAY_LICENSE = OpenSSL
+PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
1.9.1
