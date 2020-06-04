From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  4 Jun 2020 14:39:26 +0200
Subject: [Buildroot] [PATCH] package/python-django: security bump to version
 3.0.7
Message-ID: <20200604123926.18731-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

- CVE-2020-13254: Potential data leakage via malformed memcached keys

  In cases where a memcached backend does not perform key validation,
  passing malformed cache keys could result in a key collision, and
  potential data leakage.  In order to avoid this vulnerability, key
  validation is added to the memcached cache backends.

- CVE-2020-13596: Possible XSS via admin ForeignKeyRawIdWidget

  Query parameters for the admin ForeignKeyRawIdWidget were not properly URL
  encoded, posing an XSS attack vector.  ForeignKeyRawIdWidget now ensures
  query parameters are correctly URL encoded.

For details, see the announcement:
https://docs.djangoproject.com/en/dev/releases/3.0.7/

Additionally, 3.0.5..3.0.7 contains a number of non-security related
bugfixes.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index af5e4bb6e0..9690401043 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	0b0299419770eaff86ff3a4af519cd6a  Django-3.0.4.tar.gz
-sha256	50b781f6cbeb98f673aa76ed8e572a019a45e52bdd4ad09001072dfd91ab07c8  Django-3.0.4.tar.gz
+md5	c3ac98d5503c671d316cf78ded3c9809  Django-3.0.7.tar.gz
+sha256	5052b34b34b3425233c682e0e11d658fd6efd587d11335a0203d827224ada8f2  Django-3.0.7.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 0cc5749a9b..d76f6101e9 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.0.4
+PYTHON_DJANGO_VERSION = 3.0.7
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/1d/38/89ea18b5aeb9b56fff7430388946e8e9dfd7a451f3e6ddb8a9b637f442c1
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/74/ad/8a1bc5e0f8b740792c99c7bef5ecc043018e2b605a2fe1e2513fde586b72
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
-- 
2.20.1
