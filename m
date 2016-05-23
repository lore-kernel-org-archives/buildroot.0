From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 23 May 2016 06:02:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/hplip: fix static linking with cups
Message-ID: <1463976152-12874-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/c52/c5277c42344d194e004dcd0a5af71bc6110da97e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/hplip/hplip.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
index b1e8cb5..d70e2e9 100644
--- a/package/hplip/hplip.mk
+++ b/package/hplip/hplip.mk
@@ -27,6 +27,9 @@ HPLIP_CONF_OPTS = \
 	--enable-new-hpcups \
 	--enable-lite-build
 
+# build system does not support cups-config
+HPLIP_CONF_ENV = LIBS=`$(STAGING_DIR)/usr/bin/cups-config --libs`
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 HPLIP_CONF_OPTS += --enable-dbus-build
 HPLIP_DEPENDENCIES += dbus
-- 
2.8.1
