From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 12:16:56 +0200
Subject: [Buildroot] [PATCH v2 01/25] package/perl-html-tagset: New package
In-Reply-To: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429438640-9367-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                              |    1 +
 package/perl-html-tagset/Config.in             |    6 ++++++
 package/perl-html-tagset/perl-html-tagset.hash |    3 +++
 package/perl-html-tagset/perl-html-tagset.mk   |   14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/perl-html-tagset/Config.in
 create mode 100644 package/perl-html-tagset/perl-html-tagset.hash
 create mode 100644 package/perl-html-tagset/perl-html-tagset.mk

diff --git a/package/Config.in b/package/Config.in
index a3cd4c2..bb354ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -508,6 +508,7 @@ menu "Perl libraries/modules"
 	source "package/perl-gd/Config.in"
 	source "package/perl-gdgraph/Config.in"
 	source "package/perl-gdtextutil/Config.in"
+	source "package/perl-html-tagset/Config.in"
 	source "package/perl-io-socket-ssl/Config.in"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-mojolicious/Config.in"
diff --git a/package/perl-html-tagset/Config.in b/package/perl-html-tagset/Config.in
new file mode 100644
index 0000000..a39bc65
--- /dev/null
+++ b/package/perl-html-tagset/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_HTML_TAGSET
+	bool "perl-html-tagset"
+	help
+	  HTML::Tagset - data tables useful in parsing HTML
+
+	  http://www.cpan.org/modules/by-authors/id/P/PE/PETDANCE/
diff --git a/package/perl-html-tagset/perl-html-tagset.hash b/package/perl-html-tagset/perl-html-tagset.hash
new file mode 100644
index 0000000..a4cf090
--- /dev/null
+++ b/package/perl-html-tagset/perl-html-tagset.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    d2bfa18fe1904df7f683e96611e87437 HTML-Tagset-3.20.tar.gz
+sha256 adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c7131108e2 HTML-Tagset-3.20.tar.gz
diff --git a/package/perl-html-tagset/perl-html-tagset.mk b/package/perl-html-tagset/perl-html-tagset.mk
new file mode 100644
index 0000000..2629611
--- /dev/null
+++ b/package/perl-html-tagset/perl-html-tagset.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-html-tagset
+#
+################################################################################
+
+PERL_HTML_TAGSET_VERSION = 3.20
+PERL_HTML_TAGSET_SOURCE = HTML-Tagset-$(PERL_HTML_TAGSET_VERSION).tar.gz
+PERL_HTML_TAGSET_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PE/PETDANCE
+PERL_HTML_TAGSET_DEPENDENCIES = perl
+PERL_HTML_TAGSET_LICENSE = Artistic or GPLv1+
+PERL_HTML_TAGSET_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
1.7.10.4
