From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 18:04:48 +0200
Subject: [Buildroot] [git commit] gvfs: enable gphoto2
Message-ID: <20181020160911.9113784381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4439eda857b8b59385d5b7ee6ee5bcad16466e3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable gphoto2 if libgphoto2 and libgudev are available

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gvfs/gvfs.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index e34033d5c7..0fdb9e1267 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -23,7 +23,6 @@ GVFS_CONF_OPTS = \
 	--disable-gdu \
 	--disable-goa \
 	--disable-google \
-	--disable-gphoto2 \
 	--disable-keyring \
 	--disable-libmtp \
 	--disable-udisks2
@@ -99,6 +98,13 @@ else
 GVFS_CONF_OPTS += --disable-afp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGPHOTO2)$(BR2_PACKAGE_LIBGUDEV),yy)
+GVFS_DEPENDENCIES += libgphoto2 libgudev
+GVFS_CONF_OPTS += --enable-gphoto2
+else
+GVFS_CONF_OPTS += --disable-gphoto2
+endif
+
 ifeq ($(BR2_PACKAGE_LIBGTK3),y)
 GVFS_CONF_OPTS += --enable-gtk
 GVFS_DEPENDENCIES += libgtk3
