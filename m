From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 18:04:30 +0200
Subject: [Buildroot] [git commit] gvfs: add optional gcr support
Message-ID: <20181020160911.878DF84381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3525b366994fc43b36f85053f443d3e0b49500f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gvfs/gvfs.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index b0722ffb00..e34033d5c7 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -20,7 +20,6 @@ GVFS_CONF_ENV = ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-con
 # Most of these are missing library support
 GVFS_CONF_OPTS = \
 	--disable-afc \
-	--disable-gcr \
 	--disable-gdu \
 	--disable-goa \
 	--disable-google \
@@ -36,6 +35,13 @@ else
 GVFS_CONF_OPTS += --disable-avahi
 endif
 
+ifeq ($(BR2_PACKAGE_GCR),y)
+GVFS_DEPENDENCIES += gcr
+GVFS_CONF_OPTS += --enable-gcr
+else
+GVFS_CONF_OPTS += --disable-gcr
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 GVFS_DEPENDENCIES += udev
 endif
