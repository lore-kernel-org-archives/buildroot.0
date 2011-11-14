From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 11:52:48 +0100
Subject: [Buildroot] [git commit] libxcb: don't build doxygen documentation
Message-ID: <20111114114010.05E838E1B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3acf323e9e92042b34f98065b65cee16f214aa54
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In most situations we don't care about documentation, and newer doxygen
versions (1.7.x) seems to have issues with it, breaking the build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/libxcb/libxcb.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 8fb3dd3..cf01534 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -15,11 +15,14 @@ LIBXCB_DEPENDENCIES = \
 LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
 LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
 	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+HOST_LIBXCB_CONF_OPT = --disable-build-docs
 
 HOST_LIBXCB_DEPENDENCIES = \
 	host-libxslt host-pthread-stubs host-xcb-proto host-xlib_libXdmcp \
 	host-xlib_libXau host-python
 
+HOST_LIBXCB_CONF_OPT = --disable-build-docs
+
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
 
