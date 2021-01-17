From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 12:43:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/patch: add PATCH_CPE_ID_VENDOR
Message-ID: <20210117114300.313331-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:gnu:patch is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Apatch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/patch/patch.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/patch/patch.mk b/package/patch/patch.mk
index b7f5bac05a..6f83d2418c 100644
--- a/package/patch/patch.mk
+++ b/package/patch/patch.mk
@@ -9,6 +9,7 @@ PATCH_SOURCE = patch-$(PATCH_VERSION).tar.xz
 PATCH_SITE = $(BR2_GNU_MIRROR)/patch
 PATCH_LICENSE = GPL-3.0+
 PATCH_LICENSE_FILES = COPYING
+PATCH_CPE_ID_VENDOR = gnu
 
 # 0001-Fix-segfault-with-mangled-rename-patch.patch
 PATCH_IGNORE_CVES += CVE-2018-6951
-- 
2.29.2
