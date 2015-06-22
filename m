From: Albert Lee <trisk@omniti.com>
Date: Mon, 22 Jun 2015 18:05:14 -0400
Subject: [Buildroot] [PATCH] package/perl: Fix typos in HOSTCC specification
In-Reply-To: <87si9j8nxg.fsf@dell.be.48ers.dk>
References: <87si9j8nxg.fsf@dell.be.48ers.dk>
Message-ID: <1435010714-23580-1-git-send-email-trisk@omniti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Albert Lee <trisk@omniti.com>
---
 package/perl/perl.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.7.10.4
