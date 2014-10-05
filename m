From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 19:38:54 +0200
Subject: [Buildroot] [PATCH v2 06/16] package/apr-util: add optional
	dependency to gdbm
In-Reply-To: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412530744-20649-7-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apr-util/apr-util.mk |    7 +++++++
 1 file changed, 7 insertions(+)

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
-- 
1.7.10.4
