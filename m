From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Jun 2020 09:59:58 +0200
Subject: [Buildroot] [PATCH v3 5/7] package/systemd: needs kernel options
In-Reply-To: <20200621080000.180089-1-francois.perrad@gadz.org>
References: <20200621080000.180089-1-francois.perrad@gadz.org>
Message-ID: <20200621080000.180089-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

according to https://wiki.gentoo.org/wiki/Systemd#Kernel

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/systemd/systemd.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8e01a0db5..b7213dd12 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -565,9 +565,18 @@ SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 define SYSTEMD_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_BPF)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_EPOLL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SIGNALFD)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TIMERFD)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SYSFS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR)
-- 
2.25.1
