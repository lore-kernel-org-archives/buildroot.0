From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 20:28:35 +0200
Subject: [Buildroot] [git commit branch/2019.11.x] package/hiredis: install
 alloc.h
Message-ID: <20200407181715.EE277873DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d00d4c0ac5652e5ced9b786136336f67f7b8154c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

This will fix build of collectd, proftpd ... with latest hiredis

Fixes:
 - http://autobuild.buildroot.org/results/f5afe60defd63461a5fc06b26bd4759fb5f56a8f
 - http://autobuild.buildroot.org/results/45e980c85d170827d3a41e7443cf1088b2d59ead

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b72be8c48b7c110f5e63e741599ceca1d0352fbc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
