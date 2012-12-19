From: =?ISO-8859-1?Q?Arnaud_R=E9billout?= <rebillout@syscom.ch>
Date: Wed, 19 Dec 2012 13:47:11 +0100
Subject: [Buildroot] [PATCH] package/uboot-tools: Add mkenvimage for host.
Message-ID: <50D1B74F.805@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello there,

I need to use mkenvimage. And it seems that the easiest way is to 
automatically install it in the HOST_UBOOT_TOOLS_INSTALL_CMDS target.
The tool mkenvimage appeared v2011.12 of uboot, so it's present in all 
the versions that buildroot supports.
The patch is a simple line, if anyone is interested.


Regards

---
diff --git a/package/uboot-tools/uboot-tools.mk 
b/package/uboot-tools/uboot-tools.mk
index 7628b77..57c59bb 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -49,6 +49,7 @@ endef

  define HOST_UBOOT_TOOLS_INSTALL_CMDS
      $(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/usr/bin/mkimage
+    $(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage 
$(HOST_DIR)/usr/bin/mkenvimage
  endef

  $(eval $(generic-package))

---
