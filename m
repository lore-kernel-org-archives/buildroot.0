Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0653FC77B72
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 06:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F6DE813F5;
	Mon, 17 Apr 2023 06:48:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F6DE813F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X87apfYfZ5wm; Mon, 17 Apr 2023 06:48:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3D87819D6;
	Mon, 17 Apr 2023 06:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3D87819D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D22681BF5E9
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 06:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8E724060E
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 06:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8E724060E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPZSbW-2Froo for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 06:48:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 706BE40607
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 706BE40607
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 06:48:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 53F6A5FFC0;
 Mon, 17 Apr 2023 08:48:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 17 Apr 2023 08:48:22 +0200
Date: Mon, 17 Apr 2023 08:48:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
Message-ID: <20230417064822.GK2819@scaer>
References: <20220902222849.1098641-1-mario.haustein@hrz.tu-chemnitz.de>
 <20220926160849.1046939-1-mario.haustein@hrz.tu-chemnitz.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220926160849.1046939-1-mario.haustein@hrz.tu-chemnitz.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681714106;
 bh=7hoc8GWl4/jvSscCY/jPJHBLd7mdKFfVD0GL8MLA3HU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SM3ZiYxOfJWy8KWxFMxLVBuZoBTO1SsKHXH/0wZ0TrqnRD81JHDgALBCevZx30H3v
 eIcMoDpLdT3rE9g7nYG61hB1TfdWW/AYuAOtpqS/eo6PoUq2erTvwMtwFpwHeLb1Jg
 U2bygqqaXelB7N17DYhXWE4qwrIFTFzftn6Mz4Gbsd/4OitCkfmeRe20IiQS9KUGRN
 DkjipZEFrmqwU/5oBXOiO6ytDvG8OUC9Y7pkHdGcScESwRAbi5R837piv4epPq6b66
 hN07XMVC1+QkQH3KUdZ9xn7oJSduzknXsy/EhW7VmxkPv0798MzCrqvfY9tyHA1RqE
 msqc+Jz5F7Eyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SM3ZiYxO
Subject: Re: [Buildroot] [PATCH v2] package/dcron: fix /etc/cron.d/system
 cron jobs
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
Cc: "Alvaro G. M" <alvaro.gamez@hazent.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mario, All,

Sorry, for the long delay...

> Jobs with the syntax @hourly, @daily, ... were not executed since the
> version bump from `v4.5` to commit `1ba33c3325df48de46263276a43ed76cf9d81518`.
> This patch fixes the bug downstream.
> 
> Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>

Without any feedback from upstream, which has been inactive for more
than a year now: applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - Use `git format-patch` to export the patch
>   - Specify the version bump which broke dcron in the commit message
> 
> Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
> ---
>  package/dcron/0002-system-crontab.patch | 28 +++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/dcron/0002-system-crontab.patch
> 
> diff --git a/package/dcron/0002-system-crontab.patch b/package/dcron/0002-system-crontab.patch
> new file mode 100644
> index 0000000000..95d9606b7a
> --- /dev/null
> +++ b/package/dcron/0002-system-crontab.patch
> @@ -0,0 +1,28 @@
> +From 1fd99b71b063b1573beaf9f6b801ec5be2fbe24f Mon Sep 17 00:00:00 2001
> +From: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
> +Date: Fri, 2 Sep 2022 23:20:14 +0200
> +Subject: [PATCH] Make @hourly, @daily, ... work again
> +
> +closes #15
> +
> +Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
> +[Upstream status: https://github.com/dubiousjim/dcron/pull/35]
> +---
> + database.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/database.c b/database.c
> +index 37cf17a..6ec720e 100644
> +--- a/database.c
> ++++ b/database.c
> +@@ -455,6 +455,8 @@ SynchronizeFile(const char *dpath, const char *fileName, const char *userName)
> + 							line.cl_Days[j] = 1;
> + 						for (j=0; j<12; ++j)
> + 							line.cl_Mons[j] = 1;
> ++						for (j=0; j<7; ++j)
> ++							line.cl_Dow[j] = ALL_DOW;
> + 					}
> + 
> + 					while (*ptr == ' ' || *ptr == '\t')
> +-- 
> +2.35.1
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
