From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Oct 2014 20:13:28 +0200
Subject: [Buildroot] [PATCH 6/8] package/tvheadend: Enable bundled build
In-Reply-To: <1413137610-21887-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413137610-21887-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413137610-21887-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-python is needed to create a bundled version of the tvheadend binary which
includes all files used by the web UI.

Having host-python alone as dependency is not enough, we need to add
--enable-bundle to enable this functionality.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/tvheadend.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 9909b5c..c152717 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -31,6 +31,7 @@ TVHEADEND_CONF_OPTS += \
 	--arch="$(ARCH)" \
 	--cpu="$(BR2_GCC_TARGET_CPU)" \
 	--python="$(HOST_DIR)/usr/bin/python" \
+	--enable-bundle \
 	--disable-dvbscan
 
 #----------------------------------------------------------------------------
-- 
1.7.10.4
