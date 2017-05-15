From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 14:11:46 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/bluez_utils: add
	missing host-pkgconf dependency
Message-ID: <20170515125328.6113E7FB96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38314e4cbed69a050082ef1e1121bf0a86eb1de8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

The configure script use pkg-config.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit d5fec33bd5e4a928d60bdc8693ca2917b3e91a43)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez_utils/bluez_utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 1c93f2e..9761dc2 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -8,7 +8,7 @@ BLUEZ_UTILS_VERSION = 4.101
 BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.xz
 BLUEZ_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ_UTILS_INSTALL_STAGING = YES
-BLUEZ_UTILS_DEPENDENCIES = dbus libglib2
+BLUEZ_UTILS_DEPENDENCIES = host-pkgconf dbus libglib2
 BLUEZ_UTILS_CONF_OPTS = --enable-test --enable-tools
 BLUEZ_UTILS_AUTORECONF = YES
 BLUEZ_UTILS_LICENSE = GPLv2+, LGPLv2.1+
