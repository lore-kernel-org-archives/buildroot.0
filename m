From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  7 May 2014 13:04:48 -0300
Subject: [Buildroot] [PATCH] ulogd: forcibly disable mysql when not present
Message-ID: <1399478688-22510-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Forcibly disable mysql support when we don't want it since ulogd's
configure script can pick up the host mysql_config thus leading to a
build failure.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ulogd/ulogd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index 28ada96..91eeaaf 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -20,6 +20,8 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 	ULOGD_CONF_OPT += --with-mysql=$(STAGING_DIR)/usr
 	ULOGD_DEPENDENCIES += mysql
+else
+	ULOGD_CONF_OPT += --with-mysql=no
 endif
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 	ULOGD_DEPENDENCIES += sqlite
-- 
1.8.5.5
