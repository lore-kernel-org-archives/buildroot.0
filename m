From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Mar 2016 07:41:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/linphone: alsa support in
	mediastreamer needs alsa_lib_mixer
Message-ID: <1459316487-32018-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/dd6/dd6cbff641028b25303c3b462e2058b56e53f1dd/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linphone/linphone.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index eb676ea..df80490 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -36,6 +36,13 @@ endif
 # needed for bundled mediastreamer2
 LINPHONE_DEPENDENCIES += host-intltool host-gettext
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yy)
+LINPHONE_CONF_OPTS += --enable-alsa
+LINPHONE_DEPENDENCIES += alsa-lib
+else
+LINPHONE_CONF_OPTS += --disable-alsa
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 LINPHONE_CONF_OPTS += --enable-libv4l1 --enable-libv4l2
 LINPHONE_DEPENDENCIES += libv4l
-- 
2.8.0.rc3
