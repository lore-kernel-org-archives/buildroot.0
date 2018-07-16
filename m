From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 13:30:26 +0200
Subject: [Buildroot] [git commit] perl-crypt-blowfish: new package
Message-ID: <20180716113231.8ADEB8447D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34424bf095c4008c290d80101bd0e31e06969507
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  1 +
 package/Config.in                                    |  1 +
 package/perl-crypt-blowfish/Config.in                | 10 ++++++++++
 package/perl-crypt-blowfish/perl-crypt-blowfish.hash |  6 ++++++
 package/perl-crypt-blowfish/perl-crypt-blowfish.mk   | 12 ++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 932b01d327..f437401818 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1922,6 +1922,7 @@ N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
 F:	package/opkg-utils/
 F:	package/perl-convert-asn1/
+F:	package/perl-crypt-blowfish/
 F:	package/pigz/
 F:	support/scripts/size-stats
 F:	utils/size-stats-compare
diff --git a/package/Config.in b/package/Config.in
index 86563a1cee..5bd229eab0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -665,6 +665,7 @@ endif
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-convert-asn1/Config.in"
+	source "package/perl-crypt-blowfish/Config.in"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
diff --git a/package/perl-crypt-blowfish/Config.in b/package/perl-crypt-blowfish/Config.in
new file mode 100644
index 0000000000..093f11d95b
--- /dev/null
+++ b/package/perl-crypt-blowfish/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_CRYPT_BLOWFISH
+	bool "perl-crypt-blowfish"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Perl Blowfish encryption module
+
+	  https://metacpan.org/release/Crypt-Blowfish
+
+comment "perl-crypt-blowfish needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-crypt-blowfish/perl-crypt-blowfish.hash b/package/perl-crypt-blowfish/perl-crypt-blowfish.hash
new file mode 100644
index 0000000000..f814cb9bd5
--- /dev/null
+++ b/package/perl-crypt-blowfish/perl-crypt-blowfish.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    792b43cd4e49d2c2cf4a9f6990ff7d1b Crypt-Blowfish-2.14.tar.gz
+sha256 46b3431ffb6bf5b9cb359f79565d48407e652ad2b04fdf5ca62a69e7197a67b1 Crypt-Blowfish-2.14.tar.gz
+
+# computed by scancpan
+sha256 d61437443e6912d03677874c7baef242f28119c2c5d8b92b0f3f3660200f98d4 COPYRIGHT
diff --git a/package/perl-crypt-blowfish/perl-crypt-blowfish.mk b/package/perl-crypt-blowfish/perl-crypt-blowfish.mk
new file mode 100644
index 0000000000..f6644eb151
--- /dev/null
+++ b/package/perl-crypt-blowfish/perl-crypt-blowfish.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# perl-crypt-blowfish
+#
+################################################################################
+
+PERL_CRYPT_BLOWFISH_VERSION = 2.14
+PERL_CRYPT_BLOWFISH_SOURCE = Crypt-Blowfish-$(PERL_CRYPT_BLOWFISH_VERSION).tar.gz
+PERL_CRYPT_BLOWFISH_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DP/DPARIS
+PERL_CRYPT_BLOWFISH_LICENSE_FILES = COPYRIGHT
+
+$(eval $(perl-package))
