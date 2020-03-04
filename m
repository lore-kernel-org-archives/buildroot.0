From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed,  4 Mar 2020 20:54:52 +0100
Subject: [Buildroot] [PATCH] package/python-django: security bump to version
 3.0.4
Message-ID: <20200304195452.23371-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security vulnerabilities:

- CVE-2020-9402: Potential SQL injection via tolerance parameter in GIS
  functions and aggregates on Oracle.
  GIS functions and aggregates on Oracle were subject to SQL injection,
  using a suitably crafted tolerance.

For more details, see the advisory:
https://www.djangoproject.com/weblog/2020/mar/04/security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index cdf3dbd271..af5e4bb6e0 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	37ec335a56234c0ad56c383b810afc7f  Django-3.0.3.tar.gz
-sha256	2f1ba1db8648484dd5c238fb62504777b7ad090c81c5f1fd8d5eb5ec21b5f283  Django-3.0.3.tar.gz
+md5	0b0299419770eaff86ff3a4af519cd6a  Django-3.0.4.tar.gz
+sha256	50b781f6cbeb98f673aa76ed8e572a019a45e52bdd4ad09001072dfd91ab07c8  Django-3.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 0e557489df..0cc5749a9b 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.0.3
+PYTHON_DJANGO_VERSION = 3.0.4
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/3d/21/316d435bf8bd6f355be6b5765da91394fb38f405e5bea6680e411e4d470c
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/1d/38/89ea18b5aeb9b56fff7430388946e8e9dfd7a451f3e6ddb8a9b637f442c1
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
-- 
2.20.1
