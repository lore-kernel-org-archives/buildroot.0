From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Feb 2019 12:45:25 +0100
Subject: [Buildroot] [PATCH 9/12] package/mongodb: add boost mandatory
 dependency
In-Reply-To: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
References: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
Message-ID: <20190210114528.1753-9-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongodb/Config.in  | 5 +++++
 package/mongodb/mongodb.mk | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index 8bfbe0168c..c45e1e38c5 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -13,6 +13,11 @@ config BR2_PACKAGE_MONGODB
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_BOOST_FILESYSTEM
+	select BR2_PACKAGE_BOOST_IOSTREAMS
+	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
+	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_SNAPPY
 	select BR2_PACKAGE_YAML_CPP
 	select BR2_PACKAGE_ZLIB
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 8679641c5d..3525306145 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -12,6 +12,7 @@ MONGODB_LICENSE = Apache-2.0 (drivers), SSPL (database)
 MONGODB_LICENSE_FILES = APACHE-2.0.txt LICENSE-Community.txt
 
 MONGODB_DEPENDENCIES = \
+	boost \
 	host-python-cheetah \
 	host-python-pyyaml \
 	host-python-typing \
@@ -28,6 +29,7 @@ MONGODB_SCONS_ENV = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
 MONGODB_SCONS_OPTS = \
 	--disable-warnings-as-errors \
 	--enable-free-mon=off \
+	--use-system-boost \
 	--use-system-snappy \
 	--use-system-yaml \
 	--use-system-zlib
-- 
2.14.1
