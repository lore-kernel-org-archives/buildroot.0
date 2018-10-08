From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 16:40:05 +0200
Subject: [Buildroot] [git commit] perl-file-sharedir-install: new package
Message-ID: <20181008143943.113448E36A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b9b8f106354f47dd0e7c957e53882b42ee2938f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only the host variant is added, needed as a build time dependency of
the target perl-file-sharedir package.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../perl-file-sharedir-install.hash                         |  6 ++++++
 .../perl-file-sharedir-install.mk                           | 13 +++++++++++++
 utils/scancpan                                              |  1 +
 3 files changed, 20 insertions(+)

diff --git a/package/perl-file-sharedir-install/perl-file-sharedir-install.hash b/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
new file mode 100644
index 0000000000..abbab34e98
--- /dev/null
+++ b/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5    5eabd44a5d7d84bf2e8e502491226287 File-ShareDir-Install-0.13.tar.gz
+sha256 45befdf0d95cbefe7c25a1daf293d85f780d6d2576146546e6828aad26e580f9 File-ShareDir-Install-0.13.tar.gz
+
+# computed by scancpan
+sha256 c207ca1c71c16a443d875a78d8aeccfbe550da502cd7fda24819548afb04fb5c LICENSE
diff --git a/package/perl-file-sharedir-install/perl-file-sharedir-install.mk b/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
new file mode 100644
index 0000000000..9b79b9fd17
--- /dev/null
+++ b/package/perl-file-sharedir-install/perl-file-sharedir-install.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# perl-file-sharedir-install
+#
+################################################################################
+
+PERL_FILE_SHAREDIR_INSTALL_VERSION = 0.13
+PERL_FILE_SHAREDIR_INSTALL_SOURCE = File-ShareDir-Install-$(PERL_FILE_SHAREDIR_INSTALL_VERSION).tar.gz
+PERL_FILE_SHAREDIR_INSTALL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
+PERL_FILE_SHAREDIR_INSTALL_LICENSE = Artistic or GPL-1.0+
+PERL_FILE_SHAREDIR_INSTALL_LICENSE_FILES = LICENSE
+
+$(eval $(host-perl-package))
diff --git a/utils/scancpan b/utils/scancpan
index 21c391fac5..5e6775afae 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -530,6 +530,7 @@ my %white_list = (
     'ExtUtils-Config' => 1,
     'ExtUtils-InstallPaths' => 1,
     'ExtUtils-Helpers' => 1,
+    'File-ShareDir-Install' => 1,
     'Module-Build' => 1,
     'Module-Build-Tiny' => 1,
 );
