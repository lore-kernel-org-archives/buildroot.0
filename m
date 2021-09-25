Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C285C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 14:31:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DE1360FC2
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 14:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DE1360FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25DB4400D0;
	Sat, 25 Sep 2021 14:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nVPcgS-N4_4a; Sat, 25 Sep 2021 14:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 428DB4011C;
	Sat, 25 Sep 2021 14:31:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FE671BF868
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 14:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D095827AA
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 14:31:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MMOOf3tEulPb for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 14:31:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A809F827A8
 for <buildroot@busybox.net>; Sat, 25 Sep 2021 14:31:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e5cb:5ead:8e76:4901])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 671DE7802BE;
 Sat, 25 Sep 2021 16:31:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632580303;
 bh=lgo7VupF4wvXL1N1fdYgPWhZFpDPXBP3NVJnnaHBJNM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Apj+drTz3j5/rbcG1bgiqGuoWYbUGkcO/KS9+sF8tN5V0uNcXxj4eIT/aVswz3Uo1
 ZHhQG/B9LRATNUp17uArSyBxh0pJKzojqjGRPqkm4fUARu54TS+KwXifHMV5NuLPOd
 EUv1O02moX5Hi/kXyh6T4kdiPsT75nZW0mQILE6NIQ+dy90XyLHVW0bam9Fu3Q/i5o
 EIlKsmFZhIM6QlgBR8f+CH3Fz062WNBGgk/RL1xwFC7xeKSr7KYgtuAnvgNbuwLvHE
 Tpy24fq/hjoLhbblX61BBiHHZ+MuGvMOE/djh2dDPhz1xarJQK279WhCK7Rl70XSlk
 EjqjRK3ZsnKOQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 25 Sep 2021 16:31:38 +0200
Date: Sat, 25 Sep 2021 16:31:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20210925143138.GL3176@scaer>
References: <c2323e09e0a4871b6c613a92e74a31463624f62b.1632314371.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c2323e09e0a4871b6c613a92e74a31463624f62b.1632314371.git.baruch@tkos.co.il>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/strace: bump to version 5.14
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, All,

On 2021-09-22 15:39 +0300, Baruch Siach via buildroot spake thusly:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/strace/strace.hash | 4 ++--
>  package/strace/strace.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/strace/strace.hash b/package/strace/strace.hash
> index 93c9b57f46f0..eb3e97424f5a 100644
> --- a/package/strace/strace.hash
> +++ b/package/strace/strace.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
> -# https://strace.io/files/5.13/strace-5.13.tar.xz.asc
> -sha256  5acc34888b9d510ad6ac915d4a8df08f51cf1ae920ea24649f6a4bb984d0b656  strace-5.13.tar.xz
> +# https://strace.io/files/5.14/strace-5.14.tar.xz.asc
> +sha256  901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3141b7cb307b11e73  strace-5.14.tar.xz
>  sha256  f847d5ef26ad1151ca63bb88536b23a4cac5040c67917f3d5ee7ea1316e2b736  COPYING
>  sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
> diff --git a/package/strace/strace.mk b/package/strace/strace.mk
> index 29736678d89c..798d7077d642 100644
> --- a/package/strace/strace.mk
> +++ b/package/strace/strace.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -STRACE_VERSION = 5.13
> +STRACE_VERSION = 5.14
>  STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
>  STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
>  STRACE_LICENSE = LGPL-2.1+
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
