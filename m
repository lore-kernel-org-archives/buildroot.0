From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon, 21 Dec 2020 19:24:50 +0100
Subject: [Buildroot] [PATCH] package/python-crc16: allow to build with
 python3
Message-ID: <20201221182450.65921-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python3 is officially supported by package, as there is a usage example
at [1]. Simply remove dependency on BR2_PACKAGE_PYTHON.

[1] https://pypi.org/project/crc16/

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
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
-- 
2.29.2
