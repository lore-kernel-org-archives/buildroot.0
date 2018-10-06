From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2018 18:55:23 +0200
Subject: [Buildroot] [PATCH 19/20] perl-file-sharedir: new package
In-Reply-To: <20181006165524.23778-1-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
Message-ID: <20181006165524.23778-20-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                                  |  1 +
 package/perl-file-sharedir/Config.in               |  7 +++++++
 package/perl-file-sharedir/perl-file-sharedir.hash |  6 ++++++
 package/perl-file-sharedir/perl-file-sharedir.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/perl-file-sharedir/Config.in
 create mode 100644 package/perl-file-sharedir/perl-file-sharedir.hash
 create mode 100644 package/perl-file-sharedir/perl-file-sharedir.mk

diff --git a/package/Config.in b/package/Config.in
index 3c4907676..b33fd82d8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -695,6 +695,7 @@ menu "Perl libraries/modules"
 	source "package/perl-encode-detect/Config.in"
 	source "package/perl-encode-locale/Config.in"
 	source "package/perl-file-listing/Config.in"
+	source "package/perl-file-sharedir/Config.in"
 	source "package/perl-file-slurp/Config.in"
 	source "package/perl-file-util/Config.in"
 	source "package/perl-filesys-notify-simple/Config.in"
diff --git a/package/perl-file-sharedir/Config.in b/package/perl-file-sharedir/Config.in
new file mode 100644
index 000000000..592dc8f43
--- /dev/null
+++ b/package/perl-file-sharedir/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_FILE_SHAREDIR
+	bool "perl-file-sharedir"
+	select BR2_PACKAGE_PERL_CLASS_INSPECTOR
+	help
+	  Locate per-dist and per-module shared files
+
+	  https://metacpan.org/release/File-ShareDir
diff --git a/package/perl-file-sharedir/perl-file-sharedir.hash b/package/perl-file-sharedir/perl-file-sharedir.hash
new file mode 100644
index 000000000..e0a496655
--- /dev/null
+++ b/package/perl-file-sharedir/perl-file-sharedir.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    f2a0eee9f04c93753dd56437175e5bda File-ShareDir-1.116.tar.gz
+sha256 59d90bfdf98c4656ff4173e62954ea8cf0de66565e35d108ecd7050596cb8328 File-ShareDir-1.116.tar.gz
+
+# computed by scancpan
+sha256 db57983ce0a3bce54900b5a3a3a69e9a593e7b07d0f58dd9f87ac9b016ff4a6b LICENSE
diff --git a/package/perl-file-sharedir/perl-file-sharedir.mk b/package/perl-file-sharedir/perl-file-sharedir.mk
new file mode 100644
index 000000000..e34379757
--- /dev/null
+++ b/package/perl-file-sharedir/perl-file-sharedir.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-file-sharedir
+#
+################################################################################
+
+PERL_FILE_SHAREDIR_VERSION = 1.116
+PERL_FILE_SHAREDIR_SOURCE = File-ShareDir-$(PERL_FILE_SHAREDIR_VERSION).tar.gz
+PERL_FILE_SHAREDIR_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/REHSACK
+PERL_FILE_SHAREDIR_DEPENDENCIES = host-perl-file-sharedir-install perl-class-inspector
+PERL_FILE_SHAREDIR_LICENSE = Artistic or GPL-1.0+
+PERL_FILE_SHAREDIR_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
-- 
2.17.1
