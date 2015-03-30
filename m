From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Mar 2015 18:16:29 -0300
Subject: [Buildroot] [PATCH v2 2/3] libgtk2: drop libxcomposite mandatory dep
In-Reply-To: <1427750190-10801-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427750190-10801-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1427750190-10801-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's not selected, not required and duplicate with the autodep.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libgtk2/libgtk2.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

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
-- 
2.0.5
