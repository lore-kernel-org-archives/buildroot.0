From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 21:38:25 +0200
Subject: [Buildroot] [git commit] Revert "package/weston: disable -NDEBUG"
Message-ID: <20210704190629.129C68D59B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc0fb99f0307e43c5c3d366695f62bb5aec4aa27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Setting NDEBUG is no longer done by the infra.

This reverts commit 4d46a18555ad5c024b6d5fb28cf6f3cc0b2b0d5b.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/weston/weston.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 0a4a661e48..69ee11d23c 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -19,8 +19,6 @@ WESTON_CONF_OPTS = \
 	-Dcolor-management-colord=false \
 	-Dremoting=false
 
-WESTON_CFLAGS="$(TARGET_CFLAGS) -UNDEBUG"
-
 # Uses VIDIOC_EXPBUF, only available from 3.8+
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
 WESTON_CONF_OPTS += -Dsimple-clients=dmabuf-v4l
