From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 23:45:31 +0100
Subject: [Buildroot] [git commit] package/perl-gd: drop gdlib-config
Message-ID: <20210123222631.23DF67F9EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a291be2e89bc64388c10dae50233c751a86733d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop gdlib-config as it won't be available after the bump to version
2.3.0. If gdlib-config is not available, perl-gd fallbacks on glibc.pc
since version 2.57:
https://github.com/lstein/Perl-GD/commit/069e6cfff61e10c71474d75ed20d2ca11abc8f0e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perl-gd/perl-gd.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/perl-gd/perl-gd.mk b/package/perl-gd/perl-gd.mk
index d34328f0de..b058672a23 100644
--- a/package/perl-gd/perl-gd.mk
+++ b/package/perl-gd/perl-gd.mk
@@ -7,7 +7,7 @@
 PERL_GD_VERSION = 2.73
 PERL_GD_SOURCE = GD-$(PERL_GD_VERSION).tar.gz
 PERL_GD_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RU/RURBAN
-PERL_GD_DEPENDENCIES = zlib libpng freetype gd
+PERL_GD_DEPENDENCIES = host-pkgconf zlib libpng freetype gd
 PERL_GD_LICENSE = Artistic or GPL-1.0+
 PERL_GD_LICENSE_FILES = LICENSE
 PERL_GD_DISTNAME = GD
@@ -16,7 +16,6 @@ PERL_GD_CONF_OPTS = \
 	-lib_gd_path=$(STAGING_DIR)/usr \
 	-lib_ft_path=$(STAGING_DIR)/usr \
 	-lib_png_path=$(STAGING_DIR)/usr \
-	-lib_zlib_path=$(STAGING_DIR)/usr \
-	-gdlib_config_path=$(STAGING_DIR)/usr/bin
+	-lib_zlib_path=$(STAGING_DIR)/usr
 
 $(eval $(perl-package))
