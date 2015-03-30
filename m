From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 23:35:47 +0200
Subject: [Buildroot] [git commit] libgtk2: drop libxcomposite mandatory dep
Message-ID: <20150330213703.4761B80734@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a2548c02ca444c2822f2e854f2f5bee2b729ce3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's not selected, not required and duplicate with the autodep.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgtk2/libgtk2.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index 39c629c..c92bbd2 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -82,8 +82,7 @@ LIBGTK2_CONF_OPTS += \
 	--x-libraries=$(STAGING_DIR)/usr/lib \
 	--with-gdktarget=x11
 LIBGTK2_DEPENDENCIES += \
-	xlib_libXcomposite fontconfig xlib_libX11 \
-	xlib_libXext xlib_libXrender
+	fontconfig xlib_libX11 xlib_libXext xlib_libXrender
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXINERAMA),y)
 	LIBGTK2_CONF_OPTS += --enable-xinerama
