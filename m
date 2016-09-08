From: Floris Bos <bos@je-eigen-domein.nl>
Date: Thu,  8 Sep 2016 16:33:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/mysql: add MYSQL_SOCKET variable
Message-ID: <1473345222-10563-1-git-send-email-bos@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add MYSQL_SOCKET variable with default socket location for other
packages to use.

Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
---
 package/mysql/mysql.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 534bd97..a9e48ad 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -14,6 +14,9 @@ MYSQL_AUTORECONF = YES
 MYSQL_LICENSE = GPLv2
 MYSQL_LICENSE_FILES = README COPYING
 
+# Variable with default socket location for other buildroot packages to use
+MYSQL_SOCKET = /tmp/mysql.sock
+
 MYSQL_CONF_ENV = \
 	ac_cv_sys_restartable_syscalls=yes \
 	ac_cv_path_PS=/bin/ps \
-- 
2.7.4
