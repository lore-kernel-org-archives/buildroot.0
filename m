From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 23 Jan 2021 23:11:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/zstd: add CPE variables
Message-ID: <20210123221110.236624-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:facebook:zstandard is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afacebook%3Azstandard

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zstd/zstd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index a4f0632fcf..dba76b0909 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -9,6 +9,8 @@ ZSTD_SITE = https://github.com/facebook/zstd/releases/download/v$(ZSTD_VERSION)
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
 ZSTD_LICENSE_FILES = LICENSE COPYING
+ZSTD_CPE_ID_VENDOR = facebook
+ZSTD_CPE_ID_PRODUCT = zstandard
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ZSTD_OPTS += HAVE_THREAD=1
-- 
2.29.2
