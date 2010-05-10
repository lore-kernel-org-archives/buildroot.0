From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 May 2010 22:18:44 +0200
Subject: [Buildroot] [git commit master] libxcb: relax host-python regexp
Message-ID: <20100510202711.8E2388A4AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=45ca86d4e9f0ac754482bf250c3ef5805e3198ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some python versions print x.y rather than x.y.z as version number, so
make regexp more robust.

Reported-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/libxcb/libxcb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index c8b70ea..4f9b323 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -13,7 +13,7 @@ LIBXCB_AUTORECONF = NO
 LIBXCB_LIBTOOL_PATCH = NO
 LIBXCB_DEPENDENCIES = host-libxslt pthread-stubs xcb-proto xlib_libXdmcp xlib_libXau
 LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
-HOST_PYTHON_VERSION=$(shell python --version 2>&1 | sed 's/Python \(2\.[0-9]\)\..*/\1/')
+HOST_PYTHON_VERSION=$(shell python --version 2>&1 | sed 's/Python \([0-9]\.[^\.]\).*/\1/')
 LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb XCBPROTO_XCBPYTHONDIR=$(STAGING_DIR)/usr/lib/python$(HOST_PYTHON_VERSION)/site-packages
 
 $(eval $(call AUTOTARGETS,package/x11r7,libxcb))
-- 
1.6.3.3
