From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  3 Jan 2017 17:01:18 +0100
Subject: [Buildroot] [PATCH 2/2] perl-cross: bump to version 1.1.2
In-Reply-To: <20170103160118.13616-1-francois.perrad@gadz.org>
References: <20170103160118.13616-1-francois.perrad@gadz.org>
Message-ID: <20170103160118.13616-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.hash | 4 ++--
 package/perl/perl.mk   | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/perl/perl.hash b/package/perl/perl.hash
index ac417a3..9c40a53 100644
--- a/package/perl/perl.hash
+++ b/package/perl/perl.hash
@@ -3,5 +3,5 @@ md5    99f39abe614b50719d9915431e54fc1e                                 perl-5.2
 sha1   298fa605138c1a00dab95643130ae0edab369b4d                         perl-5.24.0.tar.bz2
 sha256 62328a53d157e8153b33e137594155f6f8b64418f7f9238210feb809585290e0 perl-5.24.0.tar.bz2
 
-# No upstream hashes for the following
-sha256 cac4616274edaef81f48d8880d4224e05b81d0033ebad45d42a3a18664c3409c perl-5.24.0-cross-1.0.3.tar.gz
+# Hashes from: http://github.com/arsv/perl-cross/releases/download/1.1.2/perl-cross-1.1.2.hash
+sha256 2a1b0a3ffe866bc3fd32c947c0a866360d2f26576c8f1c5c0b521d3a6e9d643d perl-cross-1.1.2.tar.gz
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 88bacef..f808a47 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -13,11 +13,10 @@ PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 1.0.3
-PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).0
+PERL_CROSS_VERSION = 1.1.2
 # DO NOT refactor with the github helper (the result is not the same)
 PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
-PERL_CROSS_SOURCE = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
+PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
 PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
 
 # We use the perlcross hack to cross-compile perl. It should
@@ -83,11 +82,11 @@ define PERL_BUILD_CMDS
 endef
 
 define PERL_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR="$(STAGING_DIR)" install.perl
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR="$(STAGING_DIR)" install.perl install.sym
 endef
 
 define PERL_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) DESTDIR="$(TARGET_DIR)" install.perl install.sym
 endef
 
 HOST_PERL_CONF_OPTS = \
-- 
2.9.3
