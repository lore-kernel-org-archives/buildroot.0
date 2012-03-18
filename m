From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Mar 2012 15:39:17 +0100
Subject: [Buildroot] [git commit] Add lpc3250loader to the host tools
Message-ID: <20120318144249.2603890D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d444e1d4c328d88f1f8befe6912e816876c1cbf4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use install -D for installation]
Signed-off-by: Alexandre Belloni <alexandre.belloni@piout.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in.host                 |    1 +
 package/lpc3250loader/Config.in.host   |    7 +++++++
 package/lpc3250loader/lpc3250loader.mk |    9 +++++++++
 3 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 1f49e79..861b736 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+source "package/lpc3250loader/Config.in.host"
 source "package/openocd/Config.in.host"
 source "package/sam-ba/Config.in.host"
 source "package/uboot-tools/Config.in.host"
diff --git a/package/lpc3250loader/Config.in.host b/package/lpc3250loader/Config.in.host
new file mode 100644
index 0000000..750080b
--- /dev/null
+++ b/package/lpc3250loader/Config.in.host
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_HOST_LPC3250LOADER
+	bool "host lpc3250loader"
+	help
+	  lpc3250loader is a tool to load/burn programs (in particular kickstart
+	  and S1L) on an LPC3250 platform.
+
+	  https://gitorious.org/lpc3250loader
diff --git a/package/lpc3250loader/lpc3250loader.mk b/package/lpc3250loader/lpc3250loader.mk
new file mode 100644
index 0000000..ed6485c
--- /dev/null
+++ b/package/lpc3250loader/lpc3250loader.mk
@@ -0,0 +1,9 @@
+HOST_LPC3250LOADER_SITE = git://gitorious.org/lpc3250loader/lpc3250loader.git
+HOST_LPC3250LOADER_VERSION = 1.0
+
+define HOST_LPC3250LOADER_INSTALL_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/LPC3250loader.py \
+		$(HOST_DIR)/usr/bin/LPC3250loader.py
+endef
+
+$(eval $(call GENTARGETS,host))
