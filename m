From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:37 -0000
Subject: [Buildroot] [git commit branch/next] linphone: add optional gtk
	support
Message-ID: <20120802195235.538AF96AE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1a3045f209d651ebbe1e5e87ccb7686e8ea595a5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linphone/linphone.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index b34fbf7..c6d571d 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -7,10 +7,16 @@
 LINPHONE_VERSION = 3.5.2
 LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/3.5.x/sources/
 LINPHONE_CONF_OPT = \
-	--disable-gtk_ui \
 	--enable-external-ortp \
 	--enable-external-mediastreamer
 
 LINPHONE_DEPENDENCIES = host-pkg-config ortp mediastreamer libeXosip2 speex
 
+ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_XORG7),yy)
+LINPHONE_CONF_OPT += --enable-gtk_ui
+LINPHONE_DEPENDENCIES += libgtk2
+else
+LINPHONE_CONF_OPT += --disable-gtk_ui
+endif
+
 $(eval $(call AUTOTARGETS))
