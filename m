From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 22 Jan 2012 02:20:20 +0100
Subject: [Buildroot] [PATCH 2/2] sofsip-cli: new package
In-Reply-To: <1327195220-25133-1-git-send-email-arnout@mind.be>
References: <1327195220-25133-1-git-send-email-arnout@mind.be>
Message-ID: <1327195220-25133-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>


Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/multimedia/Config.in                |    1 +
 package/multimedia/sofsip-cli/Config.in     |   11 +++++++++++
 package/multimedia/sofsip-cli/sofsip-cli.mk |   11 +++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/sofsip-cli/Config.in
 create mode 100644 package/multimedia/sofsip-cli/sofsip-cli.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 4779daf..320a55a 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -41,6 +41,7 @@ source "package/multimedia/musepack/Config.in"
 source "package/multimedia/portaudio/Config.in"
 source "package/multimedia/pulseaudio/Config.in"
 source "package/multimedia/sofia-sip/Config.in"
+source "package/multimedia/sofsip-cli/Config.in"
 source "package/multimedia/speex/Config.in"
 source "package/multimedia/tidsp-binaries/Config.in"
 source "package/multimedia/taglib/Config.in"
diff --git a/package/multimedia/sofsip-cli/Config.in b/package/multimedia/sofsip-cli/Config.in
new file mode 100644
index 0000000..656d5a6
--- /dev/null
+++ b/package/multimedia/sofsip-cli/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_SOFSIP_CLI
+	bool "sofsip-cli"
+	depends on BR2_USE_WCHAR # gstreamer -> glib2
+	depends on BR2_PACKAGE_SOFIA_SIP
+	select BR2_PACKAGE_GSTREAMER
+	help
+	  Client application for Sofia SIP Library
+	  http://sourceforge.net/projects/sofia-sip
+
+comment "Sofia-SIP client application requires WCHAR support (for glib2)"
+	depends on !BR2_USE_WCHAR
diff --git a/package/multimedia/sofsip-cli/sofsip-cli.mk b/package/multimedia/sofsip-cli/sofsip-cli.mk
new file mode 100644
index 0000000..12a6a97
--- /dev/null
+++ b/package/multimedia/sofsip-cli/sofsip-cli.mk
@@ -0,0 +1,11 @@
+#############################################################
+# 
+# sofsip-cli
+#
+#############################################################
+# http://sourceforge.net/projects/sofia-sip/files/sofsip-cli/0.16/sofsip-cli-0.16.tar.gz/download
+SOFSIP_CLI_VERSION = 0.16
+SOFSIP_CLI_SITE    = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sofia-sip
+SOFSIP_CLI_DEPENDENCIES = sofia-sip
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.8.3
