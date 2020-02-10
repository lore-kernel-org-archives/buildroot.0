From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Feb 2020 11:46:59 +0100
Subject: [Buildroot] [PATCH 06/12]
 package/perl-mojolicious-plugin-securityheader: new package
In-Reply-To: <20200210104706.19186-1-patrickdepinguin@gmail.com>
References: <20200210104706.19186-1-patrickdepinguin@gmail.com>
Message-ID: <20200210104706.19186-7-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

Added via utils/scancpan, without changes.

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../Config.in                                      |  7 +++++++
 .../perl-mojolicious-plugin-securityheader.hash    |  6 ++++++
 .../perl-mojolicious-plugin-securityheader.mk      | 14 ++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/perl-mojolicious-plugin-securityheader/Config.in
 create mode 100644 package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.hash
 create mode 100644 package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index dd6199bf6d..30bf7c2b18 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2386,6 +2386,7 @@ F:	package/perl-mojolicious-plugin-authentication/
 F:	package/perl-mojolicious-plugin-authorization/
 F:	package/perl-mojolicious-plugin-cspheader/
 F:	package/perl-mojolicious-plugin-i18n/
+F:	package/perl-mojolicious-plugin-securityheader/
 F:	package/perl-net-snmp/
 F:	package/perl-net-ssh2/
 F:	package/perl-net-telnet/
diff --git a/package/Config.in b/package/Config.in
index 3a664b2521..6c55a7471d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -782,6 +782,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mojolicious-plugin-authorization/Config.in"
 	source "package/perl-mojolicious-plugin-cspheader/Config.in"
 	source "package/perl-mojolicious-plugin-i18n/Config.in"
+	source "package/perl-mojolicious-plugin-securityheader/Config.in"
 	source "package/perl-moo/Config.in"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-http/Config.in"
diff --git a/package/perl-mojolicious-plugin-securityheader/Config.in b/package/perl-mojolicious-plugin-securityheader/Config.in
new file mode 100644
index 0000000000..35e8e122ab
--- /dev/null
+++ b/package/perl-mojolicious-plugin-securityheader/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER
+	bool "perl-mojolicious-plugin-securityheader"
+	select BR2_PACKAGE_PERL_MOJOLICIOUS # runtime
+	help
+	  Mojolicious Plugin.
+
+	  http://github.com/reneeb/Mojolicious-Plugin-SecurityHeader
diff --git a/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.hash b/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.hash
new file mode 100644
index 0000000000..b8a20bdd60
--- /dev/null
+++ b/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    38cf59258547ac866577db2d43632f30 Mojolicious-Plugin-SecurityHeader-0.07.tar.gz
+sha256 940474eaf7a415e5117b004387862473612e079a413590db1eb9c85d17a6648f Mojolicious-Plugin-SecurityHeader-0.07.tar.gz
+
+# computed by scancpan
+sha256 0c38e4629cc9eee869217d62ad765e581e54958596672046a62dfa4cfd87bb09 LICENSE
diff --git a/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.mk b/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.mk
new file mode 100644
index 0000000000..1f287f6f6a
--- /dev/null
+++ b/package/perl-mojolicious-plugin-securityheader/perl-mojolicious-plugin-securityheader.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-mojolicious-plugin-securityheader
+#
+################################################################################
+
+PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_VERSION = 0.07
+PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_SOURCE = Mojolicious-Plugin-SecurityHeader-$(PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_VERSION).tar.gz
+PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/RENEEB
+PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_LICENSE = Artistic-2.0
+PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_LICENSE_FILES = LICENSE
+PERL_MOJOLICIOUS_PLUGIN_SECURITYHEADER_DISTNAME = Mojolicious-Plugin-SecurityHeader
+
+$(eval $(perl-package))
-- 
2.24.1
