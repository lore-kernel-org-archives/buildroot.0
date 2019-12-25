From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 19:39:36 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/python-django:
 security bump to version 2.2.9
Message-ID: <20191225194931.589EA8E3E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b164fbfc5bd66b37fae9711f73eaa06bf56381e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Fixes the following security vulnerability:

- CVE-2019-19844: Potential account hijack via password reset form
  By submitting a suitably crafted email address making use of Unicode
  characters, that compared equal to an existing user email when lower-cased
  for comparison, an attacker could be sent a password reset token for the
  matched account

In addition, a number of bugs have been fixed.  For details, see the release
notes:
https://docs.djangoproject.com/en/dev/releases/2.2.9/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 965055f47d..5d1e6c40e7 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	57d965818410a4e00e2267eef66aa9c9  Django-2.2.8.tar.gz
-sha256	a4ad4f6f9c6a4b7af7e2deec8d0cbff28501852e5010d6c2dc695d3d1fae7ca0  Django-2.2.8.tar.gz
+md5	a9a6555d166196e502b69715341f7ad4  Django-2.2.9.tar.gz
+sha256	662a1ff78792e3fd77f16f71b1f31149489434de4b62a74895bd5d6534e635a5  Django-2.2.9.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index d541a2c07b..d5b2c1585f 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.2.8
+PYTHON_DJANGO_VERSION = 2.2.9
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/1c/aa/f618f346b895123be44739b276099a2b418b45b2b7afb5e1071403e8d2e9
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/2c/0d/2aa8e58c791d2aa65658fa26f2b035a9da13a6a34d1b2d991912c8a33729
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
