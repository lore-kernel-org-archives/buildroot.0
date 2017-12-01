From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 01 Dec 2017 21:00:57 -0000
Subject: [Buildroot] [git commit] python-treq: bump version to 17.8.0
Message-ID: <20171201205331.3A16C7FBCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3fa1087587f67db10b7351c4c0c94b9809e9892d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new runtime dependencies and add licence file checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-treq/Config.in        | 6 ++++--
 package/python-treq/python-treq.hash | 5 +++--
 package/python-treq/python-treq.mk   | 4 ++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index 2047cc0..3a121ea 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -1,14 +1,16 @@
 config BR2_PACKAGE_PYTHON_TREQ
 	bool "python-treq"
 	depends on BR2_INSTALL_LIBSTDCPP # python-pyopenssl
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
-	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	help
 	  treq is an HTTP library inspired by requests but written on
-	  top of Twisted's Agents.  It provides a simple, higher level
+	  top of Twisted's Agents. It provides a simple, higher level
 	  API for making HTTP requests when using Twisted.
 
 	  https://github.com/twisted/treq
diff --git a/package/python-treq/python-treq.hash b/package/python-treq/python-treq.hash
index a961b80..14f3946 100644
--- a/package/python-treq/python-treq.hash
+++ b/package/python-treq/python-treq.hash
@@ -1,3 +1,4 @@
 # md5 from https://pypi.python.org/pypi/treq/json, sha256 locally computed
-md5 421dea5bc8294c14aa24d64628a2eaea treq-16.12.0.tar.gz
-sha256 b008edc81157969ad2bf23bece083adedb0adf249368a3896bb5ac9a871b91a9 treq-16.12.0.tar.gz
+md5	7e1f5079b85ec104d4759fc0fb89071e  treq-17.8.0.tar.gz
+sha256	ef72d2d5e0b24bdf29267b608fa33df0ac401743af8524438b073e1fb2b66f16  treq-17.8.0.tar.gz
+sha256  7cc1b65e1937b1cc07052bb864ec96d8e5fd413400c0842e5b89a8201a600293  LICENSE
diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index 051b8ff..73c4715 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TREQ_VERSION = 16.12.0
+PYTHON_TREQ_VERSION = 17.8.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
-PYTHON_TREQ_SITE = https://pypi.python.org/packages/26/4b/303880fb5bab1111654df2df0f201f4ba038221bdc52f5a395f0abfc0cb1
+PYTHON_TREQ_SITE = https://pypi.python.org/packages/11/3e/1014f26bfd4d07db015ad48384446b3bdc4de4bbdd2eba3be7fbb149cc44
 PYTHON_TREQ_LICENSE = MIT
 PYTHON_TREQ_LICENSE_FILES = LICENSE
 PYTHON_TREQ_SETUP_TYPE = setuptools
