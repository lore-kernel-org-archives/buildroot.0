From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jan 2016 20:48:56 +0100
Subject: [Buildroot] [git commit] gstreamer1: use a relative symlink to
	gstconfig.h
Message-ID: <20160201224708.F042B7F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efd1e36f22d3607063acb4edeb6436d5bc691280
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change today, but is needed for relocatable SDK.

Signed-off-by: Phil Eichinger <phil@zankapfel.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 4548773..0eb46e8 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -41,7 +41,7 @@ GSTREAMER1_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
 # updated to look in the correct location.
 # Add a symlink to the legacy location
 define GSTREAMER1_LEGACY_CGSTCONFIG_H
-	ln -sf $(STAGING_DIR)/usr/lib/gstreamer-1.0/include/gst/gstconfig.h \
+	ln -srf $(STAGING_DIR)/usr/lib/gstreamer-1.0/include/gst/gstconfig.h \
 	       $(STAGING_DIR)/usr/include/gstreamer-1.0/gst/gstconfig.h
 endef
 GSTREAMER1_POST_INSTALL_STAGING_HOOKS += GSTREAMER1_LEGACY_CGSTCONFIG_H
