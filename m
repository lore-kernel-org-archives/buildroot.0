From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 12:03:06 +0200
Subject: [Buildroot] [git commit] package/perl-db-file: new package
Message-ID: <20150426100337.CEA49800DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1284bad1c476caf8c9cc65b72078d99c91659170
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: rename package to perl-db-file.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/perl-db-file/Config.in         |   12 ++++++++++++
 package/perl-db-file/perl-db-file.hash |    3 +++
 package/perl-db-file/perl-db-file.mk   |   13 +++++++++++++
 4 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 4327f07..6ca4276 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -505,6 +505,7 @@ menu "Perl libraries/modules"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
+	source "package/perl-db-file/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-sha1/Config.in"
 	source "package/perl-encode-locale/Config.in"
diff --git a/package/perl-db-file/Config.in b/package/perl-db-file/Config.in
new file mode 100644
index 0000000..18daec3
--- /dev/null
+++ b/package/perl-db-file/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PERL_DB_FILE
+	bool "perl-db-file"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_BERKELEYDB
+	select BR2_PACKAGE_BERKELEYDB_COMPAT185
+	help
+	  Perl5 access to Berkeley DB version 1.x
+
+	  https://metacpan.org/release/DB_File
+
+comment "perl-db_file needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-db-file/perl-db-file.hash b/package/perl-db-file/perl-db-file.hash
new file mode 100644
index 0000000..df0113c
--- /dev/null
+++ b/package/perl-db-file/perl-db-file.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    0ae7910cabc31a44e50b713a8a475514 DB_File-1.835.tar.gz
+sha256 41206f39a1bac49db8c1595e300b04c70e1393b2d78ccb9ef15c5c0b81037cfc DB_File-1.835.tar.gz
diff --git a/package/perl-db-file/perl-db-file.mk b/package/perl-db-file/perl-db-file.mk
new file mode 100644
index 0000000..1501926
--- /dev/null
+++ b/package/perl-db-file/perl-db-file.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-db_file
+#
+################################################################################
+
+PERL_DB_FILE_VERSION = 1.835
+PERL_DB_FILE_SOURCE = DB_File-$(PERL_DB_FILE_VERSION).tar.gz
+PERL_DB_FILE_SITE = $(BR2_CPAN_MIRROR)/authors/id/P/PM/PMQS
+PERL_DB_FILE_DEPENDENCIES = berkeleydb perl
+PERL_DB_FILE_LICENSE = Artistic or GPLv1+
+
+$(eval $(perl-package))
