From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jul 2017 18:16:17 +0200
Subject: [Buildroot] [git commit] package/syslog-ng: fix libnet detection
Message-ID: <20170702161954.637798188C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee99e9ea8cc31d22f72e66cdc63ae2cdc0e6a51d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/e71/e718aab76d41c9c1aa5f9e3e74fb48b63038f254/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/syslog-ng/syslog-ng.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index bc49fad..325fac5 100644
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
