From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  6 Nov 2016 11:45:48 +0100
Subject: [Buildroot] [PATCH] package/tvheadend: override default local
Message-ID: <1478429148-18777-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mkbundle python script require an utf8 encoding in Local to work
properly. With LC_ALL=C as Local on the host, mkbundle can't encode non
ASCII characters.

Force C.UTF-8 Local on the build command line.

Fixes:
http://autobuild.buildroot.net/results/6fe/6fe3331f1f1d54cb977bb61a09d7707f19f7eafa

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tvheadend/tvheadend.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index a3afec8..69b854b 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -88,7 +88,7 @@ define TVHEADEND_CONFIGURE_CMDS
 endef
 
 define TVHEADEND_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) LC_ALL=C.UTF-8 $(MAKE) -C $(@D)
 endef
 
 define TVHEADEND_INSTALL_TARGET_CMDS
-- 
2.5.5
