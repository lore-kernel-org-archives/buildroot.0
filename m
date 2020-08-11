From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 11 Aug 2020 11:19:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtd: crypto support needs
 linux-headers
Message-ID: <20200811091917.1545019-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

crypto support needs linux-headers as it includes <linux/hash_info.h>
since version 2.1.2 and
https://github.com/sigma-star/mtd-utils/commit/a739b59efe7996e3bdcbe8b17743dc05ac7c110a

Fixes:
 - http://autobuild.buildroot.org/results/dbaeed9e9e2af191166808d2d6d6d3c2e5051c2c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtd/mtd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 8220a5ace8..312bb7e7a5 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -21,8 +21,8 @@ endif
 ifeq ($(BR2_PACKAGE_MTD_UBIFS_UTILS),y)
 MTD_DEPENDENCIES += util-linux zlib lzo host-pkgconf
 MTD_CONF_OPTS += --with-ubifs
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-MTD_DEPENDENCIES += openssl
+ifeq ($(BR2_PACKAGE_LINUX_HEADERS)$(BR2_PACKAGE_OPENSSL),yy)
+MTD_DEPENDENCIES += linux-headers openssl
 MTD_CONF_OPTS += --with-crypto
 else
 MTD_CONF_OPTS += --without-crypto
-- 
2.27.0
