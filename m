From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 24 Apr 2019 14:58:57 -0400
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.50.1
Message-ID: <20190424185857.55349-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also switch to using the github macro for MESON_SITE.

Tested against systemd and glib-networking.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index fadef6df8a..c3964bc8a8 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.49.2/meson-0.49.2.tar.gz.asc
-sha256 ef9f14326ec1e30d3ba1a26df0f92826ede5a79255ad723af78a2691c37109fd meson-0.49.2.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.50.1/meson-0.50.1.tar.gz.asc
+sha256 e9f52047f26636ee512439c01755064656db5faecdd68e9af09dc772d829198c meson-0.50.1.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 49e27f5527..73e79861ae 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.49.2
-MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
+MESON_VERSION = 0.50.1
+MESON_SITE = $(call github,mesonbuild,meson,$(MESON_VERSION))
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
 MESON_SETUP_TYPE = setuptools
-- 
2.20.1
