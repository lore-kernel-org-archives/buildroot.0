From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 09:44:40 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-paramiko:
 drop python-pyasn1 dependency
Message-ID: <20210406072100.688F38BE9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d54185116034025cf46476cf3f3541efc1bfa20e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

python-pyasn1 is truly optional since version 2.5.0 and
https://github.com/paramiko/paramiko/commit/a31818c28556055341ae3d249e3893d40eb2b232

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 78da0a0ea38e2cdfdb4afbb7ad2eef3608fdc610)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
