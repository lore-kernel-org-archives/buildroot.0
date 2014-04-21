From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 14:48:23 +0200
Subject: [Buildroot] [git commit] mysql: disable maintainer mode
Message-ID: <20140421131848.0C7449C95F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8104fd72ed6fee97f024ec75a4ed81231e2777b8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The maintainer mode enables additional gcc warnings, including
-Werror, which causes build failures with certain toolchains. Since we
generally don't enable -Werror in Buildroot, it doesn't make much
sense to have it enabled for MySQL.

Fixes:

  http://autobuild.buildroot.net/results/6b6/6b61f90d1a36ba43ff568933bb74975128380516/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mysql/mysql.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
index 95b30b7..5b30d84 100644
--- a/package/mysql/mysql.mk
+++ b/package/mysql/mysql.mk
@@ -30,14 +30,16 @@ MYSQL_CONF_OPT = \
 	--without-libedit \
 	--without-readline \
 	--with-low-memory \
-	--enable-thread-safe-client
+	--enable-thread-safe-client \
+	--disable-mysql-maintainer-mode
 
 ifeq ($(BR2_PACKAGE_MYSQL_SERVER),y)
 MYSQL_DEPENDENCIES += host-mysql host-bison
 HOST_MYSQL_DEPENDENCIES =
 
 HOST_MYSQL_CONF_OPT = \
-	--with-embedded-server
+	--with-embedded-server \
+	--disable-mysql-maintainer-mode
 
 MYSQL_CONF_OPT += \
 	--disable-dependency-tracking \
