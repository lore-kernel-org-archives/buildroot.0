From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Mar 2015 11:07:41 +0100
Subject: [Buildroot] [PATCH next v2 4/4] package/apr-util: add support for
	unixodbc
In-Reply-To: <1425204461-27877-1-git-send-email-bernd.kuhls@t-online.de>
References: <1425204461-27877-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1425204461-27877-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: first inclusion in patch series, unix odbc detection works without
    odbc_config

 package/apr-util/apr-util.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 3b0a71b..07ac573 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -53,4 +53,11 @@ else
 APR_UTIL_CONF_OPTS += --without-crypto
 endif
 
+ifeq ($(BR2_PACKAGE_UNIXODBC),y)
+APR_UTIL_CONF_OPTS += --with-odbc="$(STAGING_DIR)/usr"
+APR_UTIL_DEPENDENCIES += unixodbc
+else
+APR_UTIL_CONF_OPTS += --without-odbc
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
