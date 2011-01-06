From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Thu,  6 Jan 2011 17:53:19 +0200
Subject: [Buildroot] [PATCH 5/6] Add dsp-tools package
In-Reply-To: <1294329200-10418-1-git-send-email-felipe.contreras@gmail.com>
References: <1294329200-10418-1-git-send-email-felipe.contreras@gmail.com>
Message-ID: <1294329200-10418-6-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in              |    1 +
 package/dsp-tools/Config.in    |    7 +++++++
 package/dsp-tools/dsp-tools.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/dsp-tools/Config.in
 create mode 100644 package/dsp-tools/dsp-tools.mk

diff --git a/package/Config.in b/package/Config.in
index da5b62b..f9e1568 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -478,6 +478,7 @@ source "package/sysklogd/Config.in"
 source "package/sysvinit/Config.in"
 source "package/util-linux/Config.in"
 endif
+source "package/dsp-tools/Config.in"
 endmenu
 
 menu "Text editors and viewers"
diff --git a/package/dsp-tools/Config.in b/package/dsp-tools/Config.in
new file mode 100644
index 0000000..c37d76c
--- /dev/null
+++ b/package/dsp-tools/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DSP_TOOLS
+	bool "dsp-tools"
+	select BR2_PACKAGE_TIDSP_BINARIES
+	help
+	  Utilities for TI OMAP3 DSP.
+
+	  http://github.com/felipec/dsp-tools
diff --git a/package/dsp-tools/dsp-tools.mk b/package/dsp-tools/dsp-tools.mk
new file mode 100644
index 0000000..39d11d6
--- /dev/null
+++ b/package/dsp-tools/dsp-tools.mk
@@ -0,0 +1,13 @@
+DSP_TOOLS_VERSION=2.0
+DSP_TOOLS_SOURCE=dsp-tools-$(DSP_TOOLS_VERSION).tar.gz
+DSP_TOOLS_SITE=http://gst-dsp.googlecode.com/files/
+
+define DSP_TOOLS_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e
+endef
+
+define DSP_TOOLS_INSTALL_TARGET_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(call GENTARGETS,package,dsp-tools))
-- 
1.7.4.rc1
