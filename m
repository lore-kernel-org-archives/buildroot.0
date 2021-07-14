From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 14 Jul 2021 10:50:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-django: security bump to
 version 3.2.5
Message-ID: <20210714085044.2455236-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2021-35042: Django 3.1.x before 3.1.13 and 3.2.x before 3.2.5
allows QuerySet.order_by SQL injection if order_by is untrusted input
from a client of a web application.

https://www.djangoproject.com/weblog/2021/jul/01/security-releases
https://docs.djangoproject.com/en/dev/releases/3.2.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index fe91740f5f..2f5f96a501 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  2f30db9154efb8c9ed891781d29fae2a  Django-3.2.4.tar.gz
-sha256  66c9d8db8cc6fe938a28b7887c1596e42d522e27618562517cc8929eb7e7f296  Django-3.2.4.tar.gz
+md5  46e306a5a775cace03a03d5a158ff767  Django-3.2.5.tar.gz
+sha256  3da05fea54fdec2315b54a563d5b59f3b4e2b1e69c3a5841dda35019c01855cd  Django-3.2.5.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 81a3c8b8f3..1603063beb 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.2.4
+PYTHON_DJANGO_VERSION = 3.2.5
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/27/94/123b3a95e9965819a3d30d36da6fc12ddff83bcfb0099f3e15437347480a
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/95/3b/468fa33908feefac03c0a773bd73bb8a1ab1fb4ee06e9dd62d24981f4603
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
-- 
2.30.2
