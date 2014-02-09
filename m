From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  9 Feb 2014 13:47:12 +0100
Subject: [Buildroot] [PATCH 4/4] vlc: fix typo when setting VLC_CONF_ENV
In-Reply-To: <1391950032-5312-1-git-send-email-s.martin49@gmail.com>
References: <1391950032-5312-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1391950032-5312-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.org/results/917/917c26656557d50f869639162ec7e9d0f3399824/build-end.log

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/vlc/vlc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.5.4
