From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 17 Mar 2020 16:56:32 +0100
Subject: [Buildroot] [RFC PATCH 5/5] package/systemd: needs kernel options
In-Reply-To: <20200317155632.17649-1-francois.perrad@gadz.org>
References: <20200317155632.17649-1-francois.perrad@gadz.org>
Message-ID: <20200317155632.17649-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

according to https://wiki.gentoo.org/wiki/Systemd#Kernel

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 linux/linux.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index a83d09858..cbccb50a0 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -430,8 +430,16 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_X86_MSR,$(@D)/.config))
 	$(if $(BR2_PACKAGE_SYSTEMD),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS,$(@D)/.config)
-		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_BPF,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_EPOLL,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SIGNALFD,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_TIMERFD,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_SYSFS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR,$(@D)/.config))
-- 
2.17.1
