From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Mar 2020 10:36:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/hiredis: install alloc.h
Message-ID: <20200329083650.2024350-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will fix build of collectd, proftpd ... with latest hiredis

Fixes:
 - http://autobuild.buildroot.org/results/f5afe60defd63461a5fc06b26bd4759fb5f56a8f
 - http://autobuild.buildroot.org/results/45e980c85d170827d3a41e7443cf1088b2d59ead

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiredis/hiredis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hiredis/hiredis.mk b/package/hiredis/hiredis.mk
index 02055b05d4..230fb2d187 100644
--- a/package/hiredis/hiredis.mk
+++ b/package/hiredis/hiredis.mk
@@ -55,7 +55,7 @@ endif
 define HIREDIS_INSTALL_STAGING_CMDS
 	mkdir -p $(HIREDIS_INCLUDE_DIR)
 	cp -dpfr $(@D)/hiredis.h $(@D)/async.h $(@D)/read.h $(@D)/sds.h \
-		$(@D)/adapters $(HIREDIS_INCLUDE_DIR)
+		$(@D)/alloc.h $(@D)/adapters $(HIREDIS_INCLUDE_DIR)
 	$(INSTALL) -D -m 0644 $(@D)/hiredis.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/hiredis.pc
 	$(HIREDIS_INSTALL_STAGING_STATIC_LIB)
-- 
2.25.1
