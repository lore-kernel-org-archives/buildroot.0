From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 16:04:04 +0200
Subject: [Buildroot] [git commit] package/bluez_utils: add missing check
	dependency for test program
Message-ID: <20170514140452.383EF8288A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8554be9f82301282161cf6310bacdb6067fefb16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tests are enabled since this has been introduced [1], so keep
them for now.

bluez_utils needs check tool and check if it's available [2].

[1] 06c3e2159686a886e52b2522a47e60c300cfb7f7
[2] https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/configure.ac?h=4.101#n51

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bluez_utils/bluez_utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bluez_utils/bluez_utils.mk b/package/bluez_utils/bluez_utils.mk
index 526804a..256f012 100644
--- a/package/bluez_utils/bluez_utils.mk
+++ b/package/bluez_utils/bluez_utils.mk
@@ -8,7 +8,7 @@ BLUEZ_UTILS_VERSION = 4.101
 BLUEZ_UTILS_SOURCE = bluez-$(BLUEZ_UTILS_VERSION).tar.xz
 BLUEZ_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ_UTILS_INSTALL_STAGING = YES
-BLUEZ_UTILS_DEPENDENCIES = host-pkgconf dbus libglib2
+BLUEZ_UTILS_DEPENDENCIES = host-pkgconf check dbus libglib2
 BLUEZ_UTILS_CONF_OPTS = --enable-test --enable-tools
 BLUEZ_UTILS_AUTORECONF = YES
 BLUEZ_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
