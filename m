From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Feb 2020 11:47:01 +0100
Subject: [Buildroot] [PATCH 08/12] package/perl-mozilla-ca: new package
In-Reply-To: <20200210104706.19186-1-patrickdepinguin@gmail.com>
References: <20200210104706.19186-1-patrickdepinguin@gmail.com>
Message-ID: <20200210104706.19186-9-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

This is a dependency for perl-lwp-protocol-https (added in a subsequent
patch).

Added via utils/scancpan, updating license only.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/perl-mozilla-ca/Config.in            |  6 ++++++
 package/perl-mozilla-ca/perl-mozilla-ca.hash |  6 ++++++
 package/perl-mozilla-ca/perl-mozilla-ca.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/perl-mozilla-ca/Config.in
 create mode 100644 package/perl-mozilla-ca/perl-mozilla-ca.hash
 create mode 100644 package/perl-mozilla-ca/perl-mozilla-ca.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 54120f8142..75417e5473 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2388,6 +2388,7 @@ F:	package/perl-mojolicious-plugin-authorization/
 F:	package/perl-mojolicious-plugin-cspheader/
 F:	package/perl-mojolicious-plugin-i18n/
 F:	package/perl-mojolicious-plugin-securityheader/
+F:	package/perl-mozilla-ca/
 F:	package/perl-net-snmp/
 F:	package/perl-net-ssh2/
 F:	package/perl-net-telnet/
diff --git a/package/Config.in b/package/Config.in
index 813da4efff..8a61139d3f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -784,6 +784,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mojolicious-plugin-i18n/Config.in"
 	source "package/perl-mojolicious-plugin-securityheader/Config.in"
 	source "package/perl-moo/Config.in"
+	source "package/perl-mozilla-ca/Config.in"
 	source "package/perl-net-dns/Config.in"
 	source "package/perl-net-http/Config.in"
 	source "package/perl-net-snmp/Config.in"
diff --git a/package/perl-mozilla-ca/Config.in b/package/perl-mozilla-ca/Config.in
new file mode 100644
index 0000000000..733d07e1f9
--- /dev/null
+++ b/package/perl-mozilla-ca/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_MOZILLA_CA
+	bool "perl-mozilla-ca"
+	help
+	  Mozilla's CA cert bundle in PEM format.
+
+	  https://metacpan.org/release/Mozilla-CA
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.hash b/package/perl-mozilla-ca/perl-mozilla-ca.hash
new file mode 100644
index 0000000000..0d52d192e6
--- /dev/null
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    9c93333e1d9d3fad639e9d4082898de1 Mozilla-CA-20180117.tar.gz
+sha256 f2cc9fbe119f756313f321e0d9f1fac0859f8f154ac9d75b1a264c1afdf4e406 Mozilla-CA-20180117.tar.gz
+
+# computed by scancpan
+sha256 95cd63dae5c2bf6e7cf33435981614a36c85ef01fc7a02464e05e58a5355398e README
diff --git a/package/perl-mozilla-ca/perl-mozilla-ca.mk b/package/perl-mozilla-ca/perl-mozilla-ca.mk
new file mode 100644
index 0000000000..9fca66d000
--- /dev/null
+++ b/package/perl-mozilla-ca/perl-mozilla-ca.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-mozilla-ca
+#
+################################################################################
+
+PERL_MOZILLA_CA_VERSION = 20180117
+PERL_MOZILLA_CA_SOURCE = Mozilla-CA-$(PERL_MOZILLA_CA_VERSION).tar.gz
+PERL_MOZILLA_CA_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AB/ABH
+PERL_MOZILLA_CA_LICENSE = MPL-2.0
+PERL_MOZILLA_CA_LICENSE_FILES = README
+PERL_MOZILLA_CA_DISTNAME = Mozilla-CA
+
+$(eval $(perl-package))
-- 
2.24.1
