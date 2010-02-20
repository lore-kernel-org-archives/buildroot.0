From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2010 19:42:59 +0100
Subject: [Buildroot] [PATCH 08/16] xlib_libfontenc: enable compilation on
	the host
In-Reply-To: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266691382.git.thomas.petazzoni@free-electrons.com>
Message-ID: <18f4f5d16cf2b51bdd6a867d43e6442384c6b765.1266691382.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
