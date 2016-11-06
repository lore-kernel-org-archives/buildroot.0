From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 23:02:51 +0100
Subject: [Buildroot] [git commit branch/next] gstreamer1: bump to version
	1.10.0
Message-ID: <20161107205049.934D380AC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7561c512a3bc39b0a2ed9df5c8b81cb5459d7e69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove gstconfig.h compatibility kludge since it has been
fixed/reinstated upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash |  4 ++--
 package/gstreamer1/gstreamer1/gstreamer1.mk   | 12 +-----------
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index c85518e..8bd7782 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,2 +1,2 @@
-# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.8.3.tar.xz.sha256sum
-sha256	66b37762d4fdcd63bce5a2bec57e055f92420e95037361609900278c0db7c53f  gstreamer-1.8.3.tar.xz
+# From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.10.0.tar.xz.sha256sum
+sha256	1e7778fabe480185bfc4ce552f0860de1443f6618a68a86ccdd65854fed37207  gstreamer-1.10.0.tar.xz
diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index d69c3e8..f0afdd9 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_VERSION = 1.8.3
+GSTREAMER1_VERSION = 1.10.0
 GSTREAMER1_SOURCE = gstreamer-$(GSTREAMER1_VERSION).tar.xz
 GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
@@ -36,14 +36,4 @@ GSTREAMER1_CONF_OPTS = \
 
 GSTREAMER1_DEPENDENCIES = libglib2 host-pkgconf host-bison host-flex
 
-# gstreamer-1.6 changed the location of its gstconfig.h file,
-# and unfortunately, not all (by far!) consumers have been
-# updated to look in the correct location.
-# Add a symlink to the legacy location
-define GSTREAMER1_LEGACY_CGSTCONFIG_H
-	cd $(STAGING_DIR)/usr/include/gstreamer-1.0/gst && \
-		ln -sf ../../../lib/gstreamer-1.0/include/gst/gstconfig.h .
-endef
-GSTREAMER1_POST_INSTALL_STAGING_HOOKS += GSTREAMER1_LEGACY_CGSTCONFIG_H
-
 $(eval $(autotools-package))
