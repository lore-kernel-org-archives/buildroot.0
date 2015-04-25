From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 25 Apr 2015 15:54:46 +0200
Subject: [Buildroot] [PATCH 4/6] package/perl-db_file: new package
In-Reply-To: <1429970088-593-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429970088-593-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429970088-593-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                      |    1 +
 package/perl-db_file/Config.in         |   12 ++++++++++++
 package/perl-db_file/perl-db_file.hash |    3 +++
 package/perl-db_file/perl-db_file.mk   |   13 +++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 package/perl-db_file/Config.in
 create mode 100644 package/perl-db_file/perl-db_file.hash
 create mode 100644 package/perl-db_file/perl-db_file.mk

diff --git a/package/Config.in b/package/Config.in
index b1fed98..679fa1b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -506,6 +506,7 @@ menu "Perl libraries/modules"
 	source "package/perl-crypt-openssl-random/Config.in"
 	source "package/perl-crypt-openssl-rsa/Config.in"
 	source "package/perl-datetime-tiny/Config.in"
+	source "package/perl-db_file/Config.in"
 	source "package/perl-digest-hmac/Config.in"
 	source "package/perl-digest-sha1/Config.in"
 	source "package/perl-encode-locale/Config.in"
diff --git a/package/perl-db_file/Config.in b/package/perl-db_file/Config.in
new file mode 100644
index 0000000..a2e4516
--- /dev/null
+++ b/package/perl-db_file/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PERL_DB_FILE
+	bool "perl-db_file"
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
diff --git a/package/perl-db_file/perl-db_file.hash b/package/perl-db_file/perl-db_file.hash
new file mode 100644
index 0000000..df0113c
--- /dev/null
+++ b/package/perl-db_file/perl-db_file.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    0ae7910cabc31a44e50b713a8a475514 DB_File-1.835.tar.gz
+sha256 41206f39a1bac49db8c1595e300b04c70e1393b2d78ccb9ef15c5c0b81037cfc DB_File-1.835.tar.gz
diff --git a/package/perl-db_file/perl-db_file.mk b/package/perl-db_file/perl-db_file.mk
new file mode 100644
index 0000000..1501926
--- /dev/null
+++ b/package/perl-db_file/perl-db_file.mk
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
-- 
1.7.10.4
