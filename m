From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Mar 2021 23:19:56 +0200
Subject: [Buildroot] [PATCH 1/2] package/libqmi: drop unrecognized option
Message-ID: <20210329211957.321612-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--enable-more-warnings has been dropped since version 1.26.0 and
https://github.com/freedesktop/libqmi/commit/9f31a45d5fc137431705d47b83669f35259932b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libqmi/libqmi.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index b02312d702..998952e47d 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -13,9 +13,6 @@ LIBQMI_INSTALL_STAGING = YES
 
 LIBQMI_DEPENDENCIES = libglib2
 
-# we don't want -Werror
-LIBQMI_CONF_OPTS = --enable-more-warnings=no
-
 # if libgudev available, request udev support for a better
 # qmi-firmware-update experience
 ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
-- 
2.30.2
