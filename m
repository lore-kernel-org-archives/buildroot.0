From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 13 Apr 2020 17:05:21 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-service-identity: select
 pyasn1 instead of pyasn
Message-ID: <20200413230521.123397-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The python-pyasn package is an outdated version of python-pyasn1 and
should not be used.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-service-identity/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index f1ce5312c8..0260ab4010 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	bool "python-service-identity"
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-pyasn
+	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
 	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_PYASN # runtime
-	select BR2_PACKAGE_PYTHON_PYASN_MODULES # runtime
+	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
+	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	help
 	  Service identity verification for pyOpenSSL.
-- 
2.20.1
