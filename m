From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 17:11:10 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/python-django:
 security bump to version 1.11.20
Message-ID: <20190221161037.1F234814FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c22ecefa676640ff4b0ec20d6df320a800d2fa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes the following security issues:

CVE-2019-6975: Memory exhaustion in django.utils.numberformat.format()

If django.utils.numberformat.format() ??? used by contrib.admin as well as the
the floatformat, filesizeformat, and intcomma templates filters ??? received a
Decimal with a large number of digits or a large exponent, it could lead to
significant memory usage due to a call to '{:f}'.format().

To avoid this, decimals with more than 200 digits are now formatted using
scientific notation.

https://docs.djangoproject.com/en/2.1/releases/1.11.19/

1.11.19 contained a packaging error, fixed by 1.11.20:

https://docs.djangoproject.com/en/2.1/releases/1.11.20/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 39a95f258c..b77b061c02 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,3 +1,3 @@
-# From https://www.djangoproject.com/m/pgp/Django-1.11.18.checksum.txt
-sha256  73cca1dac154e749b39cc91a54dc876109eb0512a5c6804986495305047066a5  Django-1.11.18.tar.gz
+# From https://www.djangoproject.com/m/pgp/Django-1.11.20.checksum.txt
+sha256  43a99da08fee329480d27860d68279945b7d8bf7b537388ee2c8938c709b2041  Django-1.11.20.tar.gz
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 31d9e2c92e..d2712a936c 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 1.11.18
+PYTHON_DJANGO_VERSION = 1.11.20
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/90/84/7981bdfcfa80fe81df5325899f9fc1cbebce1fbe4fac092a32dca00d0ab2
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/99/2a/6cb6fdae67a101e19cd02b1af75131eee51b8dcd0cc22c9cfdd2270b5715
+
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
