From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Jun 2020 22:36:31 +0200
Subject: [Buildroot] [git commit] package/python-validators: bump version to
 0.15.0
Message-ID: <20200621203551.42ADB83243@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=75b833bad0e1f0457f7ed1855f4f7ba138e40ea8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream dropped python 2.x support, so add a dependency on python3:
https://github.com/kvesteri/validators/commit/f8608f45378bd465072176772887c685d1d7c300

And adjust the .hash spacing for the new agreements.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-validators/Config.in              | 1 +
 package/python-validators/python-validators.hash | 6 +++---
 package/python-validators/python-validators.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-validators/Config.in b/package/python-validators/Config.in
index e700369910..802b1dde5b 100644
--- a/package/python-validators/Config.in
+++ b/package/python-validators/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_VALIDATORS
 	bool "python-validators"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
 	help
diff --git a/package/python-validators/python-validators.hash b/package/python-validators/python-validators.hash
index 1a3aa79980..2845a2e8c0 100644
--- a/package/python-validators/python-validators.hash
+++ b/package/python-validators/python-validators.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/validators/json
-md5	ae3932b693452b96f037c919e1d7250f  validators-0.14.2.tar.gz
-sha256	b192e6bde7d617811d59f50584ed240b580375648cd032d106edeb3164099508  validators-0.14.2.tar.gz
+md5  2f0446f2a15aa694be0cfd8728eb4444  validators-0.15.0.tar.gz
+sha256  31e8bb01b48b48940a021b8a9576b840f98fa06b91762ef921d02cb96d38727a  validators-0.15.0.tar.gz
 # Locally computed sha256 checksums
-sha256	a7fd9d761c7ca1c6508b9baf030f6e21f5752d1caea3e49a270634aa9ef01e6f  LICENSE
+sha256  a7fd9d761c7ca1c6508b9baf030f6e21f5752d1caea3e49a270634aa9ef01e6f  LICENSE
diff --git a/package/python-validators/python-validators.mk b/package/python-validators/python-validators.mk
index 594c1d26e5..7268b1013b 100644
--- a/package/python-validators/python-validators.mk
+++ b/package/python-validators/python-validators.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_VALIDATORS_VERSION = 0.14.2
+PYTHON_VALIDATORS_VERSION = 0.15.0
 PYTHON_VALIDATORS_SOURCE = validators-$(PYTHON_VALIDATORS_VERSION).tar.gz
-PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/4d/56/9b48c918ef118ea12b90f227c4498ed4703b418bdd8fb49479dfcbeae4ef
+PYTHON_VALIDATORS_SITE = https://files.pythonhosted.org/packages/c4/4a/4f9c892f9a9f08ee5f99c32bbd4297499099c2c5f7eff8c617a57d31a7d8
 PYTHON_VALIDATORS_SETUP_TYPE = setuptools
 PYTHON_VALIDATORS_LICENSE = MIT
 PYTHON_VALIDATORS_LICENSE_FILES = LICENSE
