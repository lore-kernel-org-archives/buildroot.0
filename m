From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Oct 2018 21:18:48 +0200
Subject: [Buildroot] [git commit] python-django: bump to version 2.1.2
Message-ID: <20181007191921.916828DFBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4972e2e8c7c251a263568158d3c9b9f4a04d042
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Django has dropped support for Python 2.x

Fixes:
http://autobuild.buildroot.org/results/423/423d480271b8bfdd9319a11cd97f9229681478e4

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/Config.in          | 8 ++++----
 package/python-django/python-django.hash | 6 ++++--
 package/python-django/python-django.mk   | 4 ++--
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/python-django/Config.in b/package/python-django/Config.in
index 75322d1bb2..89dec8e17a 100644
--- a/package/python-django/Config.in
+++ b/package/python-django/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_PYTHON_DJANGO
 	bool "python-django"
-	select BR2_PACKAGE_PYTHON_UNICODEDATA if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_UNICODEDATA if BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_UNICODEDATA
+	select BR2_PACKAGE_PYTHON3_PYEXPAT
+	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	help
 	  Django is a high-level Python Web framework that encourages
 	  rapid development and clean, pragmatic design. It takes your
diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 6e6e7708db..9a9889ab1c 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,3 +1,5 @@
-# From https://www.djangoproject.com/m/pgp/Django-1.11.16.checksum.txt
-sha256	29268cc47816a44f27308e60f71da635f549c47d8a1d003b28de55141df75791  Django-1.11.16.tar.gz
+# md5, sha256 from https://pypi.org/pypi/django/json
+md5	383ca4e98ad5d0aa9d71378fe743bdef  Django-2.1.2.tar.gz
+sha256	efbcad7ebb47daafbcead109b38a5bd519a3c3cd92c6ed0f691ff97fcdd16b45  Django-2.1.2.tar.gz
+# Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 9f43ffab85..e3f20fd1cb 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 1.11.16
+PYTHON_DJANGO_VERSION = 2.1.2
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/35/1d/59836bce4c9cfded261e21c0abd6a4629de6d289522d0fd928117d8eb985
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/8b/03/4c74d3712919613f2c611e6689522df507a2753a92049009661a81b4b72f
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
