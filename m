From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 30 Apr 2019 09:19:14 -0400
Subject: [Buildroot] [PATCH 06/11] package/python-psycopg2: bump to version
 2.8.2
In-Reply-To: <20190430131919.130128-1-aduskett@gmail.com>
References: <20190430131919.130128-1-aduskett@gmail.com>
Message-ID: <20190430131919.130128-7-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also remove upstream patch and change the hash for the license file due to
url changes.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 ...id-installing-tests-to-site-packages.patch | 31 -------------------
 package/python-psycopg2/Config.in             |  1 -
 package/python-psycopg2/python-psycopg2.hash  |  6 ++--
 package/python-psycopg2/python-psycopg2.mk    |  5 ++-
 4 files changed, 5 insertions(+), 38 deletions(-)
 delete mode 100644 package/python-psycopg2/0001-setup.py-avoid-installing-tests-to-site-packages.patch

diff --git a/package/python-psycopg2/0001-setup.py-avoid-installing-tests-to-site-packages.patch b/package/python-psycopg2/0001-setup.py-avoid-installing-tests-to-site-packages.patch
deleted file mode 100644
index f2dc3adca9..0000000000
--- a/package/python-psycopg2/0001-setup.py-avoid-installing-tests-to-site-packages.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 46c50849584d254b81ad058e1a53adcef1eb4c53 Mon Sep 17 00:00:00 2001
-From: Asaf Kahlon <asafka7@gmail.com>
-Date: Fri, 12 Oct 2018 07:57:23 +0300
-Subject: [PATCH 1/1] setup.py: avoid installing tests to site-packages
-
-This patch update only setup.py from upstream patch
-(389f6c08d9536060184bfd5c8ea2491a4a91c2fb).
-
-Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
----
- setup.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index b521290..3f309fc 100644
---- a/setup.py
-+++ b/setup.py
-@@ -674,8 +674,8 @@ setup(name="psycopg2",
-       long_description="\n".join(readme.split("\n")[2:]).lstrip(),
-       classifiers=[x for x in classifiers.split("\n") if x],
-       data_files=data_files,
--      package_dir={'psycopg2': 'lib', 'psycopg2.tests': 'tests'},
--      packages=['psycopg2', 'psycopg2.tests'],
-+      package_dir={'psycopg2': 'lib'},
-+      packages=['psycopg2'],
-       cmdclass={
-           'build_ext': psycopg_build_ext,
-           'build_py': build_py, },
--- 
-2.17.1
-
diff --git a/package/python-psycopg2/Config.in b/package/python-psycopg2/Config.in
index ec27d706de..5ffe179517 100644
--- a/package/python-psycopg2/Config.in
+++ b/package/python-psycopg2/Config.in
@@ -21,6 +21,5 @@ config BR2_PACKAGE_PYTHON_PSYCOPG2
 	  Psycopg 2 is both Unicode and Python 3 friendly.
 
 	  http://initd.org/psycopg/
-
 comment "python-psycopg2 needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index c6e199769b..2711b10627 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5	598e2f43c1b26361ae2d3a3254dae414  psycopg2-2.7.7.tar.gz
-sha256	f4526d078aedd5187d0508aa5f9a01eae6a48a470ed678406da94b4cd6524b7e  psycopg2-2.7.7.tar.gz
+md5	74cbe0f09a6ebafd107f89c858120bd5  psycopg2-2.8.2.tar.gz
+sha256	5cacf21b6f813c239f100ef78a4132056f93a5940219ec25d2ef833cbeb05588  psycopg2-2.8.2.tar.gz
 # Locally computed sha256 checksums
-sha256	3c2b037df24cb85ca1a48739dcab60a5037644b436f87173f6db0d101636b525  LICENSE
+sha256	9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index e297d6e2b2..a3548a27fa 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.7.7
+PYTHON_PSYCOPG2_VERSION = 2.8.2
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/63/54/c039eb0f46f9a9406b59a638415c2012ad7be9b4b97bfddb1f48c280df3a
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/23/7e/93c325482c328619870b6cd09370f6dbe1148283daca65115cd63642e60f
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
 PYTHON_PSYCOPG2_DEPENDENCIES = postgresql
-
 # Force psycopg2 to use the Buildroot provided postgresql version
 # instead of the one from the host machine
 PYTHON_PSYCOPG2_BUILD_OPTS = build_ext --pg-config=$(STAGING_DIR)/usr/bin/pg_config
-- 
2.20.1
