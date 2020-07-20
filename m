From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Jul 2020 22:42:06 +0200
Subject: [Buildroot] [PATCH 1/2] package/libzip: use ENABLE_BZIP2
Message-ID: <20200720204207.2005746-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use ENABLE_BZIP2 option which is available since version 1.5.2 and
https://github.com/nih-at/libzip/commit/028c492c9d45ca29e2fbec79a203ba492016f15e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libzip/libzip.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index 379eb2c5df..6023dbec1b 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -15,8 +15,9 @@ HOST_LIBZIP_DEPENDENCIES = host-zlib
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 LIBZIP_DEPENDENCIES += bzip2
+LIBZIP_CONF_OPTS += -DENABLE_BZIP2=ON
 else
-LIBZIP_CONF_OPTS += -DCMAKE_DISABLE_FIND_PACKAGE_BZIP2=TRUE
+LIBZIP_CONF_OPTS += -DENABLE_BZIP2=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-- 
2.27.0
