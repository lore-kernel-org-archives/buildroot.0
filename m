From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Mar 2017 14:23:52 +0100
Subject: [Buildroot] [git commit] classpath: xmlj requires threads.
Message-ID: <20170318132408.CC3D281DC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7bd485ad8f460356e545c39f38cd18b673c9a6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/bb1f005948803fac9e753c2d3ba1e53bb78a0456

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/classpath/classpath.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/classpath/classpath.mk b/package/classpath/classpath.mk
index e4cd0f8..47658c2 100644
--- a/package/classpath/classpath.mk
+++ b/package/classpath/classpath.mk
@@ -52,7 +52,7 @@ else
 CLASSPATH_CONF_OPTS += --disable-gtk-peer --disable-gstreamer-peer
 endif
 
-ifeq ($(BR2_PACKAGE_LIBXML2)$(BR2_PACKAGE_LIBXSLT),yy)
+ifeq ($(BR2_PACKAGE_LIBXML2)$(BR2_PACKAGE_LIBXSLT)$(BR2_TOOLCHAIN_HAS_THREADS),yyy)
 CLASSPATH_CONF_OPTS += --enable-xmlj
 CLASSPATH_DEPENDENCIES += libxml2 libxslt
 else
