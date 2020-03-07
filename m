From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Mar 2020 21:52:12 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/python-django:
 security bump to version 2.2.11
Message-ID: <20200307204132.C2AF78FC22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f0455c91137e75d9eedb93e0dcef887f817300b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes the following security issues (2.2.10):

- CVE-2020-7471: Potential SQL injection via StringAgg(delimiter)
  django.contrib.postgres.aggregates.StringAgg aggregation function was
  subject to SQL injection, using a suitably crafted delimiter.

For more details, see the advisory:
https://www.djangoproject.com/weblog/2020/feb/03/security-releases/

Fixes the following security issues (2.2.11):

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
index 5d1e6c40e7..702df9c7a0 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	a9a6555d166196e502b69715341f7ad4  Django-2.2.9.tar.gz
-sha256	662a1ff78792e3fd77f16f71b1f31149489434de4b62a74895bd5d6534e635a5  Django-2.2.9.tar.gz
+md5	3d8cc4ec1329c742d848c418932e488a  Django-2.2.11.tar.gz
+sha256	65e2387e6bde531d3bb803244a2b74e0253550a9612c64a60c8c5be267b30f50  Django-2.2.11.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index d5b2c1585f..3f046ccf41 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.2.9
+PYTHON_DJANGO_VERSION = 2.2.11
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/2c/0d/2aa8e58c791d2aa65658fa26f2b035a9da13a6a34d1b2d991912c8a33729
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f0/5b/428db83c37c2cf69e077ed327ada3511837371356204befc654b5b4bd444
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
