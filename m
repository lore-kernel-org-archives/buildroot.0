From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon,  3 Jun 2013 13:10:09 +0100
Subject: [Buildroot] [PATCH] sconeserver: fix autouild failure
Message-ID: <1370261409-8722-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Fixes autobuild failures such as the following.

  http://autobuild.buildroot.net/results/1bdb5e014daf76b701afea5c82ac83ac4c97d4cb/

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/sconeserver/sconeserver.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 744f389..565d467 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -60,7 +60,8 @@ endif
 ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
 	SCONESERVER_DEPENDENCIES += mysql_client
 	SCONESERVER_CONF_OPT += --with-mysql \
-		--with-mysql_config="$(STAGING_DIR)/usr/bin/mysql_config"
+		--with-mysql_config="$(STAGING_DIR)/usr/bin/mysql_config" \
+		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib/mysql"
 else
 	SCONESERVER_CONF_OPT += --without-mysql
 endif
-- 
1.8.1.2
