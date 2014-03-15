From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Mar 2014 22:59:04 +0100
Subject: [Buildroot] [git commit] modem-manager: install to staging
Message-ID: <20140315220126.E4A709BFF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0fd54d2823ed6fc98d267f49bd194cba61a7dca2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

network-manager can use modem-manager as a plug-in, so install
modem-manager development files to stating.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
