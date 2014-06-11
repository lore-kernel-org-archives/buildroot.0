From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Jun 2014 11:17:32 +0200
Subject: [Buildroot] [git commit] perl-cross: bump to version 0.8.5 and move
	to github
Message-ID: <20140611092236.A1FC79CB10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d07eddf4407eb0f736ca1c87be43c4d2742f9c2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The perl-cross tarball allows to patch the Perl distribution (in a
_POST_EXTRACT_HOOKS).  The github helper gives a copy of the project which
allows to build this tarball.  So, the github helper can not be used here.

[Peter: mention the change to github]
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.mk |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 64ad7d3..d9e506e 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -12,9 +12,10 @@ PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
-PERL_CROSS_VERSION = 0.8.3
-PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
-PERL_CROSS_SITE    = http://download.berlios.de/perlcross
+PERL_CROSS_VERSION = 0.8.5
+PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).2
+# DO NOT refactor with the github helper (the result is not the same)
+PERL_CROSS_SITE    = http://raw.github.com/arsv/perl-cross/releases
 PERL_CROSS_SOURCE  = perl-$(PERL_CROSS_BASE_VERSION)-cross-$(PERL_CROSS_VERSION).tar.gz
 PERL_CROSS_OLD_POD = perl$(subst .,,$(PERL_CROSS_BASE_VERSION))delta.pod
 PERL_CROSS_NEW_POD = perl$(subst .,,$(PERL_VERSION))delta.pod
