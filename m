Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFFEC61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 10:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1429340386;
	Sat, 11 Feb 2023 10:04:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1429340386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1imgMVbiTj59; Sat, 11 Feb 2023 10:04:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B84540323;
	Sat, 11 Feb 2023 10:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B84540323
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E90C61BF59A
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 10:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D087741817
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 10:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D087741817
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 26OQZ5wR37NK for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 10:04:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A35EA41806
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A35EA41806
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 10:04:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 74C6F5FF88;
 Sat, 11 Feb 2023 11:04:28 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Feb 2023 11:04:28 +0100
Date: Sat, 11 Feb 2023 11:04:28 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230211100428.GE2796@scaer>
References: <20230211094202.3816592-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230211094202.3816592-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676109870;
 bh=/crBlL9w6ahyNevHMskWdF7RBPdqFXklQ1Pcbzj0S1g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lVaSyThDO5lBIiMOramLFObEjKcljO9v05oXmifMgnHQ+th+6C1i45N4tpgyb9o0M
 YGsQaGDgAiO07DtUld1JiB77SC0KYyof34qYuKlcVqdXLpd5Al4uLdqBtd6za3acvW
 cnDffHr+flIQcYsJ7zviKkwzBETkJlsz+qjJYIe5z0S0KPd1vmn8s5rgolbJsfjEKV
 xPbJltgtMBvtW2W7z5CbsF0ieLi4dVG+luvCDjqwGWfiHeusiVJJLRjAfdIZ6lzbJ9
 V162RH8Gj9s7IsZvCDVINSaWaPMm3SGio+2Ep1xut+GbsZ1CVrEv8FBTMhQZGlqPXC
 zO0ecZ1GPlehQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lVaSyThD
Subject: Re: [Buildroot] [PATCH] package/pkg-waf: add missing $
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

Romain, All,

On 2023-02-11 10:42 +0100, Romain Naour spake thusly:
> We want to have $(@D) expanded at the time the recipe is run, so like
> all other variables, we need to $$-expand it.
> 
> Fixes:
> http://autobuild.buildroot.org/results/b6f/b6fd3a866af182edc7831492aecc8323f377b826
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-waf.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
> index 0e752072c8..c3e965bdf3 100644
> --- a/package/pkg-waf.mk
> +++ b/package/pkg-waf.mk
> @@ -42,7 +42,7 @@ define inner-waf-package
>  # otherwise waf errors out with:
>  # Waf script 'X' and library 'Y' do not match
>  define WAF_PACKAGE_REMOVE_WAF_LIB
> -	$(RM) -fr $(@D)/waf $(@D)/waflib
> +	$(RM) -fr $$(@D)/waf $$(@D)/waflib
>  endef
>  
>  # We need host-python3 to run waf
> -- 
> 2.34.3
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
