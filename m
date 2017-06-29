From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 29 Jun 2017 23:00:16 +0300
Subject: [Buildroot] [PATCH] syslog-ng: fix build with libnet
Message-ID: <70f4581a67cd5d5172f051a84a607b04e97cc1a9.1498766416.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

syslog-ng needs the path of the libnet-config utility to detect libnet.

Fixes:
http://autobuild.buildroot.net/results/5c5/5c537c239c2c61b8764cdd96d03e8da402e7a9e6/
http://autobuild.buildroot.net/results/000/0009616538c1e50aac20f18c50a612685f4dc32c/
http://autobuild.buildroot.net/results/a71/a716a4efd11793ff6969041d8cbfcf13266045ce/

Cc: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/syslog-ng/syslog-ng.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index bc49fadf999b..5bb2e12e3349 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -71,7 +71,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBNET),y)
 SYSLOG_NG_DEPENDENCIES += libnet
-SYSLOG_NG_CONF_OPTS += --enable-spoof-source
+SYSLOG_NG_CONF_OPTS += --enable-spoof-source \
+		--with-libnet="$(STAGING_DIR)/usr/bin"
 else
 SYSLOG_NG_CONF_OPTS += --disable-spoof-source
 endif
-- 
2.11.0
