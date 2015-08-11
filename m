From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 11 Aug 2015 20:16:52 +0200
Subject: [Buildroot] [PATCH/next 07/10] package/libilbc: new package
In-Reply-To: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439317015-8031-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1439317015-8031-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Config.in          |  1 +
 package/libilbc/Config.in  |  7 +++++++
 package/libilbc/libilbc.mk | 15 +++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/libilbc/Config.in
 create mode 100644 package/libilbc/libilbc.mk

diff --git a/package/Config.in b/package/Config.in
index 4cc2ce2..8a7960c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -701,6 +701,7 @@ menu "Audio/Sound"
 	source "package/libcuefile/Config.in"
 	source "package/libg7221/Config.in"
 	source "package/libid3tag/Config.in"
+	source "package/libilbc/Config.in"
 	source "package/liblo/Config.in"
 	source "package/libmad/Config.in"
 	source "package/libmodplug/Config.in"
diff --git a/package/libilbc/Config.in b/package/libilbc/Config.in
new file mode 100644
index 0000000..89d5db2
--- /dev/null
+++ b/package/libilbc/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBILBC
+	bool "libilbc"
+	help
+	  iLBC (internet Low Bitrate Codec) is a FREE speech codec
+	  suitable for robust voice communication over IP.
+
+	  http://www.webrtc.org/license-rights/ilbc-freeware
diff --git a/package/libilbc/libilbc.mk b/package/libilbc/libilbc.mk
new file mode 100644
index 0000000..8bbfc1f
--- /dev/null
+++ b/package/libilbc/libilbc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libilbc
+#
+################################################################################
+
+LIBILBC_VERSION = 829b08c7902ceb87a261279fabb36b6d523c6e07
+LIBILBC_SITE = https://freeswitch.org/stash/scm/sd/libilbc.git
+LIBILBC_SITE_METHOD = git
+LIBILBC_LICENSE = Global IP Sound iLBC Public License, v2.0
+LIBILBC_LICENSE_FILES = gips_iLBClicense.pdf
+LIBILBC_AUTORECONF = YES
+LIBILBC_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
2.1.4
