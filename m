From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 25 Apr 2012 15:49:04 +0200
Subject: [Buildroot] [git commit] berkeleydb: cleanup
Message-ID: <20120425135941.88B5696BC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=25e08d501c338714e16d6a06c5c6278e86df1dc8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the preferred 'VAR = value' form, and remove redundant configure
options.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/berkeleydb/berkeleydb.mk |   19 +++++--------------
 1 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 3d57852..396ba16 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -3,13 +3,13 @@
 # berkeley db
 #
 #############################################################
-BERKELEYDB_VERSION:=5.3.15
-BERKELEYDB_SITE:=http://download.oracle.com/berkeley-db
-BERKELEYDB_SOURCE:=db-$(BERKELEYDB_VERSION).NC.tar.gz
-BERKELEYDB_SUBDIR=build_unix
+BERKELEYDB_VERSION = 5.3.15
+BERKELEYDB_SITE = http://download.oracle.com/berkeley-db
+BERKELEYDB_SOURCE = db-$(BERKELEYDB_VERSION).NC.tar.gz
+BERKELEYDB_SUBDIR = build_unix
 BERKELEYDB_INSTALL_STAGING = YES
 
-#build directory can't be the directory where configure are there, so..
+# build directory can't be the directory where configure are there, so..
 define BERKELEYDB_CONFIGURE_CMDS
 	(cd $(@D)/build_unix; rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
@@ -20,16 +20,7 @@ define BERKELEYDB_CONFIGURE_CMDS
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/usr/lib \
-		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/share/man \
-		--infodir=/usr/share/info \
 		--with-gnu-ld \
 		--disable-cxx \
 		--disable-java \
