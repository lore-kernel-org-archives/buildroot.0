Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 733C2CAC5A8
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46EA66107A;
	Fri, 19 Sep 2025 12:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rrwp5xkyoXW; Fri, 19 Sep 2025 12:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4602061099
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4602061099;
	Fri, 19 Sep 2025 12:54:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F4DEE7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 211D1409F7
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ua6h9uktypPj for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E67140C47
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E67140C47
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CEA985FD9; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:40:39 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 49fd9c44bfeb5fe82a7270b5c2a2c704b6b9d185
X-Git-Newrev: 6890826a10280e8fb4fb16bf03ec8fd0784d5a13
X-Patchwork-Hint: ignore
Message-Id: <20250919125411.6CEA985FD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/wilc-driver: fix
 build failure with Linux 6.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=6890826a10280e8fb4fb16bf03ec8fd0784d5a13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Add a local patch pending upstream to fix build failure with Linux 6.16

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit df7d287c81c6131b88fb091ad1e7b663bd80c0be)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0014-Fix-build-for-kernel-6.16.patch           | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch b/package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch
new file mode 100644
index 0000000000..bf4a8106af
--- /dev/null
+++ b/package/wilc-driver/0014-Fix-build-for-kernel-6.16.patch
@@ -0,0 +1,34 @@
+From 8ee37436cfa1bdac354ff63e17b647e7b5fb20f9 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 8 Sep 2025 21:14:22 +0200
+Subject: [PATCH] Fix build for kernel 6.16
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41cb08555c4164996d67c78b3bf1c658075b75f1
+from_timer() has been renamed to timer_container_of() so let's rename
+according to linux version >= 6.16.
+
+Upstream: https://github.com/embeddedTS/wilc3000-external-module/pull/10
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ netdev.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/netdev.h b/netdev.h
+index 607a3b5..33708ad 100644
+--- a/netdev.h
++++ b/netdev.h
+@@ -15,6 +15,10 @@
+ #include <linux/gpio/consumer.h>
+ #include <linux/version.h>
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 16, 0))
++#define from_timer	timer_container_of
++#endif
++
+ #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0))
+ static inline int del_timer_sync(struct timer_list *timer)
+ {
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
