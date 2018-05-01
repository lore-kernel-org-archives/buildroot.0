From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 May 2018 22:40:36 +0200
Subject: [Buildroot] [PATCH 5/6] lftp: switch from libidn to libidn2
In-Reply-To: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
References: <20180501204038.20000-1-fontaine.fabrice@gmail.com>
Message-ID: <20180501204038.20000-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libidn has been removed since 4.8.1 (August 2017):
https://github.com/lavv17/lftp/commit/731abec393f3deff490c77d1d55eb7219bc6b556

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lftp/lftp.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index e1ca0533ee..68f3dfce2c 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -41,11 +41,11 @@ else
 LFTP_CONF_OPTS += --without-openssl
 endif
 
-ifeq ($(BR2_PACKAGE_LIBIDN),y)
-LFTP_DEPENDENCIES += libidn
-LFTP_CONF_OPTS += --with-libidn=$(STAGING_DIR)/usr
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+LFTP_DEPENDENCIES += libidn2
+LFTP_CONF_OPTS += --with-libidn2=$(STAGING_DIR)/usr
 else
-LFTP_CONF_OPTS += --without-libidn
+LFTP_CONF_OPTS += --without-libidn2
 endif
 
 # Remove /usr/share/lftp
-- 
2.14.1
