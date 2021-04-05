From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 18:22:44 +0200
Subject: [Buildroot] [git commit] package/python-parso: bump to version 0.8.2
Message-ID: <20210405160039.A55EB7FC58@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf3ce0e01ff0fc11e1df00134180130cffc7d245
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python 2 support has been dropped since versio 0.8.0 and
https://github.com/davidhalter/parso/commit/b601ade90b5e5d89cf1e56a00997d6e32588e930

https://github.com/davidhalter/parso/blob/v0.8.2/CHANGELOG.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-jedi/Config.in          | 1 +
 package/python-parso/Config.in         | 1 +
 package/python-parso/python-parso.hash | 4 ++--
 package/python-parso/python-parso.mk   | 4 ++--
 4 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-jedi/Config.in b/package/python-jedi/Config.in
index 8ceaa1530c..7445589029 100644
--- a/package/python-jedi/Config.in
+++ b/package/python-jedi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_JEDI
 	bool "python-jedi"
+	depends on BR2_PACKAGE_PYTHON3 # python-parso
 	select BR2_PACKAGE_PYTHON_PARSO # runtime
 	help
 	  An autocompletion tool for Python that can be used for text
diff --git a/package/python-parso/Config.in b/package/python-parso/Config.in
index ea1c5a4732..4f5482d8a0 100644
--- a/package/python-parso/Config.in
+++ b/package/python-parso/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PARSO
 	bool "python-parso"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A Python Parser.
 
diff --git a/package/python-parso/python-parso.hash b/package/python-parso/python-parso.hash
index ab2e20943f..538ffccf37 100644
--- a/package/python-parso/python-parso.hash
+++ b/package/python-parso/python-parso.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/parso/json
-md5  d3a892fb4d9a0ffed838b0a3416145bf  parso-0.7.0.tar.gz
-sha256  908e9fae2144a076d72ae4e25539143d40b8e3eafbaeae03c1bfe226f4cdf12c  parso-0.7.0.tar.gz
+md5  dd8fed40ceb890d3e277ad44a678c1f1  parso-0.8.2.tar.gz
+sha256  12b83492c6239ce32ff5eed6d3639d6a536170723c6f3f1506869f1ace413398  parso-0.8.2.tar.gz
 # Locally computed sha256 checksums
 sha256  fa67973073753d17624caf8684d5ee816d70c89d912c5bca7ca0f08e7b150edb  LICENSE.txt
 sha256  9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
diff --git a/package/python-parso/python-parso.mk b/package/python-parso/python-parso.mk
index b7688c2069..6862a7e97d 100644
--- a/package/python-parso/python-parso.mk
+++ b/package/python-parso/python-parso.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARSO_VERSION = 0.7.0
+PYTHON_PARSO_VERSION = 0.8.2
 PYTHON_PARSO_SOURCE = parso-$(PYTHON_PARSO_VERSION).tar.gz
-PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/fe/24/c30eb4be8a24b965cfd6e2e6b41180131789b44042112a16f9eb10c80f6e
+PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/5e/61/d119e2683138a934550e47fc8ec023eb7f11b194883e9085dca3af5d4951
 PYTHON_PARSO_SETUP_TYPE = setuptools
 PYTHON_PARSO_LICENSE = MIT, Python-2.0, BSD-3-Clause (flask theme)
 PYTHON_PARSO_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE test/normalizer_issue_files/LICENSE
