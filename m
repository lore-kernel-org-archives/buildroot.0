From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2018 18:55:16 +0200
Subject: [Buildroot] [PATCH 12/20] host-perl-extutils-installpaths: new
 package
In-Reply-To: <20181006165524.23778-1-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
Message-ID: <20181006165524.23778-13-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-extutils-installpaths.hash                |  6 ++++++
 .../perl-extutils-installpaths.mk                  | 14 ++++++++++++++
 utils/scancpan                                     |  1 +
 3 files changed, 21 insertions(+)
 create mode 100644 package/perl-extutils-installpaths/perl-extutils-installpaths.hash
 create mode 100644 package/perl-extutils-installpaths/perl-extutils-installpaths.mk

diff --git a/package/perl-extutils-installpaths/perl-extutils-installpaths.hash b/package/perl-extutils-installpaths/perl-extutils-installpaths.hash
new file mode 100644
index 000000000..2627a27d5
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
index 000000000..75b4c5f23
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
index 35bbeab1b..21c391fac 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -528,6 +528,7 @@ my $ua = HTTP::Tiny->new();
 
 my %white_list = (
     'ExtUtils-Config' => 1,
+    'ExtUtils-InstallPaths' => 1,
     'ExtUtils-Helpers' => 1,
     'Module-Build' => 1,
     'Module-Build-Tiny' => 1,
-- 
2.17.1
