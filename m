From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 3 Feb 2021 20:26:17 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-django:
 security bump to version 3.0.12
Message-ID: <20210203191001.5AACD7FB5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=147bd0ebb62b137d844f86cc4aa022cba7b18b61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

CVE-2021-3281: Potential directory-traversal via archive.extract()

The django.utils.archive.extract() function, used by startapp --template and
startproject --template, allowed directory-traversal via an archive with
absolute paths or relative paths with dot segments.

For details, see the advisory:
https://www.djangoproject.com/weblog/2021/feb/01/security-releases/

Additionally, 3.0.11 fixed a regression:
https://docs.djangoproject.com/en/3.1/releases/3.0.11/

Update indentation in hash file (two spaces).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 28355e20fe3fc48bf9488e3a70a778c298b1f50b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 6 +++---
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 8aebe62161..53f718ea0a 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	deec48e8713727e443a7cee6b54baaeb  Django-3.0.10.tar.gz
-sha256	2d14be521c3ae24960e5e83d4575e156a8c479a75c935224b671b1c6e66eddaf  Django-3.0.10.tar.gz
+md5  55291777e25bd9e0a286c6f64751246a  Django-3.0.12.tar.gz
+sha256  fd63e2c7acca5f2e7ad93dfb53d566e040d871404fc0f684a3e720006d221f9a  Django-3.0.12.tar.gz
 # Locally computed sha256 checksums
-sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
+sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 97bf75320d..512f2cd89c 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.0.10
+PYTHON_DJANGO_VERSION = 3.0.12
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f4/09/d7c995b128bec61233cfea0e5fa40e442cae54c127b4b2b0881e1fdd0023
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/32/e3/e7e9a9378321fdfc3eb55de151911dce968fa245d1f16d8c480c63ea4ed1
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
