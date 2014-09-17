From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 17 Sep 2014 20:51:05 +0200
Subject: [Buildroot] [PATCH] perl: fix build of native modules
Message-ID: <1410979865-26207-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CORE/vutil.h is required when the host perl version is 5.20
see http://autobuild.buildroot.net/results/c3d/c3d48c3b3d6c1e616d8e20a2f65d8ba33abe61da/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk | 1 +
 1 file changed, 1 insertion(+)

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
-- 
1.9.1
