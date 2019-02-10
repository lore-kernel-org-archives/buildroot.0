From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 10 Feb 2019 12:45:26 +0100
Subject: [Buildroot] [PATCH 10/12] package/mongodb: add pcre mandatory
 dependency
In-Reply-To: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
References: <20190210114528.1753-1-fontaine.fabrice@gmail.com>
Message-ID: <20190210114528.1753-10-fontaine.fabrice@gmail.com>
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
index c45e1e38c5..95a303af64 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_MONGODB
 	select BR2_PACKAGE_BOOST_IOSTREAMS
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_SYSTEM
+	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_SNAPPY
 	select BR2_PACKAGE_YAML_CPP
 	select BR2_PACKAGE_ZLIB
diff --git a/package/mongodb/mongodb.mk b/package/mongodb/mongodb.mk
index 3525306145..a9f48e9715 100644
--- a/package/mongodb/mongodb.mk
+++ b/package/mongodb/mongodb.mk
@@ -17,6 +17,7 @@ MONGODB_DEPENDENCIES = \
 	host-python-pyyaml \
 	host-python-typing \
 	host-scons \
+	pcre \
 	snappy \
 	yaml-cpp \
 	zlib
@@ -30,6 +31,7 @@ MONGODB_SCONS_OPTS = \
 	--disable-warnings-as-errors \
 	--enable-free-mon=off \
 	--use-system-boost \
+	--use-system-pcre \
 	--use-system-snappy \
 	--use-system-yaml \
 	--use-system-zlib
-- 
2.14.1
