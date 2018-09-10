From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Sep 2018 17:19:11 +0200
Subject: [Buildroot] [git commit] python-gunicorn: bump to version 19.9.0
Message-ID: <20180910151848.58FA08397C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dca4f1726ca17d5d118c257ac29174236582f1a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No need for setuptools on target anymore.
Add license hash.

Fixes:
http://autobuild.buildroot.net/results/3d5/3d526c23ae17f03cbd771f6ad18390567c1c5d3a/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gunicorn/Config.in            | 1 -
 package/python-gunicorn/python-gunicorn.hash | 8 +++++---
 package/python-gunicorn/python-gunicorn.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-gunicorn/Config.in b/package/python-gunicorn/Config.in
index 79cda3eaa6..098c3fa6b0 100644
--- a/package/python-gunicorn/Config.in
+++ b/package/python-gunicorn/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_GUNICORN
 	bool "python-gunicorn"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
 	help
diff --git a/package/python-gunicorn/python-gunicorn.hash b/package/python-gunicorn/python-gunicorn.hash
index a282bc995d..402250ea78 100644
--- a/package/python-gunicorn/python-gunicorn.hash
+++ b/package/python-gunicorn/python-gunicorn.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi/gunicorn/json, sha256 locally computed
-md5	338e5e8a83ea0f0625f768dba4597530  gunicorn-19.6.0.tar.gz
-sha256	813f6916d18a4c8e90efde72f419308b357692f81333cb1125f80013d22fb618  gunicorn-19.6.0.tar.gz
+# md5, sha256 from https://pypi.python.org/pypi/gunicorn/json
+md5	f581937e9d8569ebd3fd6af1f9ab809f  gunicorn-19.9.0.tar.gz
+sha256	fa2662097c66f920f53f70621c6c58ca4a3c4d3434205e608e121b5b3b71f4f3  gunicorn-19.9.0.tar.gz
+# Locally computed sha256
+sha256	789fe11b92e1cabfbcf744b5fcc392c9bd5c6798603a4e89f925b6337984d1df  LICENSE
diff --git a/package/python-gunicorn/python-gunicorn.mk b/package/python-gunicorn/python-gunicorn.mk
index cfb7da110c..d113f75185 100644
--- a/package/python-gunicorn/python-gunicorn.mk
+++ b/package/python-gunicorn/python-gunicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GUNICORN_VERSION = 19.6.0
+PYTHON_GUNICORN_VERSION = 19.9.0
 PYTHON_GUNICORN_SOURCE = gunicorn-$(PYTHON_GUNICORN_VERSION).tar.gz
-PYTHON_GUNICORN_SITE = https://pypi.python.org/packages/84/ce/7ea5396efad1cef682bbc4068e72a0276341d9d9d0f501da609fab9fcb80
+PYTHON_GUNICORN_SITE = https://files.pythonhosted.org/packages/47/52/68ba8e5e8ba251e54006a49441f7ccabca83b6bef5aedacb4890596c7911
 PYTHON_GUNICORN_SETUP_TYPE = setuptools
 PYTHON_GUNICORN_LICENSE = MIT
 PYTHON_GUNICORN_LICENSE_FILES = LICENSE
