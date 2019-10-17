From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 17 Oct 2019 16:29:27 +0100
Subject: [Buildroot] [RFC PATCH v2 28/30] package/x11r7/xlib_libXrandr: Add
 host package.
In-Reply-To: <20191017152929.49153-1-michael.drake@codethink.co.uk>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
Message-ID: <20191017152929.49153-29-michael.drake@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
index 23a0d974d0..a8080904af 100644
--- a/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.mk
@@ -11,6 +11,8 @@ XLIB_LIBXRANDR_LICENSE = MIT
 XLIB_LIBXRANDR_LICENSE_FILES = COPYING
 XLIB_LIBXRANDR_INSTALL_STAGING = YES
 XLIB_LIBXRANDR_DEPENDENCIES = xlib_libX11 xlib_libXext xlib_libXrender xorgproto
+HOST_XLIB_LIBXRANDR_DEPENDENCIES = host-xlib_libX11 host-xlib_libXext host-xlib_libXrender host-xorgproto
 XLIB_LIBXRANDR_CONF_OPTS = --disable-malloc0returnsnull
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.20.1
