From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:27:28 +0100
Subject: [Buildroot] [git commit master] xlib_libfontenc: enable compilation
	on the host
Message-ID: <20100223202923.F02E1776A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d65e627432af8fce1c41df67ca48ce926b5a7300
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xlib_libfontenc is required to build xapp_mkfontscale on the host,
which in turn is needed to build font encodings for the target.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xlib_libfontenc/xlib_libfontenc.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
index b03697a..7ab4511 100644
--- a/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
+++ b/package/x11r7/xlib_libfontenc/xlib_libfontenc.mk
@@ -12,4 +12,7 @@ XLIB_LIBFONTENC_INSTALL_STAGING = YES
 XLIB_LIBFONTENC_DEPENDENCIES = zlib xproto_xproto
 XLIB_LIBFONTENC_CONF_OPT = --enable-shared --disable-static
 
+HOST_XLIB_LIBFONTENC_DEPENDENCIES = host-zlib host-xproto_xproto
+
 $(eval $(call AUTOTARGETS,package/x11r7,xlib_libfontenc))
+$(eval $(call AUTOTARGETS,package/x11r7,xlib_libfontenc,host))
-- 
1.6.3.3
