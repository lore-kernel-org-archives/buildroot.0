Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAE9CD37AD
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 21:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3EC0419DB;
	Fri, 15 Sep 2023 21:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3EC0419DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUR-8CCVLFY6; Fri, 15 Sep 2023 21:34:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6ACA419D9;
	Fri, 15 Sep 2023 21:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6ACA419D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CB861BF3D2
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA95A419D9
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 21:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA95A419D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AfabeuhuTtfu for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 21:34:47 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDA9841989
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 21:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDA9841989
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1C5002003CC;
 Fri, 15 Sep 2023 23:34:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 15 Sep 2023 23:34:42 +0200
Date: Fri, 15 Sep 2023 23:34:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <20230915213442.GJ2571@scaer>
References: <20230915052840.3060566-1-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915052840.3060566-1-troglobit@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694813685;
 bh=4IyiNhII+7sZJeU3pQl5U59z+GgO6uO1tvAe4Ll/qYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PR7o2wuLvY03EP6KNdHFMZs6QxRZogqosJzMyHqqExZqs9k9Q+jfG2wCzxxuAbRbr
 1z44iomy0eKT6+seW/j6ruSDd+iiEh1Y0PbctDdsCENBw9t7egXsRCoPM6K8EAaNNE
 2sKDyAMZTgrg38FWoGOuYjjTmAbdvp7hmNExnr/GxRbxHMuL7kNgFZlAqKnK9rXpJ8
 MRR2X7xuKNGpWhNcGyPZTEa5Ib7lUzLbc0kPcoJtglpgDy3pgg2qN5VOJXIwQai32O
 wM/uhDv7DCOdI+GvrJChkQuK+QmJLKbIR6fhF555joC28XC2KbSxC27DP/obQg5XyX
 9gjEAZZ9pyCAA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PR7o2wuL
Subject: Re: [Buildroot] [PATCH 1/1] package/mg: bump to v3.7
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

Joachim, All,

On 2023-09-15 07:28 +0200, Joachim Wiberg spake thusly:
>  - Sync w/ OpenBSD upstream
>  - Fix key bindings, Home/End
>  - Fix buffer overflow on no match in i-search
>  - Fix mark reset
>  - Usability:
>    - persistent help in status bar
>    - F1 toggle quick-help buffer
>    - F2 save
>    - F3/F4 macro start/end + run, like GNU Emacs
> 
> Full ChangeLog https://github.com/troglobit/mg/releases/tag/v3.7
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mg/mg.hash | 4 ++--
>  package/mg/mg.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mg/mg.hash b/package/mg/mg.hash
> index e8eedb8921..6a3e3465b8 100644
> --- a/package/mg/mg.hash
> +++ b/package/mg/mg.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/troglobit/mg/releases/tag/v3.6
> -sha256  0e30f99b7606ddd92535aec0ba0118557afa4adca0961267314a4bf7791865fb  mg-3.6.tar.gz
> +# From https://github.com/troglobit/mg/releases/tag/v3.7
> +sha256  05101360d2194392da0950e8b6f18d067d8af0fd2f572461ba4d4e7b4ccbb4c1  mg-3.7.tar.gz
>  # Locally computed:
>  sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
> diff --git a/package/mg/mg.mk b/package/mg/mg.mk
> index 88f8f60257..59f1d1e316 100644
> --- a/package/mg/mg.mk
> +++ b/package/mg/mg.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MG_VERSION = 3.6
> +MG_VERSION = 3.7
>  MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
>  MG_LICENSE = Public Domain
>  MG_LICENSE_FILES = UNLICENSE
> -- 
> 2.34.1
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
