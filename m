From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Nov 2018 23:59:37 +0100
Subject: [Buildroot] [git commit branch/2018.08.x] lcdproc: use
 ac_cv_mtab_file
Message-ID: <20181113225657.E1AE882DAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=961aa15808ac5843ffb577f3f9e41acd4c72137d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Set ac_cv_mtab_file to /etc/mtab otherwise build will fail if no mtab,
mnttab or fstab is found in /etc (on host)

Fixes:
 - http://autobuild.buildroot.org/results/efaf2833d674c7e366c59f367f0b83c7f88546bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b4501ca80d9c02984e5d0715b999d8d638cda544)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lcdproc/lcdproc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index e5b6172b15..96e59da409 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -18,7 +18,9 @@ endif
 
 LCDPROC_DEPENDENCIES = freetype ncurses zlib
 
-LCDPROC_CONF_ENV += ac_cv_path_FT2_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
+LCDPROC_CONF_ENV += \
+	ac_cv_mtab_file=/etc/mtab \
+	ac_cv_path_FT2_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 LCDPROC_DEPENDENCIES += libpng
