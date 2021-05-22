From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 May 2021 19:58:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/pigz: add PIGZ_CPE_ID_VENDOR
Message-ID: <20210522175803.279609-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:zlib:pigz is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azlib%3Apigz

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pigz/pigz.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index fdf5fa40e8..3e5e892797 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -10,6 +10,7 @@ PIGZ_DEPENDENCIES = zlib
 HOST_PIGZ_DEPENDENCIES = host-zlib
 PIGZ_LICENSE = Zlib
 PIGZ_LICENSE_FILES = README
+PIGZ_CPE_ID_VENDOR = zlib
 
 define PIGZ_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-- 
2.30.2
