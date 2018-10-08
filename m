From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 12:07:58 +0200
Subject: [Buildroot] [git commit] perl-extutils-helpers: new package
Message-ID: <20181008101250.44D148E200@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe66b114a2fa15ee805df618fe98acd0aea3a6d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only the host variant is added, which is needed as a dependency of
perl-module-build-tiny (host), itself needed for
perl-apache-logformat-compiler (target).

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-extutils-helpers/perl-extutils-helpers.hash |  6 ++++++
 package/perl-extutils-helpers/perl-extutils-helpers.mk   | 13 +++++++++++++
 utils/scancpan                                           |  1 +
 3 files changed, 20 insertions(+)

diff --git a/package/perl-extutils-helpers/perl-extutils-helpers.hash b/package/perl-extutils-helpers/perl-extutils-helpers.hash
new file mode 100644
index 0000000000..2d291901e6
--- /dev/null
+++ b/package/perl-extutils-helpers/perl-extutils-helpers.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    83b00c1e401321c425ae5db6b2b2fd12 ExtUtils-Helpers-0.026.tar.gz
+sha256 de901b6790a4557cf4ec908149e035783b125bf115eb9640feb1bc1c24c33416 ExtUtils-Helpers-0.026.tar.gz
+
+# computed by scancpan
+sha256 e5530d0ebc8662df3a970644d867faf12760b1a95ca6e2bf1c5f9af410a418e0 LICENSE
diff --git a/package/perl-extutils-helpers/perl-extutils-helpers.mk b/package/perl-extutils-helpers/perl-extutils-helpers.mk
new file mode 100644
index 0000000000..82f34925fa
--- /dev/null
+++ b/package/perl-extutils-helpers/perl-extutils-helpers.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-extutils-helpers
+#
+################################################################################
+
+PERL_EXTUTILS_HELPERS_VERSION = 0.026
+PERL_EXTUTILS_HELPERS_SOURCE = ExtUtils-Helpers-$(PERL_EXTUTILS_HELPERS_VERSION).tar.gz
+PERL_EXTUTILS_HELPERS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
+PERL_EXTUTILS_HELPERS_LICENSE = Artistic or GPL-1.0+
+PERL_EXTUTILS_HELPERS_LICENSE_FILES = LICENSE
+
+$(eval $(host-perl-package))
diff --git a/utils/scancpan b/utils/scancpan
index 53a4f48623..35bbeab1bb 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -528,6 +528,7 @@ my $ua = HTTP::Tiny->new();
 
 my %white_list = (
     'ExtUtils-Config' => 1,
+    'ExtUtils-Helpers' => 1,
     'Module-Build' => 1,
     'Module-Build-Tiny' => 1,
 );
