From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Feb 2021 22:36:22 +0100
Subject: [Buildroot] [git commit] package/python-django: security bump to
 version 3.0.13
Message-ID: <20210219211620.D5D8E81620@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82abd78a01fc832f758fc2b2d7326879500fb786
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2021-23336: Web cache poisoning via django.utils.http.limited_parse_qsl()

  Django contains a copy of urllib.parse.parse_qsl() which was added to
  backport some security fixes.  A further security fix has been issued
  recently such that parse_qsl() no longer allows using ; as a query
  parameter separator by default.  Django now includes this fix.  See
  bpo-42967 for further details.

For more details, see the advisory:
https://www.djangoproject.com/weblog/2021/feb/19/security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 53f718ea0a..f40cfa8f3c 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  55291777e25bd9e0a286c6f64751246a  Django-3.0.12.tar.gz
-sha256  fd63e2c7acca5f2e7ad93dfb53d566e040d871404fc0f684a3e720006d221f9a  Django-3.0.12.tar.gz
+md5  7020810fb65b17e82d22001883b63a12  Django-3.0.13.tar.gz
+sha256  6f13c3e8109236129c49d65a42fbf30c928e66b05ca6862246061b9343ecbaf2  Django-3.0.13.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index a88aa6274a..593b0c6043 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.0.12
+PYTHON_DJANGO_VERSION = 3.0.13
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/32/e3/e7e9a9378321fdfc3eb55de151911dce968fa245d1f16d8c480c63ea4ed1
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/3b/fe/11ec9b4cbae447e7b90d551be035d55c1293973592b491540334452f1f1f
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
