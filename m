From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 Jan 2018 23:45:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/bluez5_utils: needs readline
Message-ID: <20180113224532.2715-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream commit
https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=bee3796113196da1b3f56da42fcae4d9bae6695e

moved code depending on readline from the client tool to the shared
library, readline is therefore not an optional dependency anymore.

Fixes
http://autobuild.buildroot.net/results/019/0197ee0036e129b736c1dc0e83722236fb656618/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/bluez5_utils/Config.in       | 1 +
 package/bluez5_utils/bluez5_utils.mk | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 55831e9b61..bb0a2905c5 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_READLINE
 	help
 	  bluez utils version 5.x
 
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 0634ec9f6f..055d44de78 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -8,7 +8,7 @@ BLUEZ5_UTILS_VERSION = 5.48
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2
+BLUEZ5_UTILS_DEPENDENCIES = dbus libglib2 readline
 BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 
@@ -26,7 +26,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_CLIENT),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-client
-BLUEZ5_UTILS_DEPENDENCIES += readline
 else
 BLUEZ5_UTILS_CONF_OPTS += --disable-client
 endif
-- 
2.11.0
