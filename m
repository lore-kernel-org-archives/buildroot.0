From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  4 Apr 2021 23:13:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-paramiko: drop python-pyasn1
 dependency
Message-ID: <20210404211326.3443620-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

python-pyasn1 is truly optional since version 2.5.0 and
https://github.com/paramiko/paramiko/commit/a31818c28556055341ae3d249e3893d40eb2b232

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-paramiko/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-paramiko/Config.in b/package/python-paramiko/Config.in
index e33199c82c..993c84ef4d 100644
--- a/package/python-paramiko/Config.in
+++ b/package/python-paramiko/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_PYTHON_PARAMIKO
 	depends on BR2_INSTALL_LIBSTDCPP # python-cryptography
 	select BR2_PACKAGE_PYTHON_BCRYPT # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
-	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYNACL # runtime
 	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
-- 
2.30.2
