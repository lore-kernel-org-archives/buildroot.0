From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Apr 2020 07:39:10 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add valgrind support
Message-ID: <20200428052428.677E190A06@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6d1876d7a357e3bef5cc3e5ad4982a5230a1ba5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
