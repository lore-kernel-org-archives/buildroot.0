From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 07:31:03 -0300
Subject: [Buildroot] [PATCH] perl: needs host-bison
Message-ID: <1425378663-2659-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's from last bump, fixes:
http://autobuild.buildroot.net/results/1c2/1c261b09f5a4a314d5dcbc1e5811af9c7d18658a/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/perl/perl.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 0636aba..81e6275 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -8,6 +8,7 @@ PERL_VERSION_MAJOR = 20
 PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
+PERL_DEPENDENCIES = host-bison
 PERL_LICENSE = Artistic or GPLv1+
 PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
@@ -88,7 +89,7 @@ define PERL_CONFIGURE_CMDS
 endef
 
 define PERL_BUILD_CMDS
-	$(MAKE1) -C $(@D) all
+	PATH=$(BR_PATH) $(MAKE1) -C $(@D) all
 endef
 
 define PERL_INSTALL_STAGING_CMDS
@@ -101,7 +102,7 @@ endef
 
 # We never want to have host-berkeleydb or host-gdbm as dependencies
 # of host-perl.
-HOST_PERL_DEPENDENCIES =
+HOST_PERL_DEPENDENCIES = host-bison
 
 HOST_PERL_CONF_OPTS = \
 	-des \
@@ -113,7 +114,7 @@ define HOST_PERL_CONFIGURE_CMDS
 endef
 
 define HOST_PERL_BUILD_CMDS
-	$(MAKE) -C $(@D)
+	PATH=$(BR_PATH) $(MAKE) -C $(@D)
 endef
 
 define HOST_PERL_INSTALL_CMDS
-- 
2.0.5
