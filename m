From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 21:49:16 +0200
Subject: [Buildroot] [git commit] perl: bump to version 5.18.1
Message-ID: <20130902213321.A5CD09B6CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8a9126dedacbbd528ecd57329935ef8ea021af0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cpanminus/cpanminus.mk |    4 ++--
 package/perl/perl.mk           |    8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
index 52921b5..b315388 100644
--- a/package/cpanminus/cpanminus.mk
+++ b/package/cpanminus/cpanminus.mk
@@ -11,9 +11,9 @@ CPANMINUS_DEPENDENCIES = host-qemu perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NA
 
 CPANMINUS_RUN_PERL = $(QEMU_USER) $(STAGING_DIR)/usr/bin/perl
 CPANMINUS_ARCHNAME = $(shell $(CPANMINUS_RUN_PERL) -MConfig -e "print Config->{archname}")
-CPANMINUS_PERL_LIB      = $(STAGING_DIR)/usr/lib/perl5
+CPANMINUS_PERL_LIB      = $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)
 CPANMINUS_PERL_SITELIB  = $(TARGET_DIR)/usr/lib/perl5/site_perl/$(PERL_VERSION)
-CPANMINUS_PERL_ARCHLIB  = $(CPANMINUS_PERL_LIB)/$(PERL_VERSION)/$(CPANMINUS_ARCHNAME)
+CPANMINUS_PERL_ARCHLIB  = $(CPANMINUS_PERL_LIB)/$(CPANMINUS_ARCHNAME)
 CPANMINUS_PERL_SITEARCH = $(CPANMINUS_PERL_SITELIB)/$(CPANMINUS_ARCHNAME)
 CPANMINUS_PERL5LIB = $(CPANMINUS_PERL_SITEARCH):$(CPANMINUS_PERL_SITELIB):$(CPANMINUS_PERL_ARCHLIB):$(CPANMINUS_PERL_LIB)
 ifneq ($(BR2_PACKAGE_CPANMINUS_MIRROR),"")
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 37a38f7..25314f0 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -4,16 +4,16 @@
 #
 ################################################################################
 
-PERL_VERSION_MAJOR = 16
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
+PERL_VERSION_MAJOR = 18
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
 PERL_LICENSE = Artistic
 PERL_LICENSE_FILES = Artistic
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 0.7.4
-PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).3
+PERL_CROSS_VERSION = 0.8
+PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).0
 PERL_CROSS_SITE    = http://download.berlios.de/perlcross
 PERL_CROSS_SOURCE  = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
 PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
