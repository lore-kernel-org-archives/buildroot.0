From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Dec 2011 21:13:58 +0100
Subject: [Buildroot] [git commit] libosip: bump version,
	use upstream directly
Message-ID: <20111212202250.DF8208F92D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62c10600ab3a0958c9a141de7f99cfbf55308cd9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of Debian.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libosip2/libosip2.mk |   22 ++++------------------
 1 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 29d2a55..1d53f76 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -3,24 +3,10 @@
 # libosip2
 #
 #############################################################
-LIBOSIP2_VERSION = 3.3.0
-LIBOSIP2_SOURCE = libosip2_$(LIBOSIP2_VERSION).orig.tar.gz
-LIBOSIP2_PATCH = libosip2_$(LIBOSIP2_VERSION)-1.diff.gz
-LIBOSIP2_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/libo/libosip2
-LIBOSIP2_INSTALL_STAGING = YES
-
-ifneq ($(LIBOSIP2_PATCH),)
-define LIBOSIP2_DEBIAN_PATCHES
-	if [ -d $(@D)/debian/patches ]; then \
-		(cd $(@D)/debian/patches && for i in *; \
-		 do $(SED) 's,^\+\+\+ .*cvs-$(LIBOSIP2_VERSION)/,+++ cvs-$(LIBOSIP2_VERSION)/,' $$i; \
-		 done; \
-		); \
-		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*; \
-	fi
-endef
-endif
 
-LIBOSIP2_POST_PATCH_HOOKS += LIBOSIP2_DEBIAN_PATCHES
+LIBOSIP2_VERSION = 3.6.0
+LIBOSIP2_SOURCE = libosip2-$(LIBOSIP2_VERSION).tar.gz
+LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
+LIBOSIP2_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
