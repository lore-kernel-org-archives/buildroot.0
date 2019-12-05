From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Dec 2019 23:00:47 +0100
Subject: [Buildroot] [git commit] package/python-django: bump to version 3.0
Message-ID: <20191205220559.A32A888233@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f58ffc49ce5d0988549575ef18033ddda17bc809
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Other changes:
  - Select BR2_PACKAGE_PYTHON_ASGIREF as a new runtime dependency.
  - Select BR2_PACKAGE_PYTHON_SQLPARSE as a new runtime dependency.

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-django/Config.in          | 3 +++
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-django/Config.in b/package/python-django/Config.in
index 0a2e308d31..6748d42e1a 100644
--- a/package/python-django/Config.in
+++ b/package/python-django/Config.in
@@ -3,8 +3,11 @@ config BR2_PACKAGE_PYTHON_DJANGO
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON3_UNICODEDATA
 	select BR2_PACKAGE_PYTHON3_PYEXPAT
+	select BR2_PACKAGE_PYTHON_ASGIREF # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_SQLPARSE # runtime
+
 	help
 	  Django is a high-level Python Web framework that encourages
 	  rapid development and clean, pragmatic design. It takes your
diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 965055f47d..f2bd879e9d 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	57d965818410a4e00e2267eef66aa9c9  Django-2.2.8.tar.gz
-sha256	a4ad4f6f9c6a4b7af7e2deec8d0cbff28501852e5010d6c2dc695d3d1fae7ca0  Django-2.2.8.tar.gz
+md5	bd2aebfa7c1106755544f7f217d2acde  Django-3.0.tar.gz
+sha256	d98c9b6e5eed147bc51f47c014ff6826bd1ab50b166956776ee13db5a58804ae  Django-3.0.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index d541a2c07b..4158669b14 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.2.8
+PYTHON_DJANGO_VERSION = 3.0
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/1c/aa/f618f346b895123be44739b276099a2b418b45b2b7afb5e1071403e8d2e9
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f8/46/b3b8c61f867827fff2305db40659495dcd64fb35c399e75c53f23c113871
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
