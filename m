From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 16:12:23 +0200
Subject: [Buildroot] [git commit] package/apr-util: add support for unixodbc
Message-ID: <20150405141229.9798A81938@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccaea6eb217fc3e7f5e364aaeea9a1dfcd558470
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apr-util/apr-util.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 3b0a71b..bc0572e 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -53,4 +53,13 @@ else
 APR_UTIL_CONF_OPTS += --without-crypto
 endif
 
+ifeq ($(BR2_PACKAGE_UNIXODBC),y)
+APR_UTIL_CONF_OPTS += --with-odbc="$(STAGING_DIR)/usr"
+# avoid using target binary $(STAGING_DIR)/usr/bin/odbc_config
+APR_UTIL_CONF_ENV += ac_cv_path_ODBC_CONFIG=""
+APR_UTIL_DEPENDENCIES += unixodbc
+else
+APR_UTIL_CONF_OPTS += --without-odbc
+endif
+
 $(eval $(autotools-package))
