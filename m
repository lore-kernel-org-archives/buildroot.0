Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E11BC4829A
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6C3A41AE9;
	Mon,  5 Feb 2024 22:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6C3A41AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M3ecPYaSmKFO; Mon,  5 Feb 2024 22:17:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C1F741A84;
	Mon,  5 Feb 2024 22:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C1F741A84
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E0E41BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1498A60F0A
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1498A60F0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hm3s1SrxV0MD for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:17:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5815960D9D
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5815960D9D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4539986E4B; Mon,  5 Feb 2024 22:17:45 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 23:12:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7371cb294df4792147fcf1da51139aafb759784a
X-Git-Newrev: 3aecae1802f28d1662e29b31167f7959bfe6a7ce
X-Patchwork-Hint: ignore
Message-Id: <20240205221745.4539986E4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/watchdogd: add menuconfig support
 for new system monitors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3aecae1802f28d1662e29b31167f7959bfe6a7ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/watchdogd/Config.in    | 10 ++++++++++
 package/watchdogd/watchdogd.mk | 15 ++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/package/watchdogd/Config.in b/package/watchdogd/Config.in
index 0b0480ea27..0aeaad165f 100644
--- a/package/watchdogd/Config.in
+++ b/package/watchdogd/Config.in
@@ -51,4 +51,14 @@ config BR2_PACKAGE_WATCHDOGD_MEMINFO
 	help
 	  Enable memory leak monitor.
 
+config BR2_PACKAGE_WATCHDOGD_FSMON
+	bool "File system monitor"
+	help
+	  Enable file system monitor.
+
+config BR2_PACKAGE_WATCHDOGD_TEMPMON
+	bool "Temperature monitor"
+	help
+	  Enable temperature monitor.
+
 endif
diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
index 56816de94f..189efc81d4 100644
--- a/package/watchdogd/watchdogd.mk
+++ b/package/watchdogd/watchdogd.mk
@@ -16,9 +16,7 @@ WATCHDOGD_SELINUX_MODULES = watchdog
 WATCHDOGD_CONF_OPTS = \
 	--disable-compat \
 	--disable-examples \
-	--disable-test-mode \
-	--without-fsmon \
-	--without-tempmon
+	--disable-test-mode
 
 ifneq ($(BR2_PACKAGE_WATCHDOGD_TEST_SUITE),y)
 WATCHDOGD_CONF_OPTS += --disable-builtin-tests
@@ -49,6 +47,17 @@ WATCHDOGD_CONF_OPTS += --without-meminfo
 else
 WATCHDOGD_CONF_OPTS += --with-meminfo
 endif
+
+ifneq ($(BR2_PACKAGE_WATCHDOGD_FSMON),y)
+WATCHDOGD_CONF_OPTS += --without-fsmon
+else
+WATCHDOGD_CONF_OPTS += --with-fsmon
+endif
+
+ifneq ($(BR2_PACKAGE_WATCHDOGD_TEMPMON),y)
+WATCHDOGD_CONF_OPTS += --without-tempmon
+else
+WATCHDOGD_CONF_OPTS += --with-tempmon
 endif
 
 define WATCHDOGD_INSTALL_INIT_SYSV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
