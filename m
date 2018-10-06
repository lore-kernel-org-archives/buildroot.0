From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  6 Oct 2018 18:55:14 +0200
Subject: [Buildroot] [PATCH 10/20] host-perl-extutils-config: new package
In-Reply-To: <20181006165524.23778-1-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
Message-ID: <20181006165524.23778-11-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 .../perl-extutils-config/perl-extutils-config.hash  |  6 ++++++
 .../perl-extutils-config/perl-extutils-config.mk    | 13 +++++++++++++
 utils/scancpan                                      |  1 +
 3 files changed, 20 insertions(+)
 create mode 100644 package/perl-extutils-config/perl-extutils-config.hash
 create mode 100644 package/perl-extutils-config/perl-extutils-config.mk

diff --git a/package/perl-extutils-config/perl-extutils-config.hash b/package/perl-extutils-config/perl-extutils-config.hash
new file mode 100644
index 000000000..518de8418
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
index 000000000..dfb8b26da
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
index c460e1665..53a4f4862 100755
--- a/utils/scancpan
+++ b/utils/scancpan
@@ -527,6 +527,7 @@ my $mcpan = MetaCPAN::API::Tiny->new(base_url => 'http://fastapi.metacpan.org/v1
 my $ua = HTTP::Tiny->new();
 
 my %white_list = (
+    'ExtUtils-Config' => 1,
     'Module-Build' => 1,
     'Module-Build-Tiny' => 1,
 );
-- 
2.17.1
