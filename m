From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 May 2014 22:40:18 +0200
Subject: [Buildroot] [git commit] package/rsyslog: Add missing optional
	dependency libcrypt
Message-ID: <20140515204429.5F1199CBF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b332886334962ae69f9d2acbbabdfdd9f661026b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
