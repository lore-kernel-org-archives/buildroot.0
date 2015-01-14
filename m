From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 19:26:12 +0100
Subject: [Buildroot] [git commit] python-django: security bump to version
	1.7.3
Message-ID: <20150114182636.57E45807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23ed2cf2dc85f98412862c66766f9aaeee23621e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

CVE-2015-0219 - incorrectly handled underscores in WSGI headers. A
remote attacker could possibly use this issue to spoof headers in
certain environments.

CVE-2015-0220 - incorrectly handled user-supplied redirect URLs. A
remote attacker could possibly use this issue to perform a cross-site
scripting attack.

CVE-2015-0221 - incorrectly handled reading files in
django.views.static.serve(). A remote attacker could possibly use this
issue to cause Django to consume resources, resulting in a denial of
service.

CVE-2015-0222 - incorrectly handled forms with ModelMultipleChoiceField.
A remote attacker could possibly use this issue to cause a large number
of SQL queries, resulting in a database denial of service.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-django/python-django.hash |    4 ++--
 package/python-django/python-django.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
index 0195a13..f51c9b4 100644
--- a/package/python-django/python-django.hash
+++ b/package/python-django/python-django.hash
@@ -1,2 +1,2 @@
-# sha256 from https://www.djangoproject.com/m/pgp/Django-1.7.2.checksum.txt
-sha256 31c6c3c229f8c04b3be87e6afc3492903b57ec8f1188a47b6ae160d90cf653c8 Django-1.7.2.tar.gz
+# sha256 from https://www.djangoproject.com/m/pgp/Django-1.7.3.checksum.txt
+sha256 f226fb8aa438456968d403f6739de1cf2dad128db86f66ee2b41dfebe3645c5b	Django-1.7.3.tar.gz
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
index fcfa406..28f25bd 100644
--- a/package/python-django/python-django.mk
+++ b/package/python-django/python-django.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_DJANGO_VERSION = 1.7.2
+PYTHON_DJANGO_VERSION = 1.7.3
 PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
 # The official Django site has an unpractical URL
 PYTHON_DJANGO_SITE = https://pypi.python.org/packages/source/D/Django/
