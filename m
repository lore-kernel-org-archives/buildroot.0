From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Mar 2016 22:30:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/linphone: port some stuff from
	mediastreamer
Message-ID: <1459283426-30883-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to add some dependencies formerly provided by the mediastreamer
package, also add --disable-video to make clear that our linphone
package lacks video support as stated in Config.in.

Fixes
http://autobuild.buildroot.net/results/45e/45e605de0488e9e961a536f4d232235c5282522b/
http://autobuild.buildroot.net/results/ed5/ed508ac3509be8c46670198da8eb0a2ba74835e6/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/linphone/linphone.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index 1728d20..eb676ea 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -8,7 +8,7 @@ LINPHONE_VERSION_MAJOR = 3.6
 LINPHONE_VERSION = $(LINPHONE_VERSION_MAJOR).1
 LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/$(LINPHONE_VERSION_MAJOR).x/sources
 LINPHONE_CONF_OPTS = \
-	--disable-strict
+	--disable-strict --disable-video
 # configure is out of sync causing deplibs linking issues
 LINPHONE_AUTORECONF = YES
 LINPHONE_INSTALL_STAGING = YES
@@ -34,6 +34,8 @@ LINPHONE_CONF_OPTS += --disable-gtk_ui
 endif
 
 # needed for bundled mediastreamer2
+LINPHONE_DEPENDENCIES += host-intltool host-gettext
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 LINPHONE_CONF_OPTS += --enable-libv4l1 --enable-libv4l2
 LINPHONE_DEPENDENCIES += libv4l
-- 
2.8.0.rc3
