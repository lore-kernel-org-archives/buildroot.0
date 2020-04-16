From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 16 Apr 2020 04:27:13 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-requests: bump to version
 2.23.0
Message-ID: <20200416102713.110388-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop patch that is now upstream.

License hash change is due to date change in upstream commit:
https://github.com/psf/requests/commit/a29be8f9ccf13c887e0f8861c2a35fb5289b9e3f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ncies-to-major-instead-of-minor-5342.patch | 40 -------------------
 package/python-requests/python-requests.hash  |  6 +--
 package/python-requests/python-requests.mk    |  4 +-
 3 files changed, 5 insertions(+), 45 deletions(-)
 delete mode 100644 package/python-requests/0001-Limit-dependencies-to-major-instead-of-minor-5342.patch

diff --git a/package/python-requests/0001-Limit-dependencies-to-major-instead-of-minor-5342.patch b/package/python-requests/0001-Limit-dependencies-to-major-instead-of-minor-5342.patch
deleted file mode 100644
index b113c928d4..0000000000
--- a/package/python-requests/0001-Limit-dependencies-to-major-instead-of-minor-5342.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 9e9141ed638c3163c7fbf1a1f3a9b9f5a80bdf4f Mon Sep 17 00:00:00 2001
-From: Chris Withers <chris@withers.org>
-Date: Tue, 18 Feb 2020 14:58:27 +0000
-Subject: [PATCH] Limit dependencies to major instead of minor (#5342)
-
-(cherry picked from commit c46f55bd48dabc02f033d252f8c64e2011f37361)
-
-[Romain backport from upstream to 2.22.0]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- setup.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index 3dce2965..f0bfebcc 100755
---- a/setup.py
-+++ b/setup.py
-@@ -42,8 +42,8 @@ if sys.argv[-1] == 'publish':
- packages = ['requests']
- 
- requires = [
--    'chardet>=3.0.2,<3.1.0',
--    'idna>=2.5,<2.9',
-+    'chardet>=3.0.2,<4',
-+    'idna>=2.5,<3',
-     'urllib3>=1.21.1,<1.26,!=1.25.0,!=1.25.1',
-     'certifi>=2017.4.17'
- 
-@@ -101,7 +101,7 @@ setup(
-     cmdclass={'test': PyTest},
-     tests_require=test_requirements,
-     extras_require={
--        'security': ['pyOpenSSL >= 0.14', 'cryptography>=1.3.4', 'idna>=2.0.0'],
-+        'security': ['pyOpenSSL >= 0.14', 'cryptography>=1.3.4'],
-         'socks': ['PySocks>=1.5.6, !=1.5.7'],
-         'socks:sys_platform == "win32" and python_version == "2.7"': ['win_inet_pton'],
-     },
--- 
-2.25.2
-
diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index 42f45d3a44..b252e3a781 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5	ee28bee2de76e9198fc41e48f3a7dd47  requests-2.22.0.tar.gz
-sha256	11e007a8a2aa0323f5a921e9e6a2d7e4e67d9877e85773fba9ba6419025cbeb4  requests-2.22.0.tar.gz
+md5  abfdc28db1065bbd0bc32592ac9d27a6  requests-2.23.0.tar.gz
+sha256  b3f43d496c6daba4493e7c431722aeb7dbc6288f52a6e04e7b6023b0247817e6  requests-2.23.0.tar.gz
 # Locally computed sha256 checksums
-sha256	be41abac2c40f8530307e8d172c590b476f4a488bc6a68f8de57b7cf64786687  LICENSE
+sha256  8837a2f33a61bcee175c028ff16d1c160aba48a3aebe1495ace709be4e62636b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index e64db94523..1adf564015 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.22.0
+PYTHON_REQUESTS_VERSION = 2.23.0
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/01/62/ddcf76d1d19885e8579acb1b1df26a852b03472c0e46d2b959a714c90608
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/f5/4f/280162d4bd4d8aad241a21aecff7a6e46891b905a4341e7ab549ebaf7915
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.20.1
