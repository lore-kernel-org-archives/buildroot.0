From: Joris Offouga <offougajoris@gmail.com>
Date: Wed,  8 Jan 2020 23:40:34 +0100
Subject: [Buildroot] [PATCH V2] package/c-periphery: Bump version to 2.1.0
Message-ID: <20200108224034.14703-1-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit : gpio: add cdev implementation
see : https://github.com/vsergeev/c-periphery/commit/d0a973cca2eca8c3b84013ade210849ce4e2a2af

c-periphery needs linux headers

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
---
 changes v1 -> v2
 add depends to linux headers

 package/c-periphery/Config.in        | 4 ++++
 package/c-periphery/c-periphery.hash | 4 ++--
 package/c-periphery/c-periphery.mk   | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/c-periphery/Config.in b/package/c-periphery/Config.in
index 0bfb4b1f11..bcb906da76 100644
--- a/package/c-periphery/Config.in
+++ b/package/c-periphery/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_C_PERIPHERY
 	bool "c-periphery"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
 	help
 	  c-periphery is a set of C wrapper functions for GPIO, SPI,
 	  I2C, MMIO, and Serial peripheral I/O interface access in
@@ -14,3 +15,6 @@ config BR2_PACKAGE_C_PERIPHERY
 	  integration with other projects, and is MIT licensed.
 
 	  https://github.com/vsergeev/c-periphery
+
+comment "c-periphery needs kernel headers >= 4.8"
+		depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_8
diff --git a/package/c-periphery/c-periphery.hash b/package/c-periphery/c-periphery.hash
index 8f3bd8a3da..244f8f60f1 100644
--- a/package/c-periphery/c-periphery.hash
+++ b/package/c-periphery/c-periphery.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 50665a4f298b30e4cc8f7dbd38362fd860cc3746803d00325cb04806674e3166  c-periphery-1.1.3.tar.gz
-sha256 6b5669a90260126f0600aae98cb10fb5e219269dc9cbd0137f63927b96d5c31d  LICENSE
+sha256 1c455c42b26818d199ac227cd19714f265623e15d363fdfdf47a2416a4165654  c-periphery-2.1.0.tar.gz
+sha256 e7b9464cb8511f19ddb40f9cf52fe86b3dfe38b2faed9d7bbc3d5707677ffbe3  LICENSE
diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index e62d3e05ca..bb50434efa 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = 1.1.3
+C_PERIPHERY_VERSION = 2.1.0
 C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 # only a static library
-- 
2.20.1
