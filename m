From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 Jan 2020 11:35:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/rt-tests: bump to version 1.6
Message-ID: <20200119103539.2013367-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- python3 is used instead of python since version 1.2 and
  https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git/commit/?id=9a5c9c514d217d2b7c33469c4f29cbea3d6c25c6
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rt-tests/rt-tests.hash | 3 ++-
 package/rt-tests/rt-tests.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/rt-tests/rt-tests.hash b/package/rt-tests/rt-tests.hash
index f37af4384f..7da6ed2c30 100644
--- a/package/rt-tests/rt-tests.hash
+++ b/package/rt-tests/rt-tests.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 aea85fd8eda8c1d96e9d32a019bfd4a1d2e0d362971d97838996f49d1af2d470  rt-tests-1.0.tar.xz
+sha256 bcb94448324116f29c248b14a6051c7ab72a0135234e714685a2a3a3e7d531f8  rt-tests-1.6.tar.xz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index 273949a987..431c017688 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -6,12 +6,12 @@
 
 RT_TESTS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/rt-tests
 RT_TESTS_SOURCE = rt-tests-$(RT_TESTS_VERSION).tar.xz
-RT_TESTS_VERSION = 1.0
+RT_TESTS_VERSION = 1.6
 RT_TESTS_LICENSE = GPL-2.0+
 RT_TESTS_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_PYTHON),y)
-RT_TESTS_DEPENDENCIES = python
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+RT_TESTS_DEPENDENCIES = python3
 endif
 
 define RT_TESTS_BUILD_CMDS
@@ -25,7 +25,7 @@ define RT_TESTS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		DESTDIR="$(TARGET_DIR)" \
 		prefix=/usr \
-		$(if $(BR2_PACKAGE_PYTHON),PYLIB=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages/,PYLIB="") \
+		$(if $(BR2_PACKAGE_PYTHON3),PYLIB=/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/,PYLIB="") \
 		install
 endef
 
-- 
2.24.1
