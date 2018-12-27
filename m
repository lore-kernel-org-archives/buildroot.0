From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Dec 2018 16:41:57 +0100
Subject: [Buildroot] [git commit] package/libcpprestsdk: bump version to
 v2.10.8
Message-ID: <20181227153814.3736183C21@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f0f8bf66d3b247e4f442acfef67a80fc6e1fef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In adition:
  - Add -DCPPREST_EXCLUDE_WEBSOCKETS=ON as a default CONF_OPT as websocketspp
    is not checked as a dependency.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
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
