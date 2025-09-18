Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987BDCAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 12:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E95B80ED5;
	Fri, 19 Sep 2025 12:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yqa4I7YjKgHB; Fri, 19 Sep 2025 12:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA3880BB0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DA3880BB0;
	Fri, 19 Sep 2025 12:54:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F6271290
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C44B40A7A
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B2CMoXXsmDFR for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6618040C3C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6618040C3C
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 649F785FD5; Fri, 19 Sep 2025 12:54:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Sep 2025 10:40:30 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 3fde9b525be02ad644b8488de5e1924f2777e871
X-Git-Newrev: 49fd9c44bfeb5fe82a7270b5c2a2c704b6b9d185
X-Patchwork-Hint: ignore
Message-Id: <20250919125411.649F785FD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/rtl8821cu: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=49fd9c44bfeb5fe82a7270b5c2a2c704b6b9d185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Add local patch pending upstream to fix build failure with Linux 6.16

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7c5f7bf89fbe5c9ec7e3702429c80fc5e12b89a9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../rtl8821cu/0001-Fix-build-for-kernel-6.16.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch b/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
new file mode 100644
index 0000000000..311d4fcd4c
--- /dev/null
+++ b/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
@@ -0,0 +1,34 @@
+From 13f85e370c265b782a801cd22f86cea6f6cda876 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Mon, 8 Sep 2025 21:04:30 +0200
+Subject: [PATCH] Fix build for kernel 6.16
+
+With commit:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41cb08555c4164996d67c78b3bf1c658075b75f1
+from_timer() has been renamed to timer_container_of() so let's rename
+according to linux version >= 6.16.
+
+Upstream: https://github.com/morrownr/8821cu-20210916/pull/187
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ include/osdep_service_linux.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/osdep_service_linux.h b/include/osdep_service_linux.h
+index ed1e19b..c25f6a2 100644
+--- a/include/osdep_service_linux.h
++++ b/include/osdep_service_linux.h
+@@ -210,6 +210,10 @@ typedef void	*thread_context;
+ typedef void timer_hdl_return;
+ typedef void *timer_hdl_context;
+ 
++#if (LINUX_VERSION_CODE > KERNEL_VERSION(6, 16, 0))
++#define from_timer     timer_container_of
++#endif
++
+ #if (LINUX_VERSION_CODE > KERNEL_VERSION(2, 5, 41))
+ 	typedef struct work_struct _workitem;
+ #else
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
