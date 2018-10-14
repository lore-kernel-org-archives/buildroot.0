From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Oct 2018 09:59:12 +0200
Subject: [Buildroot] [git commit] gvfs: fix activation of http/dav backend
Message-ID: <20181014075821.8D41083619@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a78848202b6bb5af178509e0514d5a42b9c4430c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since gvfs version 1.2.3, http/dav backend needs libxml2:
https://gitlab.gnome.org/GNOME/gvfs/commit/2ef5b4192f95f9205204215aec33787641608e58

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gvfs/gvfs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 7110e39083..e272d5c1dc 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -95,8 +95,8 @@ else
 GVFS_CONF_OPTS += --disable-nfs
 endif
 
-ifeq ($(BR2_PACKAGE_LIBSOUP),y)
-GVFS_DEPENDENCIES += libsoup
+ifeq ($(BR2_PACKAGE_LIBSOUP)$(BR2_PACKAGE_LIBXML2),yy)
+GVFS_DEPENDENCIES += libsoup libxml2
 GVFS_CONF_OPTS += --enable-http
 else
 GVFS_CONF_OPTS += --disable-http
