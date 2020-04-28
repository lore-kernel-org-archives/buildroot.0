From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 27 Apr 2020 23:22:25 -0600
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: add valgrind support
Message-ID: <20200428052225.121426-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mesa3d/mesa3d.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 22eff24c56..ab10194a6a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -25,8 +25,7 @@ MESA3D_DEPENDENCIES = \
 
 MESA3D_CONF_OPTS = \
 	-Dgallium-omx=disabled \
-	-Dpower8=false \
-	-Dvalgrind=false
+	-Dpower8=false
 
 ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
 MESA3D_DEPENDENCIES += host-llvm llvm
@@ -242,6 +241,13 @@ else
 MESA3D_CONF_OPTS += -Dgallium-xvmc=false
 endif
 
+ifeq ($(BR2_PACKAGE_VALGRIND),y)
+MESA3D_CONF_OPTS += -Dvalgrind=true
+MESA3D_DEPENDENCIES += valgrind
+else
+MESA3D_CONF_OPTS += -Dvalgrind=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 MESA3D_CONF_OPTS += -Dlibunwind=true
 MESA3D_DEPENDENCIES += libunwind
-- 
2.20.1
