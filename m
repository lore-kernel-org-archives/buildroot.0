From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 14:43:41 +0100
Subject: [Buildroot] [git commit] webp: add giflib optional dependency
Message-ID: <20171202133623.A19908151C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8833ab4d6ef0b68fdab43aa76b797529f38f0765
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webp/webp.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 2f3a78c..8999720 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -29,6 +29,13 @@ else
 WEBP_CONF_OPTS += --disable-libwebpmux
 endif
 
+ifeq ($(BR2_PACKAGE_GIFLIB),y)
+WEBP_DEPENDENCIES += giflib
+WEBP_CONF_OPTS += --enable-gif
+else
+WEBP_CONF_OPTS += --disable-gif
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 WEBP_DEPENDENCIES += libpng
 WEBP_CONF_ENV += ac_cv_path_LIBPNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
