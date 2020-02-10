From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Feb 2020 12:26:28 +0100
Subject: [Buildroot] [PATCHv2 05/12] package/perl-mojolicious-plugin-i18n:
 new package
In-Reply-To: <20200210112636.8155-1-patrickdepinguin@gmail.com>
References: <20200210112636.8155-1-patrickdepinguin@gmail.com>
Message-ID: <20200210112636.8155-6-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

Added via utils/scancpan, adding README.pod as license file and updating
license to Artistic-2.0.

Note that the license declared in META.{json,yml} ('perl') would mean either
Artistic or GPL-1.0, while the README.pod file only talks about
Artistic-2.0. Assume the author means the latter one.

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v2: update license and license-files

 DEVELOPERS                                        |  1 +
 package/Config.in                                 |  1 +
 package/perl-mojolicious-plugin-i18n/Config.in    |  7 +++++++
 .../perl-mojolicious-plugin-i18n.hash             |  6 ++++++
 .../perl-mojolicious-plugin-i18n.mk               | 15 +++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/perl-mojolicious-plugin-i18n/Config.in
 create mode 100644 package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.hash
 create mode 100644 package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index c7b98fb349..dd6199bf6d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2385,6 +2385,7 @@ F:	package/perl-mime-base64-urlsafe/
 F:	package/perl-mojolicious-plugin-authentication/
 F:	package/perl-mojolicious-plugin-authorization/
 F:	package/perl-mojolicious-plugin-cspheader/
+F:	package/perl-mojolicious-plugin-i18n/
 F:	package/perl-net-snmp/
 F:	package/perl-net-ssh2/
 F:	package/perl-net-telnet/
diff --git a/package/Config.in b/package/Config.in
index c85f0676cf..3a664b2521 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -781,6 +781,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mojolicious-plugin-authentication/Config.in"
 	source "package/perl-mojolicious-plugin-authorization/Config.in"
 	source "package/perl-mojolicious-plugin-cspheader/Config.in"
+	source "package/perl-mojolicious-plugin-i18n/Config.in"
 	source "package/perl-moo/Config.in"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-http/Config.in"
diff --git a/package/perl-mojolicious-plugin-i18n/Config.in b/package/perl-mojolicious-plugin-i18n/Config.in
new file mode 100644
index 0000000000..cbe11451c5
--- /dev/null
+++ b/package/perl-mojolicious-plugin-i18n/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_MOJOLICIOUS_PLUGIN_I18N
+	bool "perl-mojolicious-plugin-i18n"
+	select BR2_PACKAGE_PERL_MOJOLICIOUS # runtime
+	help
+	  Internationalization Plugin for Mojolicious.
+
+	  https://metacpan.org/release/Mojolicious-Plugin-I18N
diff --git a/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.hash b/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.hash
new file mode 100644
index 0000000000..ed4bc20748
--- /dev/null
+++ b/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    4002f7a7da4c90973ad6eedfb0fcfa16 Mojolicious-Plugin-I18N-1.6.tar.gz
+sha256 32fb5ef8037d954b7ecebef5c1b2b24b420abd829702312f4ad42794f52b514d Mojolicious-Plugin-I18N-1.6.tar.gz
+
+# manually computed
+sha256 82b05028033057b388b0040a3b5590a1c51168fe3b9899bffdb5ef7962c4eb47 README.pod
diff --git a/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.mk b/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.mk
new file mode 100644
index 0000000000..11d41ac55c
--- /dev/null
+++ b/package/perl-mojolicious-plugin-i18n/perl-mojolicious-plugin-i18n.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# perl-mojolicious-plugin-i18n
+#
+################################################################################
+
+PERL_MOJOLICIOUS_PLUGIN_I18N_VERSION = 1.6
+PERL_MOJOLICIOUS_PLUGIN_I18N_SOURCE = Mojolicious-Plugin-I18N-$(PERL_MOJOLICIOUS_PLUGIN_I18N_VERSION).tar.gz
+PERL_MOJOLICIOUS_PLUGIN_I18N_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SH/SHARIFULN
+PERL_MOJOLICIOUS_PLUGIN_I18N_DEPENDENCIES = host-perl-module-build
+PERL_MOJOLICIOUS_PLUGIN_I18N_LICENSE = Artistic-2.0
+PERL_MOJOLICIOUS_PLUGIN_I18N_LICENSE_FILES = README.pod
+PERL_MOJOLICIOUS_PLUGIN_I18N_DISTNAME = Mojolicious-Plugin-I18N
+
+$(eval $(perl-package))
-- 
2.24.1
