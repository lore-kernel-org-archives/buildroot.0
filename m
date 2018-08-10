From: Christopher McCrory <chrismcc@gmail.com>
Date: Fri, 10 Aug 2018 09:14:53 -0700
Subject: [Buildroot] [PATCH 09/18] perl-file-slurp: new package
In-Reply-To: <20180810161502.21598-1-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
Message-ID: <20180810161502.21598-10-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/Config.in                            |  1 +
 package/perl-file-slurp/Config.in            |  6 ++++++
 package/perl-file-slurp/perl-file-slurp.hash |  6 ++++++
 package/perl-file-slurp/perl-file-slurp.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/perl-file-slurp/Config.in
 create mode 100644 package/perl-file-slurp/perl-file-slurp.hash
 create mode 100644 package/perl-file-slurp/perl-file-slurp.mk

diff --git a/package/Config.in b/package/Config.in
index cd01657802..a458e56871 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -685,6 +685,7 @@ menu "Perl libraries/modules"
 	source "package/perl-encode-detect/Config.in"
 	source "package/perl-encode-locale/Config.in"
 	source "package/perl-file-listing/Config.in"
+	source "package/perl-file-slurp/Config.in"
 	source "package/perl-file-util/Config.in"
 	source "package/perl-gd/Config.in"
 	source "package/perl-gdgraph/Config.in"
diff --git a/package/perl-file-slurp/Config.in b/package/perl-file-slurp/Config.in
new file mode 100644
index 0000000000..bfd1cad186
--- /dev/null
+++ b/package/perl-file-slurp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_FILE_SLURP
+	bool "perl-file-slurp"
+	help
+	  Simple and Efficient Reading/Writing/Modifying of Complete Files
+
+	  https://metacpan.org/release/File-Slurp
diff --git a/package/perl-file-slurp/perl-file-slurp.hash b/package/perl-file-slurp/perl-file-slurp.hash
new file mode 100644
index 0000000000..18f9e65ced
--- /dev/null
+++ b/package/perl-file-slurp/perl-file-slurp.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    7d584cd15c4f8b9547765eff8c4ef078 File-Slurp-9999.19.tar.gz
+sha256 ce29ebe995097ebd6e9bc03284714cdfa0c46dc94f6b14a56980747ea3253643 File-Slurp-9999.19.tar.gz
+
+# computed by scancpan
+sha256 17e638d011c04b1d39b300c07ccd0c57d7857b9ccdb9fe7abce1b15f0e7b0c20 README
diff --git a/package/perl-file-slurp/perl-file-slurp.mk b/package/perl-file-slurp/perl-file-slurp.mk
new file mode 100644
index 0000000000..32773ddbbc
--- /dev/null
+++ b/package/perl-file-slurp/perl-file-slurp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-file-slurp
+#
+################################################################################
+
+PERL_FILE_SLURP_VERSION = 9999.19
+PERL_FILE_SLURP_SOURCE = File-Slurp-$(PERL_FILE_SLURP_VERSION).tar.gz
+PERL_FILE_SLURP_SITE = $(BR2_CPAN_MIRROR)/authors/id/U/UR/URI
+PERL_FILE_SLURP_LICENSE = Artistic or GPL-1.0+
+PERL_FILE_SLURP_LICENSE_FILES = README
+
+$(eval $(perl-package))
-- 
2.14.4
