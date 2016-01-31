From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 14:20:47 +0100
Subject: [Buildroot] [git commit] package/libraw: add optional support for
	jasper
Message-ID: <20160201224707.6BB977F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e712000dbeb97c336802b6ee8c0fbba1a0836029
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libraw/libraw.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index a4ab92f..106c52c 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -19,4 +19,11 @@ LIBRAW_CONF_OPTS += \
 LIBRAW_LICENSE = LGPLv2.1 or CDDL 1.0 or LibRaw Software License 27032010
 LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL LICENSE.LibRaw.pdf README
 
+ifeq ($(BR2_PACKAGE_JASPER),y)
+LIBRAW_CONF_OPTS += --enable-jasper
+LIBRAW_DEPENDENCIES += jasper
+else
+LIBRAW_CONF_OPTS += --disable-jasper
+endif
+
 $(eval $(autotools-package))
