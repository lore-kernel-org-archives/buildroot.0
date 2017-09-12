From: Aleksander Morgado <aleksander@aleksander.es>
Date: Tue, 12 Sep 2017 10:39:02 +0200
Subject: [Buildroot] [PATCH] libqmi: add COPYING.LIB to LICENSE_FILES
Message-ID: <20170912083902.2225-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qmicli, qmi-network and qmi-firmware-update are GPLv2+ (COPYING file
applies) and libqmi-glib is LGPLv2.1+ (COPYING.LIB file applies).

Also, setup hashes of the license files, for a correct
"make legal-info".

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/libqmi/libqmi.hash | 2 ++
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index 3f4015467..1c54231a9 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,2 +1,4 @@
 # Locally computed:
 sha256 a0a42c55935e75a630208e2f70840bd4407f56fe1c5258f5b0f6c0aaedf88cec  libqmi-1.18.0.tar.xz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 3a3d079a0..08875649a 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -8,7 +8,7 @@ LIBQMI_VERSION = 1.18.0
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
-LIBQMI_LICENSE_FILES = COPYING
+LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
 LIBQMI_INSTALL_STAGING = YES
 # 0001-musl-compat-canonicalize_file_name.patch
 LIBQMI_AUTORECONF = YES
-- 
2.13.1
