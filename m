Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A349C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 20:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DC16402B5;
	Sun, 12 Jun 2022 20:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id heiDmiMhMWyP; Sun, 12 Jun 2022 20:23:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A94B7417D2;
	Sun, 12 Jun 2022 20:23:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB6A71BF3AF
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 20:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D82BD83466
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 20:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ywu6HB0MkXFC for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 20:23:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE3368343E
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 20:23:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e0a2:2157:6a43:27a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id BD5EA7802D7;
 Sun, 12 Jun 2022 22:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1655065390;
 bh=99BV9TXGEN2nYuskgPi1hZf65iqBdJO2Ub9veqmIp3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=thHmlirpgyLY8VBGtTHnRhGaXldFxfdBcYK/wFLMwuLjOjmjHhDGKM0VCDs0RgAUS
 GnSMYxJht679s031bf64YEga8/hfZ2t/PxEj0LrcZDJSdhP8b8oxXVm43qVxG51iFf
 wVADkuw3VkCQB/hlRdcYPSmIV55Cqtllt1XCyhvkj7hnzjQoxMZOYwrmEt2I9Ip0U7
 rQ14SCjy4JAzP4U3n0wx6lUJdwjDJxLyaFDM2OPcZ46+TfnUlOHBbtlAS1aI87Wv4t
 UXJCluOT671t/8iPaix/0BPi5krDHBVHtD9pncuet+RbuCdCDr1W5AMs1BebOZ91mN
 3DlApUcmJePHw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Jun 2022 22:23:07 +0200
Date: Sun, 12 Jun 2022 22:23:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220612202307.GL427639@scaer>
References: <20220610210541.3643416-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220610210541.3643416-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/dmalloc: fix strndup detection
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

Fabrice, All,

On 2022-06-10 23:05 +0200, Fabrice Fontaine spake thusly:
> Fix strndup detection as already done for strdup in commit
> f9287b263f0808c2f0632aa1560d88e39fbf970b to avoid the following build
> failure raised since bump to version 5.6.5 in commit
> 736932c71552adc4dfa95c5236d1064860900e8a:
> 
> In file included from /nvmedata/autobuild/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/string.h:630:0,
>                  from append.c:34:
> dmalloc.h:396:7: error: expected identifier or '(' before '__extension__'
>  char *strndup(const char *string, const DMALLOC_SIZE max_len);
>        ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2164dac43e2607a3570e8f98957a70f579d06cd3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dmalloc/dmalloc.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
> index 93dc45c15d..81ac467277 100644
> --- a/package/dmalloc/dmalloc.mk
> +++ b/package/dmalloc/dmalloc.mk
> @@ -49,6 +49,7 @@ DMALLOC_CONF_ENV = CFLAGS="$(DMALLOC_CFLAGS)"
>  define DMALLOC_POST_PATCH
>  	$(SED) 's/^ac_cv_page_size=0$$/ac_cv_page_size=12/' $(@D)/configure
>  	$(SED) 's/ac_cv_strdup_macro=no$$/ac_cv_strdup_macro=yes/' $(@D)/configure
> +	$(SED) 's/ac_cv_strndup_macro=no$$/ac_cv_strndup_macro=yes/' $(@D)/configure
>  	$(SED) 's/(ld -/($${LD-ld} -/' $(@D)/configure
>  	$(SED) 's/'\''ld -/"$${LD-ld}"'\'' -/' $(@D)/configure
>  	$(SED) 's/ar cr/$$(AR) cr/' $(@D)/Makefile.in
> -- 
> 2.35.1
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
