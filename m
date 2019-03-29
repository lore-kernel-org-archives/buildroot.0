From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Mar 2019 18:25:28 +0100
Subject: [Buildroot] [PATCH 2/2] package/quota: add optional netlink
 dependency
In-Reply-To: <20190329172528.22787-1-fontaine.fabrice@gmail.com>
References: <20190329172528.22787-1-fontaine.fabrice@gmail.com>
Message-ID: <20190329172528.22787-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.20.1
