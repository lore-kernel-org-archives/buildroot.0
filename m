From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 May 2015 16:27:10 +0200
Subject: [Buildroot] [git commit] vlc: ensure correct directfb-config is used
Message-ID: <20150504142839.A9043818BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac95a7a27bf319a69db4183bc9bdd4ec9543d575
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise we can end up using host includes/libraries if the build host has
directfb-config.

Fixes:
http://autobuild.buildroot.net/results/361/3612b54b0bbc2a55ba6f0febb7be32595b523d96/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index ab9aaae..acd67ee 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -88,6 +88,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB),y)
 VLC_CONF_OPTS += --enable-directfb
+VLC_CONF_ENV += ac_cv_path_DIRECTFB_CONFIG=$(STAGING_DIR)/usr/bin/directfb-config
 VLC_DEPENDENCIES += directfb
 else
 VLC_CONF_OPTS += --disable-directfb
