From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 28 Jun 2021 22:30:03 +0200
Subject: [Buildroot] [git commit] package: gcnano-binaries: bump version to
 6.4.3
Message-ID: <20210628195848.A3B9E80E37@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59db11c7c445ef8662163a80997aa71f760a0359
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to last version of gcnano-binaries compatible with kernel
from StMicroelectronics version 5.10

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gcnano-binaries/gcnano-binaries.hash |  2 +-
 package/gcnano-binaries/gcnano-binaries.mk   | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/gcnano-binaries/gcnano-binaries.hash b/package/gcnano-binaries/gcnano-binaries.hash
index e753f944a3..e3efc82fc5 100644
--- a/package/gcnano-binaries/gcnano-binaries.hash
+++ b/package/gcnano-binaries/gcnano-binaries.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 255db9c58627f5f54fd15263647cc97a55927363fec42e7c8d7486170a65d84d  gcnano-binaries-c01642ed5e18cf09ecd905af193e935cb3be95ed.tar.gz
+sha256 afec2ba2f524821452d561b56afd2fc241293ea4a6e8598d1663f58e5d16800f  gcnano-binaries-1534c3eaabb5ae545a8f97e95f853531365a13fc.tar.gz
 sha256 7d209718473d18f69f75adb7caf9cb5d4b0a31da068756aa011bea617de3dc57  EULA
diff --git a/package/gcnano-binaries/gcnano-binaries.mk b/package/gcnano-binaries/gcnano-binaries.mk
index b27571a08c..af5fdd1b7e 100644
--- a/package/gcnano-binaries/gcnano-binaries.mk
+++ b/package/gcnano-binaries/gcnano-binaries.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-GCNANO_BINARIES_LIB_VERSION = 6.2.4
-GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_VERSION).p4
-GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_VERSION).p4-20190626
-GCNANO_BINARIES_VERSION = c01642ed5e18cf09ecd905af193e935cb3be95ed
+GCNANO_BINARIES_LIB_VERSION = 6.4
+GCNANO_BINARIES_LIB_REVISION = 3
+GCNANO_BINARIES_LIB_FULL_VERSION = $(GCNANO_BINARIES_LIB_VERSION).$(GCNANO_BINARIES_LIB_REVISION)
+GCNANO_BINARIES_DRIVER_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)
+GCNANO_BINARIES_USERLAND_VERSION = $(GCNANO_BINARIES_LIB_FULL_VERSION)-20200902
+GCNANO_BINARIES_VERSION = 1534c3eaabb5ae545a8f97e95f853531365a13fc
 GCNANO_BINARIES_SITE = $(call github,STMicroelectronics,gcnano-binaries,$(GCNANO_BINARIES_VERSION))
 
 GCNANO_BINARIES_LICENSE = MIT, Vivante End User Software License Terms
@@ -43,7 +45,7 @@ GCNANO_BINARIES_MODULE_MAKE_OPTS = \
 	DEBUG=0
 
 GCNANO_BINARIES_LIBRARIES = \
-	gbm_viv libEGL libGAL libgbm libGLESv1_CM \
+	libgbm_viv libEGL libGAL libgbm libGLESv1_CM \
 	libGLESv2 libGLSLC libOpenVG libVSC
 
 GCNANO_BINARIES_USERLAND_SUBDIR = gcnano-userland-multi-$(GCNANO_BINARIES_USERLAND_VERSION)
