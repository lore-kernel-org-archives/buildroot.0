From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Dec 2012 22:48:34 +0100
Subject: [Buildroot] [PATCH 1/2] package/dvb-apps: new package
In-Reply-To: <cover.1356731295.git.yann.morin.1998@free.fr>
References: <cover.1356731295.git.yann.morin.1998@free.fr>
Message-ID: <d4ede3beb81857dfef0587def373e943f2a6100d.1356731295.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We just need the transponders data, so we just install those.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/dvb-apps/dvb-apps.mk |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 package/dvb-apps/dvb-apps.mk

diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
new file mode 100644
index 0000000..1109d94
--- /dev/null
+++ b/package/dvb-apps/dvb-apps.mk
@@ -0,0 +1,32 @@
+#############################################################
+#
+# dvb-apps
+#
+#############################################################
+
+DVB_APPS_VERSION        = 3fc7dfa68484
+DVB_APPS_SOURCE         = dvb-apps-$(DVB_APPS_VERSION).tar.bz2
+DVB_APPS_SITE           = http://linuxtv.org/hg/dvb-apps/archive/
+
+# We just install the transponders data. As this is not a 'work' as per
+# traditional copyright, but just a collection of 'facts', there's probably
+# no license to apply to these data files.
+# To be noted however, is that the dvb-apps package bundles a copy of the
+# GPLv2 and a copy of the LGPLv2.1, and that some of the source files refer
+# to either the GPLv2+ or the LGPLv2.1+.
+# But since we do not use any of those source files, their license do not
+# apply to us.
+DVB_APPS_LICENSE        = unknown (probably public domain)
+
+define DVB_APPS_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/dvb-apps/scan/atsc
+	mkdir -p $(TARGET_DIR)/usr/share/dvb-apps/scan/dvb-c
+	mkdir -p $(TARGET_DIR)/usr/share/dvb-apps/scan/dvb-s
+	mkdir -p $(TARGET_DIR)/usr/share/dvb-apps/scan/dvb-t
+	$(INSTALL) -D $(@D)/util/scan/atsc/* $(TARGET_DIR)/usr/share/dvb-apps/scan/atsc
+	$(INSTALL) -D $(@D)/util/scan/dvb-c/* $(TARGET_DIR)/usr/share/dvb-apps/scan/dvb-c
+	$(INSTALL) -D $(@D)/util/scan/dvb-s/* $(TARGET_DIR)/usr/share/dvb-apps/scan/dvb-s
+	$(INSTALL) -D $(@D)/util/scan/dvb-t/* $(TARGET_DIR)/usr/share/dvb-apps/scan/dvb-t
+endef
+
+$(eval $(generic-package))
-- 
1.7.2.5
