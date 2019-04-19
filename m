From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 19 Apr 2019 11:19:32 +0200
Subject: [Buildroot] [PATCH 5/5] package/python-ipython: bump to version
 7.4.0
In-Reply-To: <20190419091932.4922-1-fontaine.fabrice@gmail.com>
References: <20190419091932.4922-1-fontaine.fabrice@gmail.com>
Message-ID: <20190419091932.4922-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Update hash for COPYING.rst, it has been updated to remove
  BSD-3-Clause text:
  https://github.com/ipython/ipython/commit/5a6ef3e35db9ac04bf47a17d96484e03370f03dd
- Add LICENSE to license files as this is now the file that contain
  BSD-3-Clause text
- Needs python3 since version 6.x and above
- Needs new runtime dependencies: backcall and jedi
- Drop obsolete python2 dependencies as well as simplegeneric:
  https://github.com/ipython/ipython/commit/dc0ceb16f92e0e943435106e863a5cfccd724a2d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-ipython/Config.in           | 6 +++---
 package/python-ipython/python-ipython.hash | 7 ++++---
 package/python-ipython/python-ipython.mk   | 6 +++---
 3 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/python-ipython/Config.in b/package/python-ipython/Config.in
index d8164afba2..c151ac2dd2 100644
--- a/package/python-ipython/Config.in
+++ b/package/python-ipython/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_PYTHON_IPYTHON
 	bool "python-ipython"
-	select BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE if BR2_PACKAGE_PYTHON  # runtime
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_BACKCALL # runtime
 	select BR2_PACKAGE_PYTHON_DECORATOR # runtime
-	select BR2_PACKAGE_PYTHON_PATHLIB2 if BR2_PACKAGE_PYTHON  # runtime
+	select BR2_PACKAGE_PYTHON_JEDI # runtime
 	select BR2_PACKAGE_PYTHON_PICKLESHARE # runtime
 	select BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT # runtime
 	select BR2_PACKAGE_PYTHON_PYGMENTS  # runtime
 	select BR2_PACKAGE_PYTHON_PEXPECT # runtime
-	select BR2_PACKAGE_PYTHON_SIMPLEGENERIC  # runtime
 	select BR2_PACKAGE_PYTHON_TRAITLETS  # runtime
 	help
 	  IPython is a command shell for interactive computing in
diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 41bdd70feb..70c3c904db 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,5 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5 7014b8824981eef2cb893ea5398d6b8d ipython-5.8.0.tar.gz
-sha256 4bac649857611baaaf76bc82c173aa542f7486446c335fe1a6c05d0d491c8906 ipython-5.8.0.tar.gz
+md5 826178c87b7b96651ce8b26a779e3016 ipython-7.4.0.tar.gz
+sha256 b038baa489c38f6d853a3cfc4c635b0cda66f2864d136fe8f40c1a6e334e2a6b ipython-7.4.0.tar.gz
 # Locally computed sha256
-sha256 a5d87689342ec47cebdf623af06cec734c607666c696fe48271f2ff91752443d COPYING.rst
+sha256 341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17 COPYING.rst
+sha256 e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 79a48bf43d..cd756b131e 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 5.8.0
+PYTHON_IPYTHON_VERSION = 7.4.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/41/a6/2d25314b1f9375639d8f8e0f8052e8cec5df511d3449f22c4f1c2d8cb3c6
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/e3/88/39c8b7701b2f7d5c8f3a1796b0c174f21071232bc5b242feb670e913acc6
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
-PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst
+PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_SETUP_TYPE = distutils
 
 $(eval $(python-package))
-- 
2.20.1
