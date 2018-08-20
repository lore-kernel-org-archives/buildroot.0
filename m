From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:13:02 -0700
Subject: [Buildroot] [PATCH 1/3] oracle-mysql: fix hostname path
In-Reply-To: <20180820111304.22933-1-chrismcc@gmail.com>
References: <20180820111304.22933-1-chrismcc@gmail.com>
Message-ID: <20180820111304.22933-2-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/oracle-mysql/oracle-mysql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
index 7da5c547d9..0275a8428f 100644
--- a/package/oracle-mysql/oracle-mysql.mk
+++ b/package/oracle-mysql/oracle-mysql.mk
@@ -21,6 +21,7 @@ MYSQL_SOCKET = /run/mysql/mysql.sock
 ORACLE_MYSQL_CONF_ENV = \
 	ac_cv_sys_restartable_syscalls=yes \
 	ac_cv_path_PS=/bin/ps \
+	ac_cv_path_HOSTNAME=/bin/hostname \
 	ac_cv_FIND_PROC="/bin/ps p \$\$PID | grep -v grep | grep mysqld > /dev/null" \
 	ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_GCC=yes \
 	ac_cv_have_decl_HAVE_IB_ATOMIC_PTHREAD_T_SOLARIS=no \
-- 
2.14.4
