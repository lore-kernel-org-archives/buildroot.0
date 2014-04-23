From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:27 +0200
Subject: [Buildroot] [PATCH 08/14] rpi-userland: cleanup *_CONF_OPT
In-Reply-To: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398293313-17580-9-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rpi-userland does not need -DBUILD_SHARED_LIBS=OFF to be passed to
correclty build its static libraries; so remove this cmake flag from the
configure options.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v1 -> v2:
- new patch
---
 package/rpi-userland/rpi-userland.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 7188dcf..bec5d46 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -9,7 +9,7 @@ RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3c
 RPI_USERLAND_LICENSE_FILES = LICENCE
 RPI_USERLAND_INSTALL_STAGING = YES
-RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=OFF
+RPI_USERLAND_CONF_OPT = -DVMCS_INSTALL_PREFIX=/usr
 
 define RPI_USERLAND_POST_TARGET_CLEANUP
     rm -Rf $(TARGET_DIR)/usr/src
-- 
1.9.2
