From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  6 Dec 2014 16:00:32 +0100
Subject: [Buildroot] [PATCH 2/3] package/tvheadend: Fix inclusion of DVB
	frequency tables in bundled build
In-Reply-To: <1417878033-29169-1-git-send-email-bernd.kuhls@t-online.de>
References: <1417878033-29169-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1417878033-29169-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index e0ce160..7d0ae08 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -58,6 +58,9 @@ define TVHEADEND_CONFIGURE_CMDS
 endef
 
 define TVHEADEND_BUILD_CMDS
+	$(INSTALL) -d $(@D)/data/dvb-scan
+	cp -r $(TARGET_DIR)/usr/share/dvb/* $(@D)/data/dvb-scan/
+	touch $(@D)/data/dvb-scan/.stamp
 	$(MAKE) -C $(@D)
 endef
 
-- 
1.7.10.4
