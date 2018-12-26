From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 26 Dec 2018 16:26:32 -0500
Subject: [Buildroot] [PATCH v2 2/4] libcpprestsdk: bump version to v2.10.8
In-Reply-To: <20181226212634.89240-1-aduskett@gmail.com>
References: <20181226212634.89240-1-aduskett@gmail.com>
Message-ID: <20181226212634.89240-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

In adition:
  - Add -DCPPREST_EXCLUDE_WEBSOCKETS=ON as a default CONF_OPT as websocketspp
    is not checked as a dependency.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
Changes v1 -> v2:
  - Added missing Signed off by line.

 package/libcpprestsdk/libcpprestsdk.hash | 2 +-
 package/libcpprestsdk/libcpprestsdk.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcpprestsdk/libcpprestsdk.hash b/package/libcpprestsdk/libcpprestsdk.hash
index b8c5d5430e..9a8155f354 100644
--- a/package/libcpprestsdk/libcpprestsdk.hash
+++ b/package/libcpprestsdk/libcpprestsdk.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 cf4d57bdcc1ce53f1d228156620dd87af95cbff109d85c81e8be01d0bb58fd25	libcpprestsdk-v2.10.5.tar.gz
+sha256 fd79d34b3fad4622ff58480f57ecdf374061c5bdbd83e317019422575c820443	libcpprestsdk-v2.10.8.tar.gz
 sha256 5c191789f502ac87df83b57008d2fc3e47fbf31315381b5bc4309f6602d0fe97	license.txt
diff --git a/package/libcpprestsdk/libcpprestsdk.mk b/package/libcpprestsdk/libcpprestsdk.mk
index 14526e7de4..e5500d8c7f 100644
--- a/package/libcpprestsdk/libcpprestsdk.mk
+++ b/package/libcpprestsdk/libcpprestsdk.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBCPPRESTSDK_VERSION = v2.10.5
+LIBCPPRESTSDK_VERSION = v2.10.8
 LIBCPPRESTSDK_SITE = $(call github,Microsoft,cpprestsdk,$(LIBCPPRESTSDK_VERSION))
 LIBCPPRESTSDK_LICENSE = MIT
 LIBCPPRESTSDK_LICENSE_FILES = license.txt
 LIBCPPRESTSDK_SUBDIR = Release
 LIBCPPRESTSDK_DEPENDENCIES += host-pkgconf boost openssl zlib
-LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF
+LIBCPPRESTSDK_CONF_OPTS = -DWERROR=OFF -DCPPREST_EXCLUDE_WEBSOCKETS=ON
 
 $(eval $(cmake-package))
-- 
2.19.2
