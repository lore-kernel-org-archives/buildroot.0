From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  6 Feb 2021 12:16:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: add CPE variables
Message-ID: <20210206111614.2001774-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:nodejs:node.js is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anodejs%3Anode.js

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nodejs/nodejs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 8916d47940..31ef499716 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -14,6 +14,8 @@ HOST_NODEJS_DEPENDENCIES = host-icu host-libopenssl host-python host-zlib
 NODEJS_INSTALL_STAGING = YES
 NODEJS_LICENSE = MIT (core code); MIT, Apache and BSD family licenses (Bundled components)
 NODEJS_LICENSE_FILES = LICENSE
+NODEJS_CPE_ID_VENDOR = nodejs
+NODEJS_CPE_ID_PRODUCT = node.js
 
 NODEJS_CONF_OPTS = \
 	--without-snapshot \
-- 
2.29.2
