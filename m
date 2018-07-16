From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 13:30:24 +0200
Subject: [Buildroot] [git commit] perl-convert-asn1: new package
Message-ID: <20180716113231.795718447D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7daf3c9becacf127f62afd17489d1607841ffe8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/perl-convert-asn1/Config.in              |  6 ++++++
 package/perl-convert-asn1/perl-convert-asn1.hash |  6 ++++++
 package/perl-convert-asn1/perl-convert-asn1.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 48ab0d9048..932b01d327 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1921,6 +1921,7 @@ F:	package/civetweb/
 N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
 F:	package/opkg-utils/
+F:	package/perl-convert-asn1/
 F:	package/pigz/
 F:	support/scripts/size-stats
 F:	utils/size-stats-compare
diff --git a/package/Config.in b/package/Config.in
index 20fe5ad8ff..86563a1cee 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -664,6 +664,7 @@ endif
 	source "package/perl/Config.in"
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
+	source "package/perl-convert-asn1/Config.in"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
diff --git a/package/perl-convert-asn1/Config.in b/package/perl-convert-asn1/Config.in
new file mode 100644
index 0000000000..a3e988c888
--- /dev/null
+++ b/package/perl-convert-asn1/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_CONVERT_ASN1
+	bool "perl-convert-asn1"
+	help
+	  Convert between perl data structures and ASN.1 encoded packets
+
+	  https://metacpan.org/release/Convert-ASN1
diff --git a/package/perl-convert-asn1/perl-convert-asn1.hash b/package/perl-convert-asn1/perl-convert-asn1.hash
new file mode 100644
index 0000000000..4fd7d3eb61
--- /dev/null
+++ b/package/perl-convert-asn1/perl-convert-asn1.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    68723e96be0b258a9e20480276e8a62c Convert-ASN1-0.27.tar.gz
+sha256 74a4a78ae0c5e973100ac0a8f203a110f76fb047b79dae4fc1fd7d6814d3d58a Convert-ASN1-0.27.tar.gz
+
+# computed by scancpan
+sha256 4ef46cc39d9e2b4c767503457a1f8fda5bcf9c0c164923e2a54a3863209cf237 LICENSE
diff --git a/package/perl-convert-asn1/perl-convert-asn1.mk b/package/perl-convert-asn1/perl-convert-asn1.mk
new file mode 100644
index 0000000000..74482010f9
--- /dev/null
+++ b/package/perl-convert-asn1/perl-convert-asn1.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-convert-asn1
+#
+################################################################################
+
+PERL_CONVERT_ASN1_VERSION = 0.27
+PERL_CONVERT_ASN1_SOURCE = Convert-ASN1-$(PERL_CONVERT_ASN1_VERSION).tar.gz
+PERL_CONVERT_ASN1_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GB/GBARR
+PERL_CONVERT_ASN1_LICENSE = Artistic or GPL-1.0+
+PERL_CONVERT_ASN1_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
