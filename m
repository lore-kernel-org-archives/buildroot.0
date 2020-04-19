From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 10:15:38 +0200
Subject: [Buildroot] [git commit] package/python-service-identity: use
 pyasn1 instead of pyasn
Message-ID: <20200419080312.ECDE88F138@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c7de0232ee340747096cda0946b4daccbe9a61e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-pyasn and python-pyasn1 packages package the exact same
upstream Python module, pyasn1. However, python-pyasn uses an outdated
version, and shouldn't be used.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
