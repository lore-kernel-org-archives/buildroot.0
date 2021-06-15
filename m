From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 14 Jun 2021 18:55:34 -0600
Subject: [Buildroot] [PATCH 1/1] package/weston: disable -NDEBUG
Message-ID: <20210615005534.4155014-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/f42/f420890de1b52786f8cf5f2922b69c909162eaa1/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/weston/weston.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 8afe4bbab4..abafb3a6d9 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -19,6 +19,8 @@ WESTON_CONF_OPTS = \
 	-Dcolor-management-colord=false \
 	-Dremoting=false
 
+WESTON_CFLAGS="$(TARGET_CFLAGS) -UNDEBUG"
+
 # Uses VIDIOC_EXPBUF, only available from 3.8+
 ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
 WESTON_CONF_OPTS += -Dsimple-clients=dmabuf-v4l
-- 
2.25.1
