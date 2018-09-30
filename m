From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 10:44:17 +0200
Subject: [Buildroot] [git commit] package/efl: bump to version 1.21.1
Message-ID: <20180930084531.3D82088E82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fddf14061df3d5a2b983eb5321d27ebe43a6e6e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove the --enable-i-really-know-what-i-am-doing[...] option removed by
upstream [1]. But keep BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG at Kconfig
level for Buildroot users since "warnings for disabling features have
been left intact".

Update license file hash since dates was removed from the license text.

[1] https://git.enlightenment.org/core/efl.git/commit/?id=1cda9fe749636484b1328e694a8dbbe4f9d0c31d

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/efl.hash | 11 ++++++-----
 package/efl/efl.mk   | 11 ++---------
 2 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 1391d1f707..bbefdeec66 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,10 +1,11 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.20.7.tar.xz.sha256
-sha256 b0a9b765bcd7b012f1072da1d491fc8671aa089473f746901d93f5807a2c76fe  efl-1.20.7.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.21.1.tar.xz.sha256
+sha256 44774b42b3dbbbe4d124c8fddcd169c6ffab9d602d1a757abcfb9a84e001a928 efl-1.21.1.tar.xz
+
 sha256 d949e42ca8fd48d275c397c5fc2ac34c9b63ada715dcaf1a670e17bb62964341  COMPLIANCE
 sha256 1f0597d326e2fdb54aa2f0caec6d8bb0afb9941ef32475f017ed02ca214fcf37  COPYING
-sha256 781ee841d15835b393bfe7d4c6497dc1b05217479abd40daceaf7aa102a758e1  licenses/COPYING.BSD
+sha256 af4ffe7ed1795a6e9cd3b3ce8747fdc45da449ff58cf35b8027c0699a66fd5cf  licenses/COPYING.BSD
 sha256 e60d07dfb2c5264f9f405fa52bf0d4f85429dd9ae1bc2ffcff8af1924ef720d1  licenses/COPYING.FTL
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/COPYING.GPL
-sha256 89f79ccd2c35ba220ddeba70ee36ca867226c41fc210bc5e7f1e9032c5b16d5f  licenses/COPYING.LGPL
+sha256 ae2d99bf2a8e8310281bdbe5e8b78cbe5e89bfead8c01e67a8c68b530efcf25a  licenses/COPYING.LGPL
 sha256 2996a1c43ee757f9c997a829d82bdd584052323e73cf02ff8126c6fbd95c2d87  licenses/COPYING.NGINX-MIT
-sha256 48f124212f8fc024392a2d1d011fbb96c7ab8f89c0b72c671c33e9e1cb1d0790  licenses/COPYING.SMALL
+sha256 d847c749aa38b8d864665fc4e5c80e2f2a505e414fafe9712e85b5154e908218  licenses/COPYING.SMALL
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 6ef7d53385..c4fd676be1 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.20.7
+EFL_VERSION = 1.21.1
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
@@ -50,11 +50,6 @@ EFL_CONF_OPTS = \
 	--enable-liblz4 \
 	--with-doxygen=no
 
-# Disable untested configuration warning.
-ifeq ($(BR2_PACKAGE_EFL_HAS_RECOMMENDED_CONFIG),)
-EFL_CONF_OPTS += --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-abb
-endif
-
 ifeq ($(BR2_PACKAGE_EFL_EOLIAN_CPP),y)
 EFL_CONF_OPTS += --enable-cxx-bindings \
 	--with-eolian-cxx=$(HOST_DIR)/bin/eolian_cxx
@@ -345,7 +340,6 @@ HOST_EFL_DEPENDENCIES = \
 # --with-doxygen: disable doxygen documentation
 # --with-net-control=none: disable connman networkmanager.
 # --with-x11=none: remove dependency on X.org.
-#   Yes I really know what I am doing.
 HOST_EFL_CONF_OPTS += \
 	--disable-audio \
 	--disable-fontconfig \
@@ -372,8 +366,7 @@ HOST_EFL_CONF_OPTS += \
 	--with-glib=yes \
 	--with-net-control=none \
 	--with-opengl=none \
-	--with-x11=none \
-	--enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-abb
+	--with-x11=none
 
 # Enable Eolian language bindings to provide eolian_cxx tool for the
 # host which is required to build Eolian language bindings for the
