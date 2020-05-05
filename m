From: Aleksander Morgado <aleksander@aleksander.es>
Date: Tue,  5 May 2020 14:07:20 +0200
Subject: [Buildroot] [PATCH] package/modem-manager: test for the used
 packages, not for the MM option
Message-ID: <20200505120720.258993-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows user to either explicitly select the libraries it
needs (e.g. libqmi and/or libmbim) and otherwise explicitly configure
to request the QMI/MBIM features in ModemManager.

This simplifies the build logic, and we avoid possible issues where a
user that did select the library forgot to select the MM feature.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/modem-manager/modem-manager.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 75fc5811db..6b4e9b6250 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -13,7 +13,7 @@ MODEM_MANAGER_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
 MODEM_MANAGER_INSTALL_STAGING = YES
 MODEM_MANAGER_CONF_OPTS = --disable-more-warnings
 
-ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBQMI),y)
+ifeq ($(BR2_PACKAGE_LIBQMI),y)
 MODEM_MANAGER_DEPENDENCIES += libqmi
 MODEM_MANAGER_CONF_OPTS += --with-qmi
 else
@@ -27,7 +27,7 @@ else
 MODEM_MANAGER_CONF_OPTS += --without-udev
 endif
 
-ifeq ($(BR2_PACKAGE_MODEM_MANAGER_LIBMBIM),y)
+ifeq ($(BR2_PACKAGE_LIBMBIM),y)
 MODEM_MANAGER_DEPENDENCIES += libmbim
 MODEM_MANAGER_CONF_OPTS += --with-mbim
 else
-- 
2.26.1
