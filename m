From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:05 +0200
Subject: [Buildroot] [PATCH 36/69] libxcb: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-37-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/x11r7/libxcb/libxcb.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 7f7823bf5303..ba424186335b 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -15,6 +15,9 @@ LIBXCB_INSTALL_STAGING = YES
 LIBXCB_DEPENDENCIES = \
 	host-libxslt libpthread-stubs xcb-proto xlib_libXdmcp xlib_libXau \
 	host-xcb-proto host-python host-pkgconf
+HOST_LIBXCB_DEPENDENCIES = \
+	host-libxslt host-libpthread-stubs host-xcb-proto host-xlib_libXdmcp \
+	host-xlib_libXau host-python host-pkgconf
 
 LIBXCB_CONF_OPTS = --with-doxygen=no
 HOST_LIBXCB_CONF_OPTS = --with-doxygen=no
-- 
2.1.0
