Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D28D3F09A
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCB8E40A93;
	Wed, 28 Jan 2026 17:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZO49yfACl0sO; Wed, 28 Jan 2026 17:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78BF540AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620861;
	bh=2ahwsw/6l9lKEpqD7rcnecBqMNrr+t9i6vgDpVUAQl4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lS6xYkXQM21+BMSkCFj9GecGeIVxSGaafxA9NG7wUO/MGwVVz2oo6MVGFdwNPIlmM
	 JU/LbMNkF3s1ZbH9Ra0aOo3OC7+lVl0e7VGpukVEzMF4A+7bHnJFLrTPf7+Chbaxbb
	 XOvJOAOgkVDI3TgQeKDcQ6VK2i/IQJIBpm4c7eYoZBNqoYP7XpGDJK1qzDkYXGF+Ox
	 jxK8zbkvrSrbxwWBujeLH2wh/hIQJON/Ci7I8PuTZhzeMqpTabo7K1Z/v8KHDTIO/2
	 TqlLaX1NhIpgy6fFPSY7PsBrhocifDQf/niHRW+W+1MaAY2YjFENdD0qqDOgdx0yND
	 h3JfSqR0nTO1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78BF540AB3;
	Wed, 28 Jan 2026 17:21:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FEF4118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7138060784
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id huSgVw2fIcyV for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09F4260787
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09F4260787
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:20:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03A4B82906; Wed, 28 Jan 2026 17:20:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:53:17 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: abd1a9613f6d4d7ec0dbfb17998e95f8c2d185b6
X-Git-Newrev: 0f735ee08d04445bb91d18cb069c80d3aec9d180
X-Patchwork-Hint: ignore
Message-Id: <20260128172038.03A4B82906@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/util-linux: add
 dependency to BR2_USE_MMU when needed
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0f735ee08d04445bb91d18cb069c80d3aec9d180
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Upstream added fork() to lib/canonicalize.c in version 2.34[1]
https://github.com/util-linux/util-linux/commit/e101a9eb0fab6725e0a239a92f9b50822c494a3e

but the resulting build errors on non-mmu archs were most likely masked
by previous build errors which are already fixed.

lib/canonicalize.c as part of libcommon is widely used so we need to add
the dependency to many Config.in options.

For an overview about its usage see
output/build/util-linux-2.41.2$ grep -r "LDADD = \$(LDADD) libcommon.la" * | grep Makemodule | cut -d ":" -f 2 | sort

Fixes:
https://autobuild.buildroot.net/results/34b/34b1f733fdfb5c5e30e631576f875398435ad115/

[1] Added to buildroot with commit bb216ed060b16e09b2027ef242347b2f2e3c97dc
    in 2019.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit faa62ce0858d1a5d234f71d3b54a24e1ba174e87)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linux-tools/Config.in |  2 +-
 package/util-linux/Config.in  | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 5a38f6dafe..20131b0d9f 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -150,7 +150,7 @@ comment "rtla needs a toolchain w/ threads, dynamic library"
 config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	bool"selftests"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
-	depends on BR2_USE_MMU  # bash
+	depends on BR2_USE_MMU  # bash, util-linux-schedutils
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14 # util-linux schedutils
 	select BR2_PACKAGE_LINUX_TOOLS
diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index a168abe720..dfebaa0947 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -75,11 +75,13 @@ config BR2_PACKAGE_UTIL_LINUX_AGETTY
 
 config BR2_PACKAGE_UTIL_LINUX_BFS
 	bool "bfs"
+	depends on BR2_USE_MMU # fork()
 	help
 	  SCO bfs filesystem support
 
 config BR2_PACKAGE_UTIL_LINUX_CAL
 	bool "cal"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Display a calendar, or some part of it
 
@@ -100,11 +102,13 @@ comment "chfn/chsh needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4
 
 config BR2_PACKAGE_UTIL_LINUX_CHMEM
 	bool "chmem"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Sets a particular size or range of memory online or offline
 
 config BR2_PACKAGE_UTIL_LINUX_CRAMFS
 	bool "cramfs utilities"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
 	help
 	  Utilities for compressed ROM file system (fsck.cramfs,
@@ -121,11 +125,13 @@ config BR2_PACKAGE_UTIL_LINUX_EJECT
 
 config BR2_PACKAGE_UTIL_LINUX_FALLOCATE
 	bool "fallocate"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Preallocate space to a file
 
 config BR2_PACKAGE_UTIL_LINUX_FDFORMAT
 	bool "fdformat"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Low-level format a floppy disk
 
@@ -140,26 +146,31 @@ config BR2_PACKAGE_UTIL_LINUX_FSCK
 
 config BR2_PACKAGE_UTIL_LINUX_HARDLINK
 	bool "hardlink"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Consolidate duplicate files via hardlinks
 
 config BR2_PACKAGE_UTIL_LINUX_HWCLOCK
 	bool "hwclock"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Query or set the hardware clock (RTC)
 
 config BR2_PACKAGE_UTIL_LINUX_IPCMK
 	bool "ipcmk"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Make various IPC resources
 
 config BR2_PACKAGE_UTIL_LINUX_IPCRM
 	bool "ipcrm"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Remove certain IPC resources
 
 config BR2_PACKAGE_UTIL_LINUX_IPCS
 	bool "ipcs"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Show information on IPC facilities
 
@@ -173,11 +184,13 @@ config BR2_PACKAGE_UTIL_LINUX_IRQTOP
 
 config BR2_PACKAGE_UTIL_LINUX_KILL
 	bool "kill"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Send a signal to a process
 
 config BR2_PACKAGE_UTIL_LINUX_LAST
 	bool "last"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Show a listing of last logged in users
 
@@ -188,6 +201,7 @@ config BR2_PACKAGE_UTIL_LINUX_LINE
 
 config BR2_PACKAGE_UTIL_LINUX_LOGGER
 	bool "logger"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Enter messages into the system log
 
@@ -246,6 +260,7 @@ config BR2_PACKAGE_UTIL_LINUX_LSMEM
 
 config BR2_PACKAGE_UTIL_LINUX_MESG
 	bool "mesg"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Control write access to your terminal
 
@@ -288,6 +303,7 @@ config BR2_PACKAGE_UTIL_LINUX_NEWGRP
 
 config BR2_PACKAGE_UTIL_LINUX_NOLOGIN
 	bool "nologin"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Politely refuse a login
 
@@ -333,6 +349,7 @@ comment "raw needs a toolchain w/ headers < 5.14"
 
 config BR2_PACKAGE_UTIL_LINUX_RENAME
 	bool "rename"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Rename files
 
@@ -366,21 +383,25 @@ comment "runuser needs a uClibc or glibc toolchain w/ wchar, locale, dynamic lib
 
 config BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS
 	bool "scheduling utilities"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	help
 	  Scheduling utilities (chrt, ionice, taskset, uclampset)
 
 comment "scheduling utilities need a toolchain w/ headers >= 3.14"
+	depends on BR2_USE_MMU # fork()
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 
 config BR2_PACKAGE_UTIL_LINUX_SETPRIV
 	bool "setpriv"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBCAP_NG
 	help
 	  Run a program with different Linux privilege settings
 
 config BR2_PACKAGE_UTIL_LINUX_SETTERM
 	bool "setterm"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Set terminal attributes
@@ -417,6 +438,7 @@ config BR2_PACKAGE_UTIL_LINUX_SWITCH_ROOT
 
 config BR2_PACKAGE_UTIL_LINUX_TUNELP
 	bool "tunelp"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  Set various parameters for the lp device
@@ -435,6 +457,7 @@ config BR2_PACKAGE_UTIL_LINUX_UNSHARE
 
 config BR2_PACKAGE_UTIL_LINUX_UTMPDUMP
 	bool "utmpdump"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Dump UTMP and WTMP files in raw format
 
@@ -489,6 +512,7 @@ config BR2_PACKAGE_UTIL_LINUX_WDCTL
 
 config BR2_PACKAGE_UTIL_LINUX_WRITE
 	bool "write"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Send a message to another user
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
