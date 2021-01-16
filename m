From: Asaf Kahlon <asafka7@gmail.com>
Date: Sat, 16 Jan 2021 10:25:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-bleak: depend on python3
Message-ID: <20210116082508.239321-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-bleak doesn't support python2.

Fixes:
 - http://autobuild.buildroot.net/results/22e6139a221e64ce96e23d68a58b60074fc95473/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-bleak/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-bleak/Config.in b/package/python-bleak/Config.in
index 3266932883..6015361899 100644
--- a/package/python-bleak/Config.in
+++ b/package/python-bleak/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BLEAK
 	bool "python-bleak"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_TXDBUS # runtime
 	help
 	  Bluetooth Low Energy platform Agnostic Klient.
-- 
2.27.0
