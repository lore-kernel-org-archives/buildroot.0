From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 19 May 2021 08:49:08 +0200
Subject: [Buildroot] [PATCH 1/1] package/nasm: add CPE variables
Message-ID: <20210519064908.1633187-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:nasm:netwide_assembler is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anasm%3Anetwide_assembler

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nasm/nasm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index b44b97e62b..ecb0889363 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -9,5 +9,7 @@ NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE = https://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 NASM_LICENSE = BSD-2-Clause
 NASM_LICENSE_FILES = LICENSE
+NASM_CPE_ID_VENDOR = nasm
+NASM_CPE_ID_PRODUCT = netwide_assembler
 
 $(eval $(host-autotools-package))
-- 
2.30.2
