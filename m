From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 May 2014 13:21:03 +0200
Subject: [Buildroot] [git commit] mysql: Add optional zlib dependency
Message-ID: <20140517112201.D10199CB44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=221b52b3ab8f4f90ebfe25ff52512233fd6fa49e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure zlib is built before mysql.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mysql/mysql.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 5b30d84..d338c31 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -33,6 +33,10 @@ MYSQL_CONF_OPT = \
 	--enable-thread-safe-client \
 	--disable-mysql-maintainer-mode
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+MYSQL_DEPENDENCIES += zlib
+endif
+
 ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
 MYSQL_DEPENDENCIES += host-mysql host-bison
 HOST_MYSQL_DEPENDENCIES =
