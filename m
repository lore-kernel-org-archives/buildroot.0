From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Aug 2009 11:43:07 +0200
Subject: [Buildroot] [git commit] buildroot: fix fallout after qtopia4 -> qt
	rename
Message-ID: <20090803094356.A8D147768A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5b72dda69f72e1953dfc7987dd1b418e1afe79a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/java/classpath/classpath.mk                |    4 +-
 package/java/jamvm/jamvm.mk                        |    4 +-
 scripts/test/Config.in.test.buildall               |    2 +-
 .../integrator926_huge_defconfig                   |    2 +-
 .../Atmel/at91rm9200df/at91rm9200df_defconfig      |    2 +-
 .../at91rm9200df/at91rm9200df_ext_bare_defconfig   |    2 +-
 .../Atmel/at91rm9200df/at91rm9200df_ext_defconfig  |    2 +-
 .../Atmel/at91sam9260dfc/arm_toolchain_defconfig   |    2 +-
 .../Atmel/at91sam9260dfc/at91sam9260dfc_defconfig  |    2 +-
 .../at91sam9260dfc_ext_bare_defconfig              |    2 +-
 .../at91sam9260dfc/at91sam9260dfc_ext_defconfig    |    2 +-
 .../Atmel/at91sam9260pf/at91sam9260pf_defconfig    |    2 +-
 .../Atmel/at91sam9261ek/at91sam9261ek_defconfig    |    2 +-
 .../at91sam9261ek/at91sam9261ek_ext_bare_defconfig |    2 +-
 .../at91sam9261ek/at91sam9261ek_ext_defconfig      |    2 +-
 .../Atmel/at91sam9263ek/at91sam9263ek_defconfig    |    2 +-
 .../at91sam9263ek/at91sam9263ek_ext_bare_defconfig |    2 +-
 .../at91sam9263ek/at91sam9263ek_ext_defconfig      |    2 +-
 .../Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig  |    2 +-
 .../at91sam9g20dfc_ext_bare_defconfig              |    2 +-
 .../at91sam9g20dfc/at91sam9g20dfc_ext_defconfig    |    2 +-
 target/device/Atmel/atngw100/atngw100_defconfig    |    2 +-
 target/device/Atmel/atstk1005/atstk1005_defconfig  |    2 +-
 target/device/Atmel/atstk100x/atstk100x_defconfig  |  114 ++++++++++----------
 target/device/KwikByte/kb9202/kb9202_defconfig     |    2 +-
 target/device/valka/v100sc2_defconfig              |   86 ++++++++--------
 target/device/x86/i686/i386_defconfig              |    2 +-
 target/device/x86/i686/i686_defconfig              |    2 +-
 28 files changed, 128 insertions(+), 128 deletions(-)

diff --git a/package/java/classpath/classpath.mk b/package/java/classpath/classpath.mk
index d037adf..9e1905f 100644
--- a/package/java/classpath/classpath.mk
+++ b/package/java/classpath/classpath.mk
@@ -63,8 +63,8 @@ else
 	CLASSPATH_CONF_OPT+= --disable-alsa
 endif
 
-ifeq ($(BR2_PACKAGE_QTOPIA4),y)
-	CLASSPATH_DEPENDENCIES+= qtopia4
+ifeq ($(BR2_PACKAGE_QT),y)
+	CLASSPATH_DEPENDENCIES+= qt
 	CLASSPATH_CONF_OPT+= --enable-qt-peer
 else
 	CLASSPATH_CONF_OPT+= --disable-qt-peer
diff --git a/package/java/jamvm/jamvm.mk b/package/java/jamvm/jamvm.mk
index 750bfae..00c413c 100644
--- a/package/java/jamvm/jamvm.mk
+++ b/package/java/jamvm/jamvm.mk
@@ -79,8 +79,8 @@ else
 endif
 
 #Enable or disable qt backend
-ifeq ($(BR2_PACKAGE_QTOPIA4),y)
-	JAMVM_DEPENDENCIES+= qtopia4
+ifeq ($(BR2_PACKAGE_QT),y)
+	JAMVM_DEPENDENCIES+= qt
 	JAMVM_CONF_OPT+= --enable-qt-peer
 else
 	JAMVM_CONF_OPT+= --disable-qt-peer
diff --git a/scripts/test/Config.in.test.buildall b/scripts/test/Config.in.test.buildall
index 7183963..cc9f6a4 100644
--- a/scripts/test/Config.in.test.buildall
+++ b/scripts/test/Config.in.test.buildall
@@ -550,7 +550,7 @@ config BR2_TARGET_TEST_PACKAGES
 	select BR2_PACKAGE_TIFF
 	select BR2_PACKAGE_FBV
 	select BR2_PACKAGE_FBSET
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 	select BR2_PACKAGE_XSERVER_none
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig b/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
index fdbabe0..a7cdda7 100644
--- a/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
+++ b/target/device/ARMLTD/integrator926_huge/integrator926_huge_defconfig
@@ -561,7 +561,7 @@ BR2_PACKAGE_NCURSES=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 
diff --git a/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig b/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
index 255f81a..7eb49a0 100644
--- a/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
+++ b/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
@@ -737,7 +737,7 @@ BR2_PACKAGE_NCURSES=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig b/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig
index 457d69b..ee7a2e5 100644
--- a/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig
+++ b/target/device/Atmel/at91rm9200df/at91rm9200df_ext_bare_defconfig
@@ -548,7 +548,7 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig b/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig
index ae6cb14..b70fcbd 100644
--- a/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig
+++ b/target/device/Atmel/at91rm9200df/at91rm9200df_ext_defconfig
@@ -662,7 +662,7 @@ BR2_PACKAGE_NCURSES=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig b/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig
index e2a5ae8..3113aae 100644
--- a/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig
+++ b/target/device/Atmel/at91sam9260dfc/arm_toolchain_defconfig
@@ -628,7 +628,7 @@ BR2_CROSS_TOOLCHAIN_TARGET_UTILS=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
index dc5892d..e3a1566 100644
--- a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
+++ b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
@@ -751,7 +751,7 @@ BR2_PACKAGE_NCURSES=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_bare_defconfig b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_bare_defconfig
index 37196a3..cfb45b1 100644
--- a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_bare_defconfig
+++ b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_bare_defconfig
@@ -548,7 +548,7 @@ BR2_TOOLCHAIN_EXTERNAL_PREFIX="$(ARCH)-linux"
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_defconfig b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_defconfig
index 0ae3fbd..98f2303 100644
--- a/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_defconfig
+++ b/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_ext_defconfig
@@ -670,7 +670,7 @@ BR2_PACKAGE_NCURSES=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig b/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig
index b6c0ea0..d9fadb7 100644
--- a/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig
+++ b/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig
@@ -499,7 +499,7 @@ BR2_PACKAGE_FBSET=y
 # other GUIs
 #
 # BR2_PACKAGE_QTE is not set
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_x11r7 is not set
 # BR2_PACKAGE_XSERVER_xorg is not set
diff --git a/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig b/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
index 4427334..5a922bc 100644
--- a/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
+++ b/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
@@ -751,7 +751,7 @@ BR2_PACKAGE_FBSET=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig b/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig
index 42519ad..f261d9a 100644
--- a/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig
+++ b/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_bare_defconfig
@@ -551,7 +551,7 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig b/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig
index 37e6426..61d4ff8 100644
--- a/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig
+++ b/target/device/Atmel/at91sam9261ek/at91sam9261ek_ext_defconfig
@@ -707,7 +707,7 @@ BR2_PACKAGE_FBSET=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig b/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
index e4e1e11..ae8c0e0 100644
--- a/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
+++ b/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
@@ -748,7 +748,7 @@ BR2_PACKAGE_FBSET=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig b/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig
index 988c7df..cc31254 100644
--- a/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig
+++ b/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_bare_defconfig
@@ -550,7 +550,7 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig b/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig
index 10fabcb..c42bf14 100644
--- a/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig
+++ b/target/device/Atmel/at91sam9263ek/at91sam9263ek_ext_defconfig
@@ -669,7 +669,7 @@ BR2_PACKAGE_FBSET=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
index 97df4fe..ef8fdba 100644
--- a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
+++ b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_defconfig
@@ -685,7 +685,7 @@ BR2_PACKAGE_NCURSES=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig
index d2eb609..48fe7ff 100644
--- a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig
+++ b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_bare_defconfig
@@ -548,7 +548,7 @@ BR2_TARGET_OPTIMIZATION="-Os -pipe"
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig
index 41cb613..c19a0d9 100644
--- a/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig
+++ b/target/device/Atmel/at91sam9g20dfc/at91sam9g20dfc_ext_defconfig
@@ -670,7 +670,7 @@ BR2_PACKAGE_NCURSES=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/atngw100/atngw100_defconfig b/target/device/Atmel/atngw100/atngw100_defconfig
index cbb6cc4..e1840b8 100644
--- a/target/device/Atmel/atngw100/atngw100_defconfig
+++ b/target/device/Atmel/atngw100/atngw100_defconfig
@@ -611,7 +611,7 @@ BR2_PACKAGE_LINUX_FUSION=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/atstk1005/atstk1005_defconfig b/target/device/Atmel/atstk1005/atstk1005_defconfig
index 4ccc3c6..41f2c12 100644
--- a/target/device/Atmel/atstk1005/atstk1005_defconfig
+++ b/target/device/Atmel/atstk1005/atstk1005_defconfig
@@ -656,7 +656,7 @@ BR2_PACKAGE_NCURSES=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/Atmel/atstk100x/atstk100x_defconfig b/target/device/Atmel/atstk100x/atstk100x_defconfig
index abb86f8..89f392f 100644
--- a/target/device/Atmel/atstk100x/atstk100x_defconfig
+++ b/target/device/Atmel/atstk100x/atstk100x_defconfig
@@ -686,14 +686,14 @@ BR2_PACKAGE_FBSET=y
 #
 # other GUIs
 #
-BR2_PACKAGE_QTOPIA4=y
-# BR2_PACKAGE_QTOPIA4_DEBUG is not set
-BR2_PACKAGE_QTOPIA4_SHARED=y
-# BR2_PACKAGE_QTOPIA4_STATIC is not set
-# BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL is not set
-# BR2_PACKAGE_QTOPIA4_LICENSE_APPROVED is not set
-# BR2_PACKAGE_QTOPIA4_QT3SUPPORT is not set
-BR2_PACKAGE_QTOPIA4_GUI_MODULE=y
+BR2_PACKAGE_QT=y
+# BR2_PACKAGE_QT_DEBUG is not set
+BR2_PACKAGE_QT_SHARED=y
+# BR2_PACKAGE_QT_STATIC is not set
+# BR2_PACKAGE_QT_LICENSE_TYPE_COMMERCIAL is not set
+# BR2_PACKAGE_QT_LICENSE_APPROVED is not set
+# BR2_PACKAGE_QT_QT3SUPPORT is not set
+BR2_PACKAGE_QT_GUI_MODULE=y
 
 #
 # Pixel depths
@@ -702,63 +702,63 @@ BR2_PACKAGE_QTOPIA4_GUI_MODULE=y
 #
 # Deselecting each option leads to Qt's default (8,16,32)
 #
-# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_ALL is not set
-# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_1 is not set
-# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_4 is not set
-BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_8=y
-# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_12 is not set
-# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_15 is not set
-BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_16=y
-# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_18 is not set
-# BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_24 is not set
-BR2_PACKAGE_QTOPIA4_PIXEL_DEPTH_32=y
-BR2_PACKAGE_QTOPIA4_GIF=y
-BR2_PACKAGE_QTOPIA4_LIBMNG=y
-BR2_PACKAGE_QTOPIA4_NOJPEG=y
-# BR2_PACKAGE_QTOPIA4_SYSTEMJPEG is not set
-# BR2_PACKAGE_QTOPIA4_QTJPEG is not set
-BR2_PACKAGE_QTOPIA4_NOPNG=y
-# BR2_PACKAGE_QTOPIA4_SYSTEMPNG is not set
-# BR2_PACKAGE_QTOPIA4_QTPNG is not set
-BR2_PACKAGE_QTOPIA4_NOTIFF=y
-# BR2_PACKAGE_QTOPIA4_SYSTEMTIFF is not set
-# BR2_PACKAGE_QTOPIA4_QTTIFF is not set
-BR2_PACKAGE_QTOPIA4_QTZLIB=y
-# BR2_PACKAGE_QTOPIA4_SYSTEMZLIB is not set
-BR2_PACKAGE_QTOPIA4_NOFREETYPE=y
-# BR2_PACKAGE_QTOPIA4_QTFREETYPE is not set
-# BR2_PACKAGE_QTOPIA4_SYSTEMFREETYPE is not set
-BR2_PACKAGE_QTOPIA4_EMB_PLATFORM="$(ARCH)"
-# BR2_PACKAGE_QTOPIA4_SQL_MODULE is not set
+# BR2_PACKAGE_QT_PIXEL_DEPTH_ALL is not set
+# BR2_PACKAGE_QT_PIXEL_DEPTH_1 is not set
+# BR2_PACKAGE_QT_PIXEL_DEPTH_4 is not set
+BR2_PACKAGE_QT_PIXEL_DEPTH_8=y
+# BR2_PACKAGE_QT_PIXEL_DEPTH_12 is not set
+# BR2_PACKAGE_QT_PIXEL_DEPTH_15 is not set
+BR2_PACKAGE_QT_PIXEL_DEPTH_16=y
+# BR2_PACKAGE_QT_PIXEL_DEPTH_18 is not set
+# BR2_PACKAGE_QT_PIXEL_DEPTH_24 is not set
+BR2_PACKAGE_QT_PIXEL_DEPTH_32=y
+BR2_PACKAGE_QT_GIF=y
+BR2_PACKAGE_QT_LIBMNG=y
+BR2_PACKAGE_QT_NOJPEG=y
+# BR2_PACKAGE_QT_SYSTEMJPEG is not set
+# BR2_PACKAGE_QT_QTJPEG is not set
+BR2_PACKAGE_QT_NOPNG=y
+# BR2_PACKAGE_QT_SYSTEMPNG is not set
+# BR2_PACKAGE_QT_QTPNG is not set
+BR2_PACKAGE_QT_NOTIFF=y
+# BR2_PACKAGE_QT_SYSTEMTIFF is not set
+# BR2_PACKAGE_QT_QTTIFF is not set
+BR2_PACKAGE_QT_QTZLIB=y
+# BR2_PACKAGE_QT_SYSTEMZLIB is not set
+BR2_PACKAGE_QT_NOFREETYPE=y
+# BR2_PACKAGE_QT_QTFREETYPE is not set
+# BR2_PACKAGE_QT_SYSTEMFREETYPE is not set
+BR2_PACKAGE_QT_EMB_PLATFORM="$(ARCH)"
+# BR2_PACKAGE_QT_SQL_MODULE is not set
 
 #
 # Graphics drivers
 #
-BR2_PACKAGE_QTOPIA4_GFX_LINUXFB=y
-# BR2_PACKAGE_QTOPIA4_GFX_TRANSFORMED is not set
-# BR2_PACKAGE_QTOPIA4_GFX_QVFB is not set
-# BR2_PACKAGE_QTOPIA4_GFX_VNC is not set
-# BR2_PACKAGE_QTOPIA4_GFX_MULTISCREEN is not set
+BR2_PACKAGE_QT_GFX_LINUXFB=y
+# BR2_PACKAGE_QT_GFX_TRANSFORMED is not set
+# BR2_PACKAGE_QT_GFX_QVFB is not set
+# BR2_PACKAGE_QT_GFX_VNC is not set
+# BR2_PACKAGE_QT_GFX_MULTISCREEN is not set
 
 #
 # Mouse drivers
 #
-# BR2_PACKAGE_QTOPIA4_MOUSE_PC is not set
-# BR2_PACKAGE_QTOPIA4_MOUSE_BUS is not set
-# BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP is not set
-# BR2_PACKAGE_QTOPIA4_MOUSE_YOPY is not set
-# BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX is not set
-# BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB is not set
-# BR2_PACKAGE_QTOPIA4_MOUSE_QVFB is not set
-# BR2_PACKAGE_QTOPIA4_PHONON is not set
-BR2_PACKAGE_QTOPIA4_XML=y
-# BR2_PACKAGE_QTOPIA4_XMLPATTERNS is not set
-# BR2_PACKAGE_QTOPIA4_SVG is not set
-BR2_PACKAGE_QTOPIA4_NETWORK=y
-# BR2_PACKAGE_QTOPIA4_WEBKIT is not set
-# BR2_PACKAGE_QTOPIA4_OPENSSL is not set
-BR2_PACKAGE_QTOPIA4_SCRIPT=y
-# BR2_PACKAGE_QTOPIA4_SCRIPTTOOLS is not set
+# BR2_PACKAGE_QT_MOUSE_PC is not set
+# BR2_PACKAGE_QT_MOUSE_BUS is not set
+# BR2_PACKAGE_QT_MOUSE_LINUXTP is not set
+# BR2_PACKAGE_QT_MOUSE_YOPY is not set
+# BR2_PACKAGE_QT_MOUSE_VR41XX is not set
+# BR2_PACKAGE_QT_MOUSE_TSLIB is not set
+# BR2_PACKAGE_QT_MOUSE_QVFB is not set
+# BR2_PACKAGE_QT_PHONON is not set
+BR2_PACKAGE_QT_XML=y
+# BR2_PACKAGE_QT_XMLPATTERNS is not set
+# BR2_PACKAGE_QT_SVG is not set
+BR2_PACKAGE_QT_NETWORK=y
+# BR2_PACKAGE_QT_WEBKIT is not set
+# BR2_PACKAGE_QT_OPENSSL is not set
+BR2_PACKAGE_QT_SCRIPT=y
+# BR2_PACKAGE_QT_SCRIPTTOOLS is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/KwikByte/kb9202/kb9202_defconfig b/target/device/KwikByte/kb9202/kb9202_defconfig
index 45c1c66..78af5f4 100644
--- a/target/device/KwikByte/kb9202/kb9202_defconfig
+++ b/target/device/KwikByte/kb9202/kb9202_defconfig
@@ -563,7 +563,7 @@ BR2_GRAPHIC_SUPPORT=y
 # other GUIs
 #
 # BR2_PACKAGE_QTE is not set
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_x11r7 is not set
 # BR2_PACKAGE_XSERVER_xorg is not set
diff --git a/target/device/valka/v100sc2_defconfig b/target/device/valka/v100sc2_defconfig
index 03ab78b..81f5081 100644
--- a/target/device/valka/v100sc2_defconfig
+++ b/target/device/valka/v100sc2_defconfig
@@ -542,57 +542,57 @@ BR2_PACKAGE_NCURSES=y
 #
 # other GUIs
 #
-BR2_PACKAGE_QTOPIA4=y
-# BR2_PACKAGE_QTOPIA4_DEBUG is not set
-BR2_PACKAGE_QTOPIA4_SHARED=y
-# BR2_PACKAGE_QTOPIA4_STATIC is not set
-BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_GPL=y
-# BR2_PACKAGE_QTOPIA4_LICENSE_TYPE_COMMERCIAL is not set
-BR2_PACKAGE_QTOPIA4_GPL_LICENSE_APPROVED=y
-# BR2_PACKAGE_QTOPIA4_QT3SUPPORT is not set
-BR2_PACKAGE_QTOPIA4_DEPTHS="-depths 24,16,8"
-BR2_PACKAGE_QTOPIA4_GIF=y
-# BR2_PACKAGE_QTOPIA4_LIBMNG is not set
-# BR2_PACKAGE_QTOPIA4_NOJPEG is not set
-# BR2_PACKAGE_QTOPIA4_SYSTEMJPEG is not set
-BR2_PACKAGE_QTOPIA4_QTJPEG=y
-# BR2_PACKAGE_QTOPIA4_NOPNG is not set
-# BR2_PACKAGE_QTOPIA4_SYSTEMPNG is not set
-BR2_PACKAGE_QTOPIA4_QTPNG=y
-# BR2_PACKAGE_QTOPIA4_NOTIFF is not set
-# BR2_PACKAGE_QTOPIA4_SYSTEMTIFF is not set
-BR2_PACKAGE_QTOPIA4_QTTIFF=y
-BR2_PACKAGE_QTOPIA4_QTZLIB=y
-# BR2_PACKAGE_QTOPIA4_SYSTEMZLIB is not set
-# BR2_PACKAGE_QTOPIA4_NOFREETYPE is not set
-BR2_PACKAGE_QTOPIA4_QTFREETYPE=y
-# BR2_PACKAGE_QTOPIA4_SYSTEMFREETYPE is not set
-BR2_PACKAGE_QTOPIA4_EMB_PLATFORM="avr32"
-# BR2_PACKAGE_QTOPIA4_SQL_MODULE is not set
+BR2_PACKAGE_QT=y
+# BR2_PACKAGE_QT_DEBUG is not set
+BR2_PACKAGE_QT_SHARED=y
+# BR2_PACKAGE_QT_STATIC is not set
+BR2_PACKAGE_QT_LICENSE_TYPE_GPL=y
+# BR2_PACKAGE_QT_LICENSE_TYPE_COMMERCIAL is not set
+BR2_PACKAGE_QT_GPL_LICENSE_APPROVED=y
+# BR2_PACKAGE_QT_QT3SUPPORT is not set
+BR2_PACKAGE_QT_DEPTHS="-depths 24,16,8"
+BR2_PACKAGE_QT_GIF=y
+# BR2_PACKAGE_QT_LIBMNG is not set
+# BR2_PACKAGE_QT_NOJPEG is not set
+# BR2_PACKAGE_QT_SYSTEMJPEG is not set
+BR2_PACKAGE_QT_QTJPEG=y
+# BR2_PACKAGE_QT_NOPNG is not set
+# BR2_PACKAGE_QT_SYSTEMPNG is not set
+BR2_PACKAGE_QT_QTPNG=y
+# BR2_PACKAGE_QT_NOTIFF is not set
+# BR2_PACKAGE_QT_SYSTEMTIFF is not set
+BR2_PACKAGE_QT_QTTIFF=y
+BR2_PACKAGE_QT_QTZLIB=y
+# BR2_PACKAGE_QT_SYSTEMZLIB is not set
+# BR2_PACKAGE_QT_NOFREETYPE is not set
+BR2_PACKAGE_QT_QTFREETYPE=y
+# BR2_PACKAGE_QT_SYSTEMFREETYPE is not set
+BR2_PACKAGE_QT_EMB_PLATFORM="avr32"
+# BR2_PACKAGE_QT_SQL_MODULE is not set
 
 #
 # Graphics drivers
 #
-BR2_PACKAGE_QTOPIA4_GFX_LINUXFB=y
-# BR2_PACKAGE_QTOPIA4_GFX_TRANSFORMED is not set
-# BR2_PACKAGE_QTOPIA4_GFX_QVFB is not set
-BR2_PACKAGE_QTOPIA4_GFX_VNC=y
-BR2_PACKAGE_QTOPIA4_GFX_MULTISCREEN=y
+BR2_PACKAGE_QT_GFX_LINUXFB=y
+# BR2_PACKAGE_QT_GFX_TRANSFORMED is not set
+# BR2_PACKAGE_QT_GFX_QVFB is not set
+BR2_PACKAGE_QT_GFX_VNC=y
+BR2_PACKAGE_QT_GFX_MULTISCREEN=y
 
 #
 # Mouse drivers
 #
-# BR2_PACKAGE_QTOPIA4_MOUSE_PC is not set
-# BR2_PACKAGE_QTOPIA4_MOUSE_BUS is not set
-# BR2_PACKAGE_QTOPIA4_MOUSE_LINUXTP is not set
-# BR2_PACKAGE_QTOPIA4_MOUSE_YOPY is not set
-# BR2_PACKAGE_QTOPIA4_MOUSE_VR41XX is not set
-# BR2_PACKAGE_QTOPIA4_MOUSE_TSLIB is not set
-# BR2_PACKAGE_QTOPIA4_MOUSE_QVFB is not set
-# BR2_PACKAGE_QTOPIA4_XMLPATTERNS is not set
-BR2_PACKAGE_QTOPIA4_SVG=y
-BR2_PACKAGE_QTOPIA4_WEBKIT=y
-BR2_PACKAGE_QTOPIA4_OPENSSL=y
+# BR2_PACKAGE_QT_MOUSE_PC is not set
+# BR2_PACKAGE_QT_MOUSE_BUS is not set
+# BR2_PACKAGE_QT_MOUSE_LINUXTP is not set
+# BR2_PACKAGE_QT_MOUSE_YOPY is not set
+# BR2_PACKAGE_QT_MOUSE_VR41XX is not set
+# BR2_PACKAGE_QT_MOUSE_TSLIB is not set
+# BR2_PACKAGE_QT_MOUSE_QVFB is not set
+# BR2_PACKAGE_QT_XMLPATTERNS is not set
+BR2_PACKAGE_QT_SVG=y
+BR2_PACKAGE_QT_WEBKIT=y
+BR2_PACKAGE_QT_OPENSSL=y
 
 #
 # X Window System server
diff --git a/target/device/x86/i686/i386_defconfig b/target/device/x86/i686/i386_defconfig
index 6f0a2c9..74de3e0 100644
--- a/target/device/x86/i686/i386_defconfig
+++ b/target/device/x86/i686/i386_defconfig
@@ -588,7 +588,7 @@ BR2_PACKAGE_MTD_SUMTOOL=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
diff --git a/target/device/x86/i686/i686_defconfig b/target/device/x86/i686/i686_defconfig
index 463e5b7..441b7a6 100644
--- a/target/device/x86/i686/i686_defconfig
+++ b/target/device/x86/i686/i686_defconfig
@@ -588,7 +588,7 @@ BR2_PACKAGE_MTD_SUMTOOL=y
 #
 # other GUIs
 #
-# BR2_PACKAGE_QTOPIA4 is not set
+# BR2_PACKAGE_QT is not set
 BR2_PACKAGE_XSERVER_none=y
 # BR2_PACKAGE_XSERVER_xorg is not set
 # BR2_PACKAGE_XSERVER_tinyx is not set
-- 
1.6.3.3
