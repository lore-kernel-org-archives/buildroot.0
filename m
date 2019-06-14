From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 14 Jun 2019 23:03:35 +0200
Subject: [Buildroot] [PATCH 16/27] package/libspatialindex: use common
 BR2_TOOLCHAIN_HAS_BUG_68485
In-Reply-To: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190614210346.121013-17-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For consistency with the rest of packages let's use common
BR2_TOOLCHAIN_HAS_BUG_68485 instead of !BR2_microblaze condition with
comment on top of it.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
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
 
-- 
2.17.1
