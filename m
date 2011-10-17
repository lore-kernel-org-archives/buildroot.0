From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 17 Oct 2011 23:30:06 +0200
Subject: [Buildroot] [git commit] mutt: bump to version 1.5.21
Message-ID: <20111018052253.5783D8D1BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79f5d0e3b97edcf6f43c270a505d0462bcdab4e8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...0080114-nodoc.patch => mutt-1.5.21-nodoc.patch} |    0
 package/mutt/mutt.mk                               |   22 ++++---------------
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/package/mutt/mutt-1.5.17+20080114-nodoc.patch b/package/mutt/mutt-1.5.21-nodoc.patch
similarity index 100%
rename from package/mutt/mutt-1.5.17+20080114-nodoc.patch
rename to package/mutt/mutt-1.5.21-nodoc.patch
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 4b75cc8..4c8e399 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -3,23 +3,11 @@
 # mutt
 #
 #############################################################
-MUTT_VERSION:=1.5.17+20080114
-MUTT_SOURCE:=mutt_$(MUTT_VERSION).orig.tar.gz
-MUTT_PATCH:=mutt_$(MUTT_VERSION)-1.diff.gz
-MUTT_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mutt/
-MUTT_DEPENDENCIES=ncurses
-MUTT_CONF_OPT = \
-		--disable-smtp \
-		--disable-iconv \
-		--without-wc-funcs
-MUTT_AUTORECONF=YES
 
-define MUTT_APPLY_DEBIAN_PATCHES
-        if [ -d $(@D)/debian/patches ]; then \
-                support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
-        fi
-endef
-
-MUTT_POST_PATCH_HOOKS += MUTT_APPLY_DEBIAN_PATCHES
+MUTT_VERSION = 1.5.21
+MUTT_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/mutt
+MUTT_DEPENDENCIES = ncurses
+MUTT_CONF_OPT = --disable-iconv --disable-smtp
+MUTT_AUTORECONF = YES
 
 $(eval $(call AUTOTARGETS))
