From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 20:04:42 +0200
Subject: [Buildroot] [PATCH 06/15] package/libsoxr: cleanup configure options
In-Reply-To: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1413741891-30113-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BUILD_SHARED_LIBS is already driven by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/libsoxr/libsoxr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsoxr/libsoxr.mk b/package/libsoxr/libsoxr.mk
index 528d5c1..316fbe2 100644
--- a/package/libsoxr/libsoxr.mk
+++ b/package/libsoxr/libsoxr.mk
@@ -13,7 +13,7 @@ LIBSOXR_INSTALL_STAGING = YES
 LIBSOXR_CONF_OPTS = -DWITH_OPENMP=OFF
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-LIBSOXR_CONF_OPTS += -DBUILD_SHARED_LIBS:BOOL=OFF
+LIBSOXR_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
 endif
 
 ifeq ($(call qstrip,$(BR2_ENDIAN)),BIG)
-- 
2.1.2
