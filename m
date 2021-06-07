From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jun 2021 23:15:24 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-bluezero:
 depends on dbus-python and python-gobject
Message-ID: <20210607205546.433E787922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1233f34e7680546a09ce30cc3e3c1c0c28a85f97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

As of version 0.4.0 observer.py uses dbus-python (to comunicate with BlueZ)
instead of python-aioblescan. Thus, all modules now depend on dbus-python.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 8bdc5e7c4d975193b1e18999ed840507cea63bd6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
