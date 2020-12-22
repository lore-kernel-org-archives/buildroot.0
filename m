From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Tue, 22 Dec 2020 16:07:24 +0100
Subject: [Buildroot] [PATCH 03/15] package/network-manager: add SELinux
 module
In-Reply-To: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
References: <20201222150736.319593-1-maxime.chevallier@bootlin.com>
Message-ID: <20201222150736.319593-4-maxime.chevallier@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Support for NetworkManager is added by the services/networkmanager
module in the SELinux refpolicy.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
-- 
2.25.4
