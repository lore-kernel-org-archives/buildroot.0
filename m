From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 07:46:35 -0700
Subject: [Buildroot] [PATCH 3/3] perl-cgi: new package
In-Reply-To: <20180810144635.16182-1-chrismcc@gmail.com>
References: <20180810144635.16182-1-chrismcc@gmail.com>
Message-ID: <20180810144635.16182-2-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in              |  1 +
 package/perl-cgi/Config.in     | 11 +++++++++++
 package/perl-cgi/perl-cgi.hash |  6 ++++++
 package/perl-cgi/perl-cgi.mk   | 14 ++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/perl-cgi/Config.in
 create mode 100644 package/perl-cgi/perl-cgi.hash
 create mode 100644 package/perl-cgi/perl-cgi.mk

diff --git a/package/Config.in b/package/Config.in
index 42c61c242e..9704aba846 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -665,6 +665,7 @@ endif
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
+	source "package/perl-cgi/Config.in"
 	source "package/perl-convert-asn1/Config.in"
 	source "package/perl-crypt-blowfish/Config.in"
 	source "package/perl-crypt-cbc/Config.in"
diff --git a/package/perl-cgi/Config.in b/package/perl-cgi/Config.in
new file mode 100644
index 0000000000..a054ed7929
--- /dev/null
+++ b/package/perl-cgi/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_CGI
+	bool "perl-cgi"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_HTML_PARSER
+	help
+	  Handle Common Gateway Interface requests and responses
+
+	  https://metacpan.org/module/CGI
+
+comment "perl-cgi needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-cgi/perl-cgi.hash b/package/perl-cgi/perl-cgi.hash
new file mode 100644
index 0000000000..a65b8e5446
--- /dev/null
+++ b/package/perl-cgi/perl-cgi.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    0aeb8563d533e7f83724ed068b5bfc37 CGI-4.38.tar.gz
+sha256 8c58f4a529bb92a914b22b7e64c5e31185c9854a4070a6dfad44fe5cc248e7d4 CGI-4.38.tar.gz
+
+# computed by scancpan
+sha256 c7cae89f03a970e90443b93cbf4b65d287ed20572e5d81543589c4b45c80fad8 LICENSE
diff --git a/package/perl-cgi/perl-cgi.mk b/package/perl-cgi/perl-cgi.mk
new file mode 100644
index 0000000000..b8115de6ad
--- /dev/null
+++ b/package/perl-cgi/perl-cgi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-cgi
+#
+################################################################################
+
+PERL_CGI_VERSION = 4.38
+PERL_CGI_SOURCE = CGI-$(PERL_CGI_VERSION).tar.gz
+PERL_CGI_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEEJO
+PERL_CGI_DEPENDENCIES = perl-html-parser
+PERL_CGI_LICENSE = Artistic or GPL-1.0+
+PERL_CGI_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.14.4
