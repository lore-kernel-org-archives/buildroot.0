From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:43:12 +0200
Subject: [Buildroot] [PATCH 8/8] linphone: new package
In-Reply-To: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
References: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336423392-8673-9-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Config.in            |    1 +
 package/linphone/Config.in   |   21 +++++++++++++++++++++
 package/linphone/linphone.mk |   12 ++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 package/linphone/Config.in
 create mode 100644 package/linphone/linphone.mk

diff --git a/package/Config.in b/package/Config.in
index 34c0280..f37553a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -520,6 +520,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
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
-- 
1.7.5.4
