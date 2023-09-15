Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6393CD37AA
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91728419DC;
	Fri, 15 Sep 2023 21:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91728419DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3vZsOjUl6HwZ; Fri, 15 Sep 2023 21:37:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 774A4419E0;
	Fri, 15 Sep 2023 21:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 774A4419E0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8987A1BF995
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6092F83ECE
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:37:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6092F83ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qxiUfpQr-nDz for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:37:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B2DD83ECF
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B2DD83ECF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49A6C87082; Fri, 15 Sep 2023 21:37:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 23:33:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ef2e9896fb95f6fb12881bee498f568eb6af56f
X-Git-Newrev: 046872a1f8e1d14dbe07b1cca7abfdb76b560328
X-Patchwork-Hint: ignore
Message-Id: <20230915213708.49A6C87082@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libteam: bump to v1.32
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2531340400265538296=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2531340400265538296==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=046872a1f8e1d14dbe07b1cca7abfdb76b560328
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop backported patches
 - Add necessary runner to kernel

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[yann.morin.1998@free.fr: update .checkpackageignore]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  3 --
 .../0001-revert-disregard-current-state.patch      | 51 ----------------------
 .../0002-fix-build-on-openwrt-musl-libc.patch      | 41 -----------------
 .../0003-increase-wait-time-for-daemon-kill.patch  | 37 ----------------
 package/libteam/libteam.hash                       |  2 +-
 package/libteam/libteam.mk                         |  3 +-
 6 files changed, 3 insertions(+), 134 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index fde8eceed2..4769adf6cd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -780,9 +780,6 @@ package/libsvgtiny/0002-Remove-Werror.patch Upstream
 package/libsvgtiny/0003-Hopefully-silence-warnings-about-inlines-and-non-inlines-calling-one.patch Upstream
 package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch Upstream
 package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch Upstream
-package/libteam/0001-revert-disregard-current-state.patch Upstream
-package/libteam/0002-fix-build-on-openwrt-musl-libc.patch Upstream
-package/libteam/0003-increase-wait-time-for-daemon-kill.patch Upstream
 package/libtelnet/0001-fix-compilation-without-zlib.patch Upstream
 package/libtheora/0001-link-libtheoradec.patch Upstream
 package/libtheora/0002-fix-autoreconf.patch Upstream
diff --git a/package/libteam/0001-revert-disregard-current-state.patch b/package/libteam/0001-revert-disregard-current-state.patch
deleted file mode 100644
index 339afbf416..0000000000
--- a/package/libteam/0001-revert-disregard-current-state.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 61efd6de2fbb8ee077863ee5a355ac3dfd9365b9 Mon Sep 17 00:00:00 2001
-From: Xin Long <lucien.xin@gmail.com>
-Date: Tue, 1 Sep 2020 13:59:27 +0800
-Subject: [PATCH] Revert "teamd: Disregard current state when considering port
- enablement"
-
-This reverts commit deadb5b715227429a1879b187f5906b39151eca9.
-
-As Patrick noticed, with that commit, teamd_port_check_enable()
-would set the team port to the new state unconditionally, which
-triggers another change message from kernel to userspace, then
-teamd_port_check_enable() is called again to set the team port
-to the new state.
-
-This would go around and around to update the team port state,
-and even cause teamd to consume 100% cpu.
-
-As the issue caused by that commit is serious, it has to be
-reverted. As for the issued fixed by that commit, I would
-propose a new fix later.
-
-Signed-off-by: Jiri Pirko <jiri@nvidia.com>
----
- teamd/teamd_per_port.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/teamd/teamd_per_port.c b/teamd/teamd_per_port.c
-index 166da57..d429753 100644
---- a/teamd/teamd_per_port.c
-+++ b/teamd/teamd_per_port.c
-@@ -442,14 +442,18 @@ int teamd_port_check_enable(struct teamd_context *ctx,
- 			    bool should_enable, bool should_disable)
- {
- 	bool new_enabled_state;
-+	bool curr_enabled_state;
- 	int err;
- 
- 	if (!teamd_port_present(ctx, tdport))
- 		return 0;
-+	err = teamd_port_enabled(ctx, tdport, &curr_enabled_state);
-+	if (err)
-+		return err;
- 
--	if (should_enable)
-+	if (!curr_enabled_state && should_enable)
- 		new_enabled_state = true;
--	else if (should_disable)
-+	else if (curr_enabled_state && should_disable)
- 		new_enabled_state = false;
- 	else
- 		return 0;
diff --git a/package/libteam/0002-fix-build-on-openwrt-musl-libc.patch b/package/libteam/0002-fix-build-on-openwrt-musl-libc.patch
deleted file mode 100644
index f2b38a137d..0000000000
--- a/package/libteam/0002-fix-build-on-openwrt-musl-libc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 267f24839536234ca621d4fd0466d3b57cb6dccd Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Pavel=20=C5=A0imerda?= <code@simerda.eu>
-Date: Tue, 12 Jan 2021 04:41:56 +0100
-Subject: [PATCH] fix build on OpenWRT/musl-libc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Pavel Šimerda <code@simerda.eu>
-Signed-off-by: Jiri Pirko <jiri@nvidia.com>
----
- teamd/teamd_runner_lacp.c | 2 --
- utils/teamnl.c            | 1 +
- 2 files changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/teamd/teamd_runner_lacp.c b/teamd/teamd_runner_lacp.c
-index 9437f05..f524be2 100644
---- a/teamd/teamd_runner_lacp.c
-+++ b/teamd/teamd_runner_lacp.c
-@@ -23,9 +23,7 @@
- #include <unistd.h>
- #include <limits.h>
- #include <sys/ioctl.h>
--#include <linux/if_ether.h>
- #include <sys/socket.h>
--#include <linux/netdevice.h>
- #include <netinet/in.h>
- #include <errno.h>
- #include <team.h>
-diff --git a/utils/teamnl.c b/utils/teamnl.c
-index c53345d..ec2b435 100644
---- a/utils/teamnl.c
-+++ b/utils/teamnl.c
-@@ -24,6 +24,7 @@
- #include <getopt.h>
- #include <errno.h>
- #include <sys/signalfd.h>
-+#include <sys/select.h>
- #include <signal.h>
- #include <unistd.h>
- #include <team.h>
diff --git a/package/libteam/0003-increase-wait-time-for-daemon-kill.patch b/package/libteam/0003-increase-wait-time-for-daemon-kill.patch
deleted file mode 100644
index 7827a654ef..0000000000
--- a/package/libteam/0003-increase-wait-time-for-daemon-kill.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 6875e6c8efb0fe86766b3d4f1d0db390af6998b7 Mon Sep 17 00:00:00 2001
-From: Hangbin Liu <liuhangbin@gmail.com>
-Date: Tue, 15 Dec 2020 19:33:17 +0800
-Subject: [PATCH] teamd: increase the waitting time for daemon killing
-
-In the current code, we wait for at most 5s when kill the daemon pid.
-But in some environment, it may need more time. Then the teamd -k will
-failed and return error "Failed to kill daemon: Timer expired".
-
-Let's increase the value to have enough time. Here is the reuslt with
-this patch:
-
-$ time libteam/teamd/teamd -k -t team0
-
-real    0m10.442s
-user    0m0.017s
-sys     0m0.016s
-
-Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
-Signed-off-by: Jiri Pirko <jiri@nvidia.com>
----
- teamd/teamd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/teamd/teamd.c b/teamd/teamd.c
-index 9360cbf..b310140 100644
---- a/teamd/teamd.c
-+++ b/teamd/teamd.c
-@@ -1858,7 +1858,7 @@ int main(int argc, char **argv)
- 		break;
- 	case DAEMON_CMD_KILL:
- 		if (daemon_pid_file_is_running() > 0) {
--			err = daemon_pid_file_kill_wait(SIGTERM, 5);
-+			err = daemon_pid_file_kill_wait(SIGTERM, 30);
- 			if (err)
- 				teamd_log_warn("Failed to kill daemon: %s",
- 					       strerror(errno));
diff --git a/package/libteam/libteam.hash b/package/libteam/libteam.hash
index 39d29425d3..da41c3979e 100644
--- a/package/libteam/libteam.hash
+++ b/package/libteam/libteam.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c69f7cf5a98203d66db10e67b396fe325b77a5a9491d1e07e8a07cba3ba841bb  libteam-1.31.tar.gz
+sha256  7ad90555db8aecdcaf002f543d330408501600edf7065e0ca398fce9b1e64820  libteam-1.32.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libteam/libteam.mk b/package/libteam/libteam.mk
index 8bd83aa20d..59eb4c5070 100644
--- a/package/libteam/libteam.mk
+++ b/package/libteam/libteam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTEAM_VERSION = 1.31
+LIBTEAM_VERSION = 1.32
 LIBTEAM_SITE = $(call github,jpirko,libteam,v$(LIBTEAM_VERSION))
 LIBTEAM_LICENSE = LGPL-2.1+
 LIBTEAM_LICENSE_FILES = COPYING
@@ -18,6 +18,7 @@ define LIBTEAM_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_CORE)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_TEAM)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET_TEAM_MODE_ROUNDROBIN)
 endef
 
 $(eval $(autotools-package))

--===============2531340400265538296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2531340400265538296==--
