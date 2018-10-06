From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2018 18:55:19 +0200
Subject: [Buildroot] [PATCH 15/20] perl-cookie-baker: new package
In-Reply-To: <20181006165524.23778-1-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
Message-ID: <20181006165524.23778-16-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                |  1 +
 package/perl-cookie-baker/Config.in              |  7 +++++++
 package/perl-cookie-baker/perl-cookie-baker.hash |  6 ++++++
 package/perl-cookie-baker/perl-cookie-baker.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/perl-cookie-baker/Config.in
 create mode 100644 package/perl-cookie-baker/perl-cookie-baker.hash
 create mode 100644 package/perl-cookie-baker/perl-cookie-baker.mk

diff --git a/package/Config.in b/package/Config.in
index f603a7d17..9bef92ee4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -673,6 +673,7 @@ menu "Perl libraries/modules"
 	source "package/perl-class-std/Config.in"
 	source "package/perl-class-std-fast/Config.in"
 	source "package/perl-convert-asn1/Config.in"
+	source "package/perl-cookie-baker/Config.in"
 	source "package/perl-crypt-blowfish/Config.in"
 	source "package/perl-crypt-cbc/Config.in"
 	source "package/perl-crypt-openssl-random/Config.in"
diff --git a/package/perl-cookie-baker/Config.in b/package/perl-cookie-baker/Config.in
new file mode 100644
index 000000000..e6846a21e
--- /dev/null
+++ b/package/perl-cookie-baker/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_COOKIE_BAKER
+	bool "perl-cookie-baker"
+	select BR2_PACKAGE_PERL_URI
+	help
+	  Cookie string generator / parser
+
+	  https://github.com/kazeburo/Cookie-Baker
diff --git a/package/perl-cookie-baker/perl-cookie-baker.hash b/package/perl-cookie-baker/perl-cookie-baker.hash
new file mode 100644
index 000000000..8d0d63b17
--- /dev/null
+++ b/package/perl-cookie-baker/perl-cookie-baker.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    20f6f16689df949db86645652c1ebe38 Cookie-Baker-0.10.tar.gz
+sha256 b42bad15b12da4cdc5c90c902faf3ad484281a42203fa4e7652866434f6fa4dd Cookie-Baker-0.10.tar.gz
+
+# computed by scancpan
+sha256 b4ce94671fa219074d4e91e2268652d6bf9764cebcc7a5e27bfc14897745ca4c LICENSE
diff --git a/package/perl-cookie-baker/perl-cookie-baker.mk b/package/perl-cookie-baker/perl-cookie-baker.mk
new file mode 100644
index 000000000..31410ee74
--- /dev/null
+++ b/package/perl-cookie-baker/perl-cookie-baker.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-cookie-baker
+#
+################################################################################
+
+PERL_COOKIE_BAKER_VERSION = 0.10
+PERL_COOKIE_BAKER_SOURCE = Cookie-Baker-$(PERL_COOKIE_BAKER_VERSION).tar.gz
+PERL_COOKIE_BAKER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
+PERL_COOKIE_BAKER_DEPENDENCIES = host-perl-module-build-tiny perl-uri
+PERL_COOKIE_BAKER_LICENSE = Artistic or GPL-1.0+
+PERL_COOKIE_BAKER_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.17.1
