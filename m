From: Aleksander Morgado <aleksander@aleksander.es>
Date: Tue, 12 Sep 2017 10:34:06 +0200
Subject: [Buildroot] [PATCH] modem-manager: add COPYING.LIB to LICENSE_FILES
Message-ID: <20170912083406.32085-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ModemManager and mmcli are GPLv2+ (COPYING file applies) and
libmm-glib is LGPLv2.1+ (COPYING.LIB file applies).

Also, setup hashes of the license files, for a correct
"make legal-info".

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/modem-manager/modem-manager.hash | 2 ++
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 83d45da5a..d94fda15f 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,2 +1,4 @@
 # Locally computed
 sha256  ffc035c4bfeb07780c4580bb4488ade0ab1d197c3cdf89cb8ab36386cfb34376  ModemManager-1.6.8.tar.xz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index fe08033c7..65ad0961b 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -8,7 +8,7 @@ MODEM_MANAGER_VERSION = 1.6.8
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
-MODEM_MANAGER_LICENSE_FILES = COPYING
+MODEM_MANAGER_LICENSE_FILES = COPYING COPYING.LIB
 MODEM_MANAGER_DEPENDENCIES = host-pkgconf host-intltool libglib2 libgudev
 MODEM_MANAGER_INSTALL_STAGING = YES
 
-- 
2.13.1
