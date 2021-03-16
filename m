From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:52:49 +0100
Subject: [Buildroot] [git commit] package/rsyslog: add imhttp support
Message-ID: <20210316202904.B8CEC80841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a3178d1331244172a29476a71cd2c8ea8ca2b27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

imhttp support is available since version 8.2010.0 and only depends on
civetweb:
https://github.com/rsyslog/rsyslog/commit/6102f6083cfa73fe4a91e3d34c4d1dc924465278

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rsyslog/rsyslog.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index d20a13dbdd..6da2a469a9 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -30,11 +30,17 @@ RSYSLOG_CONF_OPTS += --disable-elasticsearch \
 	--disable-omhttp \
 	--disable-fmhttp \
 	--disable-imdocker \
-	--disable-imhttp \
 	--disable-impcap \
 	--disable-omhttpfs \
 	--disable-mmkubernetes
 
+ifeq ($(BR2_PACKAGE_CIVETWEB_LIB),y)
+RSYSLOG_DEPENDENCIES += civetweb
+RSYSLOG_CONF_OPTS += --enable-imhttp
+else
+RSYSLOG_CONF_OPTS += --disable-imhttp
+endif
+
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 RSYSLOG_DEPENDENCIES += gnutls
 RSYSLOG_CONF_OPTS += --enable-gnutls
