Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDE7C77B73
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 19:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED8D560E13;
	Sun, 16 Apr 2023 19:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED8D560E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7MYkQcsybvLB; Sun, 16 Apr 2023 19:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6DA560D76;
	Sun, 16 Apr 2023 19:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6DA560D76
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 174481C40B4
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3BCD409F3
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 19:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3BCD409F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJPN_zwR4Yn8 for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 19:13:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 891584093C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 891584093C
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 19:13:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id F267F5FF9E;
 Sun, 16 Apr 2023 21:12:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Apr 2023 21:12:59 +0200
Date: Sun, 16 Apr 2023 21:12:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <20230416191259.GE2819@scaer>
References: <20220913072303.1698887-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220913072303.1698887-1-joel@jms.id.au>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681672386;
 bh=ddbVkFAJ6oVcuvpK4v6036eCdga6Bs7XYvbLbXvnNmg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DKAm8D6qdwGgwWv3eAeWjSPeoAPzExOHv86XkVxagBFw/dA8fujVYJHQXVkdQGMCN
 v/HUaIMhJZj0CJ+GQfKptyaBoFCVVZj5UfgadJO6YAyu22CTakJIWdAuz5gtZT8ufM
 SRZI5WdoHIOw2aFvdLFgxQTp3Zo1oiWH3yODcb2OxzLtTdA5Y/7gjoO9QKi3E3B+51
 qTI9hgzKvhJ7D6A0L+OCmmS1gdbSl5CZfkkHntNwlPytof33CkbZQLUgF/5K2OqOCA
 BjJ72ptmGsAAfhClZyTv/MQL6eLPpxQ2/2lN3qCaKgGB+vY3dpK0ZNIx4lhHf+vMob
 RlGb2CWqoQvVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DKAm8D6q
Subject: Re: [Buildroot] [PATCH] package/coremark: Set cflags
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Joel, All,

On 2022-09-13 16:53 +0930, Joel Stanley spake thusly:
> The coremark build needs to set PORT_CFLAGS explicitly in order to pick
> up the configured optmisation level, and other flags.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied to master, thanks.

Sorry for the delay in reviewing and applying such a simple patch. :-(

Regards,
Yann E. MORIN.

> ---
>  package/coremark/coremark.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/coremark/coremark.mk b/package/coremark/coremark.mk
> index 418fd5c8d39b..9ea8693e7189 100644
> --- a/package/coremark/coremark.mk
> +++ b/package/coremark/coremark.mk
> @@ -11,6 +11,7 @@ COREMARK_LICENSE_FILES = LICENSE.md
>  
>  define COREMARK_BUILD_CMDS
>  	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" -C $(@D) \
> +		PORT_CFLAGS="$(TARGET_CFLAGS)" \
>  		PORT_DIR=linux$(if $(BR2_ARCH_IS_64),64) EXE= link
>  endef
>  
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
