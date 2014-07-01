From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 15:05:31 +0200
Subject: [Buildroot] [git commit] perl-net-ssleay: fix build
Message-ID: <20140701130717.D219C9D11E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63d0d8040ab4ba8956a13dafd73e2fa044e29c8b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cc_runtime.h is present in old perl distribution
see http://autobuild.buildroot.net/results/6dd/6dd6bf7d0a814aa508062636fd72de1d07c1816a/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index d9e506e..8321570 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -110,10 +110,11 @@ endef
 # As a work-around, explicitly create this header file in $(STAGING_DIR).
 # It doesn't hurt to create it even if the system perl doesn't need it.
 #
-define PERL_ADD_PATCHLEVEL_DEBIAN_H
+define PERL_ADD_CORE_H
 	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/patchlevel-debian.h
+	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/cc_runtime.h
 endef
 
-PERL_POST_INSTALL_STAGING_HOOKS += PERL_ADD_PATCHLEVEL_DEBIAN_H
+PERL_POST_INSTALL_STAGING_HOOKS += PERL_ADD_CORE_H
 
 $(eval $(generic-package))
