From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Apr 2015 10:33:20 +0200
Subject: [Buildroot] [PATCH 07/20] perl-encode-locale: New package
In-Reply-To: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429432413-17038-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429432413-17038-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                                  |    1 +
 package/perl-encode-locale/Config.in               |    6 ++++++
 package/perl-encode-locale/perl-encode-locale.hash |    3 +++
 package/perl-encode-locale/perl-encode-locale.mk   |   14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 package/perl-encode-locale/Config.in
 create mode 100644 package/perl-encode-locale/perl-encode-locale.hash
 create mode 100644 package/perl-encode-locale/perl-encode-locale.mk

diff --git a/package/Config.in b/package/Config.in
index 826bde9..75e6f58 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -505,6 +505,7 @@ menu "Perl libraries/modules"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-file-util/Config.in"
 	source "package/perl-digest-hmac/Config.in"
+	source "package/perl-encode-locale/Config.in"
 	source "package/perl-gd/Config.in"
 	source "package/perl-gdgraph/Config.in"
 	source "package/perl-gdtextutil/Config.in"
diff --git a/package/perl-encode-locale/Config.in b/package/perl-encode-locale/Config.in
new file mode 100644
index 0000000..d15aecb
--- /dev/null
+++ b/package/perl-encode-locale/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_ENCODE_LOCALE
+	bool "perl-encode-locale"
+	help
+	  Determine the locale encoding
+
+	  https://github.com/gisle/encode-locale
diff --git a/package/perl-encode-locale/perl-encode-locale.hash b/package/perl-encode-locale/perl-encode-locale.hash
new file mode 100644
index 0000000..d1abef5
--- /dev/null
+++ b/package/perl-encode-locale/perl-encode-locale.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    0565984b048732e4fd1315212f21d462 Encode-Locale-1.04.tar.gz
+sha256 33aca4aa35829bd5c8c5e64ebfde86d0a2e8cd59dac2c4de707ffe9dc10bfbd4 Encode-Locale-1.04.tar.gz
diff --git a/package/perl-encode-locale/perl-encode-locale.mk b/package/perl-encode-locale/perl-encode-locale.mk
new file mode 100644
index 0000000..fd7148e
--- /dev/null
+++ b/package/perl-encode-locale/perl-encode-locale.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-encode-locale
+#
+################################################################################
+
+PERL_ENCODE_LOCALE_VERSION = 1.04
+PERL_ENCODE_LOCALE_SOURCE = Encode-Locale-$(PERL_ENCODE_LOCALE_VERSION).tar.gz
+PERL_ENCODE_LOCALE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_ENCODE_LOCALE_DEPENDENCIES = perl
+PERL_ENCODE_LOCALE_LICENSE = Artistic or GPLv1+
+PERL_ENCODE_LOCALE_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
1.7.10.4
