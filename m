From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Feb 2019 12:45:27 +0100
Subject: [Buildroot] [PATCH 11/12] package/mongodb: add sqlite mandatory
 dependency
In-Reply-To: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
References: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
Message-ID: <20190210114528.1753-11-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongodb/Config.in  | 1 +
 package/mongodb/mongodb.mk | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index 95a303af64..969b8e062f 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_MONGODB
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SNAPPY
+	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_YAML_CPP
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index a9f48e9715..b63010426d 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -19,6 +19,7 @@ MONGODB_DEPENDENCIES = \
 	host-scons \
 	pcre \
 	snappy \
+	sqlite \
 	yaml-cpp \
 	zlib
 
@@ -33,6 +34,7 @@ MONGODB_SCONS_OPTS = \
 	--use-system-boost \
 	--use-system-pcre \
 	--use-system-snappy \
+	--use-system-sqlite \
 	--use-system-yaml \
 	--use-system-zlib
 
-- 
2.14.1
