From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 17 May 2016 20:56:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: configure.ac does not support
	--en/--disable-freerdp
Message-ID: <1463511419-31833-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vlc configure does not allow disabling freerdp support:
http://git.videolan.org/?p=vlc/vlc-2.2.git;a=blob;f=configure.ac;h=e021546e284d7daefdb4d94f430eb0bc57722210;hb=HEAD#l1890

The problem

configure: WARNING: unrecognized options: --disable-gtk-doc,
 --disable-gtk-doc-html, --disable-doc, --disable-docs,
 --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6,
 --disable-libfreerdp

can be seen for example in

http://autobuild.buildroot.net/results/1a7/1a7893c13f6144e0ecd9f37f2f047c596ccedd35/build-end.log
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 30887bd..4dc8dfe 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -137,10 +137,7 @@ VLC_CONF_OPTS += --disable-flac
 endif
 
 ifeq ($(BR2_PACKAGE_FREERDP),y)
-VLC_CONF_OPTS += --enable-freerdp
 VLC_DEPENDENCIES += freerdp
-else
-VLC_CONF_OPTS += --disable-libfreerdp
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
-- 
2.8.1
