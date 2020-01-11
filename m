From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 10:21:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/ussp-push: add bluez5_utils support
Message-ID: <20200111092101.419186-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ussp-push/Config.in    | 2 +-
 package/ussp-push/ussp-push.mk | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ussp-push/Config.in b/package/ussp-push/Config.in
index aefec85a20..d0ab577609 100644
--- a/package/ussp-push/Config.in
+++ b/package/ussp-push/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_USSP_PUSH
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, alsa-lib, libglib2
 	depends on BR2_USE_MMU # dbus
 	select BR2_PACKAGE_OPENOBEX
-	select BR2_PACKAGE_BLUEZ_UTILS
+	select BR2_PACKAGE_BLUEZ_UTILS if !BR2_PACKAGE_BLUEZ5_UTILS
 	help
 	  ussp-push is an OBEX object pusher for Linux, using the BlueZ
 	  BlueTooth stack.
diff --git a/package/ussp-push/ussp-push.mk b/package/ussp-push/ussp-push.mk
index 0c45c291ac..e56b611727 100644
--- a/package/ussp-push/ussp-push.mk
+++ b/package/ussp-push/ussp-push.mk
@@ -9,6 +9,8 @@ USSP_PUSH_SITE = http://www.xmailserver.org
 USSP_PUSH_LICENSE = GPL-2.0+
 USSP_PUSH_LICENSE_FILES = COPYING
 
-USSP_PUSH_DEPENDENCIES = bluez_utils openobex
+USSP_PUSH_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils,bluez5_utils) \
+	openobex
 
 $(eval $(autotools-package))
-- 
2.24.1
