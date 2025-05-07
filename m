Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4879C3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 20:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 469D183D4D;
	Wed,  7 May 2025 20:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hoYo-AyVprd4; Wed,  7 May 2025 20:14:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5089E83D50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5089E83D50;
	Wed,  7 May 2025 20:14:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22615439
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 085CE40DC2
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4pd41WaX0Fm for <buildroot@buildroot.org>;
 Wed,  7 May 2025 20:14:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F05DA40DE6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F05DA40DE6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F05DA40DE6
 for <buildroot@buildroot.org>; Wed,  7 May 2025 20:14:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 098D21FCE7;
 Wed,  7 May 2025 20:14:37 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  7 May 2025 22:14:32 +0200
Message-ID: <20250507201433.1506091-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvfeeivdfhveeitefgtefhgfeihfejveefffdthfdtvdffueeileduheefgeeugfenucfkphepvdgrtddumegtsgduleemledvtdgsmeegjedttdemrgdvfheimegukegukeemhegtvggtmegshegvgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeelvddtsgemgeejtddtmegrvdhfieemugekugekmeehtggvtgemsgehvgegpdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1746648878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=th4M4ilHLykCpMVRRMTS2cFZppxdoFYdE07zEMTcquY=;
 b=U9rC5/QmWRlFZlPbIdE6DYVFYqY1jCF44Umsbn28mbZTmvfw6pgfRCy9K+Q6A1PVjzitPh
 FDxDV11pixw5Gb5RUNGiAoYBCHHd3SiuHjf6jByGB5SF4/rFZnRWqFTktIXGn+dIOrLnh/
 m2cvLKpvcwH4xouFVlF88ILHielkd2wwpvpSHBd8wDiA3mht74GJixnUlWNTFEPz4MwjMz
 CtNEcZfWNEu08ZtOZfpv87Uxk2EwzXimPGkzt0pI69FCSEQNUVkNtXQESochCiPIAHc35N
 UQ49hT+9muf0PwrnVyXoxOaB1QF1uC0e6DGibPFey5OLAQaqFPn5o1qfQQVVXQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=U9rC5/Qm
Subject: [Buildroot] [PATCH] package/gdb: add patches for GCC 15.x
 compatibility
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit backports an upstream patch fixing the bundled readline
library so that it builds with GCC 15.x.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Note: this patch assumes that the 16.x series has been bumped to 16.2
and the 15.x series bumped to 15.2.
---
 ...ne-tcap.h-Update-definitions-for-C23.patch | 52 +++++++++++++++++++
 ...ne-tcap.h-Update-definitions-for-C23.patch | 52 +++++++++++++++++++
 ...ne-tcap.h-Update-definitions-for-C23.patch | 52 +++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
 create mode 100644 package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
 create mode 100644 package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch

diff --git a/package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
new file mode 100644
index 0000000000..50100d8bfc
--- /dev/null
+++ b/package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
@@ -0,0 +1,52 @@
+From 0f81e47dff4bddc6ba9c45402821f857251f2b0f Mon Sep 17 00:00:00 2001
+From: Chris Packham <judge.packham@gmail.com>
+Date: Wed, 30 Apr 2025 16:49:44 +1200
+Subject: [PATCH] readline/tcap.h: Update definitions for C23
+
+C23 changes how function definitions like int `int tputs ()` are
+interpreted. In older standards this meant that the function arguments
+are unknown. In C23 this is interpreted as `int tputs (void)` so now
+when we compile with GCC15 (which defaults to -std=gnu23) we get an
+error such as
+
+  readline/display.c:2839:17: error: too many arguments to function 'tputs'; expected 0, have 3
+
+Add the function arguments for tgetent(), tgetflag(), tgetnum(),
+tgetstr(), tputs() and tgoto().
+
+Signed-off-by: Chris Packham <judge.packham@gmail.com>
+Approved-By: Tom Tromey <tom@tromey.com>
+Upstream: 5c87b330e910f8be1443c881fd16a70e685f1f2f
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ readline/readline/tcap.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
+index 859e6eed5aa..9e2ed124e49 100644
+--- a/readline/readline/tcap.h
++++ b/readline/readline/tcap.h
+@@ -46,14 +46,14 @@ extern char *UP, *BC;
+ 
+ extern short ospeed;
+ 
+-extern int tgetent ();
+-extern int tgetflag ();
+-extern int tgetnum ();
+-extern char *tgetstr ();
++extern int tgetent (char *bp, const char *name);
++extern int tgetflag (char *id);
++extern int tgetnum (char *id);
++extern char *tgetstr (char *id, char **area);
+ 
+-extern int tputs ();
++extern int tputs (const char *str, int affcnt, int (*putc)(int));
+ 
+-extern char *tgoto ();
++extern char *tgoto (const char *cap, int col, int row);
+ 
+ #endif /* HAVE_TERMCAP_H */
+ 
+-- 
+2.49.0
+
diff --git a/package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
new file mode 100644
index 0000000000..64f741fe75
--- /dev/null
+++ b/package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
@@ -0,0 +1,52 @@
+From 130750cf9607fc1c4bcbead820a27bee6ee60f04 Mon Sep 17 00:00:00 2001
+From: Chris Packham <judge.packham@gmail.com>
+Date: Wed, 30 Apr 2025 16:49:44 +1200
+Subject: [PATCH] readline/tcap.h: Update definitions for C23
+
+C23 changes how function definitions like int `int tputs ()` are
+interpreted. In older standards this meant that the function arguments
+are unknown. In C23 this is interpreted as `int tputs (void)` so now
+when we compile with GCC15 (which defaults to -std=gnu23) we get an
+error such as
+
+  readline/display.c:2839:17: error: too many arguments to function 'tputs'; expected 0, have 3
+
+Add the function arguments for tgetent(), tgetflag(), tgetnum(),
+tgetstr(), tputs() and tgoto().
+
+Signed-off-by: Chris Packham <judge.packham@gmail.com>
+Approved-By: Tom Tromey <tom@tromey.com>
+Upstream: 5c87b330e910f8be1443c881fd16a70e685f1f2f
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ readline/readline/tcap.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
+index 859e6eed5aa..9e2ed124e49 100644
+--- a/readline/readline/tcap.h
++++ b/readline/readline/tcap.h
+@@ -46,14 +46,14 @@ extern char *UP, *BC;
+ 
+ extern short ospeed;
+ 
+-extern int tgetent ();
+-extern int tgetflag ();
+-extern int tgetnum ();
+-extern char *tgetstr ();
++extern int tgetent (char *bp, const char *name);
++extern int tgetflag (char *id);
++extern int tgetnum (char *id);
++extern char *tgetstr (char *id, char **area);
+ 
+-extern int tputs ();
++extern int tputs (const char *str, int affcnt, int (*putc)(int));
+ 
+-extern char *tgoto ();
++extern char *tgoto (const char *cap, int col, int row);
+ 
+ #endif /* HAVE_TERMCAP_H */
+ 
+-- 
+2.49.0
+
diff --git a/package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch
new file mode 100644
index 0000000000..c9a34e9a89
--- /dev/null
+++ b/package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch
@@ -0,0 +1,52 @@
+From f37d1bbe334c751b9bd77fa3a9d9accd93614677 Mon Sep 17 00:00:00 2001
+From: Chris Packham <judge.packham@gmail.com>
+Date: Wed, 30 Apr 2025 16:49:44 +1200
+Subject: [PATCH] readline/tcap.h: Update definitions for C23
+
+C23 changes how function definitions like int `int tputs ()` are
+interpreted. In older standards this meant that the function arguments
+are unknown. In C23 this is interpreted as `int tputs (void)` so now
+when we compile with GCC15 (which defaults to -std=gnu23) we get an
+error such as
+
+  readline/display.c:2839:17: error: too many arguments to function 'tputs'; expected 0, have 3
+
+Add the function arguments for tgetent(), tgetflag(), tgetnum(),
+tgetstr(), tputs() and tgoto().
+
+Signed-off-by: Chris Packham <judge.packham@gmail.com>
+Approved-By: Tom Tromey <tom@tromey.com>
+Upstream: 5c87b330e910f8be1443c881fd16a70e685f1f2f
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ readline/readline/tcap.h | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
+index 859e6eed5aa..9e2ed124e49 100644
+--- a/readline/readline/tcap.h
++++ b/readline/readline/tcap.h
+@@ -46,14 +46,14 @@ extern char *UP, *BC;
+ 
+ extern short ospeed;
+ 
+-extern int tgetent ();
+-extern int tgetflag ();
+-extern int tgetnum ();
+-extern char *tgetstr ();
++extern int tgetent (char *bp, const char *name);
++extern int tgetflag (char *id);
++extern int tgetnum (char *id);
++extern char *tgetstr (char *id, char **area);
+ 
+-extern int tputs ();
++extern int tputs (const char *str, int affcnt, int (*putc)(int));
+ 
+-extern char *tgoto ();
++extern char *tgoto (const char *cap, int col, int row);
+ 
+ #endif /* HAVE_TERMCAP_H */
+ 
+-- 
+2.49.0
+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
