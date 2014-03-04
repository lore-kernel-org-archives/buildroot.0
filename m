From: =?UTF-8?q?Marcelo=20Guti=C3=A9rrez?= <kuyurix@gmail.com>
Date: Tue,  4 Mar 2014 14:50:01 +0000
Subject: [Buildroot] [PATCH 2/4] mysql: add mysql user
In-Reply-To: <1393944603-3104-1-git-send-email-kuyurix@gmail.com>
References: <1393944603-3104-1-git-send-email-kuyurix@gmail.com>
Message-ID: <1393944603-3104-2-git-send-email-kuyurix@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Marcelo Guti?rrez <kuyurix@gmail.com>
---
 package/mysql/mysql.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index eb3a70e..3b69bdc 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -79,6 +79,10 @@ define HOST_MYSQL_INSTALL_CMDS
 	$(INSTALL) -m 0755  $(@D)/sql/gen_lex_hash  $(HOST_DIR)/usr/bin/
 endef
 
+define MYSQL_USERS
+	mysql -1 nogroup -1 = /var/mysql /bin/sh -
+endef
+
 define MYSQL_ADD_FOLDER
 	$(INSTALL) -d $(TARGET_DIR)/var/mysql
 endef
-- 
1.7.10.4
