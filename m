From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 13:11:29 +0100
Subject: [Buildroot] [git commit] libxcb: really disable doxygen
	documentation for target
Message-ID: <20111114121234.2CCC78F55A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0268d6ededb519929bda8fc019b57f4bb61f7868
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Baruch Siach for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/libxcb/libxcb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index cf01534..a68779d 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -15,7 +15,7 @@ LIBXCB_DEPENDENCIES = \
 LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
 LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
 	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-HOST_LIBXCB_CONF_OPT = --disable-build-docs
+LIBXCB_CONF_OPT = --disable-build-docs
 
 HOST_LIBXCB_DEPENDENCIES = \
 	host-libxslt host-pthread-stubs host-xcb-proto host-xlib_libXdmcp \
