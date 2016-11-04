From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  4 Nov 2016 07:08:21 +0100
Subject: [Buildroot] [PATCH 1/1] tinycbor: bump to version v0.4
Message-ID: <1478239701-11829-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/tinycbor/tinycbor.hash |  4 +---
 package/tinycbor/tinycbor.mk   | 13 +------------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index f07fc17..88300e8 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,4 +1,2 @@
 # Locally computed:
-sha256	f70de1e6b7e3750abb4ceacf0059e47b47c769f113434de10293b33867ce54c2	tinycbor-v0.3.2.tar.gz
-sha256	7d3aa839ae246e9e14fc73e67869d88c684802c1578fb75503f3fdde1482dcf6	ede7f1431ae06c9086f2a83a57bd7832d99280e3.patch
-sha256	42054074478d074d0320e0c64e8d44f60081b6f0d8dc0e3607e0fb7f4dad96a4	ad09b6af11fc8b6391041973783785cfe1559d63.patch	
+sha256	302ac9de66f1048725040ccc9a99e03c20529ac2b150ccf35cfd1e2dafa81c4b	tinycbor-v0.4.tar.gz
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 8ce9a76..2691e5b 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,22 +4,11 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = v0.3.2
+TINYCBOR_VERSION = v0.4
 TINYCBOR_SITE = $(call github,01org,tinycbor,$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
 
-# This patch fixes the issue on unnamed union which are not supported by some
-# targets like blackfin
-# This patch is currently in dev branch and will be a part of v0.4
-TINYCBOR_PATCH = \
-	https://github.com/01org/tinycbor/commit/ede7f1431ae06c9086f2a83a57bd7832d99280e3.patch
-
-# This patch fixes the issue on cjson detection
-# This patch is currently in dev branch and will be a part of v0.4
-TINYCBOR_PATCH += \
-	https://github.com/01org/tinycbor/commit/ad09b6af11fc8b6391041973783785cfe1559d63.patch
-
 TINYCBOR_DEPENDENCIES = host-pkgconf
 TINYCBOR_INSTALL_STAGING = YES
 
-- 
2.5.0
