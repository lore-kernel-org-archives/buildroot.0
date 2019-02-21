From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 21 Feb 2019 14:06:27 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/python-django:
 security bump to version 2.1.7
Message-ID: <20190221154115.D62FA8C99C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d11207f161012c5d920590dd8409239199a2094
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Fixes the following security issues:

CVE-2019-6975: Memory exhaustion in django.utils.numberformat.format()

If django.utils.numberformat.format() ??? used by contrib.admin as well as the
the floatformat, filesizeformat, and intcomma templates filters ??? received a
Decimal with a large number of digits or a large exponent, it could lead to
significant memory usage due to a call to '{:f}'.format().

To avoid this, decimals with more than 200 digits are now formatted using
scientific notation.

https://docs.djangoproject.com/en/2.1/releases/2.1.6/

2.1.6 contained a packaging error, fixed by 2.1.7:

https://docs.djangoproject.com/en/2.1/releases/2.1.7/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 653f86c0e91847dd8841837b650e2e966b59dd78)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 4b932ac907..93ca1080c5 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5	9309c48c8b92503b8969a7603a97e2a1  Django-2.1.5.tar.gz
-sha256	d6393918da830530a9516bbbcbf7f1214c3d733738779f06b0f649f49cc698c3  Django-2.1.5.tar.gz
+md5	a042e6ba117d2e01950d842cceb5eee0  Django-2.1.7.tar.gz
+sha256	939652e9d34d7d53d74d5d8ef82a19e5f8bb2de75618f7e5360691b6e9667963  Django-2.1.7.tar.gz
 # Locally computed sha256 checksums
 sha256	b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 53e8f20e87..5922a6c07c 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 2.1.5
+PYTHON_DJANGO_VERSION = 2.1.7
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/5c/7f/4c750e09b246621e5e90fa08f93dec1b991f5c203b0ff615d62a891c8f41
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/7e/ae/29c28f6afddae0e305326078f31372f03d7f2e6d6210c9963843196ce67e
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_SETUP_TYPE = setuptools
