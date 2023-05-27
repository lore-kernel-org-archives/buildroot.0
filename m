Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5203C77B73
	for <buildroot@archiver.kernel.org>; Sat, 27 May 2023 16:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E454240216;
	Sat, 27 May 2023 16:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E454240216
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KD3sSPCN7brw; Sat, 27 May 2023 16:33:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75EE94264E;
	Sat, 27 May 2023 16:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75EE94264E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8C201BF314
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 16:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9E6A61348
 for <buildroot@lists.busybox.net>; Sat, 27 May 2023 16:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9E6A61348
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p8Cj0WJAyiES for <buildroot@lists.busybox.net>;
 Sat, 27 May 2023 16:33:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B7F3611C3
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B7F3611C3
 for <buildroot@buildroot.org>; Sat, 27 May 2023 16:33:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f623adec61so18772875e9.0
 for <buildroot@buildroot.org>; Sat, 27 May 2023 09:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685205185; x=1687797185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EqxbYoIcTHr5h7L7aBTzfQxfgW3GuuOd7t2d8RvIBhU=;
 b=cs9PCOTveHaAV73F7CvpqU6MqNwKLUJGzUgtUb41LFXcJR+dAv7GXwvu2aHgf4ksQY
 HxPbItUw5TR9zXood5xhUHXBGBOwml+6a/r3eG5d0xFSEnfL2jhDQFjy5ciKcIxMJMEf
 QDxc640mXYw1SODJmW4vVhYQSDhENkchW14wCFh6YrEokukVv/YxLNnYQrdl3HrAClFE
 IIwJcItY7ffhWZqfLhdO77Ipz/CdkK1MpXcZaBeWXaZCDDvn0TzzMH4fg38VAmYVMPZH
 E9bslQcE1VEp8kQbilUR609oMsUbSl78JZN1KZnH/R+vErKtUETyTB5zCiFm9qDfQijq
 hOwQ==
X-Gm-Message-State: AC+VfDyyp097cj9czwQJwe9/QwAEKBVB/idiyELmrpIGC/vUslQRGDlY
 0vvOvVBSm2A01iBkCck0zENvSOAwg/M=
X-Google-Smtp-Source: ACHHUZ4WHNd9eENgcML0BpllI0iiy8QlfVjHQ2gABnJU/6D5TqyvKldHOLoCSv1dZlGCCHiFAx1wKA==
X-Received: by 2002:a7b:cc93:0:b0:3f6:9634:c8d6 with SMTP id
 p19-20020a7bcc93000000b003f69634c8d6mr4398907wma.18.1685205185275; 
 Sat, 27 May 2023 09:33:05 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a1c4c11000000b003f4ecf1fcbcsm12562829wmf.22.2023.05.27.09.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 May 2023 09:33:04 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 May 2023 18:33:02 +0200
Message-Id: <20230527163302.2130999-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685205185; x=1687797185;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EqxbYoIcTHr5h7L7aBTzfQxfgW3GuuOd7t2d8RvIBhU=;
 b=WtKTjeX3zmqxs2zwoLjbJpziDS0dVxwL0f5/RJxCq+WhlwBwGKP0HMYazECql4+x46
 bfFjr3pw7Qh5CBsCKoRh7zBUmaD6GhtgQhCJn9UFOWmnlu9imYkGEOSWFwbVkRuD9Vyf
 SPnY5mSG8YIi5IAbpLqhmzZ+wZBYiwzy9GcV9oR9ZXZ06R3jcGCwuT/33VAuxttqyBqJ
 BI+hYJ3m+Q/C2CRbE7koOcP117IDjqHuyBqv//b/OBnbUA3rhHZ9ff/VuOYHOqmr05O9
 3UzXhCA13/GDtSfeXiKmi3zYWZ9edCqt2v88Kalb1W1XGnokMvgqLaXngZmPAvpkRxXQ
 btQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WtKTjeX3
Subject: [Buildroot] [PATCH] package/busybox: fix busybox lineedit signal
 handling
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the Busybox version bump to 1.36.0 the TestS6 fails during the
test teardown.

Backport an upstream patch fixing signal handling (SIGWINCH), see [1].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4322819388

[1] https://bugs.busybox.net/show_bug.cgi?id=15256

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...CH-and-SIGCHLD-in-hush-interrupting-.patch | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch

diff --git a/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch b/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch
new file mode 100644
index 0000000000..e233be07f8
--- /dev/null
+++ b/package/busybox/0008-shell-fix-SIGWINCH-and-SIGCHLD-in-hush-interrupting-.patch
@@ -0,0 +1,104 @@
+From f683598539683266d9b959178e1330a2b66392eb Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Thu, 26 Jan 2023 12:56:33 +0100
+Subject: [PATCH] shell: fix SIGWINCH and SIGCHLD (in hush) interrupting line
+ input, closes 15256
+
+function                                             old     new   delta
+record_pending_signo                                  32      63     +31
+lineedit_read_key                                    231     224      -7
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 1/1 up/down: 31/-7)              Total: 24 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Upstream: https://git.busybox.net/busybox/commit/?id=93e0898c663a533082b5f3c2e7dcce93ec47076d
+[Romain: backport to 1.36.0]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ libbb/lineedit.c | 17 ++++++++++-------
+ shell/ash.c      |  3 ++-
+ shell/hush.c     | 10 ++++++++--
+ 3 files changed, 20 insertions(+), 10 deletions(-)
+
+diff --git a/libbb/lineedit.c b/libbb/lineedit.c
+index d6b2e76ff..b942f540a 100644
+--- a/libbb/lineedit.c
++++ b/libbb/lineedit.c
+@@ -2180,7 +2180,8 @@ static int lineedit_read_key(char *read_key_buffer, int timeout)
+ 		 * "\xff\n",pause,"ls\n" invalid and thus won't lose "ls".
+ 		 *
+ 		 * If LI_INTERRUPTIBLE, return -1 if got EINTR in poll()
+-		 * inside read_key, or if bb_got_signal != 0 (IOW: if signal
++		 * inside read_key and bb_got_signal became != 0,
++		 * or if bb_got_signal != 0 (IOW: if signal
+ 		 * arrived before poll() is reached).
+ 		 *
+ 		 * Note: read_key sets errno to 0 on success.
+@@ -2197,14 +2198,16 @@ static int lineedit_read_key(char *read_key_buffer, int timeout)
+ 			IF_FEATURE_EDITING_WINCH(S.ok_to_redraw = 0;)
+ 			if (errno != EINTR)
+ 				break;
++			/* It was EINTR. Repeat read_key() unless... */
+ 			if (state->flags & LI_INTERRUPTIBLE) {
+-				/* LI_INTERRUPTIBLE bails out on EINTR,
+-				 * but nothing really guarantees that bb_got_signal
+-				 * is nonzero. Follow the least surprise principle:
++				/* LI_INTERRUPTIBLE bails out on EINTR
++				 * if bb_got_signal became nonzero.
++				 * (It may stay zero: for example, our SIGWINCH
++				 * handler does not set it. This is used for signals
++				 * which should not interrupt line editing).
+ 				 */
+-				if (bb_got_signal == 0)
+-					bb_got_signal = 255;
+-				goto ret;
++				if (bb_got_signal != 0)
++					goto ret; /* will return -1 */
+ 			}
+ 		}
+ 
+diff --git a/shell/ash.c b/shell/ash.c
+index 18ccc1329..5f8c8ea19 100644
+--- a/shell/ash.c
++++ b/shell/ash.c
+@@ -10821,7 +10821,8 @@ preadfd(void)
+  again:
+ 		/* For shell, LI_INTERRUPTIBLE is set:
+ 		 * read_line_input will abort on either
+-		 * getting EINTR in poll(), or if it sees bb_got_signal != 0
++		 * getting EINTR in poll() and bb_got_signal became != 0,
++		 * or if it sees bb_got_signal != 0
+ 		 * (IOW: if signal arrives before poll() is reached).
+ 		 * Interactive testcases:
+ 		 * (while kill -INT $$; do sleep 1; done) &
+diff --git a/shell/hush.c b/shell/hush.c
+index d111f0cc5..f064b8fd2 100644
+--- a/shell/hush.c
++++ b/shell/hush.c
+@@ -1946,7 +1946,12 @@ static void record_pending_signo(int sig)
+ {
+ 	sigaddset(&G.pending_set, sig);
+ #if ENABLE_FEATURE_EDITING
+-	bb_got_signal = sig; /* for read_line_input: "we got a signal" */
++	if (sig != SIGCHLD
++	 || (G_traps && G_traps[SIGCHLD] && G_traps[SIGCHLD][0])
++	 /* ^^^ if SIGCHLD, interrupt line reading only if it has a trap */
++	) {
++		bb_got_signal = sig; /* for read_line_input: "we got a signal" */
++	}
+ #endif
+ #if ENABLE_HUSH_FAST
+ 	if (sig == SIGCHLD) {
+@@ -2669,7 +2674,8 @@ static int get_user_input(struct in_str *i)
+ 		} else {
+ 			/* For shell, LI_INTERRUPTIBLE is set:
+ 			 * read_line_input will abort on either
+-			 * getting EINTR in poll(), or if it sees bb_got_signal != 0
++			 * getting EINTR in poll() and bb_got_signal became != 0,
++			 * or if it sees bb_got_signal != 0
+ 			 * (IOW: if signal arrives before poll() is reached).
+ 			 * Interactive testcases:
+ 			 * (while kill -INT $$; do sleep 1; done) &
+-- 
+2.34.3
+
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
