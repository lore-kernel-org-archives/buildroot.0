From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 10:33:24 +0200
Subject: [Buildroot] [PATCH 11/20] perl-uri: New package
In-Reply-To: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429432413-17038-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in              |    1 +
 package/perl-uri/Config.in     |    8 ++++++++
 package/perl-uri/perl-uri.hash |    3 +++
 package/perl-uri/perl-uri.mk   |   14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-uri/Config.in
 create mode 100644 package/perl-uri/perl-uri.hash
 create mode 100644 package/perl-uri/perl-uri.mk

diff --git a/package/Config.in b/package/Config.in
index e60481e..4aacdd7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -523,6 +523,7 @@ menu "Perl libraries/modules"
 	source "package/perl-path-tiny/Config.in"
 	source "package/perl-time-hires/Config.in"
 	source "package/perl-try-tiny/Config.in"
+	source "package/perl-uri/Config.in"
 	source "package/perl-xml-libxml/Config.in"
 	source "package/perl-xml-namespacesupport/Config.in"
 	source "package/perl-xml-sax/Config.in"
diff --git a/package/perl-uri/Config.in b/package/perl-uri/Config.in
new file mode 100644
index 0000000..62a53f2
--- /dev/null
+++ b/package/perl-uri/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PERL_URI
+	bool "perl-uri"
+	help
+	  The module implements the URI class. Objects of this class represent
+	  Uniform Resource Identifier references as specified in RFC 2396 and
+	  updated by RFC 2732.
+
+	  https://github.com/libwww-perl/uri
diff --git a/package/perl-uri/perl-uri.hash b/package/perl-uri/perl-uri.hash
new file mode 100644
index 0000000..da33416
--- /dev/null
+++ b/package/perl-uri/perl-uri.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    d0ef53b6c63bcc02ba55f405c30741e3 URI-1.67.tar.gz
+sha256 7088d43d5f4902becfa5e0627751f5e6d0e0bdd1637b2d39e70ce807068a274e URI-1.67.tar.gz
diff --git a/package/perl-uri/perl-uri.mk b/package/perl-uri/perl-uri.mk
new file mode 100644
index 0000000..421a89f
--- /dev/null
+++ b/package/perl-uri/perl-uri.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-uri
+#
+################################################################################
+
+PERL_URI_VERSION = 1.67
+PERL_URI_SOURCE = URI-$(PERL_URI_VERSION).tar.gz
+PERL_URI_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_URI_DEPENDENCIES = perl
+PERL_URI_LICENSE = Artistic or GPLv1+
+PERL_URI_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
1.7.10.4
