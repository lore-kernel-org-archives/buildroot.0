From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 May 2021 11:07:36 +0200
Subject: [Buildroot] [git commit] package/python-bluezero: depends on
 dbus-python and python-gobject
Message-ID: <20210521083840.D03357FFE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bdc5e7c4d975193b1e18999ed840507cea63bd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As of version 0.4.0 observer.py uses dbus-python (to comunicate with BlueZ)
instead of python-aioblescan. Thus, all modules now depend on dbus-python.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
