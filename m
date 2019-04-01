From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  1 Apr 2019 22:55:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/quota: fix syntax error
Message-ID: <20190401205516.26847-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/quota/quota.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 836baf6071..3377250766 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -13,7 +13,7 @@ QUOTA_LIBS = $(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBNL),yy)
 QUOTA_DEPENDENCIES += host-pkgconf dbus libnl
-QUOTA_CONF_OTS += --enable-netlink
+QUOTA_CONF_OPTS += --enable-netlink
 else
 QUOTA_CONF_OPTS += --disable-netlink
 endif
-- 
2.14.1
