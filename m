From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon,  2 Mar 2015 07:55:47 -0300
Subject: [Buildroot] [PATCH v2 1/1] perl-file-util: new package
In-Reply-To: <1425293747-15440-1-git-send-email-casantos@datacom.ind.br>
References: <1425293747-15440-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1425293747-15440-2-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Perl File::Util module (host and target packages)

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/Config.in                          |  1 +
 package/perl-file-util/Config.in           |  6 ++++++
 package/perl-file-util/perl-file-util.hash |  3 +++
 package/perl-file-util/perl-file-util.mk   | 15 +++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/perl-file-util/Config.in
 create mode 100644 package/perl-file-util/perl-file-util.hash
 create mode 100644 package/perl-file-util/perl-file-util.mk

diff --git a/package/Config.in b/package/Config.in
index 262a7fb..2159bd6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -469,6 +469,7 @@ endif
 if BR2_PACKAGE_PERL
 menu "Perl libraries/modules"
 	source "package/perl-datetime-tiny/Config.in"
+	source "package/perl-file-util/Config.in"
 	source "package/perl-gd/Config.in"
 	source "package/perl-gdgraph/Config.in"
 	source "package/perl-gdtextutil/Config.in"
diff --git a/package/perl-file-util/Config.in b/package/perl-file-util/Config.in
new file mode 100644
index 0000000..871be98
--- /dev/null
+++ b/package/perl-file-util/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_FILE_UTIL
+	bool "perl-file-util"
+	help
+	  Easy, versatile, portable file handling
+
+	  https://github.com/tommybutler/file-util/wiki
diff --git a/package/perl-file-util/perl-file-util.hash b/package/perl-file-util/perl-file-util.hash
new file mode 100644
index 0000000..1e613dc
--- /dev/null
+++ b/package/perl-file-util/perl-file-util.hash
@@ -0,0 +1,3 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    93c572b4c54743a7ef383486dd2c4014 File-Util-4.132140.tar.gz
+sha256 4233c493468da8b34f2df19b191aaa400f328d877c8c023605e43385976a99d1 File-Util-4.132140.tar.gz
diff --git a/package/perl-file-util/perl-file-util.mk b/package/perl-file-util/perl-file-util.mk
new file mode 100644
index 0000000..c8b4441
--- /dev/null
+++ b/package/perl-file-util/perl-file-util.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# perl-file-util
+#
+################################################################################
+
+PERL_FILE_UTIL_VERSION = 4.132140
+PERL_FILE_UTIL_SOURCE = File-Util-$(PERL_FILE_UTIL_VERSION).tar.gz
+PERL_FILE_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOMMY
+PERL_FILE_UTIL_DEPENDENCIES = perl host-perl-module-build
+PERL_FILE_UTIL_LICENSE = Artistic or GPLv1+
+PERL_FILE_UTIL_LICENSE_FILES = COPYING LICENSE
+
+$(eval $(perl-package))
+$(eval $(host-perl-package))
-- 
1.8.3.1
