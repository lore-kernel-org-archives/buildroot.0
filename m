From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu,  2 Nov 2017 22:01:44 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/python-networkmanager: Bump to
 version 2.0.1
Message-ID: <20171102210144.27993-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added new runtime dependency on python-six.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Hi Thomas,

yes I generated it with scanpypi. V2 uses all your comments how I understood it.

Changes v1->v2:
* Mention new runtime dependency on python-six.
* Revert back dependencies.
* Revert back more verbose description.
* In license kept only Zlib.
---
 package/python-networkmanager/Config.in                  | 1 +
 package/python-networkmanager/python-networkmanager.hash | 6 +++---
 package/python-networkmanager/python-networkmanager.mk   | 9 +++++----
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/python-networkmanager/Config.in b/package/python-networkmanager/Config.in
index fcbce5748d..c99f2c31ad 100644
--- a/package/python-networkmanager/Config.in
+++ b/package/python-networkmanager/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_PYTHON_NETWORKMANAGER
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python
 	depends on BR2_PACKAGE_DBUS # dbus-python
 	select BR2_PACKAGE_DBUS_PYTHON
+	select BR2_PACKAGE_PYTHON_SIX
 	help
 	  python-networkmanager wraps NetworkManagers D-Bus interface
 	  so you can be less verbose when talking to NetworkManager
diff --git a/package/python-networkmanager/python-networkmanager.hash b/package/python-networkmanager/python-networkmanager.hash
index cbd6febcd1..1fed4befb7 100644
--- a/package/python-networkmanager/python-networkmanager.hash
+++ b/package/python-networkmanager/python-networkmanager.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=97c84c19b84b1124903a06379b107f77, sha256 locally computed
-md5	97c84c19b84b1124903a06379b107f77  python-networkmanager-1.2.1.tar.gz
-sha256	7107c07383f8077cfac33fdbb3c4cda4de40be20a6b20d30840055eb519a0e89  python-networkmanager-1.2.1.tar.gz
+# md5 from https://pypi.python.org/pypi/python-networkmanager/json, sha256 locally computed
+md5	5fc644a65463031295c6b7dd51a0f1bd  python-networkmanager-2.0.1.tar.gz
+sha256	bc36507506ad29bfdac941b0987ebd1cc9633c9a9291d7378e229e4515a0a517  python-networkmanager-2.0.1.tar.gz
diff --git a/package/python-networkmanager/python-networkmanager.mk b/package/python-networkmanager/python-networkmanager.mk
index d0e4011421..02ea2ddb85 100644
--- a/package/python-networkmanager/python-networkmanager.mk
+++ b/package/python-networkmanager/python-networkmanager.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_NETWORKMANAGER_VERSION = 1.2.1
-PYTHON_NETWORKMANAGER_SITE = https://pypi.python.org/packages/e7/b1/09993250ceea9e03bc65fbabcd5286540200292c011b22237b2963c11471
-PYTHON_NETWORKMANAGER_SETUP_TYPE = distutils
-PYTHON_NETWORKMANAGER_LICENSE = GPL-3.0+
+PYTHON_NETWORKMANAGER_VERSION = 2.0.1
+PYTHON_NETWORKMANAGER_SOURCE = python-networkmanager-$(PYTHON_NETWORKMANAGER_VERSION).tar.gz
+PYTHON_NETWORKMANAGER_SITE = https://pypi.python.org/packages/d7/f9/5cbd99fd24a072875ce048e48d1754285f137aab447de8fee63b6cba990a
+PYTHON_NETWORKMANAGER_SETUP_TYPE = setuptools
+PYTHON_NETWORKMANAGER_LICENSE = Zlib
 PYTHON_NETWORKMANAGER_LICENSE_FILES = COPYING
 PYTHON_NETWORKMANAGER_DEPENDENCIES = dbus-python
 
-- 
2.14.2
