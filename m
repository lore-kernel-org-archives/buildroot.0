From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon,  8 Feb 2021 01:55:42 +0100
Subject: [Buildroot] [PATCH 1/3] package/python-bluezero: depends on
 dbus-python and python-gobject
Message-ID: <20210208005546.482866-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of version 0.4.0 observer.py uses dbus-python (to comunicate with BlueZ)
instead of python-aioblescan. Thus, all modules now depend on dbus-python.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/python-bluezero/Config.in | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/python-bluezero/Config.in b/package/python-bluezero/Config.in
index 9ea3686a2b..3a9e5df6b7 100644
--- a/package/python-bluezero/Config.in
+++ b/package/python-bluezero/Config.in
@@ -1,12 +1,9 @@
 config BR2_PACKAGE_PYTHON_BLUEZERO
 	bool "python-bluezero"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_DBUS_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_GOBJECT # runtime
 	help
 	  Python library for Bluetooth Low Energy (BLE) on Linux.
 
-	  For central.py, peripheral.py and broadcaster.py you need
-	  to enable the dbus-python and the bluez5-utils package.
-	  For observer.py, you need to enable the python-aioblescan
-	  package.
-
 	  https://github.com/ukBaz/python-bluezero
-- 
2.27.0
