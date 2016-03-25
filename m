From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Mar 2016 12:51:33 -0300
Subject: [Buildroot] [PATCH] samba4: drop --with-gettext configure option
Message-ID: <1458921093-4105-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The --with-gettext=X configure option was silently dropped from the
4.4.0 release and it errors out since it's unknown. Fixes:
http://autobuild.buildroot.net/results/3c0/3c0800fd6cc7a217a866cd9cf63d5f91dcbfd306/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/samba4/samba4.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 9f7b11d..5bacbc3 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -48,7 +48,6 @@ SAMBA4_CONF_OPTS += --without-fam
 endif
 
 ifeq ($(BR2_PACKAGE_GETTEXT),y)
-SAMBA4_CONF_OPTS += --with-gettext=$(STAGING_DIR)/usr
 SAMBA4_DEPENDENCIES += gettext
 else
 SAMBA4_CONF_OPTS += --without-gettext
-- 
2.7.3
