From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 14 Aug 2019 19:52:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/lftp: fix build with host expat
Message-ID: <20190814175238.14512-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=11881

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lftp/lftp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index 93a0bf5c32..b8a2b24302 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -25,6 +25,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_EXPAT)$(BR2_PACKAGE_LFTP_PROTO_HTTP),yy)
 LFTP_DEPENDENCIES += expat
+LFTP_CONF_OPTS += --with-expat=$(STAGING_DIR)/usr
+else
+LFTP_CONF_OPTS += --without-expat
 endif
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
-- 
2.20.1
