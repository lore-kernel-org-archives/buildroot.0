From: Mario Lang <mlang@blind.guru>
Date: Tue, 28 Nov 2017 13:10:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/lftp: Add optional support for
 libidn
Message-ID: <20171128121012.27857-1-mlang@blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mario Lang <mlang@blind.guru>
---
 package/lftp/lftp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index de4ebb8521..b174057f03 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -41,6 +41,13 @@ else
 LFTP_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBIDN),y)
+LFTP_DEPENDENCIES += libidn
+LFTP_CONF_OPTS += --with-libidn=$(STAGING_DIR)/usr
+else
+LFTP_CONF_OPTS += --without-libidn
+endif
+
 # Remove /usr/share/lftp
 define LFTP_REMOVE_DATA
 	$(RM) -fr $(TARGET_DIR)/usr/share/lftp
-- 
2.15.0
