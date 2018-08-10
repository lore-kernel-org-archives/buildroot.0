From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:45 -0700
Subject: [Buildroot] [PATCH 01/18] perl-appconfig: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-2-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                          |  1 +
 package/perl-appconfig/Config.in           |  6 ++++++
 package/perl-appconfig/perl-appconfig.hash |  6 ++++++
 package/perl-appconfig/perl-appconfig.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-appconfig/Config.in
 create mode 100644 package/perl-appconfig/perl-appconfig.hash
 create mode 100644 package/perl-appconfig/perl-appconfig.mk

diff --git a/package/Config.in b/package/Config.in
index f5a17492c7..8b80276fb1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -665,6 +665,7 @@ endif
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
+	source "package/perl-appconfig/Config.in"
 	source "package/perl-convert-asn1/Config.in"
 	source "package/perl-crypt-blowfish/Config.in"
 	source "package/perl-crypt-cbc/Config.in"
diff --git a/package/perl-appconfig/Config.in b/package/perl-appconfig/Config.in
new file mode 100644
index 0000000000..ca2220f1c0
--- /dev/null
+++ b/package/perl-appconfig/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_APPCONFIG
+	bool "perl-appconfig"
+	help
+	  AppConfig is a bundle of Perl5 modules for reading configuration files and parsing command line arguments.
+
+	  https://metacpan.org/release/AppConfig
diff --git a/package/perl-appconfig/perl-appconfig.hash b/package/perl-appconfig/perl-appconfig.hash
new file mode 100644
index 0000000000..151a2e903f
--- /dev/null
+++ b/package/perl-appconfig/perl-appconfig.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    7747d9241561ed5567d5e134b8648707 AppConfig-1.71.tar.gz
+sha256 1177027025ecb09ee64d9f9f255615c04db5e14f7536c344af632032eb887b0f AppConfig-1.71.tar.gz
+
+# computed by scancpan
+sha256 0b22dd532e4123a511d14989c4169ed56b7316cf844c29c7897a1638a4616868 LICENSE
diff --git a/package/perl-appconfig/perl-appconfig.mk b/package/perl-appconfig/perl-appconfig.mk
new file mode 100644
index 0000000000..7a553e330b
--- /dev/null
+++ b/package/perl-appconfig/perl-appconfig.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-appconfig
+#
+################################################################################
+
+PERL_APPCONFIG_VERSION = 1.71
+PERL_APPCONFIG_SOURCE = AppConfig-$(PERL_APPCONFIG_VERSION).tar.gz
+PERL_APPCONFIG_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NE/NEILB
+PERL_APPCONFIG_LICENSE = Artistic or GPL-1.0+
+PERL_APPCONFIG_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.14.4
