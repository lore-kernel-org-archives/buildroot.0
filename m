From: alexperl <alexondi@rambler.ru>
Date: Tue, 19 Jan 2010 06:16:14 -0800 (PST)
Subject: [Buildroot]  Compile Xorg-server with Mesa3D
Message-ID: <27226452.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi!
I try compile target Xorg with Mesa3D but seems in this config compile is
broken
here is patch which I made
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index e9d5f36..6272d48 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -70,6 +70,8 @@ XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d
 XSERVER_XORG_SERVER_CONF_OPT +=
--with-mesa-source="$(BUILD_DIR)/Mesa-$(MESA3D_VERSION)" --enable-xorg
+XSERVER_XORG_SERVER_CONF_ENV = GL_CFLAGS=$(STAGING_DIR)/usr
+XSERVER_XORG_SERVER_CONF_ENV += GL_LIBS=$(STAGING_DIR)/usr
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-xorg
 endif
@@ -126,3 +128,4 @@ endif


 $(eval $(call AUTOTARGETS,package/x11r7,xserver_xorg-server))
+

But after I call make I have another error

/BR2/buildroot/output/staging/usr/bin/x86_64-linux-uclibc-ldconfig -r
/BR2/buildroot/output/target 2>/dev/null
make: *** [target-finalize] Error 127
which I can't understand.
What I do wrong patch for Xorg or what?
Thank you!

-- 
View this message in context: http://old.nabble.com/Compile-Xorg-server-with-Mesa3D-tp27226452p27226452.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
