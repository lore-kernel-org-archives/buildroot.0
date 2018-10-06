From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2018 18:55:13 +0200
Subject: [Buildroot] [PATCH 09/20] perl-www-form-encoded: new package
In-Reply-To: <20181006165524.23778-1-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
Message-ID: <20181006165524.23778-10-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                  |  1 +
 package/perl-www-form-urlencoded/Config.in         |  6 ++++++
 .../perl-www-form-urlencoded.hash                  |  6 ++++++
 .../perl-www-form-urlencoded.mk                    | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/perl-www-form-urlencoded/Config.in
 create mode 100644 package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash
 create mode 100644 package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk

diff --git a/package/Config.in b/package/Config.in
index 03e1fb072..78570edb8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -748,6 +748,7 @@ menu "Perl libraries/modules"
 	source "package/perl-timedate/Config.in"
 	source "package/perl-try-tiny/Config.in"
 	source "package/perl-uri/Config.in"
+	source "package/perl-www-form-urlencoded/Config.in"
 	source "package/perl-www-robotrules/Config.in"
 	source "package/perl-x10/Config.in"
 	source "package/perl-xml-libxml/Config.in"
diff --git a/package/perl-www-form-urlencoded/Config.in b/package/perl-www-form-urlencoded/Config.in
new file mode 100644
index 000000000..f8e999e04
--- /dev/null
+++ b/package/perl-www-form-urlencoded/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_WWW_FORM_URLENCODED
+	bool "perl-www-form-urlencoded"
+	help
+	  parser and builder for application/x-www-form-urlencoded
+
+	  https://github.com/kazeburo/WWW-Form-UrlEncoded
diff --git a/package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash
new file mode 100644
index 000000000..2ad969a12
--- /dev/null
+++ b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    c7f8fbd616f9a342b5ff726b405d2a96 WWW-Form-UrlEncoded-0.25.tar.gz
+sha256 e1f7a6d22fe558242d1df584229d99058f63ef2658e43b8a90642e3875c6074e WWW-Form-UrlEncoded-0.25.tar.gz
+
+# computed by scancpan
+sha256 79c2a066104e71602785fd815c5aea6f7db78c19451d68521380083f9c2a8805 LICENSE
diff --git a/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk
new file mode 100644
index 000000000..8b922638e
--- /dev/null
+++ b/package/perl-www-form-urlencoded/perl-www-form-urlencoded.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-www-form-urlencoded
+#
+################################################################################
+
+PERL_WWW_FORM_URLENCODED_VERSION = 0.25
+PERL_WWW_FORM_URLENCODED_SOURCE = WWW-Form-UrlEncoded-$(PERL_WWW_FORM_URLENCODED_VERSION).tar.gz
+PERL_WWW_FORM_URLENCODED_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
+PERL_WWW_FORM_URLENCODED_DEPENDENCIES = host-perl-module-build
+PERL_WWW_FORM_URLENCODED_LICENSE = Artistic or GPL-1.0+
+PERL_WWW_FORM_URLENCODED_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.17.1
