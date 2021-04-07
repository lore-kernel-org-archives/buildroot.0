From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Apr 2021 11:17:13 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/python-django:
 security bump to version 3.0.14
Message-ID: <20210407085245.0A37181807@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b28cf20fee0e755690262ef8b63c5e1d070aa9b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issue:

CVE-2021-28658: Potential directory-traversal via uploaded files

MultiPartParser allowed directory-traversal via uploaded files with suitably crafted file names.

Built-in upload handlers were not affected by this vulnerability.

For more details, see the announcement:
https://www.djangoproject.com/weblog/2021/apr/06/security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cb5bfd63d9f521e0323ffd52f804900219e49330)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index f40cfa8f3c..1cc4b5ecc9 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  7020810fb65b17e82d22001883b63a12  Django-3.0.13.tar.gz
-sha256  6f13c3e8109236129c49d65a42fbf30c928e66b05ca6862246061b9343ecbaf2  Django-3.0.13.tar.gz
+md5  f444fdd6ff8edec132991cbc343368d4  Django-3.0.14.tar.gz
+sha256  d58d8394036db75a81896037d757357e79406e8f68816c3e8a28721c1d9d4c11  Django-3.0.14.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 593b0c6043..cb8f5492d6 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.0.13
+PYTHON_DJANGO_VERSION = 3.0.14
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/3b/fe/11ec9b4cbae447e7b90d551be035d55c1293973592b491540334452f1f1f
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/76/0e/5d847a77b7b42cacd01405b45e4e370124c1d8a15970865df5ab0f09f83a
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
