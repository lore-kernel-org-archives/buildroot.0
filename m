From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 12:17:04 +0200
Subject: [Buildroot] [PATCH v2 09/25] package/perl-io-html: New package
In-Reply-To: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429438640-9367-10-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                      |    1 +
 package/perl-io-html/Config.in         |    6 ++++++
 package/perl-io-html/perl-io-html.hash |    3 +++
 package/perl-io-html/perl-io-html.mk   |   14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/perl-io-html/Config.in
 create mode 100644 package/perl-io-html/perl-io-html.hash
 create mode 100644 package/perl-io-html/perl-io-html.mk

diff --git a/package/Config.in b/package/Config.in
index d453595..3c99f07 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -513,6 +513,7 @@ menu "Perl libraries/modules"
 	source "package/perl-html-parser/Config.in"
 	source "package/perl-html-tagset/Config.in"
 	source "package/perl-http-date/Config.in"
+	source "package/perl-io-html/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-mojolicious/Config.in"
diff --git a/package/perl-io-html/Config.in b/package/perl-io-html/Config.in
new file mode 100644
index 0000000..6977022
--- /dev/null
+++ b/package/perl-io-html/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_IO_HTML
+	bool "perl-io-html"
+	help
+	  Perl module that opens a file and performs automatic charset detection
+
+	  https://github.com/madsen/io-html
diff --git a/package/perl-io-html/perl-io-html.hash b/package/perl-io-html/perl-io-html.hash
new file mode 100644
index 0000000..8d8c48d
--- /dev/null
+++ b/package/perl-io-html/perl-io-html.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    3f8958718844dc96b9f6946f21d70d22 IO-HTML-1.001.tar.gz
+sha256 ea78d2d743794adc028bc9589538eb867174b4e165d7d8b5f63486e6b828e7e0 IO-HTML-1.001.tar.gz
diff --git a/package/perl-io-html/perl-io-html.mk b/package/perl-io-html/perl-io-html.mk
new file mode 100644
index 0000000..3926d44
--- /dev/null
+++ b/package/perl-io-html/perl-io-html.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-io-html
+#
+################################################################################
+
+PERL_IO_HTML_VERSION = 1.001
+PERL_IO_HTML_SOURCE = IO-HTML-$(PERL_IO_HTML_VERSION).tar.gz
+PERL_IO_HTML_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CJ/CJM
+PERL_IO_HTML_DEPENDENCIES = perl
+PERL_IO_HTML_LICENSE = Artistic or GPLv1+
+PERL_IO_HTML_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
1.7.10.4
