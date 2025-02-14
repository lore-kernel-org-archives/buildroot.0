Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B0EC02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 19:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3093384B86;
	Fri, 14 Feb 2025 19:25:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0c1EGCk-pQF; Fri, 14 Feb 2025 19:25:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 240AA84B88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 240AA84B88;
	Fri, 14 Feb 2025 19:25:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BBFA1F1
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 19:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5DDAB416B6
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 19:25:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jx7zHXumRlGN for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 19:25:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=82.165.159.41;
 helo=mout-xforward.gmx.net; envelope-from=fiona.klute@gmx.de;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6A4C7416B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A4C7416B5
Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6A4C7416B5
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 19:25:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.116.208]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26r3-1tgXPe3CWn-00Frts; Fri, 14
 Feb 2025 20:25:39 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
	Joachim Wiberg <troglobit@gmail.com>
Date: Fri, 14 Feb 2025 20:25:31 +0100
Message-ID: <20250214192532.1772100-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:bzUS50pRfJCTCqSUGXuaOABZl688Vs4PePWaNCb3uzxGbE53oit
 Hevr4saapUokdHQYh4jL8YTAhLmoRjVFWhO7KLxmuNntgjrZmmJ+ZwLic2ewhU0xG1mGg2B
 EfVA+eP2DxXPX0jFEVdb+xqOPp43yYxUwKM4XqqGYciK5UDFog5Pkfg2Q8TRogGQ7pazwpz
 VHOJe+3Rg+xtiPS9JQxNw==
UI-OutboundReport: junk:10;M01:P0:GSpEjx75FW8=;iXwpg3eg+Q4KSlcQS25wPytjYuIub
 zgq/7273sInQMLh1+HtVkhyglFMREIUW3gphcqBIkk37V3jP+mZL7GZfyjKWMdASAHL2Wstjk
 7MY9lftABtSAxF7E0frZZMBS6QNXAS50+RGMPhpQygrGoRXD8gspsvTidynJRXQ6v8wKcPUcS
 xBFn500KUap7SWzhudga/9NCo3xmpf7sVEcEMOkicKwLT5eKQ4ojbhWbG3sldyJkswghiVfMP
 GvxGTQwmLBa72MjfXxMH4lCCTKQWasqRdKqb+bhIrPx7Gli6TvKi+C/U4wiqYxi9DZMT/vM9S
 Ge610q92/3WjF4bxvYsqyNdajAlMSSz4iYdMCkWLwPJxhnqP7HLxFibwkdVH69L8hbOzHGoAv
 y90kX/EOvO4xDBpBFsv228bYSOukZbtZuI6zhV1JRQc3T+5SAkBONKhemj0Y4P28vBFWIgpOD
 UOolgitsMOiB1voxl9RCjUN9gK9+yRLzKgAW8GL+VuXBks7MJsWdO/KpU9YDNJnqOJFaJDlHE
 guLIZmG6goshtZMUFDNo+5+wYEJWx235CSzm93JrAzLfnkXjn3RCI1ZB6fxiksKDT3y2D7Fh5
 WULmKkDm9jJnRcgeOSx6Meadxeo76x3/EVNOPFIaG4xElytWI0WHSnUDJS9xrKttLzLgQIO0I
 fQLGetVbUOv1PIgYdLo/7LNxn5U+RpkAGUyclI0pUX/MDD2uQoD+7mmzCpN7GsBVgywI96mh0
 T6bYF3r19pEY17oPMQX/MsGOJ7tPGLp3O4Yh5YYrKbmeQQDWcYGE7C+nobxshexw3+otf5lVn
 eSk5Ta7OgBrcBhHoJxPM/p0Rxw2dnafHpayOuRZv/PCSDUTdi1Jjtt/Kh/OAvcyfZQ9lcRIU1
 oTKS9CZ4FOXSy+YHKn16MvS0HT6Odhti2GjYXU3qrRMPDVJz/zcZcFrb4YYu4fuHG7QP5S3Wt
 AtEK95XZCNldcU5989syueMfRxyYelwKoX3HrC1MEHl72Ydi2IvBDK3XJxlA/NBvRvyMYJDG1
 A6WKHD7u5G2LQ6jXDO9cguXtHUQYz1ZSugPguZy1xNiycQ1aJOighQSBUFAg0zRWm0zMEckXB
 8Hd015ficNBKEy5+BXjdlkTAP8uDHxWGTlZbtvGWCpHdP6EXcviW/s5IZAOMxSxCCzdsuVFlu
 fiUw7yk8cWc0BKnW5EG2M33+Wuy1c7TgM237+jYDoaRfU92PqY6bcV1T6bxYFp5UH5mX39G5h
 Zmrgi3XnY7gVDOmmnEQuIay9WSh+WmG/BARLyKNI07riK19gtDMtNd6RI9naF2Aj+krIAXlf3
 iuaqt+yuPhrMszrgXXnRzaYaVe1FmdEK9ABJa/aWTEgkSTM88JB7je5LPWGJdw2F784yfzElT
 cQiLlnQ/Jp/k+j9zd2Brs0JZH9tQIRUkMDUQk3834105DA+CPm+LJvoZ3QImSNSJXeiy2Ku4K
 XcZyndne/xP1iqbG3ILPVcLTCat1nbriysBOzJX3RXUtWUKKoh4gaP8rjv+DwGkUU38Jg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739561140; x=1740165940; i=fiona.klute@gmx.de;
 bh=StXqhmqKXY9hwAAKUAfi/9zpAQvPDaA5vRMvdkceJdI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=G3V0hT004mOfTSeO/+P5rWrdzubt8J434kIA1xp9L8fbsdS0Ty3UAkGOZxo1N9Tt
 2qqh2YhdCwvW/c6me0micssiYQhsqgUGDQVNG7o1NI7zpgWsIHbpI7CEnxW3iNnnG
 pivAOkNnKK7AnqLjyqZDcPgJwK54FbuQdNeEsZoKRZmn69s5nvalKdU3EOYpf1ZdF
 MIt1tQjxpBSHqtkOlSgkzviZbXZINnPCtLpHCCuP/o31dwbyAa7HAlHZ9b8IbsXlI
 2EY3IfZmtRAyU6uFDTpH7l15FkJZgfF69yZOy32Yg8f1RyI5p4WjfSO0fJy+RtOSc
 wvRL0FtJFE4ZN9vROA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=G3V0hT00
Subject: [Buildroot] [PATCH 1/2] package/watchdogd: fix use of uninitialized
 exit status
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
 ...Fix-use-of-uninitialized-exit-status.patch | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch

diff --git a/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch b/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch
new file mode 100644
index 0000000000..6db65b5786
--- /dev/null
+++ b/package/watchdogd/0001-Fix-use-of-uninitialized-exit-status.patch
@@ -0,0 +1,58 @@
+From 3baf18e551e1a0399a06d2212568889605a4e7cc Mon Sep 17 00:00:00 2001
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
+ src/script.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/script.c b/src/script.c
+index 1220fb9..fcfaa53 100644
+--- a/src/script.c
++++ b/src/script.c
+@@ -64,6 +64,7 @@ static void add(pid_t pid, void (*cb)(void *), void *arg)
+ 	}
+ 
+ 	info->pid = pid;
++	info->exit_status = -1;
+ 	info->cb  = cb;
+ 	info->arg = arg;
+ 	LIST_INSERT_HEAD(&exec_info_head, info, entry);
+@@ -97,8 +98,10 @@ int script_exit_status(pid_t pid)
+ 			continue;
+ 
+ 		status = info->exit_status;
+-		LIST_REMOVE(info, entry);
+-		free(info);
++		if (status >= 0) {
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
