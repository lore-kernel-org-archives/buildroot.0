From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 09:40:38 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-django:
 security bump to version 3.0.10
Message-ID: <20200905073713.5B81886F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4519dff4ce87abba4115bcc725336282eba3d3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes the following security issues:

CVE-2020-24583: Incorrect permissions on intermediate-level directories on Python 3.7+
On Python 3.7+, FILE_UPLOAD_DIRECTORY_PERMISSIONS mode was not applied to
intermediate-level directories created in the process of uploading files and
to intermediate-level collected static directories when using the
collectstatic management command.

You should review and manually fix permissions on existing
intermediate-level directories.

CVE-2020-24584: Permission escalation in intermediate-level directories of
the file system cache on Python 3.7+
On Python 3.7+, the intermediate-level directories of the file system cache
had the system???s standard umask rather than 0o077 (no group or others
permissions).

https://docs.djangoproject.com/en/dev/releases/3.0.10/

In addition, 3.0.8..10 contains a number of bugfixes.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit eaefa775ed7ec0062d21e3ac37f10e93b990ad5b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 9690401043..8aebe62161 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	c3ac98d5503c671d316cf78ded3c9809  Django-3.0.7.tar.gz
-sha256	5052b34b34b3425233c682e0e11d658fd6efd587d11335a0203d827224ada8f2  Django-3.0.7.tar.gz
+md5	deec48e8713727e443a7cee6b54baaeb  Django-3.0.10.tar.gz
+sha256	2d14be521c3ae24960e5e83d4575e156a8c479a75c935224b671b1c6e66eddaf  Django-3.0.10.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index d76f6101e9..97bf75320d 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.0.7
+PYTHON_DJANGO_VERSION = 3.0.10
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/74/ad/8a1bc5e0f8b740792c99c7bef5ecc043018e2b605a2fe1e2513fde586b72
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f4/09/d7c995b128bec61233cfea0e5fa40e442cae54c127b4b2b0881e1fdd0023
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
