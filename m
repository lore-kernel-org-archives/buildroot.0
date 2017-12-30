From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Dec 2017 11:30:08 +0100
Subject: [Buildroot] [PATCH] package/python-shutilwhich: also available in
 python3
Message-ID: <20171230103008.1828-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When in python3, shutilwhich will simply use shutil.which.

Some packages (e.g. crossbar.io) unconditionally require shutilwhich,
even when they are running under python3.

So, enable python-shutilwhich even for python3.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Mauro Condarelli <mc5686@mclink.it>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-shutilwhich/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-shutilwhich/Config.in b/package/python-shutilwhich/Config.in
index abdc8d77a1..a75a63bbf4 100644
--- a/package/python-shutilwhich/Config.in
+++ b/package/python-shutilwhich/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_SHUTILWHICH
 	bool "python-shutilwhich"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  shutil.which for those not using Python 3.3 yet.
 
-- 
2.11.0
