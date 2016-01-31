From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 14:20:52 +0100
Subject: [Buildroot] [git commit] package/libraw: add optional support for
	jpeg
Message-ID: <20160201224703.D41757F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96f06290a5914eb683d1f4fb40f9ed1d125b294f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libraw/libraw.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 106c52c..5ebc4a2 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -26,4 +26,11 @@ else
 LIBRAW_CONF_OPTS += --disable-jasper
 endif
 
+ifeq ($(BR2_PACKAGE_JPEG),y)
+LIBRAW_CONF_OPTS += --enable-jpeg
+LIBRAW_DEPENDENCIES += jpeg
+else
+LIBRAW_CONF_OPTS += --disable-jpeg
+endif
+
 $(eval $(autotools-package))
