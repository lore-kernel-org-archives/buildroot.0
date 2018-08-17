From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 18:58:05 +0200
Subject: [Buildroot] [git commit] python-django: security bump to version
 1.11.15
Message-ID: <20180817165133.646668D557@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae977e942893ac7e5c9b69418f047acae1603c27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to the latest release of the 1.11.x LTS series as 1.10.x is no longer
supported upstream:

https://www.djangoproject.com/download/

Fixes the following security issues:

- CVE-2017-12794: Possible XSS in traceback section of technical 500 debug
  page (1.11.5)

- CVE-2018-6188: Information leakage in AuthenticationForm (1.11.10)

- CVE-2018-7536: Denial-of-service possibility in urlize and urlizetrunc
  template filters (1.11.11)

- CVE-2018-7537: Denial-of-service possibility in truncatechars_html and
  truncatewords_html template filters (1.11.11)

- CVE-2018-14574: Open redirect possibility in CommonMiddleware (1.11.15)

Also add a hash for the license file.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 6 +++---
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 09be18440b..bc7aed9479 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi/django/json, sha256 locally computed
-md5	693dfeabad62c561cb205900d32c2a98  Django-1.10.7.tar.gz
-sha256	593d779dbc2350a245c4f76d26bdcad58a39895e87304fe6d725bbdf84b5b0b8  Django-1.10.7.tar.gz
+# From https://www.djangoproject.com/m/pgp/Django-1.11.15.checksum.txt
+sha256	b18235d82426f09733d2de9910cee975cf52ff05e5f836681eb957d105a05a40  Django-1.11.15.tar.gz
+sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 9056f00cf0..ae604dbc97 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 1.10.7
+PYTHON_DJANGO_VERSION = 1.11.15
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://pypi.python.org/packages/15/b4/d4bb7313e02386bd23a60e1eb5670321313fb67289c6f36ec43bce747aff
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/43/b5/b44286e56a5211d37b4058dcd5e62835afa5ce5aa6a38b56bd04c0d01cbc
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
