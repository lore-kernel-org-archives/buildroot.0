From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Mon,  7 Feb 2011 01:45:02 +0200
Subject: [Buildroot] [PATCH 1/4] Add tidsp-binaries package
Message-ID: <1297035905-29896-1-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/tidsp-binaries/Config.in        |    7 +++++++
 .../multimedia/tidsp-binaries/tidsp-binaries.mk    |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/tidsp-binaries/Config.in
 create mode 100644 package/multimedia/tidsp-binaries/tidsp-binaries.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 172678a..415e6ad 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -35,6 +35,7 @@ source "package/multimedia/musepack/Config.in"
 source "package/multimedia/python-mad/Config.in"
 source "package/multimedia/speex/Config.in"
 source "package/multimedia/swfdec/Config.in"
+source "package/multimedia/tidsp-binaries/Config.in"
 source "package/multimedia/festival/Config.in"
 source "package/multimedia/taglib/Config.in"
 source "package/multimedia/tremor/Config.in"
diff --git a/package/multimedia/tidsp-binaries/Config.in b/package/multimedia/tidsp-binaries/Config.in
new file mode 100644
index 0000000..48f85a5
--- /dev/null
+++ b/package/multimedia/tidsp-binaries/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_TIDSP_BINARIES
+	bool "tidsp-binaries"
+	depends on BR2_cortex_a8
+	help
+	  TI OMAP3 DSP algorithms.
+
+	  https://gforge.ti.com/gf/project/openmax/
diff --git a/package/multimedia/tidsp-binaries/tidsp-binaries.mk b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
new file mode 100644
index 0000000..102791f
--- /dev/null
+++ b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
@@ -0,0 +1,13 @@
+TIDSP_BINARIES_VERSION=23.i3.8
+TIDSP_BINARIES_SOURCE=tidsp-binaries-$(TIDSP_BINARIES_VERSION).tar.gz
+TIDSP_BINARIES_SITE:=http://gst-dsp.googlecode.com/files/
+
+define TIDSP_BINARIES_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
+endef
+
+define TIDSP_BINARIES_UNINSTALL_TARGET_CMDS
+	$(RM) -r $(TARGET_DIR)/lib/dsp
+endef
+
+$(eval $(call GENTARGETS,package/multimedia,tidsp-binaries))
-- 
1.7.4.1.gf4271.dirty
