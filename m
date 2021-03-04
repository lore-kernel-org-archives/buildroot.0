From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  4 Mar 2021 12:30:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/libminiupnpc: add CPE variables
Message-ID: <20210304113039.1235899-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:miniupnp_project:miniupnpc is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aminiupnp_project%3Aminiupnpc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libminiupnpc/libminiupnpc.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 50b3c6604c..d22b873428 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION = 2.1.20201016
+LIBMINIUPNPC_VERSION = $(LIBMINIUPNPC_CPE_ID_VERSION).$(LIBMINIUPNPC_CPE_ID_UPDATE)
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
 LIBMINIUPNPC_LICENSE = BSD-3-Clause
 LIBMINIUPNPC_LICENSE_FILES = LICENSE
+LIBMINIUPNPC_CPE_ID_VENDOR = miniupnp_project
+LIBMINIUPNPC_CPE_ID_PRODUCT = miniupnpc
+LIBMINIUPNPC_CPE_ID_VERSION = 2.1
+LIBMINIUPNPC_CPE_ID_UPDATE = 20201016
 
 $(eval $(cmake-package))
-- 
2.30.0
