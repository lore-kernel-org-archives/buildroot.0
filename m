From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 19:38:56 +0200
Subject: [Buildroot] [PATCH v2 08/16] package/apr-util: add optional
	dependency to openssl
In-Reply-To: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412530744-20649-9-git-send-email-bernd.kuhls@t-online.de>
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
index 42506bb..ed8eb28 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -46,4 +46,11 @@ else
 APR_UTIL_CONF_OPTS += --without-sqlite3
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+APR_UTIL_CONF_OPTS += --with-crypto --with-openssl="$(STAGING_DIR)/usr"
+APR_UTIL_DEPENDENCIES += openssl
+else
+APR_UTIL_CONF_OPTS += --without-ssl
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
