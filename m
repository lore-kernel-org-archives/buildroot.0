From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 26 Jan 2012 22:22:36 +0100
Subject: [Buildroot] [git commit] expat: fix style and drop stray file
Message-ID: <20120126212542.4121F9058C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bc83dd2706082b140203a29084ca33c293cf6469
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/expat/Makefile.in |    3 ---
 package/expat/expat.mk    |    3 ---
 2 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/package/expat/Makefile.in b/package/expat/Makefile.in
deleted file mode 100644
index 1d5d6bc..0000000
--- a/package/expat/Makefile.in
+++ /dev/null
@@ -1,3 +0,0 @@
-ifeq ($(BR2_PACKAGE_EXPAT),y)
-TARGETS+=expat
-endif
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 64a1416..b179383 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -5,13 +5,10 @@
 #############################################################
 
 EXPAT_VERSION = 2.0.1
-EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.gz
 EXPAT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/expat
 EXPAT_INSTALL_STAGING = YES
-EXPAT_INSTALL_TARGET = YES
 EXPAT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) installlib
-
 EXPAT_DEPENDENCIES = host-pkg-config
 
 $(eval $(call AUTOTARGETS))
