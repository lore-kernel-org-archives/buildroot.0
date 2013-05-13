From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 May 2013 07:52:29 -0300
Subject: [Buildroot] [PATCH] linknx: fix dependencies
Message-ID: <1368442349-10496-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The mysql_client is set instead of added, thus eliminating libpthsem.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linknx/linknx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 54e0426..701eabf 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -15,7 +15,7 @@ LINKNX_DEPENDENCIES = libpthsem
 
 ifeq ($(BR2_PACKAGE_MYSQL_CLIENT),y)
 LINKNX_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr/bin/mysql_config
-LINKNX_DEPENDENCIES = mysql_client
+LINKNX_DEPENDENCIES += mysql_client
 else
 LINKNX_CONF_OPT += --without-mysql
 endif
-- 
1.8.1.5
