Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953AAC77B61
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 17:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29BB481CA0;
	Mon, 24 Apr 2023 17:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29BB481CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYT8Yxvm8Pdm; Mon, 24 Apr 2023 17:34:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45AAD81C2F;
	Mon, 24 Apr 2023 17:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45AAD81C2F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DAA81BF83E
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 17:34:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 274F160740
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 17:34:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 274F160740
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wwmr60NLvLIy for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 17:34:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 741086073E
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 741086073E
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 17:34:41 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id D08A45C185B;
 Mon, 24 Apr 2023 19:34:37 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 24 Apr 2023 19:34:37 +0200
From: Stefan Agner <stefan@agner.ch>
To: Peter Seiderer <ps.report@gmx.net>
In-Reply-To: <20230322162538.19202-1-ps.report@gmx.net>
References: <20230322162538.19202-1-ps.report@gmx.net>
Message-ID: <49584ffdabef0920a692639448a2a145@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1682357677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lfxidYQwGs3C0fr3ayI2sIEG/KlV4OLKVuDXt2R7XBg=;
 b=ZePIaKcDJ+jdHzA01SQybJ52yiNX4qt5j50UkR6MF6hlYlINYk9yGAlzK9ekEnQSuleZ6G
 w7DXwaiZ9jbEBbm14llbh0EyXAzfUuRG6a4yqbf8fp1gRKDrgxssE7VCKTMjb/1Q7gEfzB
 O0iv1/x55zNQ6TjPA2I0X9GYZF6Sr78=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=ZePIaKcD
Subject: Re: [Buildroot] [PATCH v1] package/readline: add upstream patch to
 fix crash with invalid locale specification
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2023-03-22 17:25, Peter Seiderer wrote:
> Add upstream patch to fix crash with invalid locale specification (see [1]
> for details).
> 
> Fixes:
> 
>   - https://bugs.busybox.net/show_bug.cgi?id=15456
> 
> [1] https://lists.gnu.org/archive/html/bug-readline/2022-10/msg00002.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

This fixes a crash seen with bluetoothctl here.

Tested-by: Stefan Agner <stefan@agner.ch>

Ideally this should be applied to to LTS Buildroot 2023.02 too.

--
Stefan

> ---
>  ...ch-1-fix-crash-when-readline-is-star.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644
> package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
> 
> diff --git
> a/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
> b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
> new file mode 100644
> index 0000000000..b0f784b8ba
> --- /dev/null
> +++
> b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
> @@ -0,0 +1,41 @@
> +From b8d91eab12603fa88e095248855f5f772d182d05 Mon Sep 17 00:00:00 2001
> +From: Chet Ramey <chet.ramey@case.edu>
> +Date: Wed, 5 Oct 2022 10:41:16 -0400
> +Subject: [PATCH] Readline-8.2 patch 1: fix crash when readline is started with
> + an invalid locale specification
> +
> +[Upstream:
> https://git.savannah.gnu.org/cgit/readline.git/patch/?id=7274faabe97ce53d6b464272d7e6ab6c1392837b
> + Stripped unrelated ._.gitignore change]
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + nls.c      | 4 ++++
> + patchlevel | 2 +-
> + 2 files changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/nls.c b/nls.c
> +index 5c6a13b..8c027d6 100644
> +--- a/nls.c
> ++++ b/nls.c
> +@@ -141,6 +141,10 @@ _rl_init_locale (void)
> +   if (lspec == 0)
> +     lspec = "";
> +   ret = setlocale (LC_CTYPE, lspec);	/* ok, since it does not change locale */
> ++  if (ret == 0 || *ret == 0)
> ++    ret = setlocale (LC_CTYPE, (char *)NULL);
> ++  if (ret == 0 || *ret == 0)
> ++    ret = RL_DEFAULT_LOCALE;
> + #else
> +   ret = (lspec == 0 || *lspec == 0) ? RL_DEFAULT_LOCALE : lspec;
> + #endif
> +diff --git a/patchlevel b/patchlevel
> +index d8c9df7..fdf4740 100644
> +--- a/patchlevel
> ++++ b/patchlevel
> +@@ -1,3 +1,3 @@
> + # Do not edit -- exists only for use by patch
> + 
> +-0
> ++1
> +-- 
> +2.39.2
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
