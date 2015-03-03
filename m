From: Francois Perrad <fperrad@gmail.com>
Date: Tue,  3 Mar 2015 20:53:06 +0100
Subject: [Buildroot] [PATCH] perl: fix build
Message-ID: <1425412386-12285-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see http://autobuild.buildroot.net/results/1c2/1c261b09f5a4a314d5dcbc1e5811af9c7d18658a/
(without adding host-bison as dependency)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl/perl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0636aba..cd4c286 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -85,6 +85,7 @@ endif
 define PERL_CONFIGURE_CMDS
 	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./configure $(PERL_CONF_OPTS))
 	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
+	touch $(@D)/x2p/a2p.c # prevents regen by yacc
 endef
 
 define PERL_BUILD_CMDS
-- 
2.1.0
