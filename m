From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Dec 2020 14:06:00 +0100
Subject: [Buildroot] [git commit] package/network-manager: add SELinux module
Message-ID: <20201229134643.8218F82281@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad33d20b29fff81533451858674c2a18b685c97c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for NetworkManager is added by the services/networkmanager
module in the SELinux refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/network-manager/network-manager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 3dc3188f32..4b2ade5b9b 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -13,6 +13,7 @@ NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
 	libgcrypt wireless_tools util-linux host-intltool readline libndp
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING
+NETWORK_MANAGER_SELINUX_MODULES = networkmanager
 
 NETWORK_MANAGER_CONF_ENV = \
 	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
