From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 13:30:33 +0200
Subject: [Buildroot] [git commit] perl-mojolicious-plugin-authentication:
 new package
Message-ID: <20180716113231.BE9528447D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c6f4985a8fb1a6f737f5ea25e2e2d411656b7f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/perl-mojolicious-plugin-authentication/Config.in   |  7 +++++++
 .../perl-mojolicious-plugin-authentication.hash            |  6 ++++++
 .../perl-mojolicious-plugin-authentication.mk              | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 88b4ad0a65..0cd6b6d03a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1926,6 +1926,7 @@ F:	package/perl-crypt-blowfish/
 F:	package/perl-crypt-cbc/
 F:	package/perl-digest-md5/
 F:	package/perl-mime-base64-urlsafe/
+F:	package/perl-mojolicious-plugin-authentication/
 F:	package/pigz/
 F:	support/scripts/size-stats
 F:	utils/size-stats-compare
diff --git a/package/Config.in b/package/Config.in
index e67bcc7f25..fe9175b42b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -696,6 +696,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mailtools/Config.in"
 	source "package/perl-mime-base64-urlsafe/Config.in"
 	source "package/perl-mime-base64/Config.in"
+	source "package/perl-mojolicious-plugin-authentication/Config.in"
 	source "package/perl-mojolicious/Config.in"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-http/Config.in"
diff --git a/package/perl-mojolicious-plugin-authentication/Config.in b/package/perl-mojolicious-plugin-authentication/Config.in
new file mode 100644
index 0000000000..26c3cde5d4
--- /dev/null
+++ b/package/perl-mojolicious-plugin-authentication/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION
+	bool "perl-mojolicious-plugin-authentication"
+	select BR2_PACKAGE_PERL_MOJOLICIOUS
+	help
+	  A plugin to make authentication a bit easier
+
+	  https://metacpan.org/release/Mojolicious-Plugin-Authentication
diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
new file mode 100644
index 0000000000..f225ff486b
--- /dev/null
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    b318be1e1e50e7595baee639b2964565 Mojolicious-Plugin-Authentication-1.33.tar.gz
+sha256 1c32dffc88a683ba3b2719f34bc52fb9c5c5fb2f1276bbd30136bfad0ac262bc Mojolicious-Plugin-Authentication-1.33.tar.gz
+
+# computed by scancpan
+sha256 59727ac57166e9891175d8247a8ea47d4aeb24a0dc1e24011b773d139481b135 LICENSE
diff --git a/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
new file mode 100644
index 0000000000..2748965944
--- /dev/null
+++ b/package/perl-mojolicious-plugin-authentication/perl-mojolicious-plugin-authentication.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-mojolicious-plugin-authentication
+#
+################################################################################
+
+PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION = 1.33
+PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SOURCE = Mojolicious-Plugin-Authentication-$(PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_VERSION).tar.gz
+PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JJ/JJATRIA
+PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_DEPENDENCIES = perl-mojolicious
+PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_LICENSE = Artistic or GPL-1.0+
+PERL_MOJOLICIOUS_PLUGIN_AUTHENTICATION_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
