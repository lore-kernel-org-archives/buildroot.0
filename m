From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:52:50 +0100
Subject: [Buildroot] [git commit] package/rsyslog: add impcap support
Message-ID: <20210316202904.C870583C5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e471e5dd41d382d96ecc47ff082a7433571494d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

impcap is available since version 8.2006.0 and only depends on libpcap:
https://github.com/rsyslog/rsyslog/commit/76318ad9269309d0423358c545f72f3f79c12203

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
