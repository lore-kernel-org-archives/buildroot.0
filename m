From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 13 Oct 2018 17:06:06 +0200
Subject: [Buildroot] [PATCH 1/1] gvfs: fix activation of http/dav backend
Message-ID: <20181013150606.11876-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since gvfs version 1.2.3, http/dav backend needs libxml2:
https://gitlab.gnome.org/GNOME/gvfs/commit/2ef5b4192f95f9205204215aec33787641608e58

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gvfs/gvfs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 6b20fd9b9a..d5f3682e2c 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -94,8 +94,8 @@ else
 GVFS_CONF_OPTS += --disable-nfs
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSOUP),y)
-GVFS_DEPENDENCIES += libsoup
+ifeq ($(BR2_PACKAGE_LIBSOUP)$(BR2_PACKAGE_LIBXML2),yy)
+GVFS_DEPENDENCIES += libsoup libxml2
 GVFS_CONF_OPTS += --enable-http
 else
 GVFS_CONF_OPTS += --disable-http
-- 
2.17.1
