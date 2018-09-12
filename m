From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 21:33:42 +0200
Subject: [Buildroot] [git commit] perl-data-dump: new package
Message-ID: <20180912194148.F0E2986EDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11d72bdaef65e8959dc0382d22a63e0b790b8928
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/perl-data-dump/Config.in           |  6 ++++++
 package/perl-data-dump/perl-data-dump.hash |  6 ++++++
 package/perl-data-dump/perl-data-dump.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8c43ce1b17..0b9a3e741b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -489,6 +489,7 @@ F:	package/perl-appconfig/
 F:	package/perl-astro-suntime/
 F:	package/perl-class-std/
 F:	package/perl-class-std-fast/
+F:	package/perl-data-dump/
 F:	package/perl-data-optlist/
 F:	package/perl-data-uuid/
 F:	package/perl-date-manip/
diff --git a/package/Config.in b/package/Config.in
index 046ddd5310..b981df7879 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -674,6 +674,7 @@ menu "Perl libraries/modules"
 	source "package/perl-crypt-cbc/Config.in"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
+	source "package/perl-data-dump/Config.in"
 	source "package/perl-data-optlist/Config.in"
 	source "package/perl-data-uuid/Config.in"
 	source "package/perl-date-manip/Config.in"
diff --git a/package/perl-data-dump/Config.in b/package/perl-data-dump/Config.in
new file mode 100644
index 0000000000..a44291baae
--- /dev/null
+++ b/package/perl-data-dump/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_DATA_DUMP
+	bool "perl-data-dump"
+	help
+	  Pretty printing of data structures
+
+	  https://metacpan.org/release/Data-Dump
diff --git a/package/perl-data-dump/perl-data-dump.hash b/package/perl-data-dump/perl-data-dump.hash
new file mode 100644
index 0000000000..87850326de
--- /dev/null
+++ b/package/perl-data-dump/perl-data-dump.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    762c111e525c82ff23d62c90821b26e9 Data-Dump-1.23.tar.gz
+sha256 af53b05ef1387b4cab4427e6789179283e4f0da8cf036e8db516ddb344512b65 Data-Dump-1.23.tar.gz
+
+# computed by scancpan
+sha256 31d1b6482bcc3db87a38ad02065554f9d3bc13321d4ef8e96042464045e2abcf README
diff --git a/package/perl-data-dump/perl-data-dump.mk b/package/perl-data-dump/perl-data-dump.mk
new file mode 100644
index 0000000000..7c5d46e08e
--- /dev/null
+++ b/package/perl-data-dump/perl-data-dump.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-data-dump
+#
+################################################################################
+
+PERL_DATA_DUMP_VERSION = 1.23
+PERL_DATA_DUMP_SOURCE = Data-Dump-$(PERL_DATA_DUMP_VERSION).tar.gz
+PERL_DATA_DUMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
+PERL_DATA_DUMP_LICENSE = Artistic or GPL-1.0+
+PERL_DATA_DUMP_LICENSE_FILES = README
+
+$(eval $(perl-package))
