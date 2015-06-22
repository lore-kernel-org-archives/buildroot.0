From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Jun 2015 00:39:09 +0200
Subject: [Buildroot] [git commit] package/perl: Fix typos in HOSTCC
	specification
Message-ID: <20150622223931.7239C8046A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f2aabda7d05a9af9dba81e976042bafdd2bf5d69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Albert Lee <trisk@omniti.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/perl/perl.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 93efc57..c3569a9 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -75,7 +75,7 @@ PERL_CONF_OPTS += --only-mod=$(subst $(space),$(comma),$(PERL_MODULES))
 endif
 
 define PERL_CONFIGURE_CMDS
-	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./configure $(PERL_CONF_OPTS))
+	(cd $(@D); HOSTCC='$(HOSTCC_NOCCACHE)' ./configure $(PERL_CONF_OPTS))
 	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
 endef
 
@@ -101,7 +101,7 @@ HOST_PERL_CONF_OPTS = \
 	-Dcc="$(HOSTCC)"
 
 define HOST_PERL_CONFIGURE_CMDS
-	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./Configure $(HOST_PERL_CONF_OPTS))
+	(cd $(@D); HOSTCC='$(HOSTCC_NOCCACHE)' ./Configure $(HOST_PERL_CONF_OPTS))
 endef
 
 define HOST_PERL_BUILD_CMDS
