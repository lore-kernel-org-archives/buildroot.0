From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 30 May 2020 14:47:33 +0200
Subject: [Buildroot] [PATCH v2 5/7] package/systemd: needs kernel options
In-Reply-To: <20200530124735.1384078-1-francois.perrad@gadz.org>
References: <20200530124735.1384078-1-francois.perrad@gadz.org>
Message-ID: <20200530124735.1384078-6-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

according to https://wiki.gentoo.org/wiki/Systemd#Kernel

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/systemd/systemd.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 92de54072..c34671071 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -568,8 +568,16 @@ SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 define SYSTEMD_LINUX_CONFIG_FIXUPS
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
