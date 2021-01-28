From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Jan 2021 20:53:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/runc: add CPE variables
Message-ID: <20210128195324.4161809-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:linuxfoundation:runc is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alinuxfoundation%3Arunc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/runc/runc.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 45fe1442ad..0fec360d5f 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,10 +4,13 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.0.0-rc92
+RUNC_VERSION = $(RUNC_CPE_ID_VERSION)-$(RUNC_CPE_ID_VERSION_MINOR)
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
+RUNC_CPE_ID_VENDOR = linuxfoundation
+RUNC_CPE_ID_VERSION = 1.0.0
+RUNC_CPE_ID_VERSION_MINOR = rc92
 
 RUNC_LDFLAGS = -X main.version=$(RUNC_VERSION)
 RUNC_TAGS = cgo static_build
-- 
2.29.2
