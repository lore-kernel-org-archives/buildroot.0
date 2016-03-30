From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 16:09:21 +0200
Subject: [Buildroot] [git commit] package/linphone: alsa support in
	mediastreamer needs alsa_lib_mixer
Message-ID: <20160330140927.79C2281963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1370976b6454ea87482334ec648a6453d7d65568
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/dd6/dd6cbff641028b25303c3b462e2058b56e53f1dd/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
