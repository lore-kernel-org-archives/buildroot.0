From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 10:33:16 +0200
Subject: [Buildroot] [PATCH 03/20] perl-html-parser: New package
In-Reply-To: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429432413-17038-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                              |    1 +
 package/perl-html-parser/Config.in             |    8 ++++++++
 package/perl-html-parser/perl-html-parser.hash |    3 +++
 package/perl-html-parser/perl-html-parser.mk   |   15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/perl-html-parser/Config.in
 create mode 100644 package/perl-html-parser/perl-html-parser.hash
 create mode 100644 package/perl-html-parser/perl-html-parser.mk

diff --git a/package/Config.in b/package/Config.in
index ae4ce5f..ab4cf10 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -508,6 +508,7 @@ menu "Perl libraries/modules"
 	source "package/perl-gd/Config.in"
 	source "package/perl-gdgraph/Config.in"
 	source "package/perl-gdtextutil/Config.in"
+	source "package/perl-html-parser/Config.in"
 	source "package/perl-html-tagset/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-json-tiny/Config.in"
diff --git a/package/perl-html-parser/Config.in b/package/perl-html-parser/Config.in
new file mode 100644
index 0000000..afdd523
--- /dev/null
+++ b/package/perl-html-parser/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PERL_HTML_PARSER
+	bool "perl-html-parser"
+	select BR2_PACKAGE_PERL_HTML_TAGSET
+	help
+	  The HTML-Parser distribution is is a collection of modules that parse
+	  and extract information from HTML documents
+
+	  http://github.com/gisle/html-parser
diff --git a/package/perl-html-parser/perl-html-parser.hash b/package/perl-html-parser/perl-html-parser.hash
new file mode 100644
index 0000000..eed22b7
--- /dev/null
+++ b/package/perl-html-parser/perl-html-parser.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    9128a45893097dfa3bf03301b19c5efe HTML-Parser-3.71.tar.gz
+sha256 be918b3749d3ff93627f72ee4b825683332ecb4c81c67a3a8d72b0435ffbd802 HTML-Parser-3.71.tar.gz
diff --git a/package/perl-html-parser/perl-html-parser.mk b/package/perl-html-parser/perl-html-parser.mk
new file mode 100644
index 0000000..2488702
--- /dev/null
+++ b/package/perl-html-parser/perl-html-parser.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# perl-html-parser
+#
+################################################################################
+
+PERL_HTML_PARSER_VERSION = 3.71
+PERL_HTML_PARSER_SOURCE = HTML-Parser-$(PERL_HTML_PARSER_VERSION).tar.gz
+PERL_HTML_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_HTML_PARSER_DEPENDENCIES = perl-html-tagset
+PERL_HTML_PARSER_LICENSE = Artistic or GPLv1+
+PERL_HTML_PARSER_LICENSE_FILES = README
+
+$(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
1.7.10.4
