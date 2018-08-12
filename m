From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:24:10 +0200
Subject: [Buildroot] [git commit branch/next] perl-data-uuid: new package
Message-ID: <20180812211743.B6C318C96B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70ea9665573184d2d8943929534f5d7a5fe52fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: license is not "bsd", but some variant of MIT.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/perl-data-uuid/Config.in           | 10 ++++++++++
 package/perl-data-uuid/perl-data-uuid.hash |  6 ++++++
 package/perl-data-uuid/perl-data-uuid.mk   | 18 ++++++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 35c21817c7..fc2ce25eea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -484,6 +484,7 @@ N:	Christopher McCrory <chrismcc@gmail.com>
 F:	package/perl-appconfig/
 F:	package/perl-astro-suntime/
 F:	package/perl-class-std/
+F:	package/perl-data-uuid/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index ab54bf5968..f5ad068b6f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -673,6 +673,7 @@ menu "Perl libraries/modules"
 	source "package/perl-crypt-cbc/Config.in"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
+	source "package/perl-data-uuid/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-md5/Config.in"
diff --git a/package/perl-data-uuid/Config.in b/package/perl-data-uuid/Config.in
new file mode 100644
index 0000000000..e0752c44ab
--- /dev/null
+++ b/package/perl-data-uuid/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_DATA_UUID
+	bool "perl-data-uuid"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Globally/Universally Unique Identifiers (GUIDs/UUIDs)
+
+	  https://metacpan.org/release/Data-UUID
+
+comment "perl-data-uuid needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-data-uuid/perl-data-uuid.hash b/package/perl-data-uuid/perl-data-uuid.hash
new file mode 100644
index 0000000000..5086936d4e
--- /dev/null
+++ b/package/perl-data-uuid/perl-data-uuid.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    7619929e8fe205a7fb83bc1c29ecbf99 Data-UUID-1.221.tar.gz
+sha256 3cc7b2a3a7b74b45a059e013f7fd878078500ea4b7269036f84556b022078667 Data-UUID-1.221.tar.gz
+
+# computed by scancpan
+sha256 0560c8eea8e1fb8173faa6c2e9b7e9f8728b8ae8250a814709a53c30b778d5fb LICENSE
diff --git a/package/perl-data-uuid/perl-data-uuid.mk b/package/perl-data-uuid/perl-data-uuid.mk
new file mode 100644
index 0000000000..8e612913d9
--- /dev/null
+++ b/package/perl-data-uuid/perl-data-uuid.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# perl-data-uuid
+#
+################################################################################
+
+PERL_DATA_UUID_VERSION = 1.221
+PERL_DATA_UUID_SOURCE = Data-UUID-$(PERL_DATA_UUID_VERSION).tar.gz
+PERL_DATA_UUID_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
+# The license is documented at
+# https://fedoraproject.org/wiki/Licensing:MIT#HP_Variant as the "HP
+# Variant" of the MIT license. There is no official SPDX tag for this
+# license, but the other MIT variants are prefixed with "MIT-", so we
+# do the same here.
+PERL_DATA_UUID_LICENSE = MIT-HP
+PERL_DATA_UUID_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
