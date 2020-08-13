From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 20:02:54 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/systemd: needs
 kernel options
Message-ID: <20200813175658.40A838125A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=585755d996a1152a1e78df74bd082b61be919c3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

according to https://wiki.gentoo.org/wiki/Systemd#Kernel

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Peter: drop optional CGROUP_BPF / BPF_SYSCALL, unused POSIX_MQUEUE and
 DEVTMPFS which is already taken care of by linux.mk]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8084b809ece3ed48014316ce6881914a6749632f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/systemd.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 2490a988a2..5d6b759140 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -568,8 +568,13 @@ SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
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
