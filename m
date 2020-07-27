From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 17:27:09 +0200
Subject: [Buildroot] [git commit] package/systemd: needs kernel options
Message-ID: <20200727152220.9FB6486CA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8084b809ece3ed48014316ce6881914a6749632f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

according to https://wiki.gentoo.org/wiki/Systemd#Kernel

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Peter: drop optional CGROUP_BPF / BPF_SYSCALL, unused POSIX_MQUEUE and
 DEVTMPFS which is already taken care of by linux.mk]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index a9a750a55f..b94dc37761 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -587,8 +587,13 @@ SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 define SYSTEMD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_FHANDLE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_EPOLL)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SIGNALFD)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_TIMERFD)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_PROC_FS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_SYSFS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_AUTOFS4_FS)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_POSIX_ACL)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TMPFS_XATTR)
