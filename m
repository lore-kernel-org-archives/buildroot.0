From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 16 Apr 2020 07:27:54 +0200
Subject: [Buildroot] [PATCH] package/python-dpkt: remove Python2 only
 dependency
Message-ID: <20200416052754.2628-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

python-dpkt supports both Python flavors.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-dpkt/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-dpkt/Config.in b/package/python-dpkt/Config.in
index d8e3388d7e..9bd7a98d26 100644
--- a/package/python-dpkt/Config.in
+++ b/package/python-dpkt/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_DPKT
 	bool "python-dpkt"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  Fast, simple packet creation / parsing, with definitions
 	  for the basic TCP/IP protocols.
-- 
2.17.0
