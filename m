From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:19:35 +0100
Subject: [Buildroot] [git commit] package/apr-util: add optional dependency
	to gdbm
Message-ID: <20141026213050.CF238B0BFD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d575e2cca663eb59f57efafd98da024259b502c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apr-util/apr-util.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index c65b0fb..e22efb2 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -25,6 +25,13 @@ else
 APR_UTIL_CONF_OPTS += --without-berkeley-db
 endif
 
+ifeq ($(BR2_PACKAGE_GDBM),y)
+APR_UTIL_CONF_OPTS += --with-gdbm="$(STAGING_DIR)/usr"
+APR_UTIL_DEPENDENCIES += gdbm
+else
+APR_UTIL_CONF_OPTS += --without-gdbm
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 APR_UTIL_CONF_OPTS += --with-sqlite3="$(STAGING_DIR)/usr"
 APR_UTIL_DEPENDENCIES += sqlite
