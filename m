From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Dec 2020 10:21:28 +0100
Subject: [Buildroot] [git commit] package/python-pytest: bump to version
 6.1.2
Message-ID: <20201213091419.6AA46814A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4406031cc5016169f6ae1c2e9e5c6c58cc9f64d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-more-itertools was removed as dependency starting from
[1] (release 6.1.0).

XML module is now a hard requirement.

[1] https://github.com/pytest-dev/pytest/commit/96a48f0c66ebe1ec2305c21390a3f6c059760af5

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pytest/Config.in          | 2 +-
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
index ad57547a1b..ebbaeeea58 100644
--- a/package/python-pytest/Config.in
+++ b/package/python-pytest/Config.in
@@ -3,11 +3,11 @@ config BR2_PACKAGE_PYTHON_PYTEST
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_INICONFIG # runtime
-	select BR2_PACKAGE_PYTHON_MORE_ITERTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_PLUGGY # runtime
 	select BR2_PACKAGE_PYTHON_PY # runtime
 	select BR2_PACKAGE_PYTHON_TOML # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  pytest is a framework that makes building simple and scalable
 	  tests easy. Tests are expressive and readable???no boilerplate
diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index 6f3532a590..8c2a85c922 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5	c3e7c811b2b74c60bb5fb951229ebce9  pytest-6.0.1.tar.gz
-sha256	85228d75db9f45e06e57ef9bf4429267f81ac7c0d742cc9ed63d09886a9fe6f4  pytest-6.0.1.tar.gz
+md5	91a421ffffe3310096b4273b2fa13819  pytest-6.1.2.tar.gz
+sha256	c0a7e94a8cdbc5422a51ccdad8e6f1024795939cc89159a0ae7f0b316ad3823e  pytest-6.1.2.tar.gz
 # Locally computer sha256
 sha256	7898b9b164d4f93fd9a562fd0f592935518b48c4745303964110eb7f7fe64faf  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index c17d579f8c..d47ec0f430 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 6.0.1
+PYTHON_PYTEST_VERSION = 6.1.2
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/20/4c/d7b19b8661be78461fff0392e33943784340424921578fe1bf300ef59831
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/d4/df/bd7c25c4fe809a17315b3fc9878edf48d31dde7b431b6836848b063c0428
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
