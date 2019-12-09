From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  9 Dec 2019 23:27:44 +0100
Subject: [Buildroot] [PATCH 1/3] package/dante: remove --without-pam
Message-ID: <20191209222746.3440986-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--without-pam was wrongly put back by commit
6d8abc7c1aca00a8ee514b38d88744ccd9ec194f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dante/dante.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index 0bd036d37e..0668042bd8 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -12,7 +12,7 @@ DANTE_LICENSE_FILES = LICENSE
 # 0002-compiler.m4-do-not-remove-g-flag.patch touches a m4 file
 DANTE_AUTORECONF = YES
 
-DANTE_CONF_OPTS += --disable-client --disable-preload --without-pam
+DANTE_CONF_OPTS += --disable-client --disable-preload
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 DANTE_DEPENDENCIES += linux-pam
-- 
2.24.0
