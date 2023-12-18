Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F6AC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 16:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E30041A45;
	Mon, 18 Dec 2023 16:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E30041A45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c7AZUJTbYQbW; Mon, 18 Dec 2023 16:46:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F81241A1E;
	Mon, 18 Dec 2023 16:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F81241A1E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BE961BF2B3
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07633405F7
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 16:46:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07633405F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNtJd1zcYUnU for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 16:46:05 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14AD7405D0
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 16:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14AD7405D0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 92EE4B00535;
 Mon, 18 Dec 2023 17:45:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Dec 2023 17:45:59 +0100
Date: Mon, 18 Dec 2023 17:45:59 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZYB3R9naLw_JxAt8@landeda>
References: <20231205235919.510051-1-adam.duskett@amarulasolutions.com>
 <20231205235919.510051-3-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231205235919.510051-3-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702917962;
 bh=7OijmpfF6QdgydvsxitllIVaqtVQNb+rtilaVxCvtxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eKuBgHRmpRvjps8NmnwUOQ1W3Muy+ErpoLvm+EdPjGrJefSFqHh8Vmuz9z/bsvUdG
 H3oj+y4Rt/EhLQTJboUbQuLmQCnZOd4FyQohLMALck2NEDhnHvtDwie1asttmTl0Pl
 uY80OITTVDF7kWGcMUK0j8iUIbrcYyWViAf8xMmShWF8IojP1ZZ2fZ4r89NsFQdXvg
 njdlezAaPPG+2Mlm5zU2IUp8QAE7QGyQRf3UGM9U30ew4IW0AUEa3BAr0shiZ7cuKk
 Gd40OQ1TxrdzTcOOiIPuetjMr7TUZF8P6ZhD4qWGz0HGxOOV0bhIWgY+XzZctJPwYE
 86QzGSHiWbiNQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eKuBgHRm
Subject: Re: [Buildroot] [PATCH 2/3]
 package/giflib/0003-Fix-CVE-2023-39742.patch: New security patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-12-05 16:59 -0700, Adam Duskett spake thusly:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/giflib/0003-Fix-CVE-2023-39742.patch | 36 ++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/giflib/0003-Fix-CVE-2023-39742.patch
> 
> diff --git a/package/giflib/0003-Fix-CVE-2023-39742.patch b/package/giflib/0003-Fix-CVE-2023-39742.patch
> new file mode 100644
> index 0000000000..2ba01ac8a4
> --- /dev/null
> +++ b/package/giflib/0003-Fix-CVE-2023-39742.patch
> @@ -0,0 +1,36 @@
> +From 4288b993ee9df6550a367fe06ede3c003dc7bbc6 Mon Sep 17 00:00:00 2001
> +From: Sandro Mani <manisandro@gmail.com>
> +Date: Tue, 5 Dec 2023 16:35:40 -0700
> +Subject: [PATCH] Fix CVE-2023-39742

You forgot to add GIFLIB_IGNORE_CVES += CVE-2023-39742

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

> +From: giflib-5.2.1-17.fc39.src.rpm
> +Fix segmentation faults due to non correct checking for args
> +Fixes: https://nvd.nist.gov/vuln/detail/CVE-2023-39742
> +Upstream: https://sourceforge.net/p/giflib/bugs/166/
> +
> +Signed-off-by: Sandro Mani <manisandro@gmail.com>
> +Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> +---
> + getarg.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/getarg.c b/getarg.c
> +index d569f6c..51fbe0b 100644
> +--- a/getarg.c
> ++++ b/getarg.c
> +@@ -307,6 +307,12 @@ GAGetParmeters(void *Parameters[],
> +     int i = 0, ScanRes;
> + 
> +     while (!(ISSPACE(CtrlStrCopy[i]))) {
> ++
> ++        if ((*argv) == argv_end) {
> ++            GAErrorToken = Option;
> ++            return CMD_ERR_NumRead;
> ++        }
> ++
> +         switch (CtrlStrCopy[i + 1]) {
> +           case 'd':    /* Get signed integers. */
> +               ScanRes = sscanf(*((*argv)++), "%d",
> +-- 
> +2.43.0
> +
> -- 
> 2.43.0
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
