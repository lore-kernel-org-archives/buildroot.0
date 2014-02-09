From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 9 Feb 2014 16:42:12 +0100
Subject: [Buildroot] [git commit] vlc: fix typo when setting VLC_CONF_ENV
Message-ID: <20140209154256.B5F189C8FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7c1b84a5967e88be8032ef085c2d84aafc0008a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
  http://autobuild.buildroot.org/results/917/917c26656557d50f869639162ec7e9d0f3399824/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index fd49040..f235ff8 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -211,7 +211,7 @@ endif
 ifeq ($(BR2_PACKAGE_LIVE555),y)
 VLC_CONF_OPT += --enable-live555
 VLC_DEPENDENCIES += live555
-VLC_CONF_ENV = \
+VLC_CONF_ENV += \
 	LIVE555_CFLAGS="\
 		-I$(STAGING_DIR)/usr/include/live \
 		-I$(STAGING_DIR)/usr/include/live/BasicUsageEnvironment \
