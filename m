From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 15:23:40 +0100
Subject: [Buildroot] [git commit] webp: add libfreeglut optional dependency
Message-ID: <20171202141624.DFECD80FD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=523490e74786ee4500fe5e01801f3087660d498f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webp/webp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 8999720..e86e798 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -36,6 +36,13 @@ else
 WEBP_CONF_OPTS += --disable-gif
 endif
 
+ifeq ($(BR2_PACKAGE_LIBFREEGLUT),y)
+WEBP_DEPENDENCIES += libfreeglut
+WEBP_CONF_OPTS += --enable-gl
+else
+WEBP_CONF_OPTS += --disable-gl
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 WEBP_DEPENDENCIES += libpng
 WEBP_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
