From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 12:06:01 +0200
Subject: [Buildroot] [git commit] perl-extutils-config: new package
Message-ID: <20181008101250.3D43F8E2C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efab462124d5c1f27d531c508a16f8c0b9b3c0c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only the host variant is added, which is needed as a dependency of
perl-module-build-tiny (host), itself needed for
perl-apache-logformat-compiler (target).

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-extutils-config/perl-extutils-config.hash |  6 ++++++
 package/perl-extutils-config/perl-extutils-config.mk   | 13 +++++++++++++
 utils/scancpan                                         |  1 +
 3 files changed, 20 insertions(+)

diff --git a/package/perl-extutils-config/perl-extutils-config.hash b/package/perl-extutils-config/perl-extutils-config.hash
new file mode 100644
index 0000000000..518de84188
--- /dev/null
+++ b/package/perl-extutils-config/perl-extutils-config.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    565a7b09c7cac5907a25bbe2c959a717 ExtUtils-Config-0.008.tar.gz
+sha256 ae5104f634650dce8a79b7ed13fb59d67a39c213a6776cfdaa3ee749e62f1a8c ExtUtils-Config-0.008.tar.gz
+
+# computed by scancpan
+sha256 33b39fda54675d4d681764049e27b537cac12213aa6650667abea43662264ddc LICENSE
diff --git a/package/perl-extutils-config/perl-extutils-config.mk b/package/perl-extutils-config/perl-extutils-config.mk
new file mode 100644
index 0000000000..dfb8b26da7
--- /dev/null
+++ b/package/perl-extutils-config/perl-extutils-config.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-extutils-config
+#
+################################################################################
+
+PERL_EXTUTILS_CONFIG_VERSION = 0.008
+PERL_EXTUTILS_CONFIG_SOURCE = ExtUtils-Config-$(PERL_EXTUTILS_CONFIG_VERSION).tar.gz
+PERL_EXTUTILS_CONFIG_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
+PERL_EXTUTILS_CONFIG_LICENSE = Artistic or GPL-1.0+
+PERL_EXTUTILS_CONFIG_LICENSE_FILES = LICENSE
+
+$(eval $(host-perl-package))
diff --git a/utils/scancpan b/utils/scancpan
index c460e1665c..53a4f48623 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -527,6 +527,7 @@ my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'http://fastapi.metacpan.org/v1
 my $ua = HTTP::Tiny->new();
 
 my %white_list = (
+    'ExtUtils-Config' => 1,
     'Module-Build' => 1,
     'Module-Build-Tiny' => 1,
 );
