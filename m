From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 13 Mar 2014 16:26:37 +0100
Subject: [Buildroot] [PATCH] modem-manager: install to staging
Message-ID: <1394724397-1867-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

network-manager can use modem-manager as a plug-in, so install
modem-manager development files to stating.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/modem-manager/modem-manager.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index a2d046d..352f69a 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -10,6 +10,7 @@ MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager/
 MODEM_MANAGER_LICENSE = GPLv2+ (programs, plugins), LGPLv2+ (libmm-glib)
 MODEM_MANAGER_LICENSE_FILES = COPYING
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib host-intltool
+MODEM_MANAGER_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
 	MODEM_MANAGER_DEPENDENCIES += libqmi
-- 
1.7.7
