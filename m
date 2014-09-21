From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 21:28:59 +0200
Subject: [Buildroot] [git commit] perl: fix build of native modules
Message-ID: <20140921200726.BAC499D73A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=39fadc2863d477433df4cad983c7c7216babdcd7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CORE/vutil.h is required when the host perl version is 5.20
see http://autobuild.buildroot.net/results/c3d/c3d48c3b3d6c1e616d8e20a2f65d8ba33abe61da/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/perl/perl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 01e0166..65c0a7d 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -117,6 +117,7 @@ endef
 define PERL_ADD_CORE_H
 	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/patchlevel-debian.h
 	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/cc_runtime.h
+	touch $(STAGING_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE/vutil.h
 endef
 
 PERL_POST_INSTALL_STAGING_HOOKS += PERL_ADD_CORE_H
