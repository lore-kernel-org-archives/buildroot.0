From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Jun 2021 23:27:56 +0200
Subject: [Buildroot] [git commit] package/weston: disable -NDEBUG
Message-ID: <20210624205630.BBF8B8E21F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d46a18555ad5c024b6d5fb28cf6f3cc0b2b0d5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Per upstream -NDEBUG should not be set for any builds:
https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/643#note_958356

Fixes:
http://autobuild.buildroot.net/results/f42/f420890de1b52786f8cf5f2922b69c909162eaa1/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/weston/weston.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 69ee11d23c..0a4a661e48 100644
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
