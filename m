From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 10 May 2010 16:38:53 +0300
Subject: [Buildroot] [PATCH] Fix Python version detection for libxcb
Message-ID: <20100510133852.26288.87834.stgit@pauliusz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/x11r7/libxcb/libxcb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index c8b70ea..bd2c69d 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -13,7 +13,7 @@ LIBXCB_AUTORECONF = NO
 LIBXCB_LIBTOOL_PATCH = NO
 LIBXCB_DEPENDENCIES = host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau
 LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
-HOST_PYTHON_VERSION=$(shell python --version 2>&1 | sed 's/Python \(2\.[0-9]\)\..*/\1/')
+HOST_PYTHON_VERSION=$(shell python --version 2>&1 | sed 's/Python \(2\.[0-9]\).*/\1/')
 LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb XCBPROTO_XCBPYTHONDIR=$(STAGING_DIR)/usr/lib/python$(HOST_PYTHON_VERSION)/site-packages
 
 $(eval $(call AUTOTARGETS,package/x11r7,libxcb))
