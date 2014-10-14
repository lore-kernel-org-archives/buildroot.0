From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 14 Oct 2014 20:28:26 +0200
Subject: [Buildroot] [PATCH v3 4/7] package/tvheadend: Add support for
	libdvbcsa
In-Reply-To: <1413311309-30811-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413311309-30811-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413311309-30811-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: added TVHEADEND_CONF_OPTS, tvheadend is not an autoconf-package
v2: no changes

 package/tvheadend/tvheadend.mk |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 1445838..54112a6 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -14,6 +14,13 @@ ifeq ($(BR2_PACKAGE_AVAHI),y)
 TVHEADEND_DEPENDENCIES += avahi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
+TVHEADEND_DEPENDENCIES += libdvbcsa
+TVHEADEND_CONF_OPTS += --enable-dvbcsa
+else
+TVHEADEND_CONF_OPTS += --disable-dvbcsa
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TVHEADEND_DEPENDENCIES += libiconv
 endif
@@ -30,6 +37,7 @@ define TVHEADEND_CONFIGURE_CMDS
 	 --cpu="$(BR2_GCC_TARGET_CPU)"		\
 	 --python="$(HOST_DIR)/usr/bin/python"	\
 	 --disable-dvbscan			\
+	 $(TVHEADEND_CONF_OPTS)			\
 	)
 endef
 
-- 
1.7.10.4
