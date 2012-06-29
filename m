From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 29 Jun 2012 16:40:04 +0200
Subject: [Buildroot] [git commit] mii-diag: remove unneded explicit static
	linking handling
Message-ID: <20120629144806.915228EE2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc1d20acb78a979ed03f03143db3900d972c3714
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that it is done globally instead.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mii-diag/mii-diag.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index f74fa3d..5adb270 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -10,10 +10,6 @@ MII_DIAG_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
 
 MII_DIAG_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)
 
-ifeq ($(BR2_PREFER_STATIC_LIB),y)
-MII_DIAG_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -static"
-endif
-
 define MII_DIAG_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
 		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
