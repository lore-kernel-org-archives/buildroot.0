From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 23:11:18 +0200
Subject: [Buildroot] [git commit] package/quota: fix syntax error
Message-ID: <20190401210732.978AC81522@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=259d7a2766a4c7b6f39d214672b5c1da185c3fe0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quota/quota.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index e356d91a06..5f1e427d0b 100644
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
