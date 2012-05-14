From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 May 2012 22:58:41 +0200
Subject: [Buildroot] [git commit branch/next] linphone: new package
Message-ID: <20120514210033.6EA5F96CEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c884eb7bf6fd5ae1f1e5609b86897e7c2b70c92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/linphone/Config.in   |   21 +++++++++++++++++++++
 package/linphone/linphone.mk |   12 ++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ff03178..9a854f1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -524,6 +524,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/lighttpd/Config.in"
 endif
 source "package/links/Config.in"
+source "package/linphone/Config.in"
 source "package/lrzsz/Config.in"
 source "package/mii-diag/Config.in"
 source "package/mrouted/Config.in"
diff --git a/package/linphone/Config.in b/package/linphone/Config.in
new file mode 100644
index 0000000..31c28d8
--- /dev/null
+++ b/package/linphone/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_LINPHONE
+	bool "linphone"
+	select BR2_PACKAGE_LIBEXOSIP2
+	select BR2_PACKAGE_SPEEX
+	help
+	  Linphone is an internet phone or Voice Over IP phone (VoIP).
+
+	  With linphone you can communicate freely with people over
+	  the internet, with voice, video, and text instant messaging.
+	  Linphone makes use of the SIP protocol, an open standard
+	  for internet telephony. You can use Linphone with any SIP
+	  VoIP operator, including our free SIP audio/video service.
+	  linphone is free-software (or open-source), you can download
+	  and redistribute it freely.
+	  Linphone is available for desktop computers: Linux, Windows,
+	  MacOSX, and for mobile phones: Android, iPhone, Blackberry.
+
+	  Linphone support in Buildroot is limited to the commandline
+	  client, linphonec, and video support is not enabled.
+
+	  http://www.linphone.org/
diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
new file mode 100644
index 0000000..6ba6b53
--- /dev/null
+++ b/package/linphone/linphone.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# linphone
+#
+#############################################################
+
+LINPHONE_VERSION = 3.5.2
+LINPHONE_SITE = http://download-mirror.savannah.gnu.org/releases/linphone/3.5.x/sources/
+LINPHONE_CONF_OPT = --disable-video --disable-gtk_ui
+LINPHONE_DEPENDENCIES = libeXosip2 speex
+
+$(eval $(call AUTOTARGETS))
