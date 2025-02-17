Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C46C021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 13:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF187406F9;
	Mon, 17 Feb 2025 13:44:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMXguEfzghB6; Mon, 17 Feb 2025 13:44:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96CA34070F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96CA34070F;
	Mon, 17 Feb 2025 13:44:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B172C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 13:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D32A40428
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 13:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elgU5L5mOj1h for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 13:44:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=82.165.159.41;
 helo=mout-xforward.gmx.net; envelope-from=fiona.klute@gmx.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 71FCE400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71FCE400D6
Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 71FCE400D6
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 13:44:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.144]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mxm3K-1tQx6A0X5a-013YeX; Mon, 17
 Feb 2025 14:44:20 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Joachim Wiberg <troglobit@gmail.com>
Date: Mon, 17 Feb 2025 14:44:13 +0100
Message-ID: <20250217134414.276793-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:1jaGjne/o0mK82jk1Nhk2sBtt2SjrSyq89eO48OBEfUeYI5baSG
 fhPdBrl6+s8YLwDsMEcxT8LH6wADNBMd/r/a8/6A0QZpc+G+HDV6+o5dFXHj8KjiXfzmlsI
 Nk4kcURdkXXyVezHplliZiErRiVM3pzZ/5fRcCqnv5sYMa0HPy7CcDylqmqLqIEyQ4Fgh2c
 nKtpTtFkiCgfUnELvokOw==
UI-OutboundReport: junk:10;M01:P0:SjUwddB1vGo=;xdlTuMO0n5qhsQnkUzBIHyT4txfoJ
 lwjRbjgOr12z0TuslZYIDsJm4/PcYkj17dLNiPE6Ac1r9C6yct3oJecZJ2Ot+aEKUP449dGy3
 /09YIAdRSABmY31pTOWSIuqyEOtAb+5suFo3gjx4/nAOQkbpnYm3WnuK50zbXxd+ZQeVx+M+a
 EydRIw/ZikaAcxN7XfI8NPiU9wFG1uPJylr2uLEmZguoK272MFEjOrEJnYy3BCmxFlrKm6yiJ
 4+PVR+wt8N98pkFGXhK54KNDiiTZ8kguiL09hjEvTvD1jhd0BUIdK7c8LEWcheAB/xsdSdPSB
 6s7jLX4H+58akp/Mgr8pznG93Fe33CT2lSu+nfe9CJhfEyYLMX0o/oquSu0p0elqOsL/ldT2y
 5GC1SxIvnKJLwMDZo0WVGxzKicIiotQF5LIaIDkcOVPBYPORp+bc8D7MdF+4FESTOK+JavnFd
 /yoYWBEpSyHOrklDzD4Q3R22YbbvWUD74oA/c2VqIwe8i2841c/T1vvYQxRMRee/eVteBnNGZ
 AiTEinc+WBxMgBiFtyTvoIqOCMiH2zsq8o8qCfHpru2C4AoLqlE3NOKqMnK9Jp1OlDPdwnGi1
 myDD9WNwp8KT6hIkvV9is54rs3tTSDpL+1QYpgZ/NM+d+J7PCEXlhnN8/1PtsdY3/Mhaln6fk
 csMTF1kK+O7m3JMR0MLlqDgdYem6RHCoxUgZhPPPlQFIlhu2GjoBZ9V1YVIRY6YMkwv4fvMIN
 5BlmeNFC91Es1PxadwlIC4PsbunykhfwXt5tJqmYAVjOXtGvte0cBETLnDqNIu3F0Te9ol6Jn
 IEL6FUL1WZSd0WYY3KqfRh0ukvc5A5jmY2Sz5XwV9UEF0iPqWRwMN6vC6K8+uSSimQK9OTJMu
 KUC6SEQbgE+fMTJU191zJIOtuckxspf52kRG5+91MkUhCP6X5TipcsXJz93gVXlsfM+EZfYiR
 tl6+eViwIVOEzNl3QDwHgI0V7QjefcLCNRWZeUtuWbq8vR+K60hRkn74wxOccMP+nR5AH3OEu
 3MxMSLpgAHrFvBMwHqEo945M0jjpoERLmx9adrd/2yveMd5npI797bB6Rmthl2NjatTNo/cqo
 t8WRlmIMcFTiReYrxmuTFd/XYX1jpm4gSl8WQqRuH1xouN71ZeQsmVeQcG0wrf58taTs9WLWP
 fZE3paCnYKzxNx3gFBFeW3RTeFbT9fx1qqiYSaHKCPygbDuvXQzW0xkJoJyri8Zq6zdFCsyhK
 qiZHb9/e1/Q8+o0v9PGgGpkdYHzy30R5sUBiWISMSapH3hiHWbL4GpqdZKaEOrZMiqX65uDNw
 pvFueljZx0oUQejsMeyi54lYnE6BB1QAI+bwR7Q4mYnSgEEvTDmP/1SqLf4ZOx8QCkX0jQU/X
 Iuv595oyeNa7x6T0Yw4ER97NnieHOVwJ0UhzEHZs0MPh17W22CrZy2a4Y990d6aw2JrwVJ8/U
 ex9d0Q2NOj0SSyL2ABCKfLqgzo/XEt6KKbPUpHn+mYKQlB1oz8CaA0M5hxdjrS3RN6bMQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739799860; x=1740404660; i=fiona.klute@gmx.de;
 bh=fEtCHKGAaAY0tp5Xb1fkScfe47xlTYZ4FKD0tI7hGLA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ufzOUMAu4g7u0Fy8HA5UKvODiRUCmCYj9cv+nit235sK2kJWNGdJAKrRdODXAAgr
 9INiSaeWJ7TjHFSFKeEDNTqFHVc5O+f+qG6GGQ71Xe0Jrd4We9S2j1CCF0tIeZIEE
 9CY2P49KgIX2Gk51F0kHU4Jyjb9dmpaaHIKHBb2CIMLu2mg8ug4vQyAZVwAM7GN6l
 XEBuP1KS0ElT+jvENclH3xt6E0oIzTb70L2dckSk+7lqwmrjUFZcY7GJ/IXTv2lIM
 knRNcI0LIjiw4/wuARh/1S9AqMifk1NdLL9qQ/bedtB/WVYfN+SsTbOHoxMev65Sj
 KezoKax8262HCjvEZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ufzOUMAu
Subject: [Buildroot] [PATCH v2 1/2] package/watchdogd: fix use of
 uninitialized exit status
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The bug could lead to incorrect "critical error" reports if that
uninitialized memory happened to contain a value that interpreted as
an int was above the critical threshold. It affected primarily scripts
running approximately one second or longer, because access happens by
timer.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changed v1 -> v2: Update patch to the version merged upstream, with a
separate field to track if the process has exited.

 ...Fix-use-of-uninitialized-exit-status.patch | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch

diff --git a/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch b/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch
new file mode 100644
index 0000000000..69e7b36ef4
--- /dev/null
+++ b/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch
@@ -0,0 +1,85 @@
+From f6d56c374723923e276ccfd442fdd0cabf23d095 Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Fri, 14 Feb 2025 19:26:24 +0100
+Subject: [PATCH] Fix use of uninitialized exit status
+
+Depending on the timing between the SIGCHLD callback run and the first
+generic_cb() timer callback run, script_exit_status() sometimes
+returned uninitialized memory as the exit status of a script. This
+could lead to incorrect "critical error" reports if that uninitialized
+memory happened to contain a value that interpreted as an int was
+above the critical threshold.
+
+Additionally, script_exit_status() unconditionally removed the process
+information from the queue, meaning that if a process had not
+completed by the time its status was first probed, its status could
+never be updated or successfully probed again, leading to timeout. Fix
+this by removing the process only if the status indicates it has
+terminated (successful or not).
+
+The problems affected primarily scripts running approximately one
+second or longer, because very short running scripts will very likely
+have their exit status collected by the SIGCHLD callback before the
+first timer callback run.
+
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://github.com/troglobit/watchdogd/pull/52
+---
+ src/script.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/src/script.c b/src/script.c
+index 1220fb9..f6e0763 100644
+--- a/src/script.c
++++ b/src/script.c
+@@ -16,6 +16,7 @@
+  */
+ 
+ #include <errno.h>
++#include <stdbool.h>		/* bool type (before C23) */
+ #include <stdlib.h>		/* setenv() */
+ #include <sys/wait.h>		/* waitpid() */
+ #include <unistd.h>		/* execv(), _exit() */
+@@ -28,6 +29,7 @@
+ struct exec_info {
+ 	pid_t   pid;
+ 	int     exit_status;
++	bool    exited;
+ 	void  (*cb)(void *arg);
+ 	void   *arg;
+ 	LIST_ENTRY(exec_info) entry;
+@@ -64,6 +66,8 @@ static void add(pid_t pid, void (*cb)(void *), void *arg)
+ 	}
+ 
+ 	info->pid = pid;
++	info->exit_status = 0;
++	info->exited = false;
+ 	info->cb  = cb;
+ 	info->arg = arg;
+ 	LIST_INSERT_HEAD(&exec_info_head, info, entry);
+@@ -78,6 +82,7 @@ static int exec(pid_t pid, int status)
+ 			continue;
+ 
+ 		info->exit_status = status;
++		info->exited = true;
+ 		if (info->cb)
+ 			info->cb(info->arg);
+ 
+@@ -96,9 +101,11 @@ int script_exit_status(pid_t pid)
+ 		if (info->pid != pid)
+ 			continue;
+ 
+-		status = info->exit_status;
+-		LIST_REMOVE(info, entry);
+-		free(info);
++		if (info->exited) {
++			status = info->exit_status;
++			LIST_REMOVE(info, entry);
++			free(info);
++		}
+ 		break;
+ 	}
+ 
+-- 
+2.47.2
+
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
