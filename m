From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Oct 2019 21:07:49 +0200
Subject: [Buildroot] [git commit] package/python-service-identity: bump to
 version 18.1.0
Message-ID: <20191018191755.98B00826DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a02fef64f3b22be33538b26ccbde5f77a44d386a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Update dependency list.
* Add hash for license file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-service-identity/Config.in                    | 1 +
 package/python-service-identity/python-service-identity.hash | 8 +++++---
 package/python-service-identity/python-service-identity.mk   | 4 ++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index 73593b0d61..f1ce5312c8 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl, python-pyasn
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_CHARACTERISTIC # runtime
+	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON_PYASN # runtime
 	select BR2_PACKAGE_PYTHON_PYASN_MODULES # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
index 7caaaf99e8..9a20d08925 100644
--- a/package/python-service-identity/python-service-identity.hash
+++ b/package/python-service-identity/python-service-identity.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/service_identity/json, sha256 locally computed
-md5 f509cb41ca2f8420bd8496291136d6cc  service_identity-17.0.0.tar.gz
-sha256 4001fbb3da19e0df22c47a06d29681a398473af4aa9d745eca525b3b2c2302ab  service_identity-17.0.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/service_identity/json
+md5	c6b8bac93e7d899a1da313a19cc6570a  service_identity-18.1.0.tar.gz
+sha256	0858a54aabc5b459d1aafa8a518ed2081a285087f349fe3e55197989232e2e2d  service_identity-18.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256	c5075126e1272b176504e36af369781a95c5c1124239da8e4f61b0f9c15a56cf  LICENSE
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index ccc6e71ac3..5330239e48 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERVICE_IDENTITY_VERSION = 17.0.0
+PYTHON_SERVICE_IDENTITY_VERSION = 18.1.0
 PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
-PYTHON_SERVICE_IDENTITY_SITE = https://pypi.python.org/packages/de/2a/cab6e30be82c8fcd2339ef618036720eda954cf05daef514e386661c9221
+PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/9a/3d/9eb0563e066ea0540cf580695593ab079376e920016d4d1b3ff2fd8abf4b
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
 PYTHON_SERVICE_IDENTITY_SETUP_TYPE = setuptools
