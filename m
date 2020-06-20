From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Jun 2020 08:56:20 +0200
Subject: [Buildroot] [git commit] package/lbcamera: don't override
 _CONF_OPTS, but append
Message-ID: <20200620065639.BC6A682943@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f835da1c6d7ab59f459e66932ccfbfe5d49560b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 99cc53f3f4 (package/libcamera: add v4l2 compatibility layer
option) incorrectly added the v4l2 option, which makes it so that
the previous options are overrdien.

Fix that by using an append-assignment.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcamera/libcamera.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index fb0e54785b..ebdf2dba34 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -37,9 +37,9 @@ LIBCAMERA_LICENSE_FILES = \
 	LICENSES/CC-BY-SA-4.0.txt
 
 ifeq ($(BR2_PACKAGE_LIBCAMERA_V4L2),y)
-LIBCAMERA_CONF_OPTS = -Dv4l2=true
+LIBCAMERA_CONF_OPTS += -Dv4l2=true
 else
-LIBCAMERA_CONF_OPTS = -Dv4l2=false
+LIBCAMERA_CONF_OPTS += -Dv4l2=false
 endif
 
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
