From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 21:34:55 +0100
Subject: [Buildroot] [git commit] package/python-mwclient: bump version to
 0.8.7
Message-ID: <20180115203459.889B181D5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f75ed80a21c83098a59400087d37f64fe93b565
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch applied upstream:
https://github.com/mwclient/mwclient/commit/60d4b933184172b98e4b31b79b4420c35571bbea

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...require-pytest-runner-only-when-necessary.patch | 43 ----------------------
 package/python-mwclient/python-mwclient.hash       |  5 ++-
 package/python-mwclient/python-mwclient.mk         |  4 +-
 3 files changed, 5 insertions(+), 47 deletions(-)

diff --git a/package/python-mwclient/0001-setup.py-require-pytest-runner-only-when-necessary.patch b/package/python-mwclient/0001-setup.py-require-pytest-runner-only-when-necessary.patch
deleted file mode 100644
index 124236c..0000000
--- a/package/python-mwclient/0001-setup.py-require-pytest-runner-only-when-necessary.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a6ff9745f56b776f244c2c412685f5c10ff0f09d Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Fri, 24 Nov 2017 20:44:53 +0100
-Subject: [PATCH] setup.py: require pytest-runner only when necessary
-
-This optimizes setup.py for cases when pytest-runner is not needed,
-using the approach that is suggested upstream:
-
-https://pypi.python.org/pypi/pytest-runner#conditional-requirement
-
-Patch sent upstream: https://github.com/mwclient/mwclient/pull/180
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- setup.py | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index a32cbde..660d93b 100644
---- a/setup.py
-+++ b/setup.py
-@@ -8,6 +8,9 @@ from setuptools import setup
- here = os.path.abspath(os.path.dirname(__file__))
- README = open(os.path.join(here, 'README.rst')).read()
- 
-+needs_pytest = set(['pytest', 'test', 'ptr']).intersection(sys.argv)
-+pytest_runner = ['pytest-runner'] if needs_pytest else []
-+
- setup(name='mwclient',
-       version='0.8.6',  # Use bumpversion to update
-       description='MediaWiki API client',
-@@ -27,7 +30,7 @@ setup(name='mwclient',
-       license='MIT',
-       packages=['mwclient'],
-       install_requires=['requests_oauthlib', 'six'],
--      setup_requires=['pytest-runner'],
-+      setup_requires=pytest_runner,
-       tests_require=['pytest', 'pytest-pep8', 'pytest-cache', 'pytest-cov',
-                      'responses>=0.3.0', 'responses!=0.6.0', 'mock'],
-       zip_safe=True
--- 
-2.11.0
-
diff --git a/package/python-mwclient/python-mwclient.hash b/package/python-mwclient/python-mwclient.hash
index 1e9744c..3fb643e 100644
--- a/package/python-mwclient/python-mwclient.hash
+++ b/package/python-mwclient/python-mwclient.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/mwclient/json, sha256 locally computed
-md5	a73687e8caa4248e9f48caece76592ff  mwclient-0.8.6.tar.gz
-sha256	08f917b995b331b937ed8c7e297406e3c8d33b80234679ee7fbfeeafd7570a8e  mwclient-0.8.6.tar.gz
+md5	486d3109e73d298d512d967501b23647  mwclient-0.8.7.tar.gz
+sha256	3bdaaa48fda6386b190651e49484a549bd0c48b97573dbda34a8b7c4c80430ed  mwclient-0.8.7.tar.gz
+sha256	d29eaa80939b6d8fc3ab458bab90f4af879fa9e0430ed7e0fb2b94752e7eb33f  mwclient/__init__.py
diff --git a/package/python-mwclient/python-mwclient.mk b/package/python-mwclient/python-mwclient.mk
index 7c2a0b0..5f18ef7 100644
--- a/package/python-mwclient/python-mwclient.mk
+++ b/package/python-mwclient/python-mwclient.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MWCLIENT_VERSION = 0.8.6
+PYTHON_MWCLIENT_VERSION = 0.8.7
 PYTHON_MWCLIENT_SOURCE = mwclient-$(PYTHON_MWCLIENT_VERSION).tar.gz
-PYTHON_MWCLIENT_SITE = https://pypi.python.org/packages/cd/38/beaf985032b42a0b0c8f9028b469c4dcb0bd7bfab62707ec27af7e890e84
+PYTHON_MWCLIENT_SITE = https://pypi.python.org/packages/63/05/ddf7d1b0d3a1dc9ee650dcaef7ddfbb980b4d2f0c41128c5f9e6fed5e8e2
 PYTHON_MWCLIENT_LICENSE = MIT
 PYTHON_MWCLIENT_LICENSE_FILES = mwclient/__init__.py
 PYTHON_MWCLIENT_SETUP_TYPE = setuptools
