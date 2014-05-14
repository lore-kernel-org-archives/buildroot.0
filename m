From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 14 May 2014 20:28:52 +0200
Subject: [Buildroot] [PATCH 1/2] package/rsyslog: Add missing optional
	dependency libcrypt
Message-ID: <1400092133-16971-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rsyslog/rsyslog.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index c124c02..88747b7 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -24,6 +24,7 @@ ifeq ($(BR2_PACKAGE_LIBEE),y)
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+	RSYSLOG_DEPENDENCIES += libgcrypt
 	RSYSLOG_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 	RSYSLOG_CONF_OPT += --enable-libgcrypt=yes
 else
-- 
1.7.10.4
