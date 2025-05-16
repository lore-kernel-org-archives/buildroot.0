Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC61C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C79419DC;
	Fri, 16 May 2025 10:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QwY2uxlL-jv2; Fri, 16 May 2025 10:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E613419D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E613419D8;
	Fri, 16 May 2025 10:57:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E54A1AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DFB4419D4
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbuMuJBSlUrr for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:57:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4743B419CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4743B419CD
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4743B419CD
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:57:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA51C1C10F2; Fri, 16 May 2025 12:57:52 +0200 (CEST)
Message-ID: <9905830a-449d-4c26-bc04-a5f4fe1bd50b@rnout.be>
Date: Fri, 16 May 2025 12:57:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250507201433.1506091-1-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250507201433.1506091-1-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393073; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3Fhg0eO7xs8Iv880Pm/ZnBz/vqncgzQWW+6scpy9JFM=;
 b=b1t8ptHbHno1rDmrAyakf3IHpQpmjFnGyZqnvlo153EOTfmRc013ZstLTcojDwhc/rMv4o
 3vOqN4ztJUug026O2WRwvqHiPr+N0846eEc3UT/bnKNClV+xgEb7jTNlBt9laIjKu6cE4X
 pBowyMJFCEyInulQ01GhfwsRvf+YpijMYI90zD2OnQrE2eF6JTiDDEB1zQlV/ZTbEByAGE
 fhxwyTS2plLqAxTc1grbOvlHbWdrQPX+r1eTQKEVLHS8W5y4EYJw4T4YICbpWeKwA/QfXg
 s093jtAGh5fHix/MPKiTkI9UOMSmJUnoUv4LOEUZNbs+bws6EePwIPJTXeC9uw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=b1t8ptHb
Subject: Re: [Buildroot] [PATCH] package/gdb: add patches for GCC 15.x
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/05/2025 22:14, Thomas Petazzoni via buildroot wrote:
> This commit backports an upstream patch fixing the bundled readline
> library so that it builds with GCC 15.x.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Note: this patch assumes that the 16.x series has been bumped to 16.2
> and the 15.x series bumped to 15.2.
> ---
>   ...ne-tcap.h-Update-definitions-for-C23.patch | 52 +++++++++++++++++++
>   ...ne-tcap.h-Update-definitions-for-C23.patch | 52 +++++++++++++++++++
>   ...ne-tcap.h-Update-definitions-for-C23.patch | 52 +++++++++++++++++++
>   3 files changed, 156 insertions(+)
>   create mode 100644 package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
>   create mode 100644 package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
>   create mode 100644 package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch
> 
> diff --git a/package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
> new file mode 100644
> index 0000000000..50100d8bfc
> --- /dev/null
> +++ b/package/gdb/14.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
> @@ -0,0 +1,52 @@
> +From 0f81e47dff4bddc6ba9c45402821f857251f2b0f Mon Sep 17 00:00:00 2001
> +From: Chris Packham <judge.packham@gmail.com>
> +Date: Wed, 30 Apr 2025 16:49:44 +1200
> +Subject: [PATCH] readline/tcap.h: Update definitions for C23
> +
> +C23 changes how function definitions like int `int tputs ()` are
> +interpreted. In older standards this meant that the function arguments
> +are unknown. In C23 this is interpreted as `int tputs (void)` so now
> +when we compile with GCC15 (which defaults to -std=gnu23) we get an
> +error such as
> +
> +  readline/display.c:2839:17: error: too many arguments to function 'tputs'; expected 0, have 3
> +
> +Add the function arguments for tgetent(), tgetflag(), tgetnum(),
> +tgetstr(), tputs() and tgoto().
> +
> +Signed-off-by: Chris Packham <judge.packham@gmail.com>
> +Approved-By: Tom Tromey <tom@tromey.com>
> +Upstream: 5c87b330e910f8be1443c881fd16a70e685f1f2f
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + readline/readline/tcap.h | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
> +index 859e6eed5aa..9e2ed124e49 100644
> +--- a/readline/readline/tcap.h
> ++++ b/readline/readline/tcap.h
> +@@ -46,14 +46,14 @@ extern char *UP, *BC;
> +
> + extern short ospeed;
> +
> +-extern int tgetent ();
> +-extern int tgetflag ();
> +-extern int tgetnum ();
> +-extern char *tgetstr ();
> ++extern int tgetent (char *bp, const char *name);
> ++extern int tgetflag (char *id);
> ++extern int tgetnum (char *id);
> ++extern char *tgetstr (char *id, char **area);
> +
> +-extern int tputs ();
> ++extern int tputs (const char *str, int affcnt, int (*putc)(int));
> +
> +-extern char *tgoto ();
> ++extern char *tgoto (const char *cap, int col, int row);
> +
> + #endif /* HAVE_TERMCAP_H */
> +
> +--
> +2.49.0
> +
> diff --git a/package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
> new file mode 100644
> index 0000000000..64f741fe75
> --- /dev/null
> +++ b/package/gdb/15.2/0010-readline-tcap.h-Update-definitions-for-C23.patch
> @@ -0,0 +1,52 @@
> +From 130750cf9607fc1c4bcbead820a27bee6ee60f04 Mon Sep 17 00:00:00 2001
> +From: Chris Packham <judge.packham@gmail.com>
> +Date: Wed, 30 Apr 2025 16:49:44 +1200
> +Subject: [PATCH] readline/tcap.h: Update definitions for C23
> +
> +C23 changes how function definitions like int `int tputs ()` are
> +interpreted. In older standards this meant that the function arguments
> +are unknown. In C23 this is interpreted as `int tputs (void)` so now
> +when we compile with GCC15 (which defaults to -std=gnu23) we get an
> +error such as
> +
> +  readline/display.c:2839:17: error: too many arguments to function 'tputs'; expected 0, have 3
> +
> +Add the function arguments for tgetent(), tgetflag(), tgetnum(),
> +tgetstr(), tputs() and tgoto().
> +
> +Signed-off-by: Chris Packham <judge.packham@gmail.com>
> +Approved-By: Tom Tromey <tom@tromey.com>
> +Upstream: 5c87b330e910f8be1443c881fd16a70e685f1f2f
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + readline/readline/tcap.h | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
> +index 859e6eed5aa..9e2ed124e49 100644
> +--- a/readline/readline/tcap.h
> ++++ b/readline/readline/tcap.h
> +@@ -46,14 +46,14 @@ extern char *UP, *BC;
> +
> + extern short ospeed;
> +
> +-extern int tgetent ();
> +-extern int tgetflag ();
> +-extern int tgetnum ();
> +-extern char *tgetstr ();
> ++extern int tgetent (char *bp, const char *name);
> ++extern int tgetflag (char *id);
> ++extern int tgetnum (char *id);
> ++extern char *tgetstr (char *id, char **area);
> +
> +-extern int tputs ();
> ++extern int tputs (const char *str, int affcnt, int (*putc)(int));
> +
> +-extern char *tgoto ();
> ++extern char *tgoto (const char *cap, int col, int row);
> +
> + #endif /* HAVE_TERMCAP_H */
> +
> +--
> +2.49.0
> +
> diff --git a/package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch b/package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch
> new file mode 100644
> index 0000000000..c9a34e9a89
> --- /dev/null
> +++ b/package/gdb/16.3/0010-readline-tcap.h-Update-definitions-for-C23.patch
> @@ -0,0 +1,52 @@
> +From f37d1bbe334c751b9bd77fa3a9d9accd93614677 Mon Sep 17 00:00:00 2001
> +From: Chris Packham <judge.packham@gmail.com>
> +Date: Wed, 30 Apr 2025 16:49:44 +1200
> +Subject: [PATCH] readline/tcap.h: Update definitions for C23
> +
> +C23 changes how function definitions like int `int tputs ()` are
> +interpreted. In older standards this meant that the function arguments
> +are unknown. In C23 this is interpreted as `int tputs (void)` so now
> +when we compile with GCC15 (which defaults to -std=gnu23) we get an
> +error such as
> +
> +  readline/display.c:2839:17: error: too many arguments to function 'tputs'; expected 0, have 3
> +
> +Add the function arguments for tgetent(), tgetflag(), tgetnum(),
> +tgetstr(), tputs() and tgoto().
> +
> +Signed-off-by: Chris Packham <judge.packham@gmail.com>
> +Approved-By: Tom Tromey <tom@tromey.com>
> +Upstream: 5c87b330e910f8be1443c881fd16a70e685f1f2f
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + readline/readline/tcap.h | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
> +index 859e6eed5aa..9e2ed124e49 100644
> +--- a/readline/readline/tcap.h
> ++++ b/readline/readline/tcap.h
> +@@ -46,14 +46,14 @@ extern char *UP, *BC;
> +
> + extern short ospeed;
> +
> +-extern int tgetent ();
> +-extern int tgetflag ();
> +-extern int tgetnum ();
> +-extern char *tgetstr ();
> ++extern int tgetent (char *bp, const char *name);
> ++extern int tgetflag (char *id);
> ++extern int tgetnum (char *id);
> ++extern char *tgetstr (char *id, char **area);
> +
> +-extern int tputs ();
> ++extern int tputs (const char *str, int affcnt, int (*putc)(int));
> +
> +-extern char *tgoto ();
> ++extern char *tgoto (const char *cap, int col, int row);
> +
> + #endif /* HAVE_TERMCAP_H */
> +
> +--
> +2.49.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
