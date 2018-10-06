From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2018 18:55:22 +0200
Subject: [Buildroot] [PATCH 18/20] host-perl-file-sharedir-install: new
 package
In-Reply-To: <20181006165524.23778-1-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
Message-ID: <20181006165524.23778-19-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-file-sharedir-install.hash                 |  6 ++++++
 .../perl-file-sharedir-install.mk                   | 13 +++++++++++++
 utils/scancpan                                      |  1 +
 3 files changed, 20 insertions(+)
 create mode 100644 package/perl-file-sharedir-install/perl-file-sharedir-install.hash
 create mode 100644 package/perl-file-sharedir-install/perl-file-sharedir-install.mk

diff --git a/package/perl-file-sharedir-install/perl-file-sharedir-install.hash b/package/perl-file-sharedir-install/perl-file-sharedir-install.hash
new file mode 100644
index 000000000..abbab34e9
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
index 000000000..9b79b9fd1
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
index 21c391fac..5e6775afa 100755
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
-- 
2.17.1
