From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  3 Feb 2020 12:28:21 +0100
Subject: [Buildroot] [PATCH] package/python-django: security bump to version
 3.0.3
Message-ID: <20200203112822.4250-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:

- CVE-2020-7471: Potential SQL injection via StringAgg(delimiter)
  django.contrib.postgres.aggregates.StringAgg aggregation function was
  subject to SQL injection, using a suitably crafted delimiter.

For more details, see the advisory:
https://www.djangoproject.com/weblog/2020/feb/03/security-releases/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 8a2f967077..cdf3dbd271 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	24d5364af6b04c4dd173111a3207459a  Django-3.0.2.tar.gz
-sha256	8c3575f81e11390893860d97e1e0154c47512f180ea55bd84ce8fa69ba8051ca  Django-3.0.2.tar.gz
+md5	37ec335a56234c0ad56c383b810afc7f  Django-3.0.3.tar.gz
+sha256	2f1ba1db8648484dd5c238fb62504777b7ad090c81c5f1fd8d5eb5ec21b5f283  Django-3.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 68f9094fc0..0e557489df 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.0.2
+PYTHON_DJANGO_VERSION = 3.0.3
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/c5/c1/5b901e21114b5dd9233726c2975c0aa7e9f48f63e41ec95d8777721d8aff
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/3d/21/316d435bf8bd6f355be6b5765da91394fb38f405e5bea6680e411e4d470c
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
-- 
2.20.1
