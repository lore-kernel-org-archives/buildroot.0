From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 15:50:28 +0200
Subject: [Buildroot] [git commit] package/pcm-tools: bear the kernel options
 munging
Message-ID: <20200501133530.F318490D13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df988d40e7fb1f350679fb6d0329364f9f011c66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/linux.mk                 | 2 --
 package/pcm-tools/pcm-tools.mk | 4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 9ba75f3956..1bf7932a55 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -357,8 +357,6 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NET))
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_PERF),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_PERF_EVENTS))
-	$(if $(BR2_PACKAGE_PCM_TOOLS),
-		$(call KCONFIG_ENABLE_OPT,CONFIG_X86_MSR))
 	$(if $(BR2_PACKAGE_SYSTEMD),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
diff --git a/package/pcm-tools/pcm-tools.mk b/package/pcm-tools/pcm-tools.mk
index 6d5938f94e..6de11c0da2 100644
--- a/package/pcm-tools/pcm-tools.mk
+++ b/package/pcm-tools/pcm-tools.mk
@@ -33,4 +33,8 @@ define PCM_TOOLS_INSTALL_TARGET_CMDS
 	$(PCM_TOOLS_INSTALL_PMU_QUERY)
 endef
 
+define PCM_TOOLS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_X86_MSR)
+endef
+
 $(eval $(generic-package))
