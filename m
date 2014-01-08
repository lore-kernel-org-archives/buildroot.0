From: Francois Perrad <fperrad@gmail.com>
Date: Wed,  8 Jan 2014 13:27:26 +0100
Subject: [Buildroot] [PATCH 1/2] perl: bump to version 5.18.2
Message-ID: <1389184048-21247-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 1c7df9b..bf8eac2 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PERL_VERSION_MAJOR = 18
-PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
+PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
 PERL_LICENSE = Artistic or GPLv1+
@@ -85,7 +85,7 @@ endef
 # perlcross's miniperl_top forgets base, which is required by mktables.
 # Instead of patching, it's easier to just set PERL5LIB
 define PERL_BUILD_CMDS
-	PERL5LIB=$(@D)/dist/base/lib $(MAKE1) -C $(@D) perl modules
+	PERL5LIB=$(@D)/dist/base/lib $(MAKE1) -C $(@D) all
 endef
 
 define PERL_INSTALL_STAGING_CMDS
-- 
1.7.9.5
