From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:13:03 -0700
Subject: [Buildroot] [PATCH 2/3] oracle-mysql: use group mysql, not nogroup
In-Reply-To: <20180820111304.22933-1-chrismcc@gmail.com>
References: <20180820111304.22933-1-chrismcc@gmail.com>
Message-ID: <20180820111304.22933-3-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/oracle-mysql/oracle-mysql.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 0275a8428f..aa9d8942f4 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -99,7 +99,7 @@ ORACLE_MYSQL_CONF_OPTS += --without-debug
 endif
 
 define ORACLE_MYSQL_USERS
-	mysql -1 nogroup -1 * /var/mysql - - MySQL daemon
+	mysql -1 mysql -1 * /var/mysql - - MySQL daemon
 endef
 
 define ORACLE_MYSQL_ADD_FOLDER
-- 
2.14.4
