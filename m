From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Mar 2010 13:43:56 +0200
Subject: [Buildroot] [git commit master] xlib_libXfont: don't build devel
	documentation
Message-ID: <20100329114443.10C4E7FB8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8a5e8e2d009b809e99990eba90085df67c9fbfe9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds to the build time and brings in an xmlto dependency

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                      |    3 ++-
 package/x11r7/xlib_libXfont/xlib_libXfont.mk |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index bd8d658..b5337db 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,7 +9,8 @@
 
 	Updated/fixed packages: busybox, dosfstools, e2fsprogs,
 	freetype, iperf, less, libglib2, libpng, mdadm, memstat,
-	mtd-utils, nano, pppd, setserial, squashfs, wget
+	mtd-utils, nano, pppd, setserial, squashfs, wget,
+	xlib_libXfont
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/x11r7/xlib_libXfont/xlib_libXfont.mk b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
index ba22805..df4ecec 100644
--- a/package/x11r7/xlib_libXfont/xlib_libXfont.mk
+++ b/package/x11r7/xlib_libXfont/xlib_libXfont.mk
@@ -10,6 +10,6 @@ XLIB_LIBXFONT_SITE = http://xorg.freedesktop.org/releases/individual/lib
 XLIB_LIBXFONT_AUTORECONF = YES
 XLIB_LIBXFONT_INSTALL_STAGING = YES
 XLIB_LIBXFONT_DEPENDENCIES = freetype xlib_libfontenc xlib_xtrans xproto_fontcacheproto xproto_fontsproto xproto_xproto xfont_encodings
-XLIB_LIBXFONT_CONF_OPT = --enable-shared --disable-static
+XLIB_LIBXFONT_CONF_OPT = --enable-shared --disable-static --disable-devel-docs
 
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libXfont))
-- 
1.6.3.3
