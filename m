From: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
Date: Tue, 22 Oct 2019 16:21:55 +0530
Subject: [Buildroot] [PATCH 1/1] package/valijson: bump version to 0.2
Message-ID: <1571741515-11901-1-git-send-email-santosh.multhalli@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--------

1) Added hash  of LICENSE file in valijson.hash
2) Updated hash of valijson tar file in valijson.hash file
3) Added libcurlpp dependency in valijson.mk file
4) Update Config.in file to select curlpp in case  valijson selected

--------

Signed-off-by: Santosh Multhalli <santosh.multhalli@rockwellcollins.com>
---
 package/valijson/Config.in     | 1 +
 package/valijson/valijson.hash | 3 ++-
 package/valijson/valijson.mk   | 6 +++---
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/valijson/Config.in b/package/valijson/Config.in
index 10721b3..36a19c3 100644
--- a/package/valijson/Config.in
+++ b/package/valijson/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_VALIJSON
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_CURLPP
 	help
 	  Valijson is a header-only JSON Schema Validation library for
 	  C++. Valijson provides a simple validation API that allows
diff --git a/package/valijson/valijson.hash b/package/valijson/valijson.hash
index cd34ecb..6f11000 100644
--- a/package/valijson/valijson.hash
+++ b/package/valijson/valijson.hash
@@ -1,2 +1,3 @@
 # Locally Computed:
-sha256  d22c1f8fe27d43e5a27aad1d3cbe9f1318ec28ccfa913e615663ed2bd6a5d063  valijson-0.1.tar.gz
+sha256  77dbebb40dab2e834557c2fcc39122cdb2d0fe26bf591c2b3e0df5a316a45592  valijson-0.2.tar.gz
+sha256  1a0f99926a2dbec30eba3db820236d9953fbe3048976923ac24980e655fbe991  LICENSE
diff --git a/package/valijson/valijson.mk b/package/valijson/valijson.mk
index a804334..24e720e 100644
--- a/package/valijson/valijson.mk
+++ b/package/valijson/valijson.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-VALIJSON_VERSION = 0.1
+VALIJSON_VERSION = 0.2
 VALIJSON_SITE = $(call github,tristanpenman,valijson,v$(VALIJSON_VERSION))
 VALIJSON_LICENSE = BSD-2-Clause
 VALIJSON_LICENSE_FILES = LICENSE
 VALIJSON_INSTALL_STAGING = YES
 VALIJSON_INSTALL_TARGET = NO
-VALIJSON_DEPENDENCIES = boost
-VALIJSON_CONF_OPTS = -DINSTALL_HEADERS=TRUE
+VALIJSON_DEPENDENCIES = boost curlpp
+VALIJSON_CONF_OPTS = -Dvalijson_INSTALL_HEADERS=TRUE
 
 $(eval $(cmake-package))
-- 
2.5.0
