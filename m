From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Feb 2019 12:45:20 +0100
Subject: [Buildroot] [PATCH 4/12] package/mongodb: add yaml-cpp mandatory
 dependency
In-Reply-To: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
References: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
Message-ID: <20190210114528.1753-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this change, mongodb uses its own embedded version of yaml-cpp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongodb/Config.in  | 1 +
 package/mongodb/mongodb.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index 65cf4df53d..2eaa9e908c 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_MONGODB
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	select BR2_PACKAGE_SNAPPY
+	select BR2_PACKAGE_YAML_CPP
 	select BR2_PACKAGE_ZLIB
 	help
 	  MongoDB is a cross-platform document-oriented database
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index ce634dc0d8..07b854842f 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -14,6 +14,7 @@ MONGODB_LICENSE_FILES = GNU-AGPL-3.0.txt APACHE-2.0.txt
 MONGODB_DEPENDENCIES = \
 	host-scons \
 	snappy \
+	yaml-cpp \
 	zlib
 
 MONGODB_SCONS_TARGETS = mongod mongos
@@ -24,6 +25,7 @@ MONGODB_SCONS_ENV = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" \
 MONGODB_SCONS_OPTS = \
 	--disable-warnings-as-errors \
 	--use-system-snappy \
+	--use-system-yaml \
 	--use-system-zlib
 
 # need to pass mongo version when not building from git repo
-- 
2.14.1
