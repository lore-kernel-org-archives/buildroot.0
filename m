From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 11 Aug 2015 20:16:49 +0200
Subject: [Buildroot] [PATCH/next 04/10] package/libbroadvoice: new package
In-Reply-To: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1439317015-8031-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in                      |  1 +
 package/libbroadvoice/Config.in        |  6 ++++++
 package/libbroadvoice/libbroadvoice.mk | 19 +++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/libbroadvoice/Config.in
 create mode 100644 package/libbroadvoice/libbroadvoice.mk

diff --git a/package/Config.in b/package/Config.in
index 7a45a6c..261cbf2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -693,6 +693,7 @@ menu "Audio/Sound"
 	source "package/celt051/Config.in"
 	source "package/fdk-aac/Config.in"
 	source "package/libao/Config.in"
+	source "package/libbroadvoice/Config.in"
 	source "package/libcdaudio/Config.in"
 	source "package/libcdio/Config.in"
 	source "package/libcue/Config.in"
diff --git a/package/libbroadvoice/Config.in b/package/libbroadvoice/Config.in
new file mode 100644
index 0000000..f4e59f9
--- /dev/null
+++ b/package/libbroadvoice/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBBROADVOICE
+	bool "libbroadvoice"
+	help
+	  broadvoice - a library for the BroadVoice 16 and 32 speech codecs
+
+	  https://www.broadcom.com/support/broadvoice
diff --git a/package/libbroadvoice/libbroadvoice.mk b/package/libbroadvoice/libbroadvoice.mk
new file mode 100644
index 0000000..c18d3d2
--- /dev/null
+++ b/package/libbroadvoice/libbroadvoice.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libbroadvoice
+#
+################################################################################
+
+LIBBROADVOICE_VERSION = f65b0f50c8c767229fbf1758370880abc0d78564
+# we use the FreeSwitch fork because (quoting README):
+# "This library is based on the Broadcom reference code, but has been
+# heavily modified so that it builds into a proper library, with a clean
+# usable interface, on a range of platforms."
+LIBBROADVOICE_SITE = https://freeswitch.org/stash/scm/sd/libbroadvoice.git
+LIBBROADVOICE_SITE_METHOD = git
+LIBBROADVOICE_LICENSE = LGPLv2.1
+LIBBROADVOICE_LICENSE_FILES = COPYING
+LIBBROADVOICE_AUTORECONF = YES
+LIBBROADVOICE_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.1.4
