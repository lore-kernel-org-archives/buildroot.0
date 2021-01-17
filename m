From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jan 2021 15:25:55 +0100
Subject: [Buildroot] [git commit] package/python-esptool: fix zlib module
 for python3
Message-ID: <20210117140655.959DA87826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9e001fa9229e205878091dee93181ff51513eaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes config with BR2_PACKAGE_PYTHON3=y

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_ZLIB
  Depends on [n]: BR2_PACKAGE_PYTHON [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_ESPTOOL [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y])

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-esptool/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-esptool/Config.in b/package/python-esptool/Config.in
index 7d3579abdc..570f9aa42f 100644
--- a/package/python-esptool/Config.in
+++ b/package/python-esptool/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_PYTHON_ESPTOOL
 	select BR2_PACKAGE_PYTHON_ECDSA # runtime
 	select BR2_PACKAGE_PYTHON_PYAES # runtime
 	select BR2_PACKAGE_PYTHON_SERIAL # runtime
-	select BR2_PACKAGE_PYTHON_ZLIB # runtime
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
 	help
 	  A serial utility to communicate & flash code to Espressif
 	  ESP8266 & ESP32 chips.
