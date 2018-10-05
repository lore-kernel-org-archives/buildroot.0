From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Oct 2018 22:29:29 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] python-django: bump
 version to 1.11.16
Message-ID: <20181005202832.D8AED8D698@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44fb6ff6795b22da3c81fcb0d9b4c3c53aafc8fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Fixes a race condition in QuerySet.update_or_create() that could result in
data loss:

https://code.djangoproject.com/ticket/29499

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit feb811f56756bdbbbdd5a2230545462d46b2ea61)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index bc7aed9479..6e6e7708db 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,3 +1,3 @@
-# From https://www.djangoproject.com/m/pgp/Django-1.11.15.checksum.txt
-sha256	b18235d82426f09733d2de9910cee975cf52ff05e5f836681eb957d105a05a40  Django-1.11.15.tar.gz
+# From https://www.djangoproject.com/m/pgp/Django-1.11.16.checksum.txt
+sha256	29268cc47816a44f27308e60f71da635f549c47d8a1d003b28de55141df75791  Django-1.11.16.tar.gz
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index ae604dbc97..9f43ffab85 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 1.11.15
+PYTHON_DJANGO_VERSION = 1.11.16
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/43/b5/b44286e56a5211d37b4058dcd5e62835afa5ce5aa6a38b56bd04c0d01cbc
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/35/1d/59836bce4c9cfded261e21c0abd6a4629de6d289522d0fd928117d8eb985
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
