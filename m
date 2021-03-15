From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Mar 2021 08:44:23 +0100
Subject: [Buildroot] [PATCH 2/2] package/rsyslog: add impcap support
In-Reply-To: <20210315074423.1530562-1-fontaine.fabrice@gmail.com>
References: <20210315074423.1530562-1-fontaine.fabrice@gmail.com>
Message-ID: <20210315074423.1530562-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

impcap is available since version 8.2006.0 and only depends on libpcap:
https://github.com/rsyslog/rsyslog/commit/76318ad9269309d0423358c545f72f3f79c12203

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsyslog/rsyslog.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 6da2a469a9..99e80ae268 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -30,7 +30,6 @@ RSYSLOG_CONF_OPTS += --disable-elasticsearch \
 	--disable-omhttp \
 	--disable-fmhttp \
 	--disable-imdocker \
-	--disable-impcap \
 	--disable-omhttpfs \
 	--disable-mmkubernetes
 
@@ -60,6 +59,13 @@ else
 RSYSLOG_CONF_OPTS += --disable-libgcrypt
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPCAP),y)
+RSYSLOG_DEPENDENCIES += libpcap
+RSYSLOG_CONF_OPTS += --enable-impcap
+else
+RSYSLOG_CONF_OPTS += --disable-impcap
+endif
+
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 RSYSLOG_DEPENDENCIES += mysql
 RSYSLOG_CONF_OPTS += --enable-mysql
-- 
2.30.0
