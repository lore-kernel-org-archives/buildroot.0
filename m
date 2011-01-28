From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 Jan 2011 09:17:52 +0100
Subject: [Buildroot] [git commit master 1/1] libxcb: use correct python
	variable
Message-ID: <20110128081845.5A8DC8D475@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=3e1fd70150ea66a753c597d6e49947b4a2b34284
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Directory is /usr/lib/python$(PYTHON_VERSION_MAJOR).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/libxcb/libxcb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index c9835ed..5b6a7ca 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -16,7 +16,7 @@ LIBXCB_DEPENDENCIES = \
 	host-xcb-proto host-python
 LIBXCB_CONF_ENV = STAGING_DIR="$(STAGING_DIR)"
 LIBXCB_MAKE_OPT = XCBPROTO_XCBINCLUDEDIR=$(STAGING_DIR)/usr/share/xcb \
-	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(HOST_PYTHON_VERSION)/site-packages
+	XCBPROTO_XCBPYTHONDIR=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
 HOST_LIBXCB_DEPENDENCIES = \
 	host-libxslt host-pthread-stubs host-xcb-proto host-xlib_libXdmcp \
-- 
1.7.3.4
