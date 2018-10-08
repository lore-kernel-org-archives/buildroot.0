From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 12:09:43 +0200
Subject: [Buildroot] [git commit] perl-extutils-installpaths: new package
Message-ID: <20181008101250.4D4308E200@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8136d8fb24835b00096a3200e30ccc70a1fd13f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only the host variant is added, which is needed as a dependency of
perl-module-build-tiny (host), itself needed for
perl-apache-logformat-compiler (target).

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../perl-extutils-installpaths.hash                        |  6 ++++++
 .../perl-extutils-installpaths.mk                          | 14 ++++++++++++++
 utils/scancpan                                             |  1 +
 3 files changed, 21 insertions(+)

diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
new file mode 100644
index 0000000000..2627a27d50
--- /dev/null
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    9a8d66aab1ffec98ea260faf03ac612b ExtUtils-InstallPaths-0.012.tar.gz
+sha256 84735e3037bab1fdffa3c2508567ad412a785c91599db3c12593a50a1dd434ed ExtUtils-InstallPaths-0.012.tar.gz
+
+# computed by scancpan
+sha256 b95d38ac031587625625d92fbd2ee1d5df0d02606057d680e7dcf3598fe629f9 LICENSE
diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.mk b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
new file mode 100644
index 0000000000..75b4c5f235
--- /dev/null
+++ b/package/perl-extutils-installpaths/perl-extutils-installpaths.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-extutils-installpaths
+#
+################################################################################
+
+PERL_EXTUTILS_INSTALLPATHS_VERSION = 0.012
+PERL_EXTUTILS_INSTALLPATHS_SOURCE = ExtUtils-InstallPaths-$(PERL_EXTUTILS_INSTALLPATHS_VERSION).tar.gz
+PERL_EXTUTILS_INSTALLPATHS_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
+HOST_PERL_EXTUTILS_INSTALLPATHS_DEPENDENCIES = host-perl-extutils-config
+PERL_EXTUTILS_INSTALLPATHS_LICENSE = Artistic or GPL-1.0+
+PERL_EXTUTILS_INSTALLPATHS_LICENSE_FILES = LICENSE
+
+$(eval $(host-perl-package))
diff --git a/utils/scancpan b/utils/scancpan
index 35bbeab1bb..21c391fac5 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -528,6 +528,7 @@ my $ua = HTTP::Tiny->new();
 
 my %white_list = (
     'ExtUtils-Config' => 1,
+    'ExtUtils-InstallPaths' => 1,
     'ExtUtils-Helpers' => 1,
     'Module-Build' => 1,
     'Module-Build-Tiny' => 1,
