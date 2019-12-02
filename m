From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:47 -0000
Subject: [Buildroot] [git commit] package/python-uvloop: bump to version
 0.14.0
Message-ID: <20191202083931.1921D81368@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87a5494a90e0363e17e990430452e5ad9b27577e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package now fully supports Python 3.8, so the pre-build
hook and the dependency on host-python-cython can be removed.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-uvloop/python-uvloop.hash |  4 ++--
 package/python-uvloop/python-uvloop.mk   | 17 +++++------------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/package/python-uvloop/python-uvloop.hash b/package/python-uvloop/python-uvloop.hash
index 3c274097fe..436babf915 100644
--- a/package/python-uvloop/python-uvloop.hash
+++ b/package/python-uvloop/python-uvloop.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/uvloop/json
-md5	11c84a0a62048200a70272ec9a990ff9  uvloop-0.13.0.tar.gz
-sha256	942cd07035510b149d6160796f4e972137130ae953871b6a98c2cf5d5ab68c2e  uvloop-0.13.0.tar.gz
+md5	a2f82abb676756f11f544c6b51caf171  uvloop-0.14.0.tar.gz
+sha256	123ac9c0c7dd71464f58f1b4ee0bbd81285d96cdda8bc3519281b8973e3a461e  uvloop-0.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256	2fdc436a67077941295c58647f521fbef8f50e46db0970552fa1a4dd8ae261c6  LICENSE-APACHE
 sha256	9185f3c77e9f6ef8859a6ba4c94128ac1329876be3e813aad32d7645e51ae409  LICENSE-MIT
diff --git a/package/python-uvloop/python-uvloop.mk b/package/python-uvloop/python-uvloop.mk
index 8dbe3b36d9..3ee8d299a3 100644
--- a/package/python-uvloop/python-uvloop.mk
+++ b/package/python-uvloop/python-uvloop.mk
@@ -4,21 +4,14 @@
 #
 ################################################################################
 
-PYTHON_UVLOOP_VERSION = 0.13.0
+PYTHON_UVLOOP_VERSION = 0.14.0
 PYTHON_UVLOOP_SOURCE = uvloop-$(PYTHON_UVLOOP_VERSION).tar.gz
-PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/e3/15/dc3276384f4363015d7c72282f37066bae26c77f99158f66c9058ac167cf
+PYTHON_UVLOOP_SITE = https://files.pythonhosted.org/packages/84/2e/462e7a25b787d2b40cf6c9864a9e702f358349fc9cfb77e83c38acb73048
 PYTHON_UVLOOP_SETUP_TYPE = setuptools
 PYTHON_UVLOOP_LICENSE = Apache-2.0, MIT
 PYTHON_UVLOOP_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-PYTHON_UVLOOP_BUILD_OPTS = build_ext --inplace --cython-always --use-system-libuv
-PYTHON_UVLOOP_INSTALL_TARGET_OPTS = build_ext --inplace --cython-always --use-system-libuv
-PYTHON_UVLOOP_DEPENDENCIES = libuv host-python-cython
-
-# force regenerating loop.c with cython. can be removed with the next
-# uvloop version bump
-define PYTHON_UVLOOP_FORCE_REGEN_LOOPC
-	$(RM) $(@D)/uvloop/loop.c
-endef
-PYTHON_UVLOOP_PRE_BUILD_HOOKS += PYTHON_UVLOOP_FORCE_REGEN_LOOPC
+PYTHON_UVLOOP_BUILD_OPTS = build_ext --inplace --use-system-libuv
+PYTHON_UVLOOP_INSTALL_TARGET_OPTS = build_ext --inplace --use-system-libuv
+PYTHON_UVLOOP_DEPENDENCIES = libuv
 
 $(eval $(python-package))
