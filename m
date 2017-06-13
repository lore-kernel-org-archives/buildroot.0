From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 13 Jun 2017 10:59:50 +0200
Subject: [Buildroot] [PATCH] python-paramiko: sort runtime dependencies in
	alphabetical order
Message-ID: <20170613085950.7578-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-paramiko/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-paramiko/Config.in b/package/python-paramiko/Config.in
index 7d20d04d2..1f86af3be 100644
--- a/package/python-paramiko/Config.in
+++ b/package/python-paramiko/Config.in
@@ -1,12 +1,12 @@
 config BR2_PACKAGE_PYTHON_PARAMIKO
 	bool "python-paramiko"
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_PYASN # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
-	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  SSH2 protocol library.
 
-- 
2.11.0
