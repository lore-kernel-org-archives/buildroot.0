From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:10:21 +0200
Subject: [Buildroot] [git commit branch/next] perl-appconfig: new package
Message-ID: <20180812210350.010DC8A5DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71ad5eeb9a725a6e4593d817be135fe284246c5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/perl-appconfig/Config.in           |  7 +++++++
 package/perl-appconfig/perl-appconfig.hash |  6 ++++++
 package/perl-appconfig/perl-appconfig.mk   | 13 +++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e0e37a031a..1b0af622c4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -480,6 +480,9 @@ F:	package/python-rtslib-fb/
 F:	package/python-urwid/
 F:	package/targetcli-fb/
 
+N:	Christopher McCrory <chrismcc@gmail.com>
+F:	package/perl-appconfig/
+
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
 F:	package/checkpolicy/
diff --git a/package/Config.in b/package/Config.in
index bc6df3a3b0..d3b7c5b0d7 100644
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
index 0000000000..0c40abb9ef
--- /dev/null
+++ b/package/perl-appconfig/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_APPCONFIG
+	bool "perl-appconfig"
+	help
+	  AppConfig is a bundle of Perl5 modules for reading
+	  configuration files and parsing command line arguments.
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
