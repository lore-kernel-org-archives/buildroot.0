From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 21 Jan 2021 23:04:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/chartjs: add CPE variables
Message-ID: <20210121220456.2370992-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:chartjs:chart.js is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Achartjs%3Achart.js

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/chartjs/chartjs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/chartjs/chartjs.mk b/package/chartjs/chartjs.mk
index 82c86dc6cc..2748a94d36 100644
--- a/package/chartjs/chartjs.mk
+++ b/package/chartjs/chartjs.mk
@@ -8,6 +8,8 @@ CHARTJS_VERSION = 2.9.4
 CHARTJS_SITE = $(call github,chartjs,Chart.js,v$(CHARTJS_VERSION))
 CHARTJS_LICENSE = MIT
 CHARTJS_LICENSE_FILES = LICENSE.md
+CHARTJS_CPE_ID_VENDOR = chartjs
+CHARTJS_CPE_ID_PRODUCT = chart.js
 
 define CHARTJS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.min.css \
-- 
2.29.2
