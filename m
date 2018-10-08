From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:26:33 +0200
Subject: [Buildroot] [git commit] perl-hash-multivalue: new package
Message-ID: <20181008083554.111EC8E12C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc3cdcd3ec78a77cb395f21872bc59dd54f0af3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                      |  1 +
 package/perl-hash-multivalue/Config.in                 |  6 ++++++
 package/perl-hash-multivalue/perl-hash-multivalue.hash |  6 ++++++
 package/perl-hash-multivalue/perl-hash-multivalue.mk   | 13 +++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 52e554e72b..0b9a0cb96d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -699,6 +699,7 @@ menu "Perl libraries/modules"
 	source "package/perl-gd/Config.in"
 	source "package/perl-gdgraph/Config.in"
 	source "package/perl-gdtextutil/Config.in"
+	source "package/perl-hash-multivalue/Config.in"
 	source "package/perl-html-parser/Config.in"
 	source "package/perl-html-tagset/Config.in"
 	source "package/perl-http-cookies/Config.in"
diff --git a/package/perl-hash-multivalue/Config.in b/package/perl-hash-multivalue/Config.in
new file mode 100644
index 0000000000..0883c95d86
--- /dev/null
+++ b/package/perl-hash-multivalue/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_HASH_MULTIVALUE
+	bool "perl-hash-multivalue"
+	help
+	  Store multiple values per key
+
+	  https://github.com/miyagawa/Hash-MultiValue
diff --git a/package/perl-hash-multivalue/perl-hash-multivalue.hash b/package/perl-hash-multivalue/perl-hash-multivalue.hash
new file mode 100644
index 0000000000..3a68650697
--- /dev/null
+++ b/package/perl-hash-multivalue/perl-hash-multivalue.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    508015312eb08cd2bcea987c4efbb93d Hash-MultiValue-0.16.tar.gz
+sha256 66181df7aa68e2786faf6895c88b18b95c800a8e4e6fb4c07fd176410a3c73f4 Hash-MultiValue-0.16.tar.gz
+
+# computed by scancpan
+sha256 af32512e13f6722dab770b989c57556a5e3d29a49b22b8ad5668064db8592401 LICENSE
diff --git a/package/perl-hash-multivalue/perl-hash-multivalue.mk b/package/perl-hash-multivalue/perl-hash-multivalue.mk
new file mode 100644
index 0000000000..f42bc6092c
--- /dev/null
+++ b/package/perl-hash-multivalue/perl-hash-multivalue.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-hash-multivalue
+#
+################################################################################
+
+PERL_HASH_MULTIVALUE_VERSION = 0.16
+PERL_HASH_MULTIVALUE_SOURCE = Hash-MultiValue-$(PERL_HASH_MULTIVALUE_VERSION).tar.gz
+PERL_HASH_MULTIVALUE_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AR/ARISTOTLE
+PERL_HASH_MULTIVALUE_LICENSE = Artistic or GPL-1.0+
+PERL_HASH_MULTIVALUE_LICENSE_FILES = LICENSE
+
+$(eval $(perl-package))
