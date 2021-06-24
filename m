From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jun 2021 09:20:03 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] package/python-django:
 security bump to version 3.2.4
Message-ID: <20210624065201.032098E065@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d0c5c212b37bc1a93378cdf16529eb4831cea3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Django 3.2.4 fixes two security issues and several bugs in 3.2.3.
- CVE-2021-33203: Potential directory traversal via ``admindocs``
- CVE-2021-33571: Possible indeterminate SSRF, RFI, and LFI attacks
  since validators accepted leading zeros in IPv4 addresses

https://github.com/django/django/blob/3.2.4/docs/releases/3.2.4.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7c69da6295627dabcbfd6ec0faf3bc6b8d9410d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-django/python-django.hash | 4 ++--
 package/python-django/python-django.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 1c7d7b8841..fe91740f5f 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/django/json
-md5  43784c090a8805605e3d0b768cd21cb2  Django-3.2.2.tar.gz
-sha256  0a1d195ad65c52bf275b8277b3d49680bd1137a5f55039a806f25f6b9752ce3d  Django-3.2.2.tar.gz
+md5  2f30db9154efb8c9ed891781d29fae2a  Django-3.2.4.tar.gz
+sha256  66c9d8db8cc6fe938a28b7887c1596e42d522e27618562517cc8929eb7e7f296  Django-3.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index 0e36a530a9..81a3c8b8f3 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 3.2.2
+PYTHON_DJANGO_VERSION = 3.2.4
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
-PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/da/24/e2e6e534464f8e0bd010401f06d2cfc773141776d2952d6418d01c97f12c
+PYTHON_DJANGO_SITE = https://files.pythonhosted.org/packages/27/94/123b3a95e9965819a3d30d36da6fc12ddff83bcfb0099f3e15437347480a
 PYTHON_DJANGO_LICENSE = BSD-3-Clause
 PYTHON_DJANGO_LICENSE_FILES = LICENSE
 PYTHON_DJANGO_CPE_ID_VENDOR = djangoproject
