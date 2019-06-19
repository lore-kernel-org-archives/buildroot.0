From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 21:53:39 +0200
Subject: [Buildroot] [git commit] package/libspatialindex: use
 BR2_TOOLCHAIN_HAS_BUG_68485 option
Message-ID: <20190619195308.2E2DF8110E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01322e386f5d1a45bce433b5a4ff722e92e0ab0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For consistency with the rest of packages let's use the common
BR2_TOOLCHAIN_HAS_BUG_68485 option instead of !BR2_microblaze
condition with the comment on top of it.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libspatialindex/libspatialindex.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/libspatialindex/libspatialindex.mk b/package/libspatialindex/libspatialindex.mk
index 3a558dfc7e..8dd85e2700 100644
--- a/package/libspatialindex/libspatialindex.mk
+++ b/package/libspatialindex/libspatialindex.mk
@@ -17,9 +17,7 @@ LIBSPATIALINDEX_AUTORECONF = YES
 LIBSPATIALINDEX_CXXFLAGS = $(TARGET_CXXFLAGS)
 LIBSPATIALINDEX_CONF_ENV = CXXFLAGS="$(LIBSPATIALINDEX_CXXFLAGS)"
 
-# Workaround gcc ICE
-# (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485)
-ifeq ($(BR2_microblaze),y)
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
 LIBSPATIALINDEX_CXXFLAGS += -O0
 endif
 
