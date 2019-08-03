From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Aug 2019 00:22:37 +0200
Subject: [Buildroot] [git commit] package/python-zeroconf: depends on ifaddr
 instead of netifaces
Message-ID: <20190803221949.5321180F4C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c53c300d4f82302b7aae67691741e590b504789
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting from 0.21.0 zeroconf uses pure-python ifaddr module
instead of netifaces.

Currently we have zeroconf 0.23.0, so this module raises
ModuleNotFoundError exception during import.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-zeroconf/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-zeroconf/Config.in b/package/python-zeroconf/Config.in
index ac1acbbd8c..a56bf7c16c 100644
--- a/package/python-zeroconf/Config.in
+++ b/package/python-zeroconf/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_ZEROCONF
 	bool "python-zeroconf"
 	depends on BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_NETIFACES # runtime
+	select BR2_PACKAGE_PYTHON_IFADDR # runtime
 	help
 	  Pure Python Multicast DNS Service Discovery Library
 	  (Bonjour/Avahi compatible).
