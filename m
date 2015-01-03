From: oli vogt <oli.vogt.pub01@gmail.com>
Date: Sat,  3 Jan 2015 13:28:24 +1300
Subject: [Buildroot] [PATCH 1/1] python-django: new package
Message-ID: <1420244904-23270-1-git-send-email-oli.vogt.pub01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: oli vogt <oli.vogt.pub01@gmail.com>
---
 package/Config.in                        |  1 +
 package/python-django/Config.in          | 15 +++++++++++++++
 package/python-django/python-django.hash |  2 ++
 package/python-django/python-django.mk   | 14 ++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 package/python-django/Config.in
 create mode 100644 package/python-django/python-django.hash
 create mode 100644 package/python-django/python-django.mk

diff --git a/package/Config.in b/package/Config.in
index 424ef12..8d91b04 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -496,6 +496,7 @@ menu "external python modules"
 	source "package/python-crc16/Config.in"
 	source "package/python-daemon/Config.in"
 	source "package/python-dialog/Config.in"
+	source "package/python-django/Config.in"
 	source "package/python-docopt/Config.in"
 	source "package/python-dpkt/Config.in"
 	source "package/python-enum/Config.in"
diff --git a/package/python-django/Config.in b/package/python-django/Config.in
new file mode 100644
index 0000000..c48a381
--- /dev/null
+++ b/package/python-django/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_PYTHON_DJANGO
+	bool "python-django"
+	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_UNICODEDATA
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	help
+	  Django is a high-level Python Web framework that encourages
+	  rapid development and clean, pragmatic design. It takes your
+	  Web applications from concept to launch in a matter of hours.
+	  Django takes care of user authentication, content administration,
+	  site maps, RSS feeds, user comments and many more tasks.
+	  Django takes security seriously and helps developers avoid
+	  many common security mistakes
+
+	  https://www.djangoproject.com/
diff --git a/package/python-django/python-django.hash b/package/python-django/python-django.hash
new file mode 100644
index 0000000..313abb4
--- /dev/null
+++ b/package/python-django/python-django.hash
@@ -0,0 +1,2 @@
+# sha256 from https://www.djangoproject.com/m/pgp/Django-1.7.1.checksum.txt
+sha256	3de62e71ce2cfbcdecb6e344cad04948506c8410ea5c6eab15c8f3b31b8ac1c0 Django-1.7.1.tar.gz
diff --git a/package/python-django/python-django.mk b/package/python-django/python-django.mk
new file mode 100644
index 0000000..f874ca3
--- /dev/null
+++ b/package/python-django/python-django.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-django
+#
+################################################################################
+
+PYTHON_DJANGO_VERSION = 1.7.1
+PYTHON_DJANGO_SOURCE = Django-$(PYTHON_DJANGO_VERSION).tar.gz
+PYTHON_DJANGO_SITE = https://www.djangoproject.com/download/$(PYTHON_DJANGO_VERSION)/tarball/
+PYTHON_DJANGO_LICENSE = BSD
+PYTHON_DJANGO_LICENSE_FILES = LICENSE
+PYTHON_DJANGO_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
-- 
1.9.1
