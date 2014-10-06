From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  6 Oct 2014 21:32:09 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/apr-util: add optional
	dependency to openssl
Message-ID: <1412623929-4638-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: Fixed configure option to disable OpenSSL support (Thomas)
v2: split patch and reordered apr-util dependencies (Yann)

 package/apr-util/apr-util.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 42506bb..85235c9 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -46,4 +46,11 @@ else
 APR_UTIL_CONF_OPTS += --without-sqlite3
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+APR_UTIL_CONF_OPTS += --with-crypto --with-openssl="$(STAGING_DIR)/usr"
+APR_UTIL_DEPENDENCIES += openssl
+else
+APR_UTIL_CONF_OPTS += --without-crypto
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
