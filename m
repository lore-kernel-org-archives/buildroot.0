From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:36:48 +0200
Subject: [Buildroot] [git commit] motion: fix postgresql support
Message-ID: <20161019213751.1876F81664@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1092c8f612229aeca7ef7453debdb0e7b501004b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commandline paramter to enable/disable postgresql support is
called '--with-pgsql/--without-pgsql' and not '--with-postgresql/
--without-postgresql'.

Fixes [1] in case postgresql development files are installed on the host:

  checking for PostgreSQL... testing
  checking autodect pgsql headers... yes /usr/include/postgresql
  checking autodect pgsql libs... /usr/lib64
  checking for PQconnectStart in -lpq... no
  configure: error: PostgreSQL support can't build without PostgreSQL libraries

[1] http://autobuild.buildroot.net/results/749/7497730da2affffe0e5b9b790081de10c269f416

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/motion/motion.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/motion/motion.mk b/package/motion/motion.mk
index cf9be76..16ce406 100644
--- a/package/motion/motion.mk
+++ b/package/motion/motion.mk
@@ -44,11 +44,11 @@ endif
 ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
 MOTION_DEPENDENCIES += postgresql
 MOTION_CONF_OPTS += \
-	--with-postgresql \
+	--with-pgsql \
 	--with-pgsql-include=$(STAGING_DIR)/usr/include \
 	--with-pgsql-lib=$(STAGING_DIR)/usr/lib
 else
-MOTION_CONF_OPTS += --without-postgresql
+MOTION_CONF_OPTS += --without-pgsql
 endif
 
 ifeq ($(BR2_PACKAGE_SDL),y)
