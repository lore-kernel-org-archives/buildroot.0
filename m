From: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Date: Sat, 18 Mar 2017 14:07:07 +0100
Subject: [Buildroot] [PATCH 1/1] classpath: xmlj requires threads.
Message-ID: <1489842427-12463-1-git-send-email-m.hoffmann@cartelsol.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/bb1f005948803fac9e753c2d3ba1e53bb78a0456
Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
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
-- 
2.7.4
