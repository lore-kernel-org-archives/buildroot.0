From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 13:23:11 +0100
Subject: [Buildroot] [git commit] package/python-crc16: allow to build with
 python3
Message-ID: <20201223120721.0FE1E80462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7fdc5686bb269cc3797d7c550f10f75074f2e71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python3 is officially supported by package, as there is a usage example
at [1]. Simply remove dependency on BR2_PACKAGE_PYTHON.

[1] https://pypi.org/project/crc16/

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-crc16/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-crc16/Config.in b/package/python-crc16/Config.in
index b7a10b66ad..06ad00778c 100644
--- a/package/python-crc16/Config.in
+++ b/package/python-crc16/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_CRC16
 	bool "python-crc16"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  This library calculates only CRC16 (16-bit codes) and the
 	  only supported variant at the moment is CRC-CCITT (XModem).
