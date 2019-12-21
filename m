From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 23:08:18 +0100
Subject: [Buildroot] [git commit] package/python-django: security bump to
 version 3.0.1
Message-ID: <20191221215917.3539C8D3B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ea753f8d3fbbb88629b82c1befbd1fc224b59bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerability:

- CVE-2019-19844: Potential account hijack via password reset form
  By submitting a suitably crafted email address making use of Unicode
  characters, that compared equal to an existing user email when lower-cased
  for comparison, an attacker could be sent a password reset token for the
  matched account

In addition, a number of bugs have been fixed.  For details, see the release
notes:
https://docs.djangoproject.com/en/dev/releases/3.0.1/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index f2bd879e9d..f55f844e33 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	bd2aebfa7c1106755544f7f217d2acde  Django-3.0.tar.gz
-sha256	d98c9b6e5eed147bc51f47c014ff6826bd1ab50b166956776ee13db5a58804ae  Django-3.0.tar.gz
+md5	12f434ed7ccd6ee57be6f05a45e20e97  Django-3.0.1.tar.gz
+sha256	315b11ea265dd15348d47f2cbb044ef71da2018f6e582fed875c889758e6f844  Django-3.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 4158669b14..100eb43abe 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.0
+PYTHON_DJANGO_VERSION = 3.0.1
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/f8/46/b3b8c61f867827fff2305db40659495dcd64fb35c399e75c53f23c113871
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/44/e8/4ae9ef3d455f4ce5aa22259cb6e40c69b29ef6b02d49c5cdfa265f7fc821
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
