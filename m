From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 21:25:04 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20210328192020.ECFCF87B83@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df7757a532aee829f0368c7a0a784565f2a3d464
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream removed x11 dependency from vaapi support:
https://github.com/tvheadend/tvheadend/commit/ecd05a21de3075466476df97cf37ffd42c787e58

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tvheadend/tvheadend.hash | 2 +-
 package/tvheadend/tvheadend.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index b987a735eb..1c896df140 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b5e58601da7af383c2c7f27016417a478be0d302a4a8a00ec87fc8bdacc56ef1  tvheadend-febcf9818d7c37fec8a98d424934edcb3243d5e4.tar.gz
+sha256  fc734c36c98aa1535172621c3b6fcac9f1d253f850abc50d01b771937bfd2a76  tvheadend-dbaa0f850394af8ab845df802f5f781ac0218ec4.tar.gz
 sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index e19763e186..114142bfa9 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = febcf9818d7c37fec8a98d424934edcb3243d5e4
+TVHEADEND_VERSION = dbaa0f850394af8ab845df802f5f781ac0218ec4
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
@@ -29,7 +29,7 @@ endif
 ifeq ($(BR2_PACKAGE_TVHEADEND_TRANSCODING),y)
 TVHEADEND_CONF_OPTS += --enable-libav --enable-libx264
 TVHEADEND_DEPENDENCIES += ffmpeg x264
-ifeq ($(BR2_PACKAGE_LIBVA)$(BR2_PACKAGE_XORG7),yy)
+ifeq ($(BR2_PACKAGE_LIBVA),y)
 TVHEADEND_CONF_OPTS += --enable-vaapi
 TVHEADEND_DEPENDENCIES += libva
 else
