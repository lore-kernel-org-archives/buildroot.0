From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Jan 2014 20:56:21 +0100
Subject: [Buildroot] [PATCH 1/3] package/rpi-userland: fix fall-out after
	cmake infra change
In-Reply-To: <cover.1390593263.git.yann.morin.1998@free.fr>
References: <cover.1390593263.git.yann.morin.1998@free.fr>
Message-ID: <f1e089f08a99fa89b5c7facdc5fc320f1e6c4cb4.1390593263.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Cset 9fa7f2b (pkg-cmake.mk: build shared library when !BR2_PREFER_STATIC_LIB)
broke rpi-userland.

Force not building shared libs for rpi-userland, since they are broken.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 35eaf24..223b645 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -9,7 +9,7 @@ RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
-RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
+RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=OFF
 
 define RPI_USERLAND_POST_TARGET_CLEANUP
     rm -Rf $(TARGET_DIR)/usr/src
-- 
1.8.1.2
