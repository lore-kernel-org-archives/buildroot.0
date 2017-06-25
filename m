From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Jun 2017 10:37:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: fix libnet detection
Message-ID: <20170625083749.26322-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/e71/e718aab76d41c9c1aa5f9e3e74fb48b63038f254/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/syslog-ng/syslog-ng.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index bc49fadf9..325fac584 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -71,7 +71,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBNET),y)
 SYSLOG_NG_DEPENDENCIES += libnet
-SYSLOG_NG_CONF_OPTS += --enable-spoof-source
+SYSLOG_NG_CONF_OPTS += \
+	--with-libnet=$(STAGING_DIR)/usr/bin \
+	--enable-spoof-source
 else
 SYSLOG_NG_CONF_OPTS += --disable-spoof-source
 endif
-- 
2.11.0
