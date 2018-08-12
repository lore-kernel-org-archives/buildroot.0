From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:40:27 +0200
Subject: [Buildroot] [git commit branch/next] perl-file-slurp: new package
Message-ID: <20180812213440.50FEF8C9D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61bc823035249da55d37364c56c79fae278be4ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/perl-file-slurp/Config.in            |  7 +++++++
 package/perl-file-slurp/perl-file-slurp.hash |  6 ++++++
 package/perl-file-slurp/perl-file-slurp.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a1c037aedb..8348ce102f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -488,6 +488,7 @@ F:	package/perl-data-uuid/
 F:	package/perl-date-manip/
 F:	package/perl-dbi/
 F:	package/perl-device-serialport/
+F:	package/perl-file-slurp/
 
 N:	Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 F:	package/audit/
diff --git a/package/Config.in b/package/Config.in
index 23a5628f50..ba5b0e1699 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -684,6 +684,7 @@ menu "Perl libraries/modules"
 	source "package/perl-encode-detect/Config.in"
 	source "package/perl-encode-locale/Config.in"
 	source "package/perl-file-listing/Config.in"
+	source "package/perl-file-slurp/Config.in"
 	source "package/perl-file-util/Config.in"
 	source "package/perl-gd/Config.in"
 	source "package/perl-gdgraph/Config.in"
diff --git a/package/perl-file-slurp/Config.in b/package/perl-file-slurp/Config.in
new file mode 100644
index 0000000000..69a8871717
--- /dev/null
+++ b/package/perl-file-slurp/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_FILE_SLURP
+	bool "perl-file-slurp"
+	help
+	  Simple and Efficient Reading/Writing/Modifying of Complete
+	  Files
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
