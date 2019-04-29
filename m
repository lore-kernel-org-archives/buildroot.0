From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 29 Apr 2019 20:11:43 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-reentry: bump to version
 1.3.1
Message-ID: <20190429171143.25845-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also update dependency list.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-reentry/Config.in           | 2 +-
 package/python-reentry/python-reentry.hash | 5 +++--
 package/python-reentry/python-reentry.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-reentry/Config.in b/package/python-reentry/Config.in
index 18518f2c3f..8ebbe395c8 100644
--- a/package/python-reentry/Config.in
+++ b/package/python-reentry/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_PYTHON_REENTRY
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
-	select BR2_PACKAGE_PYTHON_PY # runtime
+	select BR2_PACKAGE_PYTHON_PATHLIB2 if BR2_PACKAGE_PYTHON # runtime
 	help
 	  A plugin manager based on setuptools entry points mechanism.
 
diff --git a/package/python-reentry/python-reentry.hash b/package/python-reentry/python-reentry.hash
index 7a3bbf4d99..089d8594f5 100644
--- a/package/python-reentry/python-reentry.hash
+++ b/package/python-reentry/python-reentry.hash
@@ -1,4 +1,5 @@
-# sha256 from https://pypi.org/pypi/reentry/json
-sha256	00df980d8c61713f5002d4d893ba6ea38e9a721cd04aef5a520b974e700ab550  reentry-1.2.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/reentry/json
+md5	819931cd0a766a7c226879e57ccea9c7  reentry-1.3.1.tar.gz
+sha256	2fe18c1a6946f3e2a51e1d5aa78228a11e879fbb0da14da5bf1e6252e83d26b1  reentry-1.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256	4ae7f3216208a7e2327236e95bcd2397b2495f1c2298c708986c893bea608509  LICENSE
diff --git a/package/python-reentry/python-reentry.mk b/package/python-reentry/python-reentry.mk
index d3f0e03ef0..428dbf2b1b 100644
--- a/package/python-reentry/python-reentry.mk
+++ b/package/python-reentry/python-reentry.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REENTRY_VERSION = 1.2.0
+PYTHON_REENTRY_VERSION = 1.3.1
 PYTHON_REENTRY_SOURCE = reentry-$(PYTHON_REENTRY_VERSION).tar.gz
-PYTHON_REENTRY_SITE = https://files.pythonhosted.org/packages/e2/b4/46dfac6613302fea51454a01aebedae9440aff9d813aedbbc5f687552e3b
+PYTHON_REENTRY_SITE = https://files.pythonhosted.org/packages/ee/3f/a90789e01c4d2b67a57e9bd758e60ecb9338d428604f66130b57684ba8cc
 PYTHON_REENTRY_SETUP_TYPE = setuptools
 PYTHON_REENTRY_LICENSE = MIT
 PYTHON_REENTRY_LICENSE_FILES = LICENSE
-- 
2.20.1
