From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Jan 2014 22:34:19 +0100
Subject: [Buildroot] [git commit] perl: bump to version 5.18.2
Message-ID: <20140108213639.C282D9C3E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=542801aca9dcfc68fc9588d117f97ea54df54954
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
