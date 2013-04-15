From: Patrick Ziegler <patrick.ziegler@fh-kl.de>
Date: Mon, 15 Apr 2013 11:09:16 +0200
Subject: [Buildroot] [PATCH] busybox: don't disable static option
Message-ID: <516BC3BC.5040100@fh-kl.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't change the busybox STATIC option if buildroots PREFER_STATIC_LIB option
is not set. Not to prefer static linking doesn't imply prefer dynamic linking
for all packages.

Signed-off-by: Patrick Ziegler <patrick.ziegler@fh-kl.de>
---
 package/busybox/busybox.mk |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 900896f..985203c 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -106,10 +106,6 @@ ifeq ($(BR2_PREFER_STATIC_LIB),y)
 define BUSYBOX_PREFER_STATIC
 	$(call KCONFIG_ENABLE_OPT,CONFIG_STATIC,$(BUSYBOX_BUILD_CONFIG))
 endef
-else
-define BUSYBOX_PREFER_STATIC
-	$(call KCONFIG_DISABLE_OPT,CONFIG_STATIC,$(BUSYBOX_BUILD_CONFIG))
-endef
 endif
 
 # Disable usage of inetd if netkit-base package is selected
-- 
1.7.10.4



-- 
Dipl.-Inf. (FH) Patrick Ziegler

University Of Applied Sciences
Kaiserslautern

Amerikastrasse 1
D-66482 Zweibruecken
Germany

Phone:  +49 631 3724 5526
Mail:   patrick.ziegler at fh-kl.de
PGP KeyID 0xB4796B8C

http://www.fh-kl.de
http://www.fh-kl.de/fachbereiche/imst/iuk-knowhow.html
