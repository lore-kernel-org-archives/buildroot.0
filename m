From: Felipe Contreras <felipe.contreras@gmail.com>
Date: Mon, 24 Jan 2011 00:41:32 +0200
Subject: [Buildroot] [PATCH 3rd RESEND 3/6] Add tidsp-binaries package
In-Reply-To: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
Message-ID: <1295822495-16972-4-git-send-email-felipe.contreras@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/tidsp-binaries/Config.in        |    6 ++++++
 .../multimedia/tidsp-binaries/tidsp-binaries.mk    |    9 +++++++++
 3 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/tidsp-binaries/Config.in
 create mode 100644 package/multimedia/tidsp-binaries/tidsp-binaries.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index da50dbb..8a251fb 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -27,6 +27,7 @@ source "package/multimedia/mpg123/Config.in"
 source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/speex/Config.in"
 source "package/multimedia/swfdec/Config.in"
+source "package/multimedia/tidsp-binaries/Config.in"
 source "package/multimedia/festival/Config.in"
 source "package/multimedia/taglib/Config.in"
 source "package/multimedia/tremor/Config.in"
diff --git a/package/multimedia/tidsp-binaries/Config.in b/package/multimedia/tidsp-binaries/Config.in
new file mode 100644
index 0000000..2d50b62
--- /dev/null
+++ b/package/multimedia/tidsp-binaries/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_TIDSP_BINARIES
+	bool "tidsp-binaries"
+	help
+	  TI OMAP3 DSP algorithms.
+
+	  https://gforge.ti.com/gf/project/openmax/
diff --git a/package/multimedia/tidsp-binaries/tidsp-binaries.mk b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
new file mode 100644
index 0000000..5dc9205
--- /dev/null
+++ b/package/multimedia/tidsp-binaries/tidsp-binaries.mk
@@ -0,0 +1,9 @@
+TIDSP_BINARIES_VERSION=23.i3.8
+TIDSP_BINARIES_SOURCE=tidsp-binaries-$(TIDSP_BINARIES_VERSION).tar.gz
+TIDSP_BINARIES_SITE:=http://gst-dsp.googlecode.com/files/
+
+define TIDSP_BINARIES_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(call GENTARGETS,package/multimedia,tidsp-binaries))
-- 
1.7.4.rc2
