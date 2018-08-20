From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 20 Aug 2018 04:13:04 -0700
Subject: [Buildroot] [PATCH 3/3] oracle-mysql: check for my.cnf before
 starting
In-Reply-To: <20180820111304.22933-1-chrismcc@gmail.com>
References: <20180820111304.22933-1-chrismcc@gmail.com>
Message-ID: <20180820111304.22933-4-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/oracle-mysql/S97mysqld | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/oracle-mysql/S97mysqld b/package/oracle-mysql/S97mysqld
index 110ca2cd12..9777ff7775 100644
--- a/package/oracle-mysql/S97mysqld
+++ b/package/oracle-mysql/S97mysqld
@@ -3,6 +3,7 @@
 MYSQL_DIR="/var/mysql"
 MYSQL_USER="mysql"
 
+[ -r /etc/my.cnf ] || exit 0
 [ -r /etc/default/mysql ] && . /etc/default/mysql
 
 case "$1" in
-- 
2.14.4
