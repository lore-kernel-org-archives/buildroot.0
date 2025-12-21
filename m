Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B22BE67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 15:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1366B60A4E;
	Sun, 21 Dec 2025 15:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8e_s2ZK1Hixv; Sun, 21 Dec 2025 15:56:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0876608FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766332579;
	bh=bkQY0hLVidVK6dY+nut4sF6WIWB/w2hOO3xb7UIwYoY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Wah1qOdI2Q0WoJMqCh3Ui12NEbGPfAqi2wHZfu961QqcRen3YSIJmlkzU2C/PGA7H
	 9aAUo9Cabtmu+++FzVd/VaenupwMZOne+qS0tJUUXMpPrRQdTLsH5hf3b+U8okkqcM
	 zeIRyHwfMZ6Wsdon63dMvSIn+jVV3ur5Aoh+Rfnl+kgyY16Q40vjRmQMhLyM4v4dVa
	 QDucyO7J7sL8toFcV6RPpQkjLgNQ7RMVEqKblxgRDFgQqWsC2BZzWu9HBLrPPFAcOb
	 j5FleGm3W1hP1lSsZtmdBCWXO6eYRHczh4j2SF34QnpUKPGzy65mM2iyUoGRu+BgJH
	 yBnI18JsEQz/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0876608FE;
	Sun, 21 Dec 2025 15:56:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7094E119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 15:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62F7140624
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 15:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vGoDfH67Rucm for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 15:56:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 745EA40517
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 745EA40517
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 15:56:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 573AD874CF; Sun, 21 Dec 2025 15:56:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 16:42:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e42b3de3b1ccd41ef1907a791a7d3792d201c0be
X-Git-Newrev: ca3855c13f5803cd7e47a1b3299786ab4546abdb
X-Patchwork-Hint: ignore
Message-Id: <20251221155617.573AD874CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/watchdogd: bump to version 4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ca3855c13f5803cd7e47a1b3299786ab4546abdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
 - Add watchdogctl list-clients command to display currently subscribed
   clients to the process supervisor. Outputs to stdout in either table
   format (default) with colored headers, or JSON format with -j/--json
 - New global -j, --json option for machine-readable output, currently
   supported by list-clients and status commands
 - New API: wdog_clients() returns array of wdog_client_t structs for
   programmatic access to subscribed clients. See API documentation at
   https://codedocs.xyz/troglobit/watchdogd/wdog_8h.html
 - Enhance watchdogctl status command to display formatted output by
   default, with device information, capabilities, and reset history in
   a human-readable table format. Use -j/--json for JSON output

Fixes:
 - Generic scripts running more than 1 second would fail with false
   "critical error" reports and cause unwanted system reboots due
   to uninitialized exit status variable
 - watchdogctl reload with tempmon crashes watchdogd
 - Issue causing unwanted reboot when watchdogctl reload was called
   while a generic monitor script was running
 - Fix memory leak in generic monitor with optional script path, would
   be triggered on watchdogctl reload

The first of the fixes means we can now drop the backported patch.
Also, the test mode has been dropped from public use, hence it being
removed as well in this commit.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                   |  6 ++
 ...0001-Fix-use-of-uninitialized-exit-status.patch | 85 ----------------------
 package/watchdogd/Config.in                        |  7 --
 package/watchdogd/watchdogd.hash                   |  2 +-
 package/watchdogd/watchdogd.mk                     | 11 +--
 5 files changed, 9 insertions(+), 102 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 99289f2903..cf4f45a8d9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_WATCHDOGD_TEST_SUITE
+	bool "The watchdogd test mode option has been removed."
+	select BR2_LEGACY
+	help
+	  watchdogd v4.1 removes the test mode and test suite.
+
 config BR2_KERNEL_HEADERS_6_17
 	bool "kernel headers version 6.17.x are no longer supported"
 	select BR2_LEGACY
diff --git a/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch b/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch
deleted file mode 100644
index 69e7b36ef4..0000000000
--- a/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From f6d56c374723923e276ccfd442fdd0cabf23d095 Mon Sep 17 00:00:00 2001
-From: Fiona Klute <fiona.klute@gmx.de>
-Date: Fri, 14 Feb 2025 19:26:24 +0100
-Subject: [PATCH] Fix use of uninitialized exit status
-
-Depending on the timing between the SIGCHLD callback run and the first
-generic_cb() timer callback run, script_exit_status() sometimes
-returned uninitialized memory as the exit status of a script. This
-could lead to incorrect "critical error" reports if that uninitialized
-memory happened to contain a value that interpreted as an int was
-above the critical threshold.
-
-Additionally, script_exit_status() unconditionally removed the process
-information from the queue, meaning that if a process had not
-completed by the time its status was first probed, its status could
-never be updated or successfully probed again, leading to timeout. Fix
-this by removing the process only if the status indicates it has
-terminated (successful or not).
-
-The problems affected primarily scripts running approximately one
-second or longer, because very short running scripts will very likely
-have their exit status collected by the SIGCHLD callback before the
-first timer callback run.
-
-Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
-Upstream: https://github.com/troglobit/watchdogd/pull/52
----
- src/script.c | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/src/script.c b/src/script.c
-index 1220fb9..f6e0763 100644
---- a/src/script.c
-+++ b/src/script.c
-@@ -16,6 +16,7 @@
-  */
- 
- #include <errno.h>
-+#include <stdbool.h>		/* bool type (before C23) */
- #include <stdlib.h>		/* setenv() */
- #include <sys/wait.h>		/* waitpid() */
- #include <unistd.h>		/* execv(), _exit() */
-@@ -28,6 +29,7 @@
- struct exec_info {
- 	pid_t   pid;
- 	int     exit_status;
-+	bool    exited;
- 	void  (*cb)(void *arg);
- 	void   *arg;
- 	LIST_ENTRY(exec_info) entry;
-@@ -64,6 +66,8 @@ static void add(pid_t pid, void (*cb)(void *), void *arg)
- 	}
- 
- 	info->pid = pid;
-+	info->exit_status = 0;
-+	info->exited = false;
- 	info->cb  = cb;
- 	info->arg = arg;
- 	LIST_INSERT_HEAD(&exec_info_head, info, entry);
-@@ -78,6 +82,7 @@ static int exec(pid_t pid, int status)
- 			continue;
- 
- 		info->exit_status = status;
-+		info->exited = true;
- 		if (info->cb)
- 			info->cb(info->arg);
- 
-@@ -96,9 +101,11 @@ int script_exit_status(pid_t pid)
- 		if (info->pid != pid)
- 			continue;
- 
--		status = info->exit_status;
--		LIST_REMOVE(info, entry);
--		free(info);
-+		if (info->exited) {
-+			status = info->exit_status;
-+			LIST_REMOVE(info, entry);
-+			free(info);
-+		}
- 		break;
- 	}
- 
--- 
-2.47.2
-
diff --git a/package/watchdogd/Config.in b/package/watchdogd/Config.in
index 0aeaad165f..eeff3ad744 100644
--- a/package/watchdogd/Config.in
+++ b/package/watchdogd/Config.in
@@ -20,13 +20,6 @@ config BR2_PACKAGE_WATCHDOGD
 
 if BR2_PACKAGE_WATCHDOGD
 
-config BR2_PACKAGE_WATCHDOGD_TEST_SUITE
-	bool "Enable watchdogctl test cases"
-	help
-	  The watchdogctl program comes with a suite of tests built-in.
-	  They can be used to verify correct operation of watchdogd and
-	  the kernel watchdog driver.
-
 config BR2_PACKAGE_WATCHDOGD_GENERIC
 	bool "Generic script monitor"
 	default y if BR2_PACKAGE_WATCHDOGD_GENERIC_POLL_WRAP # legacy 2024.02
diff --git a/package/watchdogd/watchdogd.hash b/package/watchdogd/watchdogd.hash
index 0c228666bd..1ecc2cb40f 100644
--- a/package/watchdogd/watchdogd.hash
+++ b/package/watchdogd/watchdogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  7f38bc691353a51fc6feb2ccab60417c0284dd3f4d55c50d8b1781fda70d8101  watchdogd-4.0.tar.gz
+sha256  7ae90acfd8879145be6fb9afe0f388e461230ce76ff9b8f4daeb93250351c314  watchdogd-4.1.tar.gz
 
 # Locally calculated
 sha256  e233c56d807c74c67f2eff47ad03c216144cdd374d8d7578b996c28c260eadda  LICENSE
diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
index 189efc81d4..e6c756af53 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WATCHDOGD_VERSION = 4.0
+WATCHDOGD_VERSION = 4.1
 WATCHDOGD_SITE = https://github.com/troglobit/watchdogd/releases/download/$(WATCHDOGD_VERSION)
 WATCHDOGD_LICENSE = ISC
 WATCHDOGD_LICENSE_FILES = LICENSE
@@ -15,14 +15,7 @@ WATCHDOGD_SELINUX_MODULES = watchdog
 
 WATCHDOGD_CONF_OPTS = \
 	--disable-compat \
-	--disable-examples \
-	--disable-test-mode
-
-ifneq ($(BR2_PACKAGE_WATCHDOGD_TEST_SUITE),y)
-WATCHDOGD_CONF_OPTS += --disable-builtin-tests
-else
-WATCHDOGD_CONF_OPTS += --enable-builtin-tests
-endif
+	--disable-examples
 
 ifneq ($(BR2_PACKAGE_WATCHDOGD_GENERIC),y)
 WATCHDOGD_CONF_OPTS += --without-generic
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
