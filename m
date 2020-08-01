From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat,  1 Aug 2020 16:14:13 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-pynacl: bump to version 1.4.0
Message-ID: <20200801221413.1662705-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to backport a commit to fix a build failure cased by a spurious
wheel dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...e-spurious-requirement-for-wheel-596.patch | 34 +++++++++++++++++++
 package/python-pynacl/python-pynacl.hash      |  6 ++--
 package/python-pynacl/python-pynacl.mk        |  4 +--
 3 files changed, 39 insertions(+), 5 deletions(-)
 create mode 100644 package/python-pynacl/0001-Remove-spurious-requirement-for-wheel-596.patch

diff --git a/package/python-pynacl/0001-Remove-spurious-requirement-for-wheel-596.patch b/package/python-pynacl/0001-Remove-spurious-requirement-for-wheel-596.patch
new file mode 100644
index 0000000000..4f4a76ce29
--- /dev/null
+++ b/package/python-pynacl/0001-Remove-spurious-requirement-for-wheel-596.patch
@@ -0,0 +1,34 @@
+From 44fb453931c611d4822343debe902cca8e1c8afe Mon Sep 17 00:00:00 2001
+From: Scott Kitterman <sklist@kitterman.com>
+Date: Tue, 26 May 2020 20:08:16 -0400
+Subject: [PATCH] Remove spurious requirement for wheel (#596)
+
+* Remove spurious requirement for wheel
+
+* Put wheel back in pyproject.toml
+
+Co-authored-by: Scott Kitterman <scott@kitterman.com>
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1 at gmail.com: backport from upstream commit
+44fb453931c611d4822343debe902cca8e1c8afe]
+---
+ setup.py | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 9319c1c..d82a7fe 100644
+--- a/setup.py
++++ b/setup.py
+@@ -35,8 +35,7 @@ except ImportError:
+ 
+ 
+ requirements = ["six"]
+-setup_requirements = ["setuptools",
+-                      "wheel"]
++setup_requirements = ["setuptools"]
+ test_requirements = ["pytest>=3.2.1,!=3.3.0",
+                      "hypothesis>=3.27.0"]
+ docs_requirements = ["sphinx>=1.6.5",
+-- 
+2.25.1
+
diff --git a/package/python-pynacl/python-pynacl.hash b/package/python-pynacl/python-pynacl.hash
index 9aa8a0eefe..b6ee2baf0e 100644
--- a/package/python-pynacl/python-pynacl.hash
+++ b/package/python-pynacl/python-pynacl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pynacl/json
-md5	3f3b1272287bc2de8efd8a5fa18bf728  PyNaCl-1.3.0.tar.gz
-sha256	0c6100edd16fefd1557da078c7a31e7b7d7a52ce39fdca2bec29d4f7b6e7600c  PyNaCl-1.3.0.tar.gz
+md5  8c6c57893327a694c72510fb620e4744  PyNaCl-1.4.0.tar.gz
+sha256  54e9a2c849c742006516ad56a88f5c74bf2ce92c9f67435187c3c5953b346505  PyNaCl-1.4.0.tar.gz
 # Locally computed sha256 checksums
-sha256	d3174ad63e721d4c9dccb8ad4320848992d314369bc46319720b5802c9153fe9  LICENSE
+sha256  d3174ad63e721d4c9dccb8ad4320848992d314369bc46319720b5802c9153fe9  LICENSE
diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
index 679b3a7795..1e4155992a 100644
--- a/package/python-pynacl/python-pynacl.mk
+++ b/package/python-pynacl/python-pynacl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYNACL_VERSION = 1.3.0
+PYTHON_PYNACL_VERSION = 1.4.0
 PYTHON_PYNACL_SOURCE = PyNaCl-$(PYTHON_PYNACL_VERSION).tar.gz
-PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/61/ab/2ac6dea8489fa713e2b4c6c5b549cc962dd4a842b5998d9e80cf8440b7cd
+PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/cf/5a/25aeb636baeceab15c8e57e66b8aa930c011ec1c035f284170cacb05025e
 PYTHON_PYNACL_LICENSE = Apache-2.0
 PYTHON_PYNACL_LICENSE_FILES = LICENSE
 PYTHON_PYNACL_SETUP_TYPE = setuptools
-- 
2.25.1
