From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Apr 2020 14:10:25 +0200
Subject: [Buildroot] [PATCH 13/22] package/pcm-tools: bear the kernel
 options munging
In-Reply-To: <cover.1586002215.git.yann.morin.1998@free.fr>
References: <cover.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <aa4f123aa809e65dcc434916b0375a3d4143da06.1586002215.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Carlos Santos <unixmania@gmail.com>
---
 linux/linux.mk                 | 2 --
 package/pcm-tools/pcm-tools.mk | 4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 157808a49d..ec57f580ea 100644
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
-- 
2.20.1
