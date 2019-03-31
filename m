From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 14:47:12 +0200
Subject: [Buildroot] [git commit] package/quota: add optional netlink
 dependency
Message-ID: <20190331124437.2D9D07FDB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47048e6012278ad69bb3d60d2778ad300276b45f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quota/quota.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/quota/quota.mk b/package/quota/quota.mk
index 46ef243ecc..836baf6071 100644
--- a/package/quota/quota.mk
+++ b/package/quota/quota.mk
@@ -11,6 +11,13 @@ QUOTA_LICENSE = GPL-2.0+
 QUOTA_LICENSE_FILES = COPYING
 QUOTA_LIBS = $(TARGET_NLS_LIBS)
 
+ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_LIBNL),yy)
+QUOTA_DEPENDENCIES += host-pkgconf dbus libnl
+QUOTA_CONF_OTS += --enable-netlink
+else
+QUOTA_CONF_OPTS += --disable-netlink
+endif
+
 ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
 QUOTA_DEPENDENCIES += host-pkgconf e2fsprogs
 QUOTA_CONF_OPTS += --enable-ext2direct
